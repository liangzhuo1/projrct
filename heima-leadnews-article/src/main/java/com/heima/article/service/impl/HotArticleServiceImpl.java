package com.heima.article.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.heima.article.feign.AdminFeign;
import com.heima.article.mapper.ApArticleMapper;
import com.heima.article.service.HotArticleService;
import com.heima.common.constans.article.ArticleConstans;
import com.heima.model.admin.pojos.AdChannel;
import com.heima.model.article.pojos.ApArticle;
import com.heima.model.article.vo.HotArticleVo;
import com.heima.model.common.dtos.ResponseResult;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class HotArticleServiceImpl implements HotArticleService {

    @Autowired
    private ApArticleMapper apArticleMapper;

    @Override
    public void computeHotArticle() {

        //1.查询前5天的新发布的文章的数据
        String dayParam = DateTime.now().minusDays(5).toString("yyyy-MM-dd 00:00:00");
        List<ApArticle> articleList = apArticleMapper.selectList(Wrappers.<ApArticle>lambdaQuery().gt(ApArticle::getPublishTime, dayParam));

        //2.计算文章的分值（阅读量、点赞量、评论和收藏）
        List<HotArticleVo> hotArticleVoList = computeHotArticle(articleList);

        //3.给每个频道缓存热度较高的30条数据
        cacheTagToRedis(hotArticleVoList);

    }

    @Autowired
    private AdminFeign adminFeign;

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 缓存文章列表到redis
     * @param hotArticleVoList
     */
    private void cacheTagToRedis(List<HotArticleVo> hotArticleVoList) {
        //1.查询所有的频道信息
        ResponseResult responseResult = adminFeign.selectAllChannel();
        List<AdChannel> channels = JSONArray.parseArray(JSON.toJSONString(responseResult.getData()), AdChannel.class);
        //2.检索数据，给每个频道存入30条分值较高的数据到redis
        if(channels != null && !channels.isEmpty()){
            for (AdChannel channel : channels) {
                List<HotArticleVo> hotArticleVos = hotArticleVoList.stream().filter(p -> p.getChannelId().equals(channel.getId())).collect(Collectors.toList());
                sortAndCache(hotArticleVos, ArticleConstans.HOT_ARTICLE_FIRST_PAGE + channel.getId());
            }
        }

        //3.如果是推荐数据__all__，从热点数据中找出分值最高的30条数据存入redis
        sortAndCache(hotArticleVoList, ArticleConstans.HOT_ARTICLE_FIRST_PAGE+ArticleConstans.DEFAULT_TAG);

    }

    private void sortAndCache(List<HotArticleVo> hotArticleVos, String s) {
        hotArticleVos.sort(new Comparator<HotArticleVo>() {
            @Override
            public int compare(HotArticleVo o1, HotArticleVo o2) {
                return o1.getScore() < o2.getScore() ? 1 : -1;
            }
        });
        if (hotArticleVos.size() > 30) {
            hotArticleVos = hotArticleVos.subList(0, 30);
        }
        if (hotArticleVos.size() == 0) {
            redisTemplate.opsForValue().set(s, "");
        }
        redisTemplate.opsForValue().set(s, JSON.toJSONString(hotArticleVos));
    }

    /**
     * 计算文章分值
     * @param articleList
     * @return
     */
    private List<HotArticleVo> computeHotArticle(List<ApArticle> articleList) {

        List<HotArticleVo> hotArticleVoList = new ArrayList<>();
        HotArticleVo hotArticleVo = null;
        if(!articleList.isEmpty()&& articleList.size() > 0){
            for (ApArticle apArticle : articleList) {
                hotArticleVo = new HotArticleVo();
                BeanUtils.copyProperties(apArticle,hotArticleVo);
                Integer score = computeScore(apArticle);
                hotArticleVo.setScore(score);
                hotArticleVoList.add(hotArticleVo);
            }
        }

        return hotArticleVoList;

    }

    /**
     * 计算分值
     * @param apArticle
     * @return
     */
    private Integer computeScore(ApArticle apArticle) {
        Integer score = 0;
        if(apArticle.getLikes() != null){
            score+=apArticle.getLikes()* ArticleConstans.HOT_ARTICLE_LIKE_WEIGHT;
        }
        if(apArticle.getViews() != null){
            score+=apArticle.getViews();
        }
        if(apArticle.getComment() != null){
            score+=apArticle.getComment()*ArticleConstans.HOT_ARTICLE_COMMENT_WEIGHT;
        }
        if(apArticle.getCollection() != null){
            score+=apArticle.getCollection()*ArticleConstans.HOT_ARTICLE_COLLECTION_WEIGHT;
        }

        return score;

    }

}

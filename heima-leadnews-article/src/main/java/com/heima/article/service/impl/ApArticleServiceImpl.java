package com.heima.article.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.heima.article.mapper.ApArticleMapper;
import com.heima.article.service.ApArticleService;
import com.heima.common.constans.article.ArticleConstans;
import com.heima.model.article.dtos.ArticleHomeDto;
import com.heima.model.article.mess.ArticleVisitStreamMess;
import com.heima.model.article.pojos.ApArticle;

import com.heima.model.article.vo.HotArticleVo;
import com.heima.model.common.dtos.ResponseResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class ApArticleServiceImpl extends ServiceImpl<ApArticleMapper, ApArticle> implements ApArticleService {

    // 单页最大加载的数字
    private final static short MAX_PAGE_SIZE = 50;

    @Autowired
    private ApArticleMapper apArticleMapper;

    @Value("${fdfs.url}")
    private String fileServerUrl;

    @Override
    public ResponseResult load(ArticleHomeDto dto, Short loadType) {
        //1.校验参数
        Integer size = dto.getSize();
        if (size == null || size == 0) {
            size = 10;
        }
        size = Math.min(size, MAX_PAGE_SIZE);
        dto.setSize(size);

        //类型参数检验
        if (!loadType.equals(ArticleConstans.LOADTYPE_LOAD_MORE) && !loadType.equals(ArticleConstans.LOADTYPE_LOAD_NEW)) {
            loadType = ArticleConstans.LOADTYPE_LOAD_MORE;
        }
        //文章频道校验
        if (StringUtils.isEmpty(dto.getTag())) {
            dto.setTag(ArticleConstans.DEFAULT_TAG);
        }

        //时间校验
        if (dto.getMaxBehotTime() == null) dto.setMaxBehotTime(new Date());
        if (dto.getMinBehotTime() == null) dto.setMinBehotTime(new Date());
        //2.查询数据
        List<ApArticle> apArticles = apArticleMapper.loadArticleList(dto, loadType);

        //3.结果封装
        ResponseResult responseResult = ResponseResult.okResult(apArticles);
        responseResult.setHost(fileServerUrl);
        return responseResult;
    }

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void updateArticle(ArticleVisitStreamMess mess) {
        //1.查询当前文章数据
        ApArticle apArticle = getById(mess.getArticleId());

        //2.修改文章
        apArticle.setViews((int) (apArticle.getViews() == null ? 0 : apArticle.getViews() + mess.getView()));
        apArticle.setComment((int) (apArticle.getComment() == null ? 0 : apArticle.getComment() + mess.getComment()));
        apArticle.setCollection((int) (apArticle.getCollection() == null ? 0 : apArticle.getCollection() + mess.getCollect()));
        apArticle.setLikes((int) (apArticle.getLikes() == null ? 0 : apArticle.getLikes() + mess.getLike()));
        //3.计算分值
        Integer score = computeScore(apArticle);
        score = score * 3;

        //4.查询redis中的数据
        String jsonStr = redisTemplate.opsForValue().get(ArticleConstans.HOT_ARTICLE_FIRST_PAGE + apArticle.getChannelId());
        if (StringUtils.isNotBlank(jsonStr)) {
            boolean flag = true;
            //5.判断当前文章分值是否大于缓存中的某一条数据
            //如果大于，就替换缓存中的这一条数据
            List<HotArticleVo> hotArticleVoList = JSON.parseArray(jsonStr, HotArticleVo.class);
            if (!hotArticleVoList.isEmpty() && hotArticleVoList.size() > 0) {
                for (HotArticleVo hotArticleVo : hotArticleVoList) {
                    if (hotArticleVo.getId().equals(apArticle.getId()) ) {
                        flag = false;
                        hotArticleVo.setScore(score);
                        redisTemplate.opsForValue().set(ArticleConstans.HOT_ARTICLE_FIRST_PAGE + apArticle.getChannelId(), JSON.toJSONString(hotArticleVoList));
                        break;
                    }
                }
                if(flag){
                    for (HotArticleVo hotArticleVo : hotArticleVoList) {
                        if ((hotArticleVo.getScore()==null ? 0:hotArticleVo.getScore()) < score ) {
                            hotArticleVoList.remove(hotArticleVo);
                            HotArticleVo hot = new HotArticleVo();
                            BeanUtils.copyProperties(apArticle, hot);
                            hotArticleVo.setScore(score);
                            hotArticleVoList.add(hot);
                            redisTemplate.opsForValue().set(ArticleConstans.HOT_ARTICLE_FIRST_PAGE + apArticle.getChannelId(), JSON.toJSONString(hotArticleVoList));
                            break;
                        }
                    }
                }

            }
        }

        updateById(apArticle);

    }

    /**
     * 查找热点数据并且替换
     * @param apArticle
     * @param score
     * @param hotArticleVoList
     * @param hotArticleVo
     */
    private void findHotAndCache(ApArticle apArticle, Integer score, List<HotArticleVo> hotArticleVoList, HotArticleVo hotArticleVo) {

    }

    /**
     * 计算分值
     *
     * @param apArticle
     * @return
     */
    private Integer computeScore(ApArticle apArticle) {
        Integer score = 0;
        if (apArticle.getLikes() != null) {
            score += apArticle.getLikes() * ArticleConstans.HOT_ARTICLE_LIKE_WEIGHT;
        }
        if (apArticle.getViews() != null) {
            score += apArticle.getViews();
        }
        if (apArticle.getComment() != null) {
            score += apArticle.getComment() * ArticleConstans.HOT_ARTICLE_COMMENT_WEIGHT;
        }
        if (apArticle.getCollection() != null) {
            score += apArticle.getCollection() * ArticleConstans.HOT_ARTICLE_COLLECTION_WEIGHT;
        }

        return score;

    }

    @Override
    public ResponseResult load2(ArticleHomeDto dto, Short loadType, boolean firstPage) {
        if(firstPage){
            String jsonStr = redisTemplate.opsForValue().get(ArticleConstans.HOT_ARTICLE_FIRST_PAGE + dto.getTag());
            if(StringUtils.isNotBlank(jsonStr)){
                List<HotArticleVo> hotArticleVoList = JSON.parseArray(jsonStr, HotArticleVo.class);
                if(!hotArticleVoList.isEmpty()&& hotArticleVoList.size() > 0){
                    ResponseResult responseResult = ResponseResult.okResult(hotArticleVoList);
                    responseResult.setHost(fileServerUrl);
                    return responseResult;
                }
            }
        }
        return load(dto,loadType);
    }
}
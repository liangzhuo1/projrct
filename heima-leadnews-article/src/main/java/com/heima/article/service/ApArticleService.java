package com.heima.article.service;

import com.alibaba.druid.wall.Violation;
import com.baomidou.mybatisplus.extension.service.IService;
import com.heima.model.article.dtos.ArticleHomeDto;
import com.heima.model.article.mess.ArticleVisitStreamMess;
import com.heima.model.article.pojos.ApArticle;
import com.heima.model.common.dtos.ResponseResult;

public interface ApArticleService extends IService<ApArticle> {

    /**
     *  根据参数加载文章列表
     * @param dto
     * @param loadType 1：加载更多  2加载最新
     * @return
     */
    public ResponseResult load(ArticleHomeDto dto,Short loadType);

    /**
     *  根据参数加载文章列表
     * @param dto
     * @param loadType 1：加载更多  2加载最新
     * @return
     */
    public ResponseResult load2(ArticleHomeDto dto,Short loadType,boolean firstPage);

    /**
     * 更新文章分值
     * @param mess
     */
    public void updateArticle(ArticleVisitStreamMess mess);

}
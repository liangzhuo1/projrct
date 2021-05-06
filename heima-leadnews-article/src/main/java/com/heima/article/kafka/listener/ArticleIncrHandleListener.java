package com.heima.article.kafka.listener;

import com.alibaba.fastjson.JSON;
import com.heima.article.service.ApArticleService;
import com.heima.common.constans.message.HotArticleConstants;
import com.heima.model.article.mess.ArticleVisitStreamMess;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ArticleIncrHandleListener {

    @Autowired
    private ApArticleService articleService;

    @KafkaListener(topics = HotArticleConstants.HOT_ARTICLE_INCR_HANDLE_TOPIC)
    public void receiveMessage(ConsumerRecord<String,String> record){
        Optional<? extends ConsumerRecord<?, ?>> optional = Optional.ofNullable(record);
        if(optional.isPresent()){
            String value = record.value();
            ArticleVisitStreamMess mess = JSON.parseObject(value, ArticleVisitStreamMess.class);
            articleService.updateArticle(mess);
        }

    }
}

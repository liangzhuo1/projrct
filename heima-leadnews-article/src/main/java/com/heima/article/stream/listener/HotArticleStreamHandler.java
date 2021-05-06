package com.heima.article.stream.listener;

import com.alibaba.fastjson.JSON;
import com.heima.article.config.stream.KafkaStreamListener;
import com.heima.common.constans.message.HotArticleConstants;
import com.heima.model.article.mess.ArticleVisitStreamMess;
import com.heima.model.article.mess.UpdateArticleMess;
import lombok.extern.log4j.Log4j2;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.kstream.*;
import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
@Log4j2
public class HotArticleStreamHandler implements KafkaStreamListener<KStream<?,String>> {

    @Override
    public String listenerTopic() {
        return HotArticleConstants.HOT_ARTICLE_SCORE_TOPIC;
    }

    @Override
    public String sendTopic() {
        return HotArticleConstants.HOT_ARTICLE_INCR_HANDLE_TOPIC;
    }

    @Override
    public KStream<?, String> getService(KStream<?, String> stream) {
        return stream.map((key,value)->{
            UpdateArticleMess mess = JSON.parseObject(value, UpdateArticleMess.class);
            //map<articleId,LIKES:1>
            System.out.println("key:"+mess.getArticleId()+",value:"+mess.getType().name()+":"+mess.getAdd());
            return new KeyValue<>(mess.getArticleId().toString(),mess.getType().name()+":"+mess.getAdd());
        }).groupByKey().windowedBy(TimeWindows.of(10000)).aggregate(new Initializer<String>() {
            @Override
            public String apply() {
                return "COLLECTION:0,COMMENT:0,LIKES:0,VIEWS:0";
            }
        }, new Aggregator<Object, String, String>() {
            @Override
            public String apply(Object aggKey, String value, String aggValue) {
                //LIKES:1
                String[] valArr = value.split(":");
                if(valArr[0].equals("") || valArr[1].equals("")){
                    return aggValue;
                }
                int col = 0,com = 0,lik = 0,vie=0;
                if("COLLECTION".equalsIgnoreCase(valArr[0])){
                    col+=Integer.valueOf(valArr[1]);
                }
                if("COMMENT".equalsIgnoreCase(valArr[0])){
                    com+=Integer.valueOf(valArr[1]);
                }
                if("LIKES".equalsIgnoreCase(valArr[0])){
                    lik+=Integer.valueOf(valArr[1]);
                }
                if("VIEWS".equalsIgnoreCase(valArr[0])){
                    vie+=Integer.valueOf(valArr[1]);
                }
                System.out.println(String.format("COLLECTION:%d,COMMENT:%d,LIKES:%d,VIEWS:%d",col,com,lik,vie));
                return String.format("COLLECTION:%d,COMMENT:%d,LIKES:%d,VIEWS:%d",col,com,lik,vie);
            }
        },Materialized.as("count-article-num-miukoo-1")).toStream().map((key,value)->{
            return new KeyValue<>(key.key().toString(),formatObj(key.key().toString(),value));
        });
    }

    /**
     * 格式化发送消息的value
     * @param ArticleId
     * @param value
     * @return
     */
    private String formatObj(String ArticleId,String value){
        ArticleVisitStreamMess mess = new ArticleVisitStreamMess();
        //value  -->  COLLECTION:%d,COMMENT:%d,LIKES:%d,VIEWS:%d
        Pattern pattern = Pattern.compile("COLLECTION:(\\d+),COMMENT:(\\d+),LIKES:(\\d+),VIEWS:(\\d+)");
        Matcher matcher = pattern.matcher(value);
        if(matcher.find()){
            mess.setCollect(Long.valueOf(matcher.group(1)));
            mess.setComment(Long.valueOf(matcher.group(2)));
            mess.setLike(Long.valueOf(matcher.group(3)));
            mess.setView(Long.valueOf(matcher.group(4)));
        }else {
            mess.setCollect(0);
            mess.setComment(0);
            mess.setLike(0);
            mess.setView(0);
        }
        mess.setArticleId(Long.valueOf(ArticleId));
        System.out.println(JSON.toJSONString(mess));//{"articleId":1302977558807060482,"collect":0,"comment":0,"like":0,"view":1}
        return JSON.toJSONString(mess);

    }
}

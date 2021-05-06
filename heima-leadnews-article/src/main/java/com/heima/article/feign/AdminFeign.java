package com.heima.article.feign;

import com.heima.model.common.dtos.ResponseResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("leadnews-admin")
public interface AdminFeign {

    @GetMapping("/api/v1/channel/channels")
    public ResponseResult selectAllChannel();
}

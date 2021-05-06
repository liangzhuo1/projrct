package com.heima.model.common.dtos;

import lombok.Data;

import java.io.Serializable;

@Data
public class PageResponseResult extends ResponseResult implements Serializable {
    private Long currentPage;
    private Long size;
    private Long total;

    public PageResponseResult(Long currentPage, Long size, Long total) {
        super();
        this.currentPage = currentPage;
        this.size = size;
        this.total = total;
    }

    public PageResponseResult() {

    }


}

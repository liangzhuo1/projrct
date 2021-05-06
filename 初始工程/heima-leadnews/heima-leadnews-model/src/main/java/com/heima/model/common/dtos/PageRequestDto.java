package com.heima.model.common.dtos;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
public class PageRequestDto {

    protected Integer size;

    protected Integer page;

    public void checkParam() {
        if (this.page == null || this.page <= 0) {
            this.setPage(1);
        }
        if (this.size == null || this.size <= 0 || this.size > 100) {
            this.setSize(10);
        }
    }
}

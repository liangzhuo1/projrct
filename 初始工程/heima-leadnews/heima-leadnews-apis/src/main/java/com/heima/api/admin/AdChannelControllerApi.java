package com.heima.api.admin;

import com.heima.model.admin.dtos.ChannelDto;
import com.heima.model.admin.pojos.AdChannel;
import com.heima.model.common.dtos.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@Api(tags = "channel", description = "频道管理API")
public interface  AdChannelControllerApi {
    /**
     * 根据名称分页查询频道列表
     * @param dto
     * @return
     */
    @ApiOperation("根据名称分页查询频道列表")
    public ResponseResult findByNameAndPage(ChannelDto dto);

    /**
     * 添加AdChannel
     * @param adChannel
     * @return
     */
    @ApiOperation("添加AdChannel")
    public ResponseResult insertChannel(AdChannel adChannel);

    @ApiOperation("修改回显")
    public ResponseResult findById(@ApiParam(value = "频道id",required = true) Integer id);









    /**
     * 修改
     * @param adChannel
     * @return
     */
    public ResponseResult update(AdChannel adChannel);

    /**
     * 删除
     * @param id
     * @return
     */
    @ApiOperation("删除")
    public ResponseResult delete(Integer id);
}

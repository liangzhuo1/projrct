package com.heima.apis.behavior;

import com.heima.model.behavior.pojos.ApBehaviorEntry;

import java.util.List;

public interface ApBehaviorEntryControllerApi {

    /**
     * 查询行为实体
     * @param userId
     * @param equipmentId
     * @return
     */
    public ApBehaviorEntry findByUserIdOrEquipmentId(Integer userId, Integer equipmentId);

    /**
     * 查询所有行为实体
     * @return
     */
    List<ApBehaviorEntry> selectAllEntry();
}

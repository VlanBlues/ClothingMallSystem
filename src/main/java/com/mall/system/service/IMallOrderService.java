package com.mall.system.service;

import com.mall.system.entity.MallOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.system.util.Result;

import java.util.List;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface IMallOrderService extends IService<MallOrder> {
    Result listByUserId(Integer userId,Integer current,Integer size);
}

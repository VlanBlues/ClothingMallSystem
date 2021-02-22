package com.mall.system.service;

import com.mall.system.entity.MallAddress;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.system.util.Result;

/**
 * <p>
 * 收货地址表 服务类
 * </p>
 *
 * @author lan
 * @since 2021-02-22
 */
public interface IMallAddressService extends IService<MallAddress> {
    Result listAddress(Integer current, Integer size);
}

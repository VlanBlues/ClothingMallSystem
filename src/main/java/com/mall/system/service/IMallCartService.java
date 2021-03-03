package com.mall.system.service;

import com.mall.system.entity.MallCart;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.system.util.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface IMallCartService extends IService<MallCart> {
    Result getByUserId(Integer userId);
}

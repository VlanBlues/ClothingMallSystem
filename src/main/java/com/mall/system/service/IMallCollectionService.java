package com.mall.system.service;

import com.mall.system.entity.MallCollection;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.system.util.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lan
 * @since 2021-03-08
 */
public interface IMallCollectionService extends IService<MallCollection> {
    Result listByUserId(Integer userId);
}

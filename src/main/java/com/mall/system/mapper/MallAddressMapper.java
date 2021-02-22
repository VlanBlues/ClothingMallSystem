package com.mall.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallAddress;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 收货地址表 Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-02-22
 */
public interface MallAddressMapper extends BaseMapper<MallAddress> {
    List<MallAddress> listAddress(Page<MallAddress> mallAddressPage);
}

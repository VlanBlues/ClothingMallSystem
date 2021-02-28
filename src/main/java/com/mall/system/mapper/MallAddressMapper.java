package com.mall.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallAddress;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

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
    Page<MallAddress> listAddress(@Param("userId") String userId,@Param("name") String name, Page<MallAddress> mallAddressPage);
}

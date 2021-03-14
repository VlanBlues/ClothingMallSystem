package com.mall.system.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 订单表 Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface MallOrderMapper extends BaseMapper<MallOrder> {
    Page<MallOrder> listByUserId(@Param("orderSn") String orderSn,@Param("userId") Integer userId, IPage<MallOrder> orderPage);
}

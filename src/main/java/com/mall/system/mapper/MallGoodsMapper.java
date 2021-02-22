package com.mall.system.mapper;

import com.mall.system.entity.MallGoods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 商品基本信息表 Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface MallGoodsMapper extends BaseMapper<MallGoods> {
    List<MallGoods> queryByOrderSn(@Param("orderSn") String orderSn);
}

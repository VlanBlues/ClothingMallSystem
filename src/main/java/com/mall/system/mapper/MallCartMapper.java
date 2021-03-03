package com.mall.system.mapper;

import com.mall.system.entity.MallCart;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface MallCartMapper extends BaseMapper<MallCart> {
    List<MallCart> getByUserId(@Param("userId") Integer userId);
}

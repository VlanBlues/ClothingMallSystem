package com.mall.system.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallCollection;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-03-08
 */
public interface MallCollectionMapper extends BaseMapper<MallCollection> {
    Page<MallCollection> listByUserId(@Param("goodsSn") String goodsSn, @Param("userId") Integer userId, IPage<MallCollection> page);
}

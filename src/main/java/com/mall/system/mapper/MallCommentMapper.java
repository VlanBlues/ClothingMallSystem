package com.mall.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 评论表 Mapper 接口
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface MallCommentMapper extends BaseMapper<MallComment> {
    Page<MallComment> listComment(@Param("userId") Integer userId,@Param("goodsSn") String goodsSn, Page<MallComment> mallCommentPage);
}

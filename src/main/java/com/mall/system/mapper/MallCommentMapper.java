package com.mall.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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
    List<MallComment> listComment(Page<MallComment> mallCommentPage);
}

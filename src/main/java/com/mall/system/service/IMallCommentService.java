package com.mall.system.service;

import com.mall.system.entity.MallComment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.system.util.Result;

import java.util.List;

/**
 * <p>
 * 评论表 服务类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
public interface IMallCommentService extends IService<MallComment> {
    Result listComment(Integer userId,String goodsSn ,Integer current, Integer size);
}

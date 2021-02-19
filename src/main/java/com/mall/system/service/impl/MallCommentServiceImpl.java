package com.mall.system.service.impl;

import com.mall.system.entity.MallComment;
import com.mall.system.mapper.MallCommentMapper;
import com.mall.system.service.IMallCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Service
public class MallCommentServiceImpl extends ServiceImpl<MallCommentMapper, MallComment> implements IMallCommentService {

}

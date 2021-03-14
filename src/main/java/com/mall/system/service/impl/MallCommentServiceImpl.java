package com.mall.system.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallComment;
import com.mall.system.mapper.MallCommentMapper;
import com.mall.system.service.IMallCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.system.util.Result;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource
    private MallCommentMapper commentMapper;

    @Override
    public Result listComment(Integer userId,String goodsSn ,Integer current, Integer size) {
        try {
            Page<MallComment> commentPage = new Page<>(current,size);
            Page<MallComment> commentList = commentMapper.listComment(userId,goodsSn,commentPage);
            return Result.success(commentList);
        }catch (Exception e){
            return Result.fail(e.getMessage());
        }
    }
}

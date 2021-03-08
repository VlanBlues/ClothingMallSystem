package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallComment;
import com.mall.system.service.IMallCommentService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 评论表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/comment")
public class MallCommentController {

    @Resource
    private IMallCommentService commentService;

    @RequestMapping("/add")
    public Result addComment(MallComment comment) {
        if (commentService.save(comment)) {
            return Result.success("评论成功！");
        }
        return Result.fail("评论失败！");
    }
    
    @RequestMapping("/delete")
    public Result deleteComment(Integer commentId){
        UpdateWrapper<MallComment> wrapper = new UpdateWrapper<>();
        wrapper.eq("comment_id",commentId).set("deleted",1);
        if (commentService.update(wrapper)) {
            return Result.success("评论删除成功！");
        }
        return Result.fail("评论删除失败！");
    }
    
    @RequestMapping("/list")
    public Result listComment(Integer current,Integer size){
        
        return commentService.listComment(current,size);
    }
}

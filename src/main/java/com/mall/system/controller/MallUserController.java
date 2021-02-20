package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallUser;
import com.mall.system.service.IMallUserService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.EncryptUtil;
import com.mall.system.util.IpUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/user")
public class MallUserController {

    @Resource
    private IMallUserService userService;

    @RequestMapping("/login")
    public Result login(MallUser user, HttpServletRequest request){
        user.setPassword(EncryptUtil.Base64Encode(user.getPassword().trim()));
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username",user.getUsername()).eq("password",user.getPassword())
                .ne("deleted",1);
        int count = userService.count(wrapper);
        if(count>0){
            UpdateWrapper<MallUser> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("username",user.getUsername()).set("last_login_time",DateUtil.getStringDate())
                    .set("last_login_ip",IpUtil.getIpAddr(request));
            userService.update(updateWrapper);
            return Result.success("登录成功!","eca6948a-fcb3-4e1a-bf9d-ab4a0be907cc");
        }
        return Result.fail("用户名或密码错误！");
    }
    
    @RequestMapping("/add")
    public Result addUser(MallUser user){
        user.setAddTime(DateUtil.getStringDate());
        user.setPassword(EncryptUtil.Base64Encode(user.getPassword().trim()));
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username",user.getUsername().trim());
        if(userService.count(wrapper) > 1){
            return Result.fail("用户名已存在");
        }
        user.setAddTime(DateUtil.getStringDate());
        if(userService.save(user)){
            return Result.success("注册成功！");
        }
        return Result.fail("注册失败！");
    }

    @RequestMapping("/update")
    public Result updateUser(MallUser user){
        user.setUpdateTime(DateUtil.getStringDate());
        if(userService.updateById(user)){
            return Result.success("更新成功！");
        }
        return Result.fail("更新失败！");
    }

    @RequestMapping("/delete")
    public Result deleteUser(MallUser user){
        UpdateWrapper<MallUser> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("user_id",user.getUserId()).set("deleted",1);
        if(userService.update(updateWrapper)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败!");
    }

    @RequestMapping("/list")
    public Result listUser(Integer current,Integer size){
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted", 1);
        IPage<MallUser> userIPage = new Page<>(current,size);
        IPage page = userService.page(userIPage, wrapper);
        return Result.success(page);
    }
}

package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallUser;
import com.mall.system.service.IMallUserService;
import com.mall.system.util.*;
import io.netty.util.internal.StringUtil;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
    public Result login(@RequestBody MallUser user, HttpServletRequest request){
        user.setPassword(EncryptUtil.Base64Encode(user.getPassword().trim()));
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username",user.getUsername()).eq("password",user.getPassword())
                .ne("deleted",1);
        MallUser mallUser = userService.getOne(wrapper);
        if(!StringUtil.isNullOrEmpty(mallUser.getUsername())){
            UpdateWrapper<MallUser> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("username",user.getUsername()).set("last_login_time",DateUtil.getStringDate())
                    .set("last_login_ip",IpUtil.getIpAddr(request));
            userService.update(updateWrapper);
            return Result.success("登录成功!",mallUser);
        }
        return Result.fail("用户名或密码错误！");
    }

    @RequestMapping("/addOrUpdate")
    public Result addUser(@RequestBody MallUser user){
        user.setPassword(EncryptUtil.Base64Encode(user.getPassword().trim()));
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        wrapper.eq("username",user.getUsername().trim());
        if(userService.count(wrapper) > 1){
            return Result.fail("用户名已存在");
        }
        user.setAddTime(DateUtil.getStringDate());
        if(userService.saveOrUpdate(user)){
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
    public Result deleteUser(Integer id){
        MallUser user = userService.getById(id);
        UpdateWrapper<MallUser> updateWrapper = new UpdateWrapper<>();
        String msg;
        String err;
        if(user.getDeleted() == 0){
            updateWrapper.eq("user_id",id).set("deleted",1);
            msg = "失效成功！";
            err = "失效失败！";
        }else {
            updateWrapper.eq("user_id",id).set("deleted",0);
            msg = "恢复可用！";
            err = "恢复失败！";
        }
        if(userService.update(updateWrapper)){
            return Result.success(msg);
        }
        return Result.fail(err);
    }

    @RequestMapping("/list")
    public Result listUser(String username,String mobile,Integer current,Integer size){
        QueryWrapper<MallUser> wrapper = new QueryWrapper<>();
        if(ObjectUtil.isNotEmpty(username)){
            wrapper.like("username",username);
        }
        if(ObjectUtil.isNotEmpty(mobile)){
            wrapper.like("mobile",mobile);
        }
        IPage<MallUser> userIPage = new Page<>(current,size);
        IPage page = userService.page(userIPage, wrapper);
        return Result.success(page);
    }
}

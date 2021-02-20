package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallAdmin;
import com.mall.system.service.IMallAdminService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.EncryptUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/admin")
public class MallAdminController {
    @Resource
    private IMallAdminService adminService;
    
    @RequestMapping("/login")
    public Result login(MallAdmin admin){
        admin.setPassword(EncryptUtil.Base64Encode(admin.getPassword().trim()));
        QueryWrapper<MallAdmin> wrapper = new QueryWrapper<>();
        wrapper.eq("username",admin.getUsername()).eq("password",admin.getPassword())
                .ne("deleted",1);
        int count = adminService.count(wrapper);
        if(count>0){
            UpdateWrapper<MallAdmin> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("username",admin.getUsername()).set("last_login_time",DateUtil.getStringDate());
            adminService.update(updateWrapper);
            return Result.success("登录成功!","eca6948a-fcb3-4e1a-bf9d-ab4a0be907cc");
        }
        return Result.fail("用户名或密码错误！");
    }
    
    //添加管理员
    @RequestMapping("/add")
    public Result addAdmin(MallAdmin admin){
        admin.setAddTime(DateUtil.getStringDate());
        admin.setPassword(EncryptUtil.Base64Encode(admin.getPassword().trim()));
        QueryWrapper<MallAdmin> wrapper = new QueryWrapper<>();
        wrapper.eq("username",admin.getUsername().trim());
        if(adminService.count(wrapper) > 1){
            return Result.fail("用户名已存在");
        }
        admin.setAddTime(DateUtil.getStringDate());
        if(adminService.save(admin)){
            return Result.success("注册成功！");
        }
        return Result.fail("注册失败！");
    }
    
    @RequestMapping("/update")
    public Result updateAdmin(MallAdmin admin){
        if(adminService.updateById(admin)){
            return Result.success("更新成功！");
        }
        return Result.fail("更新失败！");
    }
    
    @RequestMapping("/delete")
    public Result deleteAdmin(MallAdmin admin){
        UpdateWrapper<MallAdmin> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("admin_id",admin.getAdminId()).set("deleted",1);
        if(adminService.update(updateWrapper)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败!");
    }
    
    @RequestMapping("/list")
    public Result listAdmin(Integer current,Integer size){
        QueryWrapper<MallAdmin> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted", 1);
        IPage<MallAdmin> adminIPage = new Page<>(current,size);
        IPage page = adminService.page(adminIPage, wrapper);
        return Result.success(page);
    }
}

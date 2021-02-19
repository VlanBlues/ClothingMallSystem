package com.mall.system.controller;


import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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
    
    @RequestMapping("/test")
    public Result ClassName(){
        return Result.success("123");
    }
}

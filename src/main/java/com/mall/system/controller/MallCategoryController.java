package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.mall.system.entity.MallCategory;
import com.mall.system.service.IMallCategoryService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 类目表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/category")
public class MallCategoryController {
    @Resource
    private IMallCategoryService categoryService;
    
    @RequestMapping("/add")
    public Result addCategory(MallCategory category){
        category.setAddTime(DateUtil.getStringDate());
        if (categoryService.save(category)) {
            return Result.success("添加成功！");
        }
        return Result.fail("添加失败！");
    }

    @RequestMapping("/delete")
    public Result deleteCategory(Integer categoryId){
        UpdateWrapper<MallCategory> wrapper = new UpdateWrapper<>();
        wrapper.eq("category_id",categoryId).set("deleted",1);
        if (categoryService.update(wrapper)) {
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }
    
    @RequestMapping("/list")
    public Result listCategory(){
        QueryWrapper<MallCategory> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted",1);
        return Result.success(categoryService.list(wrapper));
    }
    
    @RequestMapping("/update")
    public Result updateCategory(MallCategory category){
        category.setUpdateTime(DateUtil.getStringDate());
        if (categoryService.saveOrUpdate(category)) {
            return Result.success("修改成功！");
        }
        return Result.fail("修改失败！");
    }
}

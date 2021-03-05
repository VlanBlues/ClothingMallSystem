package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallCategory;
import com.mall.system.entity.MallGoods;
import com.mall.system.service.IMallCategoryService;
import com.mall.system.service.IMallGoodsService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品基本信息表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/goods")
public class MallGoodsController {

    @Resource
    private IMallGoodsService goodsService;
    
    @Resource
    private IMallCategoryService categoryService;

    @PostMapping("/add")
    public Result addCategory(@RequestBody MallGoods goods){
        System.out.println(1231);
        if (goodsService.save(goods)) {
            return Result.success("商品添加成功！");
        }
        return Result.fail("商品添加失败！");
    }

    @RequestMapping("/delete")
    public Result deleteCategory(Integer goodsId){
        UpdateWrapper<MallGoods> wrapper = new UpdateWrapper<>();
        wrapper.eq("goods_id",goodsId).set("deleted",1);
        if (goodsService.update(wrapper)) {
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @RequestMapping("/list")
    public Result list(Integer current,Integer size){
        QueryWrapper<MallGoods> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted",1);
        IPage<MallGoods> goodsIPage = new Page<>(current,size);
        IPage page = goodsService.page(goodsIPage, wrapper);
        return Result.success(page);
    }
    
    @RequestMapping("/getByGoodsId")
    public Result getByGoodsId(Integer goodsId){
        MallGoods goods = goodsService.getById(goodsId);
        return Result.success(goods);
    }
    
    @RequestMapping("/listByCategoryId")
    public Result listByCategoryId(Integer categoryId){
        QueryWrapper<MallGoods> wrapper = new QueryWrapper<>();
        if(null != categoryId){
            wrapper.eq("category_id",categoryId).ne("deleted",1);
            return Result.success(goodsService.list(wrapper));
        }
        return Result.fail("参数不能为空");
    }

    @RequestMapping("/listBySearch")
    public Result listBySearch(String search){
        QueryWrapper<MallGoods> wrapper = new QueryWrapper<>();
        if(null != search){
            wrapper.like("brief",search).ne("deleted",1);
            return Result.success(goodsService.list(wrapper));
        }
        return Result.fail("参数不能为空");
    }

    @RequestMapping("/listByCategory")
    public Result listByCategory(){
        List<MallCategory> categories = categoryService.list();
        List<Object> list = new ArrayList<>();
        Map<String, Object> map;
        for (MallCategory category : categories) {
            map = new HashMap<>();
            QueryWrapper<MallGoods> wrapper = new QueryWrapper<>();
            wrapper.eq("category_id",category.getCategoryId()).ne("deleted",1);
            map.put("name",category.getName());
            map.put("list",goodsService.list(wrapper));
            list.add(map);
        }
        return Result.success(list);
    }

    @RequestMapping("/update")
    public Result updateCategory(MallGoods goods){
        goods.setUpdateTime(DateUtil.getStringDate());
        if (goodsService.saveOrUpdate(goods)) {
            return Result.success("修改成功！");
        }
        return Result.fail("修改失败！");
    }
}

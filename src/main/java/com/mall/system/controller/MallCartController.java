package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallCart;
import com.mall.system.service.IMallCartService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.ObjectUtil;
import com.mall.system.util.Result;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import sun.nio.cs.ext.MacArabic;

import javax.annotation.Resource;

/**
 * <p>
 *  购物车前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/cart")
public class MallCartController {

    @Resource
    private IMallCartService cartService;
    
    @RequestMapping("/add")
    public Result addCart(MallCart cart){
        cart.setAddTime(DateUtil.getStringDate());
        QueryWrapper<MallCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",cart.getUserId()).eq("goods_sn",cart.getGoodsSn())
                .ne("deleted",1);
        MallCart queryCart = cartService.getOne(wrapper);
        if(ObjectUtil.isNotEmpty(queryCart.getCartId().toString())){
            queryCart.setNum(queryCart.getNum()+1);
            queryCart.setUpdateTime(DateUtil.getStringDate());
            if(cartService.saveOrUpdate(queryCart)){
                return Result.success("当前商品已存在！购物车加一");
            }
        }else {
            cart.setAddTime(DateUtil.getStringDate());
            if(cartService.save(cart)){
                return Result.success("添加购物车成功！");
            }
        }
        return Result.fail("添加购物车失败！");
    }
    
    @RequestMapping("/delete")
    public Result deleteCart(Integer cartId){
        UpdateWrapper<MallCart> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("cart_id",cartId).set("deleted",1);
        if(cartService.update(updateWrapper)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }
    
    @RequestMapping("/listByUserId")
    public Result listByUserId(Integer current,Integer size,Integer userId){
        QueryWrapper<MallCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId).ne("deleted",1);
        IPage<MallCart> cartIPage = new Page<>(current,size);
        IPage page = cartService.page(cartIPage, wrapper);
        return Result.success(page);
    }

    @RequestMapping("/list")
    public Result list(Integer current,Integer size){
        QueryWrapper<MallCart> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted",1);
        IPage<MallCart> cartIPage = new Page<>(current,size);
        IPage page = cartService.page(cartIPage, wrapper);
        return Result.success(page);
    }
    
    @RequestMapping("/update")
    public Result updateCart(MallCart cart){
        cart.setUpdateTime(DateUtil.getStringDate());
        if (cartService.saveOrUpdate(cart)) {
            return Result.success("更新成功！");
        }
        return Result.fail("更新失败!");
    }
}

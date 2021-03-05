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
import org.springframework.web.bind.annotation.*;

import sun.nio.cs.ext.MacArabic;

import javax.annotation.Resource;
import java.util.List;

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
    
    @PostMapping("/add")
    public Result addCart(@RequestBody MallCart cart){
        QueryWrapper<MallCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",cart.getUserId()).eq("goods_sn",cart.getGoodsSn())
                .ne("deleted",1).ne("check_set",1);
        MallCart queryCart = cartService.getOne(wrapper);
        Integer beforeGoodsNun = cart.getGoodsNum();
        if(null != queryCart){
            queryCart.setGoodsNum(queryCart.getGoodsNum()+cart.getGoodsNum());
            boolean b = cartService.saveOrUpdate(queryCart);
            if(b && beforeGoodsNun == 0){
                return Result.success("添加购物车成功！",listByUserId(cart.getUserId()));
            }else if(b){
                return Result.success("当前商品已存在！购物车加"+cart.getGoodsNum(),listByUserId(cart.getUserId()));
            }
        }else {
            if(cartService.save(cart)){
                return Result.success("添加购物车成功！",listByUserId(cart.getUserId()));
            }
        }
        return Result.fail("添加购物车失败！");
    }
    
    @GetMapping("/delete")
    public Result deleteCart( Integer cartId){
        UpdateWrapper<MallCart> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("cart_id",cartId).set("deleted",1);
        if(cartService.update(updateWrapper)){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }
    
    @RequestMapping("/listByUserId")
    public Result listByUserId(Integer userId){
        
        return cartService.getByUserId(userId);
    }

    @RequestMapping("/list")
    public Result list(Integer current,Integer size){
        QueryWrapper<MallCart> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted",1).ne("goods_num",0);
        IPage<MallCart> cartIPage = new Page<>(current,size);
        IPage page = cartService.page(cartIPage, wrapper);
        return Result.success(page);
    }
    
    @PostMapping("/update")
    public Result updateCart(@RequestBody MallCart cart){
        UpdateWrapper<MallCart> wrapper = new UpdateWrapper<>();
        wrapper.eq("cart_id",cart.getCartId());
        if(null != cart.getGoodsNum()){
            wrapper.set("goods_num",cart.getGoodsNum());
        }
        if(null != cart.getDeleted()){
            wrapper.set("deleted",cart.getDeleted());
        }
        if (cartService.update(wrapper)) {
            return Result.success("更新成功！");
        }
        return Result.fail("更新失败!");
    }
}

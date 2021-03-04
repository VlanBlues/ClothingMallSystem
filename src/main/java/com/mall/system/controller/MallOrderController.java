package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.mall.system.entity.MallCart;
import com.mall.system.entity.MallCategory;
import com.mall.system.entity.MallOrder;
import com.mall.system.entity.MallOrderGoods;
import com.mall.system.service.IMallCartService;
import com.mall.system.service.IMallOrderGoodsService;
import com.mall.system.service.IMallOrderService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@RestController
@RequestMapping("/order")
public class MallOrderController {

    @Resource
    private IMallOrderService orderService;
    
    @Resource
    private IMallCartService cartService;
    
    @Resource
    private IMallOrderGoodsService orderGoodsService;

    @PostMapping("/add")
    @Transactional
    public Result addOrders(@RequestBody MallOrder order){
        //订单编号
        String orderSn = DateUtil.getNo(3);
        order.setOrderSn(orderSn);
        for (MallCart mallCart : order.getCartList()) {
            MallOrderGoods orderGoods = new MallOrderGoods();
            orderGoods.setOrderSn(orderSn);
            orderGoods.setGoodsSn(mallCart.getGoodsSn());
            orderGoods.setNum(mallCart.getGoodsNum());
            orderGoodsService.save(orderGoods);
            //更新购物车已经被收为订单
            UpdateWrapper<MallCart> wrapper = new UpdateWrapper<>();
            wrapper.eq("cart_id",mallCart.getCartId()).set("check",0);
            cartService.update(wrapper);
        }
        if (orderService.save(order)) {
            return Result.success("订单创建成功！");
        }
        return Result.fail("订单创建失败！");
    }

    @RequestMapping("/delete")
    public Result deleteOrders(Integer orderId,String orderSn){
        UpdateWrapper<MallOrder> wrapper = new UpdateWrapper<>();
        wrapper.eq("order_id",orderId).set("deleted",1);
        UpdateWrapper<MallOrderGoods> orderGoodsUpdateWrapper = new UpdateWrapper<>();
        orderGoodsUpdateWrapper.eq("order_sn",orderSn).set("deleted",1);
        if (orderService.update(wrapper) && orderGoodsService.update(orderGoodsUpdateWrapper)) {
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @RequestMapping("/listByUser")
    public Result listOrders(Integer userId){
        QueryWrapper<MallOrder> wrapper = new QueryWrapper<>();
        wrapper.ne("deleted",1);
        return Result.success(orderService.list(wrapper));
    }

    @RequestMapping("/update")
    public Result updateOrders(MallOrder order){
        order.setUpdateTime(DateUtil.getStringDate());
        if (orderService.saveOrUpdate(order)) {
            return Result.success("修改成功！");
        }
        return Result.fail("修改失败！");
    }
}

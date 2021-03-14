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
        String shipSn = "wl"+DateUtil.getRandom(10);
        //物流单号
        order.setOrderSn(orderSn);
        order.setShipSn(shipSn);
        for (MallCart mallCart : order.getCartList()) {
            MallOrderGoods orderGoods = new MallOrderGoods();
            orderGoods.setOrderSn(orderSn);
            orderGoods.setGoodsSn(mallCart.getGoodsSn());
            orderGoods.setNum(mallCart.getGoodsNum());
            orderGoodsService.save(orderGoods);
            //更新购物车已经被收为订单
            UpdateWrapper<MallCart> wrapper = new UpdateWrapper<>();
            wrapper.eq("cart_id",mallCart.getCartId()).set("check_set",1);
            cartService.update(wrapper);
        }
        if (orderService.save(order)) {
            return Result.success("订单创建成功！");
        }
        return Result.fail("订单创建失败！");
    }

    @PostMapping("/delete")
    public Result deleteOrders(@RequestBody MallOrder order){
        UpdateWrapper<MallOrder> wrapper = new UpdateWrapper<>();
        wrapper.eq("order_id",order.getOrderId()).set("deleted",1);
        UpdateWrapper<MallOrderGoods> orderGoodsUpdateWrapper = new UpdateWrapper<>();
        orderGoodsUpdateWrapper.eq("order_sn",order.getOrderSn()).set("deleted",1);
        if (orderService.update(wrapper) && orderGoodsService.update(orderGoodsUpdateWrapper)) {
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @RequestMapping("/listByUser")
    public Result listOrders(String orderSn,Integer userId,Integer current,Integer size){
        return orderService.listByUserId(orderSn,userId,current,size);
    }

    @RequestMapping("/update")
    public Result updateOrders(MallOrder order){
        if (orderService.saveOrUpdate(order)) {
            return Result.success("修改成功！");
        }
        return Result.fail("修改失败！");
    }

    //发货
    @PostMapping("/ship")
    public Result shipOrders(@RequestBody MallOrder order){
        UpdateWrapper<MallOrder> wrapper = new UpdateWrapper<>();
        wrapper.eq("order_id",order.getOrderId()).set("order_status",2);
        boolean update = orderService.update(wrapper);
        if(update){
            return Result.success("发货成功！");
        }
        return Result.fail("发货失败！");
    }

    //收货
    @PostMapping("/receive")
    public Result receive(@RequestBody MallOrder order){
        UpdateWrapper<MallOrder> wrapper = new UpdateWrapper<>();
        wrapper.eq("order_id",order.getOrderId()).set("order_status",3);
        boolean update = orderService.update(wrapper);
        if(update){
            return Result.success("收货成功！");
        }
        return Result.fail("收货失败！");
    }

    //取消
    @PostMapping("/cancel")
    public Result cancel(@RequestBody MallOrder order){
        UpdateWrapper<MallOrder> wrapper = new UpdateWrapper<>();
        wrapper.eq("order_id",order.getOrderId()).set("order_status",4);
        boolean update = orderService.update(wrapper);
        if(update){
            return Result.success("取消订单成功！");
        }
        return Result.fail("取消订单失败！");
    }
}

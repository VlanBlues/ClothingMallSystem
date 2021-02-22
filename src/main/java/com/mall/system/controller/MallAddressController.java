package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.mall.system.entity.MallAddress;
import com.mall.system.service.IMallAddressService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 收货地址表 前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-02-22
 */
@RestController
@RequestMapping("/address")
public class MallAddressController {
    @Resource
    private IMallAddressService addressService;

    @RequestMapping("/add")
    public Result addAddress(MallAddress address){
        address.setAddTime(DateUtil.getStringDate());
        if (addressService.save(address)) {
            return Result.success("地址添加成功！");
        }
        return Result.fail("添加失败！");
    }

    @RequestMapping("/delete")
    public Result deleteAddress(Integer addressId){
        UpdateWrapper<MallAddress> wrapper = new UpdateWrapper<>();
        wrapper.eq("address_id",addressId).set("deleted",1);
        if (addressService.update(wrapper)) {
            return Result.success("地址删除成功！");
        }
        return Result.fail("地址删除失败！");
    }

    @RequestMapping("/listByUserId")
    public Result listByUserId(Integer userId){
        QueryWrapper<MallAddress> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId).ne("deleted",1);
        return Result.success(addressService.list(wrapper));
    }

    /**
     *
     * @param current 当前页
     * @param size 一页大小
     * @return 地址列表
     */
    @RequestMapping("/list")
    public Result listAddress(Integer current,Integer size){
        return addressService.listAddress(current, size);
    }

    @RequestMapping("/update")
    public Result updateAddress(MallAddress address){
        address.setUpdateTime(DateUtil.getStringDate());
        if (addressService.saveOrUpdate(address)) {
            return Result.success("地址修改成功！");
        }
        return Result.fail("地址修改失败！");
    }

}

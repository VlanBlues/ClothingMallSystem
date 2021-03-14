package com.mall.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallOrder;
import com.mall.system.mapper.MallOrderMapper;
import com.mall.system.service.IMallOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.system.util.Result;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Service
public class MallOrderServiceImpl extends ServiceImpl<MallOrderMapper, MallOrder> implements IMallOrderService {

    @Resource
    private MallOrderMapper orderMapper;

    @Override
    public Result listByUserId(String orderSn,Integer userId, Integer current, Integer size) {
        IPage<MallOrder> page = new Page<>(current,size);
        Page<MallOrder> orderList = orderMapper.listByUserId(orderSn,userId, page);
        return Result.success(orderList);
    }
}

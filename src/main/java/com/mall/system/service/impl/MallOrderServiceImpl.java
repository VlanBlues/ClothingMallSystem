package com.mall.system.service.impl;

import com.mall.system.entity.MallOrder;
import com.mall.system.mapper.MallOrderMapper;
import com.mall.system.service.IMallOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}

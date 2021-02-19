package com.mall.system.service.impl;

import com.mall.system.entity.MallAddress;
import com.mall.system.mapper.MallAddressMapper;
import com.mall.system.service.IMallAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 收货地址表 服务实现类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Service
public class MallAddressServiceImpl extends ServiceImpl<MallAddressMapper, MallAddress> implements IMallAddressService {

}

package com.mall.system.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.system.entity.MallAddress;
import com.mall.system.mapper.MallAddressMapper;
import com.mall.system.service.IMallAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.system.util.Result;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Resource
    private MallAddressMapper addressMapper;
    
    @Override
    public Result listAddress(Integer current, Integer size) {
        Page<MallAddress> page = new Page<>(current,size);
        List<MallAddress> mallAddresses = addressMapper.listAddress(page);
        return Result.success(mallAddresses);
    }
}

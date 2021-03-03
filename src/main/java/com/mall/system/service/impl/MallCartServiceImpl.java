package com.mall.system.service.impl;

import com.mall.system.entity.MallCart;
import com.mall.system.mapper.MallCartMapper;
import com.mall.system.service.IMallCartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.system.util.Result;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Service
public class MallCartServiceImpl extends ServiceImpl<MallCartMapper, MallCart> implements IMallCartService {

    @Resource
    private MallCartMapper cartMapper;
    
    @Override
    public Result getByUserId(Integer userId) {
        List<MallCart> cartList = cartMapper.getByUserId(userId);
        
        return Result.success(cartList);
    }
}

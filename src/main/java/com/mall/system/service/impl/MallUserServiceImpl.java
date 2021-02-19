package com.mall.system.service.impl;

import com.mall.system.entity.MallUser;
import com.mall.system.mapper.MallUserMapper;
import com.mall.system.service.IMallUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Service
public class MallUserServiceImpl extends ServiceImpl<MallUserMapper, MallUser> implements IMallUserService {

}

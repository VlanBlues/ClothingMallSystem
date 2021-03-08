package com.mall.system.service.impl;

import com.mall.system.entity.MallCollection;
import com.mall.system.mapper.MallCollectionMapper;
import com.mall.system.service.IMallCollectionService;
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
 * @since 2021-03-08
 */
@Service
public class MallCollectionServiceImpl extends ServiceImpl<MallCollectionMapper, MallCollection> implements IMallCollectionService {

    @Resource
    private MallCollectionMapper collectionMapper;
    
    @Override
    public Result listByUserId(Integer userId) {
        List<MallCollection> mallCollections = collectionMapper.listByUserId(userId);
        return Result.success(mallCollections);
    }
}

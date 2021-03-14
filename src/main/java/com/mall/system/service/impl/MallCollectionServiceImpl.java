package com.mall.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
    public Result listByUserId(String goodsSn,Integer userId,Integer current,Integer size) {
        IPage<MallCollection> page = new Page<>(current,size);
        Page<MallCollection> mallCollections = collectionMapper.listByUserId(goodsSn,userId,page);
        return Result.success(mallCollections);
    }
}

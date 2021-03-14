package com.mall.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.mall.system.entity.MallCollection;
import com.mall.system.service.IMallCollectionService;
import com.mall.system.util.DateUtil;
import com.mall.system.util.Result;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lan
 * @since 2021-03-08
 */
@RestController
@RequestMapping("/collection")
public class MallCollectionController {
    @Resource
    private IMallCollectionService collectionService;

    @PostMapping("/addOrUpdate")
    public Result addAddress(@RequestBody MallCollection collection){
        QueryWrapper<MallCollection> wrapper = new QueryWrapper<>();
        wrapper.eq("goods_id",collection.getGoodsId()).eq("user_id",collection.getUserId());
        MallCollection mallCollection = collectionService.getOne(wrapper);
        if(null == mallCollection){
            if (collectionService.save(collection)) {
                return Result.success("收藏成功！");
            }
        }else {
            UpdateWrapper<MallCollection> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("collection_id",mallCollection.getCollectionId());
            if(mallCollection.getDeleted() == 1){
                updateWrapper.set("deleted",0);
                if(collectionService.update(updateWrapper)){
                    return Result.success("收藏成功！");
                }
            }else {
                updateWrapper.set("deleted",1);
                if(collectionService.update(updateWrapper)){
                    return Result.success("取消收藏成功！");
                }
            }
        }

        return Result.fail("收藏操作失败！");
    }

    @RequestMapping("/listByUserId")
    public Result listByUserId(String goodsSn,Integer userId,Integer current,Integer size){
       return collectionService.listByUserId(goodsSn,userId,current,size);
    }

    @RequestMapping("/getCollectionState")
    public Result getCollectionState(MallCollection collection){
        QueryWrapper<MallCollection> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",collection.getUserId()).eq("goods_id",collection.getGoodsId());
        MallCollection collection1 = collectionService.getOne(wrapper);
        Map<String, Object> map = new HashMap<>();
        if(null == collection1 || collection1.getDeleted() == 1){
            map.put("state",false);
            return Result.success("",map);
        }
        map.put("state",true);
        return Result.success("",map);
    }
}

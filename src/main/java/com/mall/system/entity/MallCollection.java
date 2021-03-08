package com.mall.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author lan
 * @since 2021-03-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallCollection implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "collection_id", type = IdType.AUTO)
    private Integer collectionId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 货物Id
     */
    private Integer goodsId;

    /**
     * 创建时间
     */
    private String addTime;

    /**
     * 更新时间
     */
    private String updateTime;

    /**
     * 逻辑删除
     */
    private int deleted;

    @TableField(exist = false)
    private MallGoods mallGoods;

}

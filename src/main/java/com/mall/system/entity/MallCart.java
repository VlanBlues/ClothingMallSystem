package com.mall.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2021-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallCart implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "cart_id", type = IdType.AUTO)
    private Integer cartId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 货物sn码
     */
    private String goodsSn;

    /**
     * 数量
     */
    private Integer num;

    private String addTime;

    private String updateTime;

    /**
     * 逻辑删除
     */
    private Integer deleted;


}

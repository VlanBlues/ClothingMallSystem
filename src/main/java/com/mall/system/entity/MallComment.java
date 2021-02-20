package com.mall.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 评论表
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallComment implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "comment_id", type = IdType.AUTO)
    private Integer commentId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 用户表的用户ID
     */
    private Integer userId;

    /**
     * 订单id
     */
    private Integer orderId;

    /**
     * 订单货物id
     */
    private Integer orderGoodsId;

    /**
     * 评分， 1-5
     */
    private Integer star;

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
    private Boolean deleted;

    @TableField(exist = false)
    private MallGoods goods;

    @TableField(exist = false)
    private MallUser user;


}

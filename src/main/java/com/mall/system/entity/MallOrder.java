package com.mall.system.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "order_id", type = IdType.AUTO)
    private Integer orderId;

    /**
     * 用户表的用户ID
     */
    private Integer userId;

    /**
     * 订单编号
     */
    private String orderSn;

    /**
     * 订单状态(0.未支付 1.已支付 2.已取消)
     */
    private Integer orderStatus;

    /**
     * 用户订单留言
     */
    private String message;

    /**
     * 订单费用
     */
    private BigDecimal orderPrice;

    /**
     * 发货开始时间
     */
    private String shipTime;

    /**
     * 物流单号
     */
    private String shipSn;

    /**
     * 用户确认收货时间
     */
    private String confirmTime;

    /**
     * 订单关闭时间
     */
    private String endTime;

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
    private Integer deleted;

    @TableField(exist = false)
    private List<MallCart> cartList;
    
    /*@TableField(exist = false)
    private List<MallOrderGoods> orderGoodsList;

    @TableField(exist = false)
    private List<MallGoods> goodsList;*/

    @TableField(exist = false)
    private MallUser user;


}

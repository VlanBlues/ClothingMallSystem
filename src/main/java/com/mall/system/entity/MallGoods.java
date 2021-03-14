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
 * 商品基本信息表
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallGoods implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "goods_id", type = IdType.AUTO)
    private Integer goodsId;

    /**
     * 商品编号
     */
    private String goodsSn;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品所属类目ID
     */
    private Integer categoryId;

    /**
     * 商品宣传图片列表，采用JSON数组格式
     */
    private String gallery;

    /**
     * 商品简介
     */
    private String brief;

    /**
     * 商品剩余数量
     */
    private Integer num;

    /**
     * 商品页面商品图片
     */
    private String picUrl;

    /**
     * 零售价格
     */
    private BigDecimal retailPrice;


    /**
     * 商品详细介绍，是富文本格式
     */
    private String detail;

    /**
     * 创建时间
     */
    private String addTime;

    /**
     * 更新时间
     */
    private String updateTime;

    /**
     * 浏览量
     */
    private Integer browse;

    /**
     * 已销售总量
     */
    private Integer sales;

    /**
     * 逻辑删除
     */
    private Integer deleted;

    /**
     * 审批状态 ：4 未提交  0 待审批  1 审批通过 2 审批拒绝
     */
    private Integer approveStatus;

    /**
     * 审批内容
     */
    private String approveMsg;

    @TableField(exist = false)
    private Integer buyNum;

    /*@TableField(exist = false)
    private MallComment comment;*/

    @TableField(exist = false)
    private List<MallComment> commentList;

    @TableField(exist = false)
    private Integer isComment;//是否评论

}

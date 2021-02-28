package com.mall.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 收货地址表
 * </p>
 *
 * @author lan
 * @since 2021-02-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallAddress implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "address_id", type = IdType.AUTO)
    private Integer addressId;

    /**
     * 收货人名称
     */
    private String name;

    /**
     * 用户表的用户ID
     */
    private Integer userId;

    /**
     * 行政区域表的省
     */
    private String province;

    /**
     * 行政区域表的市
     */
    private String city;

    /**
     * 行政区域表的区县
     */
    private String area;

    /**
     * 具体收货地址
     */
    private String address;

    /**
     * 手机号码
     */
    private String mobile;

    /**
     * 是否默认地址
     */
    private Boolean isDefault;

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
    private MallUser user;
}

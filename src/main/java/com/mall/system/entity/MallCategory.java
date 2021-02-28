package com.mall.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 类目表
 * </p>
 *
 * @author lan
 * @since 2021-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MallCategory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "category_id", type = IdType.AUTO)
    private Integer categoryId;

    /**
     * 类目名称
     */
    private String name;

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


}

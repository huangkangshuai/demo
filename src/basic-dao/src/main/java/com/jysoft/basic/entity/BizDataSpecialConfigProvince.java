package com.jysoft.basic.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;



import com.baomidou.mybatisplus.annotations.Version;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 数据专项配置对应的省公司编码（权限配置）
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("biz_data_special_config_province")
public class BizDataSpecialConfigProvince extends Model<BizDataSpecialConfigProvince> {

    private static final long serialVersionUID = 1L;

    /**
     * 数据专项配置id
     */
    @TableField("biz_data_special_config_id")
    private String bizDataSpecialConfigId;

    /**
     * 省公司编码
     */
    @TableField("province_code")
    private String provinceCode;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}

package com.jysoft.basic.entity;

import java.util.Date;
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
 * 码表
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("config_code")
public class ConfigCode extends Model<ConfigCode> {

    private static final long serialVersionUID = 1L;

    /**
     * 码表名称
     */
    @TableField("code_name")
    private String codeName;

    /**
     * 码表编码
     */
    @TableField("code_no")
    private String codeNo;

    /**
     * 父编码
     */
    @TableField("parent_code_no")
    private String parentCodeNo;

    /**
     * 码表描述
     */
    @TableField("code_describe")
    private String codeDescribe;

    /**
     * 码表启动标识，1启用，2暂停
     */
    @TableField("code_flag")
    private Integer codeFlag;

    /**
     * 排序字段
     */
    @TableField("code_sort")
    private Integer codeSort;

    /**
     * 创建人名称
     */
    @TableField("create_name")
    private String createName;

    /**
     * 创建人id
     */
    @TableField("create_id")
    private Integer createId;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 编辑人名称
     */
    @TableField("modify_name")
    private String modifyName;

    /**
     * 编辑人id
     */
    @TableField("modify_id")
    private Integer modifyId;

    /**
     * 编辑时间
     */
    @TableField("modify_time")
    private Date modifyTime;

    /**
     * 版本号
     */

    private String version;

    /**
     * 是否删除 0否，1是
     */
    private Integer deleted;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}

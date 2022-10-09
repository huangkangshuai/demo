package com.jysoft.basic.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.List;


import com.baomidou.mybatisplus.annotations.Version;

import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 数据专项配置
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("biz_data_special_config")
public class BizDataSpecialConfig extends Model<BizDataSpecialConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 专项工作编码
     */
    @TableId(value = "id",type = IdType.UUID)
    private String id;

    /**
     * 专项工作编码
     */
    @TableField("special_work_code")
    private String specialWorkCode;

    /**
     * 专项工作名称
     */
    @TableField("special_work_name")
    private String specialWorkName;

    /**
     * 中台空间
     */
    @TableField("work_space")
    private String workSpace;

    /**
     * 核查计划
     */
    @TableField("check_plan")
    private String checkPlan;

    /**
     * 白名单
     */
    @TableField("white_list")
    private String whiteList;

    /**
     * 报告计划
     */
    @TableField("report_Plan")
    private String reportPlan;

    /**
     * 核查期次
     */
    @TableField("check_period")
    private String checkPeriod;

    /**
     * 期次明细
     */
    @TableField("period_info")
    private String periodInfo;

    /**
     * 任务日志
     */
    @TableField("task_log")
    private String taskLog;

    /**
     * 问题核查日志
     */
    @TableField("problem_task_log")
    private String problemTaskLog;

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

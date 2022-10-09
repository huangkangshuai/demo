/**
  作用：该文件用于初始化所用到的sql
  建表规范：
    1、主键id必须使用随机数16位
    2、表编码必须使用utf8mb4，避免乱码等问题
    3、采用26个英文字母(只能小写)、**下划线_**组成，命名简洁明确，多个单词用下划线_分隔
    4、禁止使用数据库关键字，如：name，time ，datetime，password等
    5、表名称不应该取得太长（一般不超过6个英文单词）
    6、字段命名使用完整名称，禁止缩写
    7、表、表字段创建时必须填写描述信息
    8、表、表字段尽量使用英文，特殊情况下英文较长（超过10位），可采用拼音
    9、表创建时建议添加默认字段create_name、create_id、create_time、modify_name、modify_id、modify_time、version(默认1)、deleted
    10、表名称可以是biz_user、config_info等
    11、字段命名统一：period 期次、review 审批、chain 中台、rule_id 规则编号、desc 描述、state 状态、count 数量 - 后续可持续更新
 */


CREATE TABLE business.`biz_data_special_config`
(
    `id`                VARCHAR(32)  NOT NULL COMMENT '唯一标识',
    `special_work_code` VARCHAR(32)  NOT NULL COMMENT '专项工作编码',
    `special_work_name` VARCHAR(150) NOT NULL COMMENT '专项工作名称',
    `work_space`        VARCHAR(128) NOT NULL COMMENT '中台空间',
    `check_plan`        VARCHAR(128) NOT NULL COMMENT '核查计划',
    `white_list`        VARCHAR(128) NOT NULL COMMENT '白名单',
    `report_plan`       VARCHAR(128) NOT NULL COMMENT '报告计划',
    `check_period`      VARCHAR(128) NOT NULL COMMENT '核查期次',
    `period_info`       VARCHAR(128) NOT NULL COMMENT '期次明细',
    `task_log`          VARCHAR(128) NOT NULL COMMENT '任务日志',
    `problem_task_log`  VARCHAR(128) NOT NULL COMMENT '问题核查日志',
    `create_name`       VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`         INT          NOT NULL DEFAULT '0' COMMENT '创建人id',
    `create_time`       datetime     NOT NULL COMMENT '创建时间',
    `modify_name`       VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`         INT          NOT NULL DEFAULT '0' COMMENT '编辑人id',
    `modify_time`       datetime     NOT NULL COMMENT '编辑时间',
    `version`           VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`           INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '数据专项配置';

CREATE TABLE `biz_data_special_config_province` (
                                                    `biz_data_special_config_id` varchar(64) DEFAULT NULL COMMENT '数据专项配置id',
                                                    `province_code` varchar(64) DEFAULT NULL COMMENT '省公司编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据专项配置对应的省公司编码（权限配置）';

CREATE TABLE business.`biz_check_rules_sub`
(
    `id`            VARCHAR(32)  NOT NULL COMMENT '编号',
    `code`          VARCHAR(100) NOT NULL COMMENT '规则编号(8位序号，第1位是0，第2位是1)',
    `contact_phone` VARCHAR(11)  NOT NULL COMMENT '联系人手机号',
    `contact_name`  VARCHAR(300) NOT NULL COMMENT '联系人名称',
    `state`         TINYINT      NOT NULL DEFAULT '1' COMMENT '状态（1待提交 2：已提交）',
    `content`       text COMMENT '核查主体内容（通常是sql）',
    `name`          VARCHAR(300) NOT NULL COMMENT '规则名称',
    `category`      VARCHAR(50)  NOT NULL COMMENT '规则分类',
    `desc`          VARCHAR(500) NOT NULL COMMENT '规则描述',
    `logic`         VARCHAR(100) NOT NULL COMMENT '核查逻辑',
    `province_code` VARCHAR(64)  NOT NULL COMMENT '省公司编码',
    `province_name` VARCHAR(64)  NOT NULL COMMENT '省公司名称',
    `create_name`   VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`     VARCHAR(32)  NOT NULL COMMENT '创建人id',
    `create_time`   datetime     NOT NULL COMMENT '创建时间',
    `modify_name`   VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`     VARCHAR(32)  NOT NULL COMMENT '编辑人id',
    `modify_time`   datetime     NOT NULL COMMENT '编辑时间',
    `version`       VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`       INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是',
    `table_name`    VARCHAR(255) NOT NULL COMMENT '表英文名',
    `table_name_cn` VARCHAR(255) NOT NULL COMMENT '表中文名',
    `system_code`   VARCHAR(32)  NOT NULL COMMENT '系统编号',
    `system_name`   VARCHAR(255) NOT NULL COMMENT '系统名称',
    `professional_name` VARCHAR(50)  NOT NULL COMMENT '专业',
    `professional_code` VARCHAR(32) NOT NULL COMMENT '专业编号',
    `field_name_cn` VARCHAR(255) NOT NULL COMMENT '核查中文字段名称',
    `field_name`    VARCHAR(255) NOT NULL COMMENT '核查英文字段名称',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则提报表';

CREATE TABLE business.`biz_check_rules_sub_review`
(
    `id`            VARCHAR(32)  NOT NULL COMMENT '编号',
    `code`          VARCHAR(100) NOT NULL COMMENT '规则编号(8位序号，第1位是0，第2位是1)',
    `contact_phone` VARCHAR(11)  NOT NULL COMMENT '联系人手机号',
    `contact_name`  VARCHAR(300) NOT NULL COMMENT '联系人名称',
    `state`         TINYINT      NOT NULL DEFAULT '2' COMMENT '状态（2:已提交 3:已删除）',
    `content`       text COMMENT '核查主体内容（通常是sql）',
    `name`          VARCHAR(300) NOT NULL COMMENT '规则名称',
    `category`      VARCHAR(50)  NOT NULL COMMENT '规则分类',
    `desc`          VARCHAR(500) NOT NULL COMMENT '规则描述',
    `logic`         VARCHAR(100) NOT NULL COMMENT '核查逻辑',
    `province_code` VARCHAR(64)  NOT NULL COMMENT '省公司编码',
    `province_name` VARCHAR(64)  NOT NULL COMMENT '省公司名称',
    `create_name`   VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`     VARCHAR(32)  NOT NULL COMMENT '创建人id',
    `create_time`   datetime     NOT NULL COMMENT '创建时间',
    `modify_name`   VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`     VARCHAR(32)  NOT NULL COMMENT '编辑人id',
    `modify_time`   datetime     NOT NULL COMMENT '编辑时间',
    `version`       VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`       INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是',
    `table_name`    VARCHAR(255) NOT NULL COMMENT '表英文名',
    `table_name_cn` VARCHAR(255) NOT NULL COMMENT '表中文名',
    `system_code`   VARCHAR(32)           DEFAULT '0' COMMENT '系统编号',
    `system_name`   VARCHAR(255) NOT NULL COMMENT '系统名称',
    `professional_name` VARCHAR(50)  NOT NULL COMMENT '专业',
    `professional_code` VARCHAR(32) NOT NULL COMMENT '专业编号',
    `field_name_cn` VARCHAR(255) NOT NULL COMMENT '核查中文字段名称',
    `field_name`    VARCHAR(255) NOT NULL COMMENT '核查英文字段名称',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则提报审批表';

CREATE TABLE business.`biz_check_rules_config`
(
    `id`                VARCHAR(32)  NOT NULL COMMENT '编号',
    `name`              VARCHAR(300) NOT NULL COMMENT '规则名称',
    `code`              VARCHAR(32)  NOT NULL COMMENT '规则编号',
    `category`          VARCHAR(50)  NOT NULL COMMENT '分类',
    `category_code`     VARCHAR(32)  NOT NULL COMMENT '分类编号',
    `professional_code` VARCHAR(32)  NOT NULL COMMENT '专业编号',
    `professional_name` VARCHAR(50)  NOT NULL COMMENT '专业',
    `system_code`       VARCHAR(50)  NOT NULL COMMENT '所属系统编号',
    `system`            VARCHAR(50)  NOT NULL COMMENT '所属系统',
    `desc`              VARCHAR(500) NOT NULL COMMENT '规则描述',
    `logic`         VARCHAR(100) NOT NULL COMMENT '核查逻辑',
    `content`            text COMMENT '核查主体内容（通常是sql）',
    `province_code`   VARCHAR(64)  NOT NULL COMMENT '省公司编码',
    `province_name`   VARCHAR(64)  NOT NULL COMMENT '省公司名称',
    `field_name`        VARCHAR(500) NOT NULL COMMENT '核查字段名称',
    `main_table_name`   VARCHAR(100) NOT NULL COMMENT '核查主表名称',
    `state`             TINYINT      NOT NULL DEFAULT '1' COMMENT '状态（1：新增规则、2：版本更新、等）',
    `check_time`        datetime     NOT NULL COMMENT '核查时间',
    `publish_chain`     datetime     NOT NULL COMMENT '发布至中台时间',
    `create_name`       VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`         VARCHAR(50)  NOT NULL COMMENT '创建人id',
    `version`           VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`           INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是',
    `create_time`       datetime     NOT NULL COMMENT '创建时间',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则配置表';

CREATE TABLE business.`biz_check_rules_config_object`
(
    `id`                   VARCHAR(32)  NOT NULL COMMENT '编号',
    `table_type`           TINYINT               DEFAULT '1' COMMENT '表类型:主表:1,非主表:2',
    `rules_config_id`      BIGINT       NOT NULL COMMENT '检查配置表id',
    `table_name_cn`        VARCHAR(255) NOT NULL COMMENT '表中文名',
    `table_name`           VARCHAR(255) NOT NULL COMMENT '表英文名',
    `system_code`          VARCHAR(32)  NOT NULL DEFAULT '0' COMMENT '系统编号',
    `system_name`          VARCHAR(255) NOT NULL COMMENT '系统名称',
    `source_table_name_cn` VARCHAR(255) NOT NULL COMMENT '源端表中文名',
    `source_table_name`    VARCHAR(255) NOT NULL COMMENT '源端表英文名',
    `field_type`           TINYINT      NOT NULL DEFAULT '1' COMMENT '字段类型（1:问题字段,2:参考字段）',
    `professional_name` VARCHAR(50)  NOT NULL COMMENT '专业',
    `professional_code` VARCHAR(32) NOT NULL COMMENT '专业编号',
    `field_name_cn` VARCHAR(255) NOT NULL COMMENT '核查表中文字段名称',
    `field_name`    VARCHAR(255) NOT NULL COMMENT '核查表英文字段名称',
    `source_field_name`    VARCHAR(255) NOT NULL COMMENT '核查源端表英文字段名称',
    `create_name`          VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`            VARCHAR(50)  NOT NULL COMMENT '创建人id',
    `create_time`          datetime     NOT NULL COMMENT '创建时间',
    `version`              VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`              INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则对象表';


CREATE TABLE business.`biz_check_rules_config_publish_record`
(
    `id`                 VARCHAR(32) NOT NULL COMMENT '编号',
    `version`            VARCHAR(32)  NOT NULL COMMENT '版本号',
    `publish_chain`      datetime    NOT NULL COMMENT '发布至中台时间',
    `commit_time`        datetime    NOT NULL COMMENT '规则提交时间',
    `config_code`        VARCHAR(100) NOT NULL COMMENT '规则表编号',
    `commit_create_id`   VARCHAR(32)  NOT NULL COMMENT '规则提交人id',
    `commit_create_name` VARCHAR(255) NOT NULL COMMENT '规则提交人',
    `content`            text COMMENT '核查主体内容（通常是sql）'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则发布记录表';

CREATE TABLE business.`biz_check_task_relation`
(
    `id`                VARCHAR(32) NOT NULL COMMENT '编号',
    `rules_id`          VARCHAR(32)  NOT NULL COMMENT '规则关联id',
    `special_work_id`   VARCHAR(32)  DEFAULT NULL COMMENT '专项工作关联id',
    `rules_version`     VARCHAR(32)  DEFAULT NULL COMMENT '规则版本号',
    `rules_name`        VARCHAR(300) NOT NULL COMMENT '规则名称',
    `rules_code`        VARCHAR(32) NOT NULL COMMENT '规则编号',
    `category`          VARCHAR(50)  NOT NULL COMMENT '规则分类',
    `professional_name` VARCHAR(50)  NOT NULL COMMENT '专业',
    `professional_code` VARCHAR(32)  NOT NULL COMMENT '专业编号',
    `system`            VARCHAR(50)  NOT NULL COMMENT '所属系统',
    `system_code`       VARCHAR(32)  NOT NULL COMMENT '所属系统编号',
    `desc`              VARCHAR(500) NOT NULL COMMENT '规则描述',
    `field_name`        VARCHAR(500) NOT NULL COMMENT '核查字段名称',
    `main_table_name`   VARCHAR(100) NOT NULL COMMENT '核查主表名称',
    `content`           text COMMENT '核查主体内容（通常是sql）',
    `create_name`       VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`         VARCHAR(50)  NOT NULL COMMENT '创建人id',
    `create_time`       datetime    NOT NULL COMMENT '创建时间',
    `modify_name`       VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`         VARCHAR(50)  NOT NULL COMMENT '编辑人id',
    `modify_time`       datetime    NOT NULL COMMENT '编辑时间',
    `deleted`           INT          DEFAULT '0' COMMENT '是否删除 0否，1是',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查任务表，关联专项与规则关系表';


CREATE TABLE business.`biz_check_rules_white`
(
    `id`              VARCHAR(32)  NOT NULL COMMENT '编号',
    `special_work_id` VARCHAR(32)           DEFAULT NULL COMMENT '专项工作id',
    `rules_id`        BIGINT       NOT NULL COMMENT '检查配置表id',
    `rules_object_id`        BIGINT       NOT NULL COMMENT '检查配置对象表id',
    `rules_field_name` VARCHAR(500) NOT NULL COMMENT '核查字段名称',
    `rules_table_name`   VARCHAR(100) NOT NULL COMMENT '核查表名称',
    `contact_phone`   VARCHAR(11)  NOT NULL COMMENT '联系人手机号',
    `contact_name`    VARCHAR(300) NOT NULL COMMENT '联系人名称',
    `material`        text COMMENT '附件资料',
    `state`           TINYINT               DEFAULT '1' COMMENT '状态 1:启用 2：禁用',
    `province_code`   VARCHAR(64)  NOT NULL COMMENT '省公司编码',
    `province_name`   VARCHAR(64)  NOT NULL COMMENT '省公司名称',
    `type`            TINYINT      NOT NULL DEFAULT '1' COMMENT '状态 1:无 2:条件 3:主键',
    `type_content`    text COMMENT '白名单内容 type>1时存在',
    `desc`            VARCHAR(512) NOT NULL COMMENT '白名单描述',
    `create_name`     VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`       VARCHAR(32)  NOT NULL COMMENT '创建人id',
    `create_time`     datetime     NOT NULL COMMENT '创建时间',
    `modify_name`     VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`       VARCHAR(32)  NOT NULL COMMENT '编辑人id',
    `modify_time`     datetime     NOT NULL COMMENT '编辑时间',
    `version`         VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`         INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则白名单表';

CREATE TABLE business.`biz_check_rules_white_record`
(
    `id`              VARCHAR(32)  NOT NULL COMMENT '编号',
    `code`            VARCHAR(32)  NOT NULL COMMENT '白名单编号(待确定，后续可以随机生成)',
    `special_work_id` VARCHAR(32)           DEFAULT NULL COMMENT '专项工作id',
    `rules_id`        BIGINT       NOT NULL COMMENT '检查配置表id',
    `rules_object_id`        BIGINT       NOT NULL COMMENT '检查配置对象表id',
    `rules_field_name`        VARCHAR(500) NOT NULL COMMENT '核查字段名称',
    `rules_table_name`   VARCHAR(100) NOT NULL COMMENT '核查表名称',
    `contact_phone`   VARCHAR(11)  NOT NULL COMMENT '联系人手机号',
    `contact_name`    VARCHAR(300) NOT NULL COMMENT '联系人名称',
    `material`        text COMMENT '附件资料',
    `state`           TINYINT               DEFAULT '1' COMMENT '状态 1:启用 2：禁用',
    `province_code`   VARCHAR(64)  NOT NULL COMMENT '省公司编码',
    `province_name`   VARCHAR(64)  NOT NULL COMMENT '省公司名称',
    `type`            TINYINT      NOT NULL DEFAULT '1' COMMENT '状态 1:无 2:条件 3:主键',
    `type_content`    text COMMENT '白名单内容 type>1时存在',
    `desc`            VARCHAR(512) NOT NULL COMMENT '白名单描述',
    `create_name`     VARCHAR(255) NOT NULL COMMENT '创建人名称',
    `create_id`       VARCHAR(32)  NOT NULL COMMENT '创建人id',
    `create_time`     datetime     NOT NULL COMMENT '创建时间',
    `modify_name`     VARCHAR(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`       VARCHAR(32)  NOT NULL COMMENT '编辑人id',
    `modify_time`     datetime     NOT NULL COMMENT '编辑时间',
    `version`         VARCHAR(32)  NOT NULL COMMENT '版本号',
    `deleted`         INT          NOT NULL DEFAULT '0' COMMENT '是否删除 0否，1是'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查规则白名单历史记录表';


CREATE TABLE business.`biz_check_task_instance`
(
    `id`                VARCHAR(32) NOT NULL COMMENT '任务实例编号',
    `special_config_id` VARCHAR(32) NOT NULL COMMENT '专项配置ID',
    `province_count`    INT         NOT NULL DEFAULT '0' COMMENT '省公司数量',
    `rules_count`       INT         NOT NULL DEFAULT '0' COMMENT '规则数',
    `problem_count`     INT         NOT NULL DEFAULT '0' COMMENT '问题数',
    `count`             INT                  DEFAULT NULL COMMENT '核查总数量',
    `create_time`       datetime    NOT NULL COMMENT '创建时间',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查任务实例表';

CREATE TABLE business.`biz_check_task_instance_detail`
(
    `id`                VARCHAR(32) NOT NULL COMMENT '编号',
    `special_config_id` VARCHAR(32) NOT NULL COMMENT '专项配置ID',
    `rules_id`           VARCHAR(32) NOT NULL COMMENT '规则编号',
    `rules_version`      VARCHAR(32)  NOT NULL COMMENT '规则版本号',
    `instance_id`       VARCHAR(32) NOT NULL COMMENT '任务实例编号关联',
    `rules_table`        VARCHAR(128) NOT NULL COMMENT '核查主表名称',
    `rules_partition`    VARCHAR(255) NOT NULL COMMENT '核查分区',
    `rules_field`        VARCHAR(128) NOT NULL COMMENT '核查字段',
    `province_name`     VARCHAR(128) NOT NULL COMMENT '核查省公司',
    `province_code`     VARCHAR(255) NOT NULL COMMENT '核查省公司编号',
    `count`             INT          DEFAULT '0' COMMENT '核查数量',
    `problem_count`     INT          DEFAULT '0' COMMENT '核查问题数',
    `create_time`       datetime    NOT NULL COMMENT '创建时间',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '核查任务实例明细表';


CREATE TABLE `config_code`
(
    `id`             varchar(32)  NOT NULL COMMENT '唯一标识',
    `code_name`      varchar(150) NOT NULL COMMENT '码表名称',
    `code_no`        varchar(64)  NOT NULL COMMENT '码表编码',
    `parent_code_no` varchar(64)  NOT NULL COMMENT '父编码',
    `code_desc`      varchar(600) NOT NULL COMMENT '码表描述',
    `code_flag`      int          DEFAULT '0' COMMENT '码表启动标识，1启用，2暂停',
    `code_sort`      int          DEFAULT '0' COMMENT '排序字段',
    `create_name`    varchar(255) NOT NULL COMMENT '创建人名称',
    `create_id`      int          DEFAULT '0' COMMENT '创建人id',
    `create_time`    datetime NOT NULL COMMENT '创建时间',
    `modify_name`    varchar(255) NOT NULL COMMENT '编辑人名称',
    `modify_id`      int          DEFAULT '0' COMMENT '编辑人id',
    `modify_time`    datetime NOT NULL COMMENT '编辑时间',
    `version`        varchar(32)  NOT NULL COMMENT '版本号',
    `deleted`        int          DEFAULT '0' COMMENT '是否删除 0否，1是'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='码表';


CREATE TABLE business.`biz_data_table_liability`
(
    `id`                 varchar(32)                                NOT NULL COMMENT '主键编号，业务中的序号',
    `professional_code`  varchar(32)  DEFAULT ''                    NOT NULL COMMENT '专业',
    `system_code`        varchar(63)  DEFAULT ''                    NOT NULL COMMENT '所属系统',
    `name`               varchar(127) DEFAULT ''                    NOT NULL COMMENT '表名，表名唯一，不同业务也是唯一',
    `name_cn`            varchar(127) DEFAULT ''                    NOT NULL COMMENT '表中文名名',
    `source_name`        varchar(127) DEFAULT ''                    NOT NULL COMMENT '表源端英文名',
    `chain_name`         varchar(127) DEFAULT ''                    NOT NULL COMMENT '表中台英文名',
    `target_primary_key` varchar(511) DEFAULT '{}'                  NOT NULL COMMENT '源表主键Key，采用Json形式。包含：col，name信息',
    `liability_type`     tinyint      DEFAULT 1                     NOT NULL COMMENT '认责方式：1：直接认责；2：间接认责',
    `directly_key`       varchar(255) DEFAULT ''                    NOT NULL COMMENT '直接认责对应的字段名，只有在type为1时有效',
    `directly_name_cn`   varchar(255) DEFAULT ''                    NOT NULL COMMENT '直接认责对应的字段中文名，只有在type为1时有效',
    `indirect_key`       varchar(255) DEFAULT ''                    NOT NULL COMMENT '间接认责对应的字段名，只有在type为2时有效',
    `indirect_name_cn`   varchar(255) DEFAULT ''                    NOT NULL COMMENT '间接认责对应的字段中文名，只有在type为2时有效',
    `indirect_value`     text                                       NOT NULL COMMENT '间接认责对应的SQL信息，只有在type为2时有效',
    `create_name`        varchar(255)                               NOT NULL COMMENT '创建人名称',
    `create_id`          varchar(50)                                NOT NULL COMMENT '创建人id',
    `create_time`        datetime                                   NOT NULL COMMENT '创建时间',
    `modify_name`        varchar(255) DEFAULT ''                    NOT NULL COMMENT '编辑人名称',
    `modify_id`          varchar(50)  DEFAULT ''                    NOT NULL COMMENT '编辑人id',
    `modify_time`        datetime     DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '编辑时间',
    `version`            varchar(32)  DEFAULT ''                    NOT NULL COMMENT '版本号',
    `deleted`            int          DEFAULT 0                     NOT NULL COMMENT '是否删除 0否，1是',
    PRIMARY KEY (`id`),
    UNIQUE KEY `u_idx_name` (`name`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='认责配置表';

CREATE TABLE business.`biz_data_report_schedule`
(
    `id`                    varchar(32)                                 NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code`     varchar(32)                                 NOT NULL COMMENT '专项工作编码',
    `special_work_name`     varchar(127)                                NOT NULL COMMENT '专项工作名称', # TODO
    `bianhao`                    varchar(32)                                 NOT NULL COMMENT '标号', # TODO
    `name`                  varchar(127)                                NOT NULL COMMENT '报告名称',
    `desc`                  varchar(255)                                NOT NULL COMMENT '报告说明',
    `report_type`           tinyint       DEFAULT 1                     NOT NULL COMMENT '报告类型：1：临时；2：周监测；3：月评价',
    `report_info`           varchar(1023) DEFAULT '{}'                  NOT NULL COMMENT '报告规则，详细参照业务对应的Bean', # TODO 用表去平铺
    `current_report_date`   datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '本期报告核查日期',
    `current_period`        varchar(255)  DEFAULT ''                    NOT NULL COMMENT '本期期次',
    `current_problem_count` int(10)       DEFAULT 0                     NOT NULL COMMENT '本期问题数',
    `current_total_count`   int(10)       DEFAULT 0                     NOT NULL COMMENT '本期总数',
    `last_report_date`      datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '上期报告核查日期',
    `last_period`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '上期期次',
    `last_problem_count`    int(10)       DEFAULT 0                     NOT NULL COMMENT '上期问题数',
    `last_total_count`      int(10)       DEFAULT 0                     NOT NULL COMMENT '上期总数',
    `state`                 tinyint       DEFAULT 1                     NOT NULL COMMENT '操作状态：1：草拟；2：提交编制；3：已编制；4：已审核；5：下发',
    `create_name`           varchar(255)                                NOT NULL COMMENT '创建人名称',
    `create_id`             varchar(50)                                 NOT NULL COMMENT '创建人id',
    `create_time`           datetime                                    NOT NULL COMMENT '创建时间',
    `modify_name`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '编辑人名称',
    `modify_id`             varchar(50)   DEFAULT ''                    NOT NULL COMMENT '编辑人id',
    `modify_time`           datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '编辑时间',
    `version`               varchar(32)   DEFAULT ''                    NOT NULL COMMENT '版本号',
    `deleted`               int           DEFAULT 0                     NOT NULL COMMENT '是否删除 0否，1是',
    UNIQUE KEY (`id`),
    UNIQUE KEY `u_idx_name` (`name`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='数据质量报告模版表';

CREATE TABLE business.`biz_data_report_info`
(
    `id`                    varchar(32)                                 NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code`     varchar(32)                                 NOT NULL COMMENT '专项工作编码',
    `special_work_name`     varchar(127)                                NOT NULL COMMENT '专项工作名称',
    `schedule_id`           varchar(32)                                 NOT NULL COMMENT '报告计划ID（计划编号）',
    `name`                  varchar(127)                                NOT NULL COMMENT '报告名称',
    `desc`                  varchar(255)                                NOT NULL COMMENT '报告说明',
    `report_type`           tinyint       DEFAULT 1                     NOT NULL COMMENT '报告类型：1：临时；2：周监测；3：月评价',
    `report_info`           varchar(1023) DEFAULT '{}'                  NOT NULL COMMENT '报告规则，详细参照业务对应的Bean',
    `current_report_date`   datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '本期报告核查日期',
    `current_period`        varchar(255)  DEFAULT ''                    NOT NULL COMMENT '本期期次',
    `current_problem_count` int(10)       DEFAULT 0                     NOT NULL COMMENT '本期问题数',
    `current_total_count`   int(10)       DEFAULT 0                     NOT NULL COMMENT '本期总数',
    `last_report_date`      datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '上期报告核查日期',
    `last_period`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '上期期次',
    `last_problem_count`    int(10)       DEFAULT 0                     NOT NULL COMMENT '上期问题数',
    `last_total_count`      int(10)       DEFAULT 0                     NOT NULL COMMENT '上期总数',
    `state`                 tinyint       DEFAULT 1                     NOT NULL COMMENT '操作状态：1：草拟；2：提交编制；3：已编制；4：已审核；5：下发',
    `repair_problem_count`  int(10)       DEFAULT 0                     NOT NULL COMMENT '整治问题数',
    `repair_total_count`    int(10)       DEFAULT 0                     NOT NULL COMMENT '整治总数',
    `new_problem_count`     int(10)       DEFAULT 0                     NOT NULL COMMENT '新增问题数',
    `new_total_count`       int(10)       DEFAULT 0                     NOT NULL COMMENT '新增总数',
    `draft_time`            datetime                                    NOT NULL COMMENT '草拟时间',
    `submit_time`           datetime                                    NOT NULL COMMENT '提交编制时间',
    `run_success_time`      datetime                                    NOT NULL COMMENT '编制时间',
    `review_time`           datetime                                    NOT NULL COMMENT '审核时间',
    `send_time`             datetime                                    NOT NULL COMMENT '下发时间',
    `create_name`           varchar(255)                                NOT NULL COMMENT '创建人名称',
    `create_id`             varchar(50)                                 NOT NULL COMMENT '创建人id',
    `create_time`           datetime                                    NOT NULL COMMENT '创建时间',
    `modify_name`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '编辑人名称',
    `modify_id`             varchar(50)   DEFAULT ''                    NOT NULL COMMENT '编辑人id',
    `modify_time`           datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '编辑时间',
    `version`               varchar(32)   DEFAULT ''                    NOT NULL COMMENT '版本号',
    `deleted`               int           DEFAULT 0                     NOT NULL COMMENT '是否删除 0否，1是',
    UNIQUE KEY (`id`),
    UNIQUE KEY `u_idx_name` (`name`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='数据质量报告模版表';

CREATE TABLE business.`biz_data_report_province_info`
(
    `id`                    varchar(32)                                 NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code`     varchar(32)                                 NOT NULL COMMENT '专项工作编码',
    `special_work_name`     varchar(127)                                NOT NULL COMMENT '专项工作名称',
    `schedule_id`           varchar(32)                                 NOT NULL COMMENT '报告计划ID',
    `schedule_code`         varchar(32)                                 NOT NULL COMMENT '报告计划编号',
    `name`                  varchar(127)                                NOT NULL COMMENT '报告名称',
    `desc`                  varchar(255)                                NOT NULL COMMENT '报告说明',
    `report_type`           tinyint       DEFAULT 1                     NOT NULL COMMENT '报告类型：1：临时；2：周监测；3：月评价',
    `report_info`           varchar(1023) DEFAULT '{}'                  NOT NULL COMMENT '报告规则，详细参照业务对应的Bean',
    `report_date`           datetime                                    NOT NULL COMMENT '报告生成日期',
    `current_report_date`   datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '本期报告核查日期',
    `current_period`        varchar(255)  DEFAULT ''                    NOT NULL COMMENT '本期期次',
    `current_problem_count` int(10)       DEFAULT 0                     NOT NULL COMMENT '本期问题数',
    `current_total_count`   int(10)       DEFAULT 0                     NOT NULL COMMENT '本期总数',
    `last_report_date`      datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '上期报告核查日期',
    `last_period`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '上期期次',
    `last_problem_count`    int(10)       DEFAULT 0                     NOT NULL COMMENT '上期问题数',
    `last_total_count`      int(10)       DEFAULT 0                     NOT NULL COMMENT '上期总数',
    `state`                 tinyint       DEFAULT 1                     NOT NULL COMMENT '操作状态：1：已生成；2：已审核；3：下发',
    `repair_problem_count`  int(10)       DEFAULT 0                     NOT NULL COMMENT '整治问题数',
    `repair_total_count`    int(10)       DEFAULT 0                     NOT NULL COMMENT '整治总数',
    `new_problem_count`     int(10)       DEFAULT 0                     NOT NULL COMMENT '新增问题数',
    `new_total_count`       int(10)       DEFAULT 0                     NOT NULL COMMENT '新增总数',
    `run_success_time`      datetime                                    NOT NULL COMMENT '编制时间',
    `create_name`           varchar(255)                                NOT NULL COMMENT '创建人名称',
    `create_id`             varchar(50)                                 NOT NULL COMMENT '创建人id',
    `create_time`           datetime                                    NOT NULL COMMENT '创建时间',
    `modify_name`           varchar(255)  DEFAULT ''                    NOT NULL COMMENT '编辑人名称',
    `modify_id`             varchar(50)   DEFAULT ''                    NOT NULL COMMENT '编辑人id',
    `modify_time`           datetime      DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '编辑时间',
    `version`               varchar(32)   DEFAULT ''                    NOT NULL COMMENT '版本号',
    `deleted`               int           DEFAULT 0                     NOT NULL COMMENT '是否删除 0否，1是',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='数据质量报告表结果';

CREATE TABLE business.`biz_data_report_province_detail`
(
    `id`                    varchar(32)                                NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code`     varchar(32)                                NOT NULL COMMENT '专项工作编码',
    `special_work_name`     varchar(127)                               NOT NULL COMMENT '专项工作名称',
    `schedule_id`           varchar(32)                                NOT NULL COMMENT '报告计划ID',
    `schedule_code`         varchar(32)                                NOT NULL COMMENT '报告计划编号',
    `province_code`         varchar(64)  DEFAULT ''                    NOT NULL COMMENT '省公司编码',
    `province_name`         varchar(64)  DEFAULT ''                    NOT NULL COMMENT '省公司编码',
    `rule_id`               varchar(32)                                NOT NULL COMMENT '规则编号',
    `rule_name`             varchar(32)                                NOT NULL COMMENT '规则名称',
    `rule_version`          varchar(32)                                NOT NULL COMMENT '规则版本',
    `current_partition_key` varchar(32)                                NOT NULL COMMENT '本期核查分区',
    `current_report_date`   datetime     DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '本期报告核查日期',
    `current_period`        varchar(255) DEFAULT ''                    NOT NULL COMMENT '本期期次',
    `current_problem_count` int(10)      DEFAULT 0                     NOT NULL COMMENT '本期问题数',
    `current_total_count`   int(10)      DEFAULT 0                     NOT NULL COMMENT '本期总数',
    `last_partition_key`    varchar(32)                                NOT NULL COMMENT '上期核查分区',
    `last_report_date`      datetime     DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '上期报告核查日期',
    `last_period`           varchar(255) DEFAULT ''                    NOT NULL COMMENT '上期期次',
    `last_problem_count`    int(10)      DEFAULT 0                     NOT NULL COMMENT '上期问题数',
    `last_total_count`      int(10)      DEFAULT 0                     NOT NULL COMMENT '上期总数',
    `state`                 tinyint      DEFAULT 1                     NOT NULL COMMENT '操作状态：1：已生成；2：已审核；3：下发',
    `repair_problem_count`  int(10)      DEFAULT 0                     NOT NULL COMMENT '整治问题数',
    `repair_total_count`    int(10)      DEFAULT 0                     NOT NULL COMMENT '整治总数',
    `new_problem_count`     int(10)      DEFAULT 0                     NOT NULL COMMENT '新增问题数',
    `new_total_count`       int(10)      DEFAULT 0                     NOT NULL COMMENT '新增总数',
    `checkrules_count`      int(10)      DEFAULT 0                     NOT NULL COMMENT '白名单条数',
    `create_name`           varchar(255)                               NOT NULL COMMENT '创建人名称',
    `create_id`             varchar(50)                                NOT NULL COMMENT '创建人id',
    `create_time`           datetime                                   NOT NULL COMMENT '创建时间',
    `modify_name`           varchar(255) DEFAULT ''                    NOT NULL COMMENT '编辑人名称',
    `modify_id`             varchar(50)  DEFAULT ''                    NOT NULL COMMENT '编辑人id',
    `modify_time`           datetime     DEFAULT '1970-01-01 00:00:01' NOT NULL COMMENT '编辑时间',
    `version`               varchar(32)  DEFAULT ''                    NOT NULL COMMENT '版本号',
    `deleted`               int          DEFAULT 0                     NOT NULL COMMENT '是否删除 0否，1是',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='数据质量报告表明细表';

CREATE TABLE business.`biz_check_task_monitor_info`
(
    `id`                      varchar(32)            NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code`       varchar(32)            NOT NULL COMMENT '专项工作编码',
    `special_work_name`       varchar(127)           NOT NULL COMMENT '专项工作名称',
    `task_instance_id`        varchar(32)            NOT NULL COMMENT '任务执行编号',
    `task_instance_node_type` varchar(64) DEFAULT '' NOT NULL COMMENT '任务环节类型',# TODO 具体类型
    `task_instance_node_name` varchar(64) DEFAULT '' NOT NULL COMMENT '任务环节名称',
    `success_count`           int(10)     DEFAULT 0  NOT NULL COMMENT '成功数量',
    `fail_count`              int(10)     DEFAULT 0  NOT NULL COMMENT '错误数量',
    `warn_count`              int(10)     DEFAULT 0  NOT NULL COMMENT '告警数量',
    `start_time`              datetime               NOT NULL COMMENT '开始时间',
    `end_time`                datetime               NOT NULL COMMENT '结束时间',
    `create_time`             datetime               NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查监测信息';

CREATE TABLE business.`biz_check_task_monitor_detail`
(
    `id`                varchar(32)            NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code` varchar(32)            NOT NULL COMMENT '专项工作编码',
    `special_work_name` varchar(127)           NOT NULL COMMENT '专项工作名称',
    `task_instance_id`  varchar(32)            NOT NULL COMMENT '任务执行编号',
    `rule_id`           varchar(32) DEFAULT '' NOT NULL COMMENT '检查规则编号',
    `rule_name`         varchar(64) DEFAULT '' NOT NULL COMMENT '检查规则名称',
    `rule_version`      varchar(32) DEFAULT '' NOT NULL COMMENT '检查规则版本',
    `state`             tinyint     DEFAULT 1  NOT NULL COMMENT '状态：1：正常；2：错误；3：告警',
    `count`             int(10)     DEFAULT 0  NOT NULL COMMENT '结果数据量',
    `fail_msg`          text                   NOT NULL COMMENT '错误信息',
    `run_sql`           text                   NOT NULL COMMENT '脚本SQL',
    `start_time`        datetime               NOT NULL COMMENT '开始时间',
    `end_time`          datetime               NOT NULL COMMENT '结束时间',
    `create_time`       datetime               NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查监测明细';

CREATE TABLE business.`biz_check_task_table_monitor_info`
(
    `id`                varchar(32)       NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code` varchar(32)       NOT NULL COMMENT '专项工作编码',
    `special_work_name` varchar(127)      NOT NULL COMMENT '专项工作名称',
    `record_date`       datetime          NOT NULL COMMENT '记录日期（监测日期）',
    `success_count`     int(10) DEFAULT 0 NOT NULL COMMENT '成功数量',
    `fail_count`        int(10) DEFAULT 0 NOT NULL COMMENT '错误数量',
    `warn_count`        int(10) DEFAULT 0 NOT NULL COMMENT '告警数量',
    `start_time`        datetime          NOT NULL COMMENT '开始时间',
    `end_time`          datetime          NOT NULL COMMENT '结束时间',
    `create_time`       datetime          NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查表监测信息';

CREATE TABLE business.`biz_check_task_table_monitor_detail`
(
    `id`                varchar(32)            NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code` varchar(32)            NOT NULL COMMENT '专项工作编码',
    `special_work_name` varchar(127)           NOT NULL COMMENT '专项工作名称',
    `record_date`       datetime               NOT NULL COMMENT '记录日期（监测日期）',
    `table_name`        varchar(64) DEFAULT '' NOT NULL COMMENT '数据表名称',
    `table_name_cn`     varchar(64) DEFAULT '' NOT NULL COMMENT '数据表中文', # todo 删除中文名
    `state`             tinyint     DEFAULT 1  NOT NULL COMMENT '状态：1：正常；2：错误；3：告警',
    `count`             int(10)     DEFAULT 0  NOT NULL COMMENT '结果数据量',
    `fail_msg`          text                   NOT NULL COMMENT '错误信息',
    `run_sql`           text                   NOT NULL COMMENT '脚本SQL',
    `start_time`        datetime               NOT NULL COMMENT '开始时间',
    `end_time`          datetime               NOT NULL COMMENT '结束时间',
    `create_time`       datetime               NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查表监测明细';

CREATE TABLE business.`biz_data_report_step_info`
(
    `id`                varchar(32)  NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code` varchar(32)  NOT NULL COMMENT '专项工作编码',
    `special_work_name` varchar(127) NOT NULL COMMENT '专项工作名称',
    `schedule_id`       varchar(32)  NOT NULL COMMENT '报告计划ID',
    `start_time`        datetime     NOT NULL COMMENT '开始时间',
    `end_time`          datetime     NOT NULL COMMENT '结束时间',
    `create_time`       datetime     NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查报告下发信息';

CREATE TABLE business.`biz_data_table_primary_key_count`
(
    `id`            varchar(32)  NOT NULL COMMENT '主键编号，业务中的序号',
    `zhouqi`        varchar(32)  NOT NULL COMMENT '周期', # TODO 周期
    `table_name`    varchar(255) NOT NULL DEFAULT '' COMMENT '表英文名',
    `table_name_cn` varchar(255) NOT NULL DEFAULT '' COMMENT '表中文名',
    `type`          varchar(20)  NOT NULL COMMENT '统计类型： 1:主键字段统计 2:认责字段统计',
    `province_code` varchar(128) NOT NULL DEFAULT '' COMMENT '核查省公司',
    `total_count` varchar(255) NOT NULL DEFAULT '0' COMMENT '核查数量（主键总数、认责总数）',
    `invalid_count` int          NOT NULL DEFAULT '0' COMMENT '核查问题数(主键重复数、认责匹配失败数)',
    `create_time`   datetime     NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查报告下发信息';


CREATE TABLE business.`biz_data_report_step_detail`
(
    `id`                varchar(32)            NOT NULL COMMENT '主键编号，业务中的序号',
    `special_work_code` varchar(32)            NOT NULL COMMENT '专项工作编码',
    `special_work_name` varchar(127)           NOT NULL COMMENT '专项工作名称',
    `schedule_id`       varchar(32)            NOT NULL COMMENT '报告计划ID',
    `report_step`       varchar(32)            NOT NULL COMMENT '报告阶段',
    `task_run_id`       varchar(32)            NOT NULL COMMENT '任务执行编号',
    `task_node_type`    varchar(64) DEFAULT '' NOT NULL COMMENT '任务环节类型',
    `task_node_name`    varchar(64) DEFAULT '' NOT NULL COMMENT '任务环节名称',
    `start_time`        datetime               NOT NULL COMMENT '开始时间',
    `end_time`          datetime               NOT NULL COMMENT '结束时间',
    `create_time`       datetime               NOT NULL COMMENT '创建时间',
    UNIQUE KEY `u_idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='任务核查报告下发明细信息';

CREATE TABLE `config_logs`
(
    `id`            varchar(32)  NOT NULL COMMENT '编号',
    `state`         tinyint(1)   NOT NULL COMMENT '日志状态 1:正常 2:异常 3:警告',
    `type`          varchar(20)  NOT NULL COMMENT '日志类型 sys:系统,业务:biz ,调试:debug,发版:release,告警:alarm',
    `opt_type`      varchar(20)  NOT NULL COMMENT '操作类型 SYS_ADD：增加系统、SYS_LOGIN:用户登录等，具体见代码',
    `opt_type_name` varchar(30)  NOT NULL COMMENT '操作类型名称',
    `level`         varchar(10)  NOT NULL COMMENT '日志级别',
    `ip`            varchar(255) DEFAULT NULL COMMENT '客户端ip',
    `content`       text         NOT NULL COMMENT '记录内容',
    `create_name`   varchar(255) NOT NULL COMMENT '创建人名称',
    `create_id`     varchar(32)  NOT NULL COMMENT '创建人id',
    `create_time`   datetime     NOT NULL COMMENT '创建时间',
    UNIQUE KEY `idx_id` (`id`) COMMENT '唯一约束'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='日志表';


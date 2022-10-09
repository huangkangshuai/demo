package com.jysoft.basic.dto;

import com.jysoft.basic.entity.BizDataSpecialConfig;
import com.jysoft.basic.entity.BizDataSpecialConfigProvince;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class BizDataSpecialConfigDTO extends BizDataSpecialConfig {

    /**
     * 权限
     */
    List<BizDataSpecialConfigProvince> provinceList ;

}


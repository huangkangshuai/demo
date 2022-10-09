package com.jysoft.basic.service;

import com.jysoft.basic.dto.BizDataSpecialConfigDTO;
import com.jysoft.basic.dto.DemoDTO;
import com.jysoft.basic.entity.BizDataSpecialConfig;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 * 数据专项配置 服务类
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
public interface IBizDataSpecialConfigService extends IService<BizDataSpecialConfig> {
    void save(BizDataSpecialConfigDTO dto);
    void update(BizDataSpecialConfigDTO dto);
    Map selectCodes(String id);
    void deleteById(String id);
}

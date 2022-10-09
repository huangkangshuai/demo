package com.jysoft.basic.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.jysoft.basic.dto.BizDataSpecialConfigDTO;
import com.jysoft.basic.dto.DemoDTO;
import com.jysoft.basic.entity.BizDataSpecialConfig;
import com.jysoft.basic.entity.BizDataSpecialConfigProvince;
import com.jysoft.basic.entity.BusinessDemo;
import com.jysoft.basic.entity.ConfigCode;
import com.jysoft.basic.mapper.BizDataSpecialConfigMapper;
import com.jysoft.basic.mapper.BizDataSpecialConfigProvinceMapper;
import com.jysoft.basic.mapper.ConfigCodeMapper;
import com.jysoft.basic.service.IBizDataSpecialConfigService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.jysoft.basic.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 数据专项配置 服务实现类
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
@Service
public class BizDataSpecialConfigServiceImpl extends ServiceImpl<BizDataSpecialConfigMapper, BizDataSpecialConfig> implements IBizDataSpecialConfigService {
    @Autowired
    BizDataSpecialConfigProvinceMapper provinceMapper;

    @Autowired
    ConfigCodeMapper configCodeMapper;


    //保存数据专项
    @Transactional
    public void save(BizDataSpecialConfigDTO dto) {
        BizDataSpecialConfig target = new BizDataSpecialConfig();
        BeanUtil.copyProperties(dto, target);
        super.insert(target);//保存数据专项基本信息
        for (BizDataSpecialConfigProvince vo :dto.getProvinceList()){//保存数据专项权限
            vo.setBizDataSpecialConfigId(target.getId());
            provinceMapper.insert(vo);
        }

    }

    //修改数据专项
    @Transactional
    public void update(BizDataSpecialConfigDTO dto) {
        BizDataSpecialConfig target = new BizDataSpecialConfig();
        BeanUtil.copyProperties(dto, target);

        super.updateById(target);//修改数据专项基本信息

        Map m = new HashMap();
        m.put("biz_data_special_config_id",target.getId());
        provinceMapper.deleteByMap(m);//删除数据专项权限

        for (BizDataSpecialConfigProvince vo :dto.getProvinceList()){//保存数据专项权限
            vo.setBizDataSpecialConfigId(target.getId());
            provinceMapper.insert(vo);
        }


    }
    //查询数据专项信息
    @Override
    public Map selectCodes(String id) {
        Map<Object,Object> map = new HashMap();
        map.put("0001","workSpaces");//中台空间
        map.put("0002","checkPlans");//核查计划
        map.put("0003","whiteLists");//白名单
        map.put("0004","reportPlans");//报告计划
        map.put("0005","checkPeriods");//核查期次
        map.put("0006","periodInfos");//期次明细
        map.put("0007","taskLogs");//任务日志
        map.put("0008","problemTaskLogs");//问题核查日志
        map.put("0009","provinceLists");//省公司
        Map<Object,Object> mapRet = new HashMap();
        Map m = new HashMap();
        for(Object key : map.keySet()){
            Wrapper ew=new EntityWrapper<ConfigCode>()
                    .eq("parent_code_no",key)
                    .orderBy("code_sort")
                    .last("asc");
            List list =configCodeMapper.selectList(ew);
            if("0009".equals(key)){
                m.put("provinceLists",list);
                mapRet.put("provinceLists",m);
            }else{
                mapRet.put(map.get(key),list);
            }


        }
        if(StringUtil.isEmpty(id)){//id为空新增，获取specialWorkCode最大值。加1
            List<BizDataSpecialConfig> list =this.selectList(new EntityWrapper<BizDataSpecialConfig>()
                    //.eq("deleted",0)
                    .orderBy("specialWorkCode")
                    .last("desc limit 1")
            );
            int code =10000001;
            if(list!=null && list.size()>0){
                BizDataSpecialConfig bc= list.get(0);
                code = Integer.valueOf(bc.getSpecialWorkCode())+1;
            }
            mapRet.put("specialWorkCode",code);
        }else{//修改，
            Wrapper ew=new EntityWrapper<BizDataSpecialConfig>()
                    .eq("id",id)
                    .eq("deleted","0");

            BizDataSpecialConfig bc=(BizDataSpecialConfig)super.selectOne(ew);//查询数据专项基本信息
            BizDataSpecialConfigDTO dto = new BizDataSpecialConfigDTO();
            BeanUtil.copyProperties(bc, dto);
            List<BizDataSpecialConfigProvince> list= provinceMapper.selectList(new EntityWrapper<BizDataSpecialConfigProvince>()
                    .eq("biz_data_special_config_id",id)
                   );//查询数据专项权限
            dto.setProvinceList(list);
            mapRet.put("bizDataSpecialConfig",dto);//数据专项对象
            m.put("provinceListsSelect",list);//数据专项对象对应的权限，

        }
        return mapRet;

    }

    @Override

    public void deleteById(String id) {

        Wrapper ew=new EntityWrapper<BizDataSpecialConfig>()
                .eq("id",id);

        super.updateForSet("deleted=1",ew);
        //super.update(null,ew);
        //super.deleteById(id);
        //Map m = new HashMap();
        //m.put("biz_data_special_config_id",id);
        //provinceMapper.deleteByMap(m);
    }
}

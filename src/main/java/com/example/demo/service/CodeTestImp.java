package com.example.demo.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.example.demo.entity.ConfigCodeTest;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.example.demo.mapper.ConfigCodeMapperTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CodeTestImp  extends ServiceImpl<ConfigCodeMapperTest, ConfigCodeTest> implements CodeTest {

    @Override
    public List selectById(String id) {
        EntityWrapper<ConfigCodeTest> ew=new EntityWrapper<ConfigCodeTest>();
                ew.eq("code_no",id);
        System.out.println(ew.getSqlSegment());
        System.out.println(baseMapper.selectTest(ew));
        List<ConfigCodeTest> ccTs = baseMapper.selectTest(ew);

        return ccTs;
    }
}

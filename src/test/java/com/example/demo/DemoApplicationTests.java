package com.example.demo;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.example.demo.entity.ConfigCodeTest;
import com.example.demo.mapper.ConfigCodeMapperTest;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;



@SpringBootTest
@RunWith(SpringRunner.class)
class DemoApplicationTests {
    @Autowired
    private ConfigCodeMapperTest configCodeMapperTest;

    @Test
    public void demoTest(){
        EntityWrapper<ConfigCodeTest> ew=new EntityWrapper<ConfigCodeTest>();
        ew.eq("code_no","sjzl_hcjh_zzry");
        System.out.println(configCodeMapperTest.selectTest(ew));
    }

}

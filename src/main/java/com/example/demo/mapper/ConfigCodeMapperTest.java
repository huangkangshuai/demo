package com.example.demo.mapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.example.demo.entity.ConfigCodeTest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConfigCodeMapperTest extends BaseMapper<ConfigCodeTest> {
        //BaseMapper封装了所有的CRUD已经编写完成 （增删改查）
        //不需要像以前的配置一些xml
    List queryAll();
    ConfigCodeTest queryById(String code_no);
    List<ConfigCodeTest> selectTest(@Param("ew") Wrapper<ConfigCodeTest> wrapper);
    void deleteTest(@Param("ew") Wrapper<ConfigCodeTest> wrapper);

}

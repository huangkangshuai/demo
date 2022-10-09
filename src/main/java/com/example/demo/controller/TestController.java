package com.example.demo.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.example.demo.entity.ConfigCodeTest;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.example.demo.mapper.ConfigCodeMapperTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
@Controller
@RequestMapping("/test1")
public class TestController {

    @Autowired
    ConfigCodeMapperTest configCodeMapperTest;

    @GetMapping("/test7")
    public ModelAndView demoTest() {
        Wrapper<ConfigCodeTest> ewa = new QueryWrapper<ConfigCodeTest>();
        List list1 = configCodeMapperTest.selectList(ewa);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("test1/test7");
        mv.addObject("list1",list1);
        return mv;
    }
}

package com.example.demo.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.example.demo.entity.ConfigCodeTest;
import com.example.demo.mapper.ConfigCodeMapperTest;
import com.example.demo.service.CodeTestImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/test")
public class ConfigCodeController {
    @Resource
    private ConfigCodeMapperTest configCodeMapperTest;

    @Resource
    private CodeTestImp codeTestImp;


    @GetMapping("/test1")
    public String demoTest(Model m) {
        List list1 = configCodeMapperTest.queryAll();
        System.out.println(list1);
        List list2 = configCodeMapperTest.selectList(null);
        System.out.println(list2);
        String list3 = configCodeMapperTest.selectList(null).toString();
        m.addAttribute("list1",list1);
        m.addAttribute("list2",list2);
        m.addAttribute("list3",list3);
        return configCodeMapperTest.selectList(null).toString();
    }

    @GetMapping("/test2")
    public ConfigCodeTest demoTest2(@RequestParam(value = "code_no") String code_no) {
        return configCodeMapperTest.queryById(code_no);
    }

    @GetMapping("/test3")
    public List demoTest3(@RequestParam(value = "code_no") String code_no) {
        return codeTestImp.selectById(code_no);
    }

    @GetMapping("/test4")
    public ModelAndView demoTest4(HttpServletRequest request,@RequestParam(value = "code_no") String code_no) {
        System.out.println(request.getParameter("code_no"));//sjzl_bmd
        System.out.println(request.getParameterValues("code_no"));
        Wrapper<ConfigCodeTest> ew=new EntityWrapper<ConfigCodeTest>();
        ew.eq("code_no", code_no);
        System.out.println(configCodeMapperTest.selectTest(ew));
        List list1 = configCodeMapperTest.selectTest(ew);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("test/test4");
        mav.addObject("list1",list1);
        codeTestImp.list();
        return mav;
    }
    @GetMapping ("/test5")
    public List demoTest5(@RequestParam(value = "code_no") String code_no) {
        Wrapper<ConfigCodeTest> ew1=new EntityWrapper<ConfigCodeTest>();
        ew1.eq("code_no", code_no);
        System.out.println(configCodeMapperTest.selectTest(ew1));
        List list = configCodeMapperTest.selectTest(ew1);
        return configCodeMapperTest.selectTest(ew1);
    }
    @PostMapping("/test6")
    public ModelAndView demoTest6(HttpServletRequest request,@RequestParam(value = "code_no") String code_no){
        Wrapper<ConfigCodeTest> ew1=new EntityWrapper<>();
        ew1.eq("code_no",code_no);
        System.out.println(ew1.getSqlSegment());
        configCodeMapperTest.deleteTest(ew1);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/test/test4");
        return mv;
    }
}



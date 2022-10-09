package com.jysoft.basic.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.jysoft.basic.common.BaseResponse;
import com.jysoft.basic.dto.BizDataSpecialConfigDTO;
import com.jysoft.basic.dto.DemoDTO;
import com.jysoft.basic.entity.BizDataSpecialConfig;
import com.jysoft.basic.service.IBizDataSpecialConfigService;

import com.jysoft.basic.utils.ResultResponseUtil;
import com.jysoft.basic.vo.BizDataSpecialConfigVo;
import com.jysoft.basic.vo.DemoAddVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <p>
 * 数据专项配置 前端控制器
 * </p>
 *
 * @author beihai
 * @since 2022-09-23
 */
@Api(tags="数据专项配置控制器")
@RestController
@RequestMapping("/basic/biz-data-special-config")
public class BizDataSpecialConfigController {
    @Autowired
    IBizDataSpecialConfigService bizDataSpecialConfigService;

    @GetMapping(value = "/selectList")
    @ApiOperation(value = "专项数据查询")
    public BaseResponse selectList(HttpServletRequest request)  {
        Wrapper wp =new EntityWrapper<BizDataSpecialConfig>()
                .eq("deleted",0)
                .orderBy("create_time")
                .last("desc ");
        return ResultResponseUtil.setResultSuccess( bizDataSpecialConfigService.selectList(wp));
    }

    @PostMapping(value = "/insert")
    @ApiOperation(value = "新增专项数据")
    public BaseResponse insert(@RequestBody BizDataSpecialConfigVo addVO,HttpServletRequest request)  {
        BizDataSpecialConfigDTO demoDTO = new BizDataSpecialConfigDTO();
        addVO.setCreateTime(new Date());
        addVO.setDeleted(0);
        BeanUtil.copyProperties(addVO, demoDTO);
        bizDataSpecialConfigService.save(demoDTO);
        return ResultResponseUtil.setResultSuccess();

    }
    @PostMapping(value = "/update")
    @ApiOperation(value = "修改专项数据")
    public BaseResponse update(@RequestBody BizDataSpecialConfigVo addVO,HttpServletRequest request)  {
        BizDataSpecialConfigDTO demoDTO = new BizDataSpecialConfigDTO();
        addVO.setModifyTime(new Date());
        BeanUtil.copyProperties(addVO, demoDTO);
        bizDataSpecialConfigService.update(demoDTO);
        return ResultResponseUtil.setResultSuccess();

    }

    @GetMapping(value = "/selectCodes")
    @ApiOperation(value = "查询专项配置下拉框信息")
    public BaseResponse selectCodes(HttpServletRequest request,@RequestParam("id") String id)  {
        return ResultResponseUtil.setResultSuccess(bizDataSpecialConfigService.selectCodes(id));

    }

    @GetMapping(value = "/deleteById")
    @ApiOperation(value = "删除专项配置")
    public BaseResponse deleteById(HttpServletRequest request,@RequestParam("id") String id)  {
        bizDataSpecialConfigService.deleteById(id);
        return ResultResponseUtil.setResultSuccess();
    }




}

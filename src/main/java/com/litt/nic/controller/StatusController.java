package com.litt.nic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.litt.nic.common.AbstractBaseController;
import com.litt.nic.pojo.status;
import com.litt.nic.service.IStatusService;

@Controller
@RequestMapping("/status")
public class StatusController extends AbstractBaseController {

	@Autowired
	private IStatusService statusService;
	
	@ResponseBody
	@RequestMapping("/getStatusList")
	public JSONObject getFinishList(HttpServletRequest request){
		List<status> list=statusService.findAllStatus();
		return getJsonResult(list);
	}
}

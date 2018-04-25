package com.litt.nic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.litt.nic.common.AbstractBaseController;
import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.user;
import com.litt.nic.service.IUserService;
@Controller
@RequestMapping("/userManager")
public class UserManagerController extends AbstractBaseController {

	@Autowired
	private IUserService userService;
	
	@RequestMapping("toUserList")
	public String toUserList(HttpServletRequest request){
		return "/WEB-INF/views/managerView/user/mng";
	}
	@ResponseBody
	@RequestMapping("/getList")
	public JSONObject getList(HttpServletRequest request,user user, @ModelAttribute Paginator paginator){
		Map<String, Object> qryMap = new HashMap<>();
		qryMap.put("user_name", user.getUserName());
		qryMap.put("user_telephone", user.getUserTelephone());
		qryMap.put("user_department", user.getUserDepartment());
		qryMap.put("user_nickname", user.getUserNickname());
		qryMap.put("user_sex", user.getUserSex());
		List<user> list=userService.getList(qryMap, paginator);
		return  queryListToJSONObject(list);
	}
}

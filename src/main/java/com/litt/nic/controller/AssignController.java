package com.litt.nic.controller;

import java.util.Date;
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
import com.litt.nic.pojo.vo.AssignVO;
import com.litt.nic.service.IAssignService;
import com.litt.nic.pojo.assign;

@Controller
@RequestMapping("/assignManager")
public class AssignController extends AbstractBaseController {

	@Autowired
	private IAssignService assignService;
	
	
	/**
	 * 业务指派页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toAssign")
	public String toAssign(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/assign/mng";
	}
	
	@ResponseBody
	@RequestMapping("/getList")
	public JSONObject getList(HttpServletRequest request,assign assign, @ModelAttribute Paginator paginator) {
		
		Map<String,Object> qryMap=new HashMap<String,Object>();
		
		qryMap.put("location", assign.getLocation());
		qryMap.put("content", assign.getContent());
		qryMap.put("managerid", assign.getManagerid());
		qryMap.put("status", assign.getStatus());
		List<AssignVO> list=assignService.getList(qryMap, paginator);
		
		return queryListToJSONObject(list);
	}
	
	
	
	/**
	 * 业务指派
	 * @param request
	 * @param techsupport
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/assign")
	public JSONObject assign(HttpServletRequest request, assign assign) {
		assign.setCreatetime(new Date());
		if(null==assign.getId()){
			assignService.add(assign);
			return getJsonResult("业务指派添加成功");
		}else{
			assignService.update(assign);
			return getJsonResult("业务指派更新成功");
		}
	}
	@ResponseBody
	@RequestMapping("/work")
	public JSONObject work(HttpServletRequest request, assign assign) {
		
		assignService.update(assign);
		return getJsonResult("操作成功");
	}
}

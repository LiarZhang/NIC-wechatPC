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
import com.litt.nic.pojo.manager;
import com.litt.nic.pojo.worklog;
import com.litt.nic.pojo.vo.WorklogVO;
import com.litt.nic.service.IWorklogService;

@Controller
@RequestMapping("/worklog")
public class WorklogController extends AbstractBaseController{

	@Autowired
	private IWorklogService  worklogService ;
	
	@RequestMapping("/toworklog")
	public String toFinish(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/worklog/mng";
	}
	
	@ResponseBody
	@RequestMapping("/getList")
	public JSONObject getList(HttpServletRequest request,worklog worklog,@ModelAttribute Paginator paginator){
		
		Map<String, Object> qryMap = new HashMap<>();
		qryMap.put("location", worklog.getLocation());
		qryMap.put("content", worklog.getContent());
		qryMap.put("managerid", worklog.getManagerid());
		List<WorklogVO> list= worklogService.getList(qryMap, paginator);
		return queryListToJSONObject(list);
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public JSONObject add(HttpServletRequest request,worklog worklog){
		manager managers=(manager) request.getSession().getAttribute("loginmanager");
		if(null!=managers){
			worklog.setManagerid(managers.getManagerId());
			if(null==worklog.getId()){
				worklogService.add(worklog);
				return getJsonResult("添加成功");
			}else{
				worklogService.update(worklog);
				return getJsonResult("更改成功");
			}
		}
		return  getErrorJsonResult("操作失败,请重新登陆");
	}
	@ResponseBody
	@RequestMapping("/delete")
	public JSONObject delete(HttpServletRequest request,worklog worklog){
		worklogService.delete(worklog.getId());
		return getJsonResult("删除成功");
	}
}

package com.litt.nic.controller;

import java.util.HashMap;
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
import com.litt.nic.pojo.department;
import com.litt.nic.service.IDepartmentService;

@Controller
@RequestMapping("/departmentManager")
public class DepartmentController extends AbstractBaseController{

	@Autowired
	private IDepartmentService departmentService;
	
	@RequestMapping("/todepartList")
	public String todepartList(HttpServletRequest request){
		return "/WEB-INF/views/managerView/department/mng";
	}
	/**
	 * 不分页查询
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getList")
	public JSONObject getList(HttpServletRequest request){
		return getJsonResult(departmentService.findAllInfo());
	}
	/**
	 * 分页查询
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getDepartmentList")
	public JSONObject getDepartmentList(HttpServletRequest request,@ModelAttribute Paginator paginator){
		String departmentName=request.getParameter("departmentName");
		Map<String, Object> qryMap = new HashMap<>();
		qryMap.put("department_name", departmentName);
		return queryListToJSONObject(departmentService.getList(qryMap, paginator));
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public JSONObject add(HttpServletRequest request){
		String departmentName=request.getParameter("departName");
		department department=new department();
		department.setDepartmentName(departmentName);
		departmentService.insert(department);
		return getJsonResult("添加成功");
	}
	@ResponseBody
	@RequestMapping("/update")
	public JSONObject update(HttpServletRequest request){
		String departmentName=request.getParameter("departName");
		Integer departmentID=Integer.parseInt(request.getParameter("departmentId"));
		department department=new department();
		department.setDepartmentId(departmentID);
		department.setDepartmentName(departmentName);
		departmentService.update(department);
		return getJsonResult("修改成功");
	}
	@ResponseBody
	@RequestMapping("/delete")
	public JSONObject delete(HttpServletRequest request){
		Integer departmentID=Integer.parseInt(request.getParameter("id"));
		departmentService.delete(departmentID);
		return getJsonResult("删除成功");
	}
}

package com.litt.nic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.litt.nic.common.AbstractBaseController;
import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.manager;
import com.litt.nic.service.IManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController extends AbstractBaseController{
	@Autowired
	private IManagerService managerservice;

/*	@RequestMapping("/load")
	public String load(HttpServletRequest request) {
		List<manager> record = managerservice.selectAllManager();
		request.setAttribute("record", record);
		return "/WEB-INF/views/manager/managerlist";

	}*/

	

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		Integer managerId = Integer.valueOf(request.getParameter("managerId"));
		System.out.println(managerId);
		managerservice.deleteByPrimaryKey(managerId);
		return "redirect:/manager/load";

	}

	@RequestMapping("/loadmanagerinfor")
	public String loadmanagerinformation(HttpServletRequest request,
			manager model) {

		Integer managerId = Integer.valueOf(request.getParameter("managerId"));
		manager managernews = managerservice.selectByPrimaryKey(managerId);
		System.out.println("/loadmanagerinfor" + managernews.toString());
		request.setAttribute("managernews", managernews);
		return "/WEB-INF/views/manager/updatemanager";

	}

	@RequestMapping("/update")
	public String update(HttpServletRequest request, manager model) {
		System.out.println("/update" + model.toString());
		managerservice.updateByPrimaryKeySelective(model);
		return "redirect:/manager/load";

	}

	// WEB-INF为安全目录，所以跳转经过Controller再跳转页面
	@RequestMapping("/toadd")
	public String ToRegistered(HttpServletRequest request) {
		return "/WEB-INF/views/manager/addmanager";

	}
	/**toAdd
	 * @author Liar
	 * @param request
	 * @return
	 */
	@RequestMapping("/toload")
	public String To(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/manager/mng";

	}
	@RequestMapping("/toAdd")
	public String toAdd(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/addmanager/addmanager";

	}
	@RequestMapping("/toMe")
	public String toMe(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/manager/me";
	}
	/**分页
	 * @author Liar
	 * 查询所有的管理员
	 */
	@ResponseBody
	@RequestMapping("/getManagerList")
	public JSONObject getManagerList(HttpServletRequest request,String name, String telephone, String type,
			String duty,@ModelAttribute Paginator paginator){
		Map<String, Object> qryMap = new HashMap<>();
		qryMap.put("manager_telephone", telephone);
		qryMap.put("manager_typ", type);
		qryMap.put("manager_name", name);
		qryMap.put("manager_duty", duty);
		List<manager> list=managerservice.selectAllManager(qryMap,paginator);
		return queryListToJSONObject(list);
	}
	/**
	 * 不分页
	 * @author Liar
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getList")
	public JSONObject getList(HttpServletRequest request){
		Map<String, Object> qryMap = new HashMap<>();
		List<manager> list=managerservice.selectAllManager(qryMap);
		return getJsonResult(list);
	}
	@ResponseBody
	@RequestMapping("/add")
	public JSONObject add(HttpServletRequest request,
			HttpServletResponse response, manager model) {
		manager DBmanager=managerservice.findByName(model.getManagerName());
		if(null==DBmanager){
			model.setManagerPassword("123456");
			managerservice.insert(model);
			return getJsonResult("添加成功");
		}
		return getErrorJsonResult("添加失败,用户名已存在");
	}
	@ResponseBody
	@RequestMapping("/updateManager")
	public JSONObject updateManager(HttpServletRequest request,
			HttpServletResponse response, manager model,String newPassword) {
		if("".equals(newPassword)||null==newPassword){//管理员更新
			manager DBmanager=managerservice.findByName(model.getManagerName());
			if(null==DBmanager||(null!=DBmanager&&model.getManagerId()==DBmanager.getManagerId())){
				managerservice.updateByPrimaryKeySelective(model);
				return getJsonResult("更新用户成功");
			}
			return getErrorJsonResult("更新失败,用户名已存在");
		}else{//个人更新密码
			manager DBmanager=managerservice.findById(model.getManagerId());
			if(!(DBmanager.getManagerPassword()).equals(model.getManagerPassword())){
				return getErrorJsonResult("更新失败,原密码输入错误");
			}else{
				model.setManagerPassword(newPassword);
				managerservice.updateByPrimaryKeySelective(model);
				request.getSession().removeAttribute("loginmanager");
				return getJsonResult("更新用户成功");
			}
		}
		
	}
	@ResponseBody
	@RequestMapping("/deleteManager")
	public JSONObject delete(HttpServletRequest request,HttpServletResponse response, manager model) {
		try {
			managerservice.deleteByPrimaryKey(model.getManagerId());
			return getJsonResult("用户删除成功");
		} catch (Exception e) {
			return getJsonResult("用户删除失败,存在数据关联");
		}
	}
	@ResponseBody
	@RequestMapping("/resetPassword")
	public JSONObject resetPassword(HttpServletRequest request,
			HttpServletResponse response, manager model) {
		manager DBmanager=managerservice.findByName(model.getManagerName());
		if(null==DBmanager){
			managerservice.updateByPrimaryKeySelective(model);
			return getJsonResult("更新用户成功");
		}
		return getErrorJsonResult("更新失败,用户名已存在");
	}
	@ResponseBody
	@RequestMapping("/getMe")
	public JSONObject getMe(HttpServletRequest request,@ModelAttribute Paginator paginator){
		manager manager=(manager) request.getSession().getAttribute("loginmanager");
		Map<String, Object> qryMap = new HashMap<>();
		qryMap.put("manager_id", manager.getManagerId());
		List<manager> list=managerservice.selectAllManager(qryMap, paginator);
		return queryListToJSONObject(list);
	}
}
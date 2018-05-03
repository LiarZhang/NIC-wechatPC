package com.litt.nic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import com.litt.nic.pojo.techsupport;
import com.litt.nic.service.ITechSupportService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/workManager")
public class WorksController extends AbstractBaseController {

	@Autowired
	private ITechSupportService techSupportService;

	@RequestMapping("/toFinish")
	public String toFinish(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/finish/mng";
	}

	@RequestMapping("/toUnFinish")
	public String toUnFinish(HttpServletRequest request) {
		return "/WEB-INF/views/managerView/unfinish/mng";
	}
	

	@ResponseBody
	@RequestMapping("/getFinishList")
	public JSONObject getFinishList(HttpServletRequest request, String parent, String son, String inputsearch, @ModelAttribute Paginator paginator) {
		Map<String, Object> qryMap = new HashMap<>();
		/*qryMap.put("techsupport_devicename", devicename);
		qryMap.put("techsupport_department", department);
		qryMap.put("user_name", username);
		qryMap.put("type", type);*/
		if(parent.equals("service")){
			qryMap.put("type", son);
		}
		if(parent.equals("department")){
			qryMap.put("techsupport_department", son);
		}
		if(!"".equals(inputsearch)){
			qryMap.put("techsupport_location", inputsearch);
		}
		qryMap.put("status_id", 5);
		//qryMap.put("techsupport_location", location);
		List<techsupport> finishlist = techSupportService.getFinishList(qryMap, paginator);

		return queryListToJSONObject(finishlist);
	}

	@ResponseBody
	@RequestMapping("/getUnFinishList")
	public JSONObject getUnFinishList(HttpServletRequest request, String parent, String son, String inputsearch, @ModelAttribute Paginator paginator) {
		Map<String, Object> qryMap = new HashMap<>();
		if(parent.equals("service")){
			qryMap.put("type", son);
		}
		if(parent.equals("department")){
			qryMap.put("techsupport_department", son);
		}
		if(!"".equals(inputsearch)){
			qryMap.put("techsupport_location", inputsearch);
		}
		
		
		//qryMap.put("techsupport_devicename", devicename);
//		qryMap.put("techsupport_department", department);
//		qryMap.put("user_name", username);
//		qryMap.put("type", type);
//		qryMap.put("techsupport_location", location);
		// qryMap.put("status_id", statusId);
		List<techsupport> finishlist = techSupportService.getUnFinishList(qryMap, paginator);

		return queryListToJSONObject(finishlist);
	}
	/**
	 * 加载照片
	 * @param request
	 * @param response
	 * @param picurl
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/loadPicture")
	public void loadPicture(HttpServletRequest request, HttpServletResponse response,String picurl) throws IOException {
		String parentfile = System.getProperty("catalina.home") + "/webapps"
				+ "/download" + "/ManageUpload/";
		String file=parentfile+picurl;
		// 读取本地图片输入流
		FileInputStream inputStream = new FileInputStream(new File(file));
		int i = inputStream.available();
		// byte数组用于存放图片字节数据
		byte[] buff = new byte[i];
		inputStream.read(buff);
		// 记得关闭输入流
		inputStream.close();
		// 设置发送到客户端的响应内容类型
		response.setHeader("Content-type", "image/png");
		OutputStream out = response.getOutputStream();
		out.write(buff);
		// 关闭响应输出流
		out.close();
	}

	// 反馈
	@ResponseBody
	@RequestMapping("/feedback")
	public JSONObject feedback(HttpServletRequest request) {
		String list = request.getParameter("IdList");
		String feedback = request.getParameter("feedback");
		JSONArray jsonArray = JSONArray.fromObject(list);
		for (int i = 0; i < jsonArray.size(); i++) {
			int id = jsonArray.getInt(i);
			techSupportService.updateFeedback(id, feedback);
		}
		return getJsonResult("反馈成功");
	}

	/**
	 * 业务处理
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doWork")
	public JSONObject doWork(HttpServletRequest request, techsupport techsupport) {
		String list = request.getParameter("IdList");
		JSONArray jsonArray = JSONArray.fromObject(list);
		for (int i = 0; i < jsonArray.size(); i++) {
			int id = jsonArray.getInt(i);
			techsupport.setTechsupportId(id);
			techSupportService.work(techsupport);
		}
		return getJsonResult("处理成功");
	}
}

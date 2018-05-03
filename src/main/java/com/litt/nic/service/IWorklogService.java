package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.worklog;
import com.litt.nic.pojo.vo.WorklogVO;

public interface IWorklogService {

	public List<WorklogVO> getList(Map<String,Object> qryMap,Paginator paginator);
	
	public int add(worklog worklog);
	
	public int update(worklog worklog);
	
	public int  delete(Integer id);
}

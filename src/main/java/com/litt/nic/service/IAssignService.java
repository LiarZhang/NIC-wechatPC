package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.assign;
import com.litt.nic.pojo.vo.AssignVO;

public interface IAssignService {

	public List<AssignVO> getList(Map<String, Object> qryMap, Paginator paginator);
	
	public int add(assign assign);
	
	public int update(assign assign);
}

package com.litt.nic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.assign;
import com.litt.nic.pojo.vo.AssignVO;
import com.litt.nic.service.IAssignService;
import com.github.pagehelper.PageHelper;
import com.litt.nic.Dao.assignMapper;

@Service
public class AssignServiceImpl implements IAssignService{

	@Autowired
	private assignMapper assignMapper;
	
	@Override
	public List<AssignVO> getList(Map<String, Object> qryMap, Paginator paginator) {
		PageHelper.startPage(paginator.getPageNumber(),paginator.getPageSize());
		List<AssignVO> list=assignMapper.getList(qryMap);
		return list;
	}

	@Override
	public int add(assign assign) {
		return assignMapper.insertSelective(assign);
	}

	@Override
	public int update(assign assign) {
		return assignMapper.updateByPrimaryKeySelective(assign);
	}

	
}

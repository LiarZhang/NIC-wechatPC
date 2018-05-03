package com.litt.nic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.litt.nic.Dao.worklogMapper;
import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.worklog;
import com.litt.nic.pojo.vo.WorklogVO;
import com.litt.nic.service.IWorklogService;

@Service
public class WorklogServiceImpl implements IWorklogService{

	@Autowired
	private worklogMapper  worklogMapper ;
	
	@Override
	public List<WorklogVO> getList(Map<String, Object> qryMap, Paginator paginator) {
		PageHelper.startPage(paginator.getPageNumber(),paginator.getPageSize());
		List<WorklogVO> list=worklogMapper.getList(qryMap);
		return list;
	}

	@Override
	public int add(worklog worklog) {
		// TODO Auto-generated method stub
		return worklogMapper.insertSelective(worklog);
	}

	@Override
	public int update(worklog worklog) {
		// TODO Auto-generated method stub
		return worklogMapper.updateByPrimaryKeySelective(worklog);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return worklogMapper.deleteByPrimaryKey(id);
	}

	
}

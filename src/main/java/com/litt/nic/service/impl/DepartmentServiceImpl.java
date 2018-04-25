package com.litt.nic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.litt.nic.Dao.departmentMapper;
import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.department;
import com.litt.nic.service.IDepartmentService;
@Service
public class DepartmentServiceImpl implements IDepartmentService {

	@Autowired
	private  departmentMapper departmentmapper;
	@Override
	public List<department> findAllInfo() {
		return departmentmapper.selectAllInfo();
	}
	@Override
	public List<department> getList(Map<String, Object> qryMap, Paginator paginator) {
		PageHelper.startPage(paginator.getPageNumber(),paginator.getPageSize());
		return departmentmapper.getList(qryMap);
	}
	@Override
	public int insert(department record) {
		return departmentmapper.insert(record);
	}
	@Override
	public int update(department record) {
		return departmentmapper.updateByPrimaryKey(record);
	}
	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return departmentmapper.deleteByPrimaryKey(id);
	}

}

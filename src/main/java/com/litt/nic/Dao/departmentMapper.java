package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import com.litt.nic.pojo.department;

public interface departmentMapper {
	List<department> selectAllInfo();
	List<department> getList(Map<String, Object> qryMap);
	int insert(department record);
	int updateByPrimaryKey(department record);
	
	int deleteByPrimaryKey(Integer Id);
}

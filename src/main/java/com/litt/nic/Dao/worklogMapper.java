package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import com.litt.nic.pojo.worklog;
import com.litt.nic.pojo.vo.WorklogVO;

public interface worklogMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(worklog record);

	int insertSelective(worklog record);

	worklog selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(worklog record);

	int updateByPrimaryKey(worklog record);

	List<WorklogVO> getList(Map<String ,Object> qryMap);
}
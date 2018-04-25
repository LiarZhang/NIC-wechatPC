package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import com.litt.nic.pojo.article;

public interface articleMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(article record);

	int insertSelective(article record);

	article selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(article record);

	int updateByPrimaryKeyWithBLOBs(article record);

	int updateByPrimaryKey(article record);

	int findMaxId();
	
	List<article> getList(Map<String,Object> qryMap);
}
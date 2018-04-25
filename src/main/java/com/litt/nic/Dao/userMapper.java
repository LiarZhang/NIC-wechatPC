package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import com.litt.nic.pojo.user;

public interface userMapper {
	int deleteByPrimaryKey(Integer userId);

	int insert(user record);

	int insertSelective(user record);

	user selectByPrimaryKey(Integer userId);

	int updateByPrimaryKeySelective(user record);

	int updateByPrimaryKey(user record);

	user selectByOpenid(String openid);
	
	/**
	 * @author Liar
	 * @param qryMap
	 * @return
	 */
	List<user> getList(Map<String, Object> qryMap);
}
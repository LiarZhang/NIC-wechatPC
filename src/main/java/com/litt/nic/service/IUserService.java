package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.user;

public interface IUserService {
	user findById(int id);

	void addUser(com.litt.nic.pojo.user user);

	user findByOpenid(String openid);
	
	List<user> getList(Map<String, Object> qryMap, Paginator paginator);
}

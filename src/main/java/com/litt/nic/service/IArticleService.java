package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.article;

public interface IArticleService {
	int findMaxId();

	article findById(int id);

	int save(article article);
	
	List<article> getList(Map<String,Object> qryMap,Paginator paginator);
}

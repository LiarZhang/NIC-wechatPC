package com.litt.nic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.litt.nic.Dao.articleMapper;
import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.article;
import com.litt.nic.service.IArticleService;

@Service
public class ArticleServiceImpl implements IArticleService {

	@Autowired
	private articleMapper articleMapper;

	@Override
	public int findMaxId() {
		return articleMapper.findMaxId();
	}

	@Override
	public article findById(int id) {
		return articleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int save(article article) {
		return articleMapper.insert(article);
	}

	@Override
	public List<article> getList(Map<String, Object> qryMap, Paginator paginator) {
		PageHelper.startPage(paginator.getPageNumber(), paginator.getPageSize());
		return articleMapper.getList(qryMap);
	}

}

package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.department;

public interface IDepartmentService {
  List<department> findAllInfo();
  /**
   * 分页
   * @param qryMap
   * @param paginator
   * @return
   */
  List<department> getList(Map<String, Object> qryMap,Paginator paginator);
  
  int insert(department record);
  
  int update(department record);
  
  int delete(Integer id);
}

package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import com.litt.nic.pojo.assign;
import com.litt.nic.pojo.vo.AssignVO;

public interface assignMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(assign record);

    int insertSelective(assign record);

    assign selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(assign record);

    int updateByPrimaryKey(assign record);
    
    List<AssignVO> getList(Map<String,Object> qryMap);
}
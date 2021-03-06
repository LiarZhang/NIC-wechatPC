package com.litt.nic.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.litt.nic.pojo.techsupport;

public interface techsupportMapper {
	int deleteByPrimaryKey(Integer techsupportId);

	int insert(techsupport record);

	int insertSelective(techsupport record);

	techsupport selectByPrimaryKey(Integer techsupportId);

	int updateByPrimaryKeySelective(techsupport record);

	int updateByPrimaryKey(techsupport record);

	List<techsupport> selectAllTS();

	List<techsupport> selectTSMultiInfo(@Param("key") String key,
			@Param("val") String val);

	List<techsupport> selectByType(String type);

	/**
	 * 查询所有业务未完成的信息
	 */
	List<techsupport> findAllUnfinished();

	/**
	 * 修改状态
	 * 
	 * @param techsupport_id
	 * @param status_id
	 */
	void updateStatus_id(int techsupport_id, int status_id);

	/**
	 * 修改负责人
	 * 
	 * @param techsupport_id
	 * @param manager_id
	 */
	void updateManager_id(int techsupport_id, int manager_id);

	void updateEndTime(int techsupport_id, String endtime);

	void updateFeedback(int id, String info);

	List<techsupport> selectfinish(String dateString);

	List<techsupport> selectUnFinishedTSByMultiInfo(@Param("key") String key,
			@Param("val") String val);

	List<techsupport> findFeedback(Integer userId);
	
	List<techsupport> getFinishList(Map<String,Object> qryMap);
	List<techsupport> getUnFinishList(Map<String,Object> qryMap);
	
}
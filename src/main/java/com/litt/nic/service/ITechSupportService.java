package com.litt.nic.service;

import java.util.List;
import java.util.Map;

import com.litt.nic.common.Paginator;
import com.litt.nic.pojo.techsupport;

public interface ITechSupportService {
	List<techsupport> findAllTS();

	List<techsupport> findByType(String type);

	List<techsupport> findByMutilInfo(String key, String val);

	/**
	 * 查询所有业务未完成的信息
	 */
	public List<techsupport> findAllUnfinished();

	/**
	 * 修改状态
	 */
	public void updateStatus_id(int techsupport_id, int status_id);

	/**
	 * 修改负责人
	 * 
	 * @param techsupport_id
	 * @param manager_id
	 */
	void updateManager_id(int techsupport_id, int manager_id);

	techsupport findById(Integer techsupportId);

	List<techsupport> findUnFinishedTSByMultiInfo(String key, String val);

	void updateEndTime(int techsupport_id, String endtime);

	void updateFeedback(int id, String info);

	List<com.litt.nic.pojo.techsupport> findByEnd(String dateString);

	void addtech(techsupport techsupport);

	List<techsupport> findFeedback(Integer userId);
	/**
	 * 分页
	 * @param qryMap
	 * @param paginator
	 * @return
	 */
	List<techsupport> getFinishList(Map<String,Object> qryMap,Paginator paginator);
	List<techsupport> getUnFinishList(Map<String,Object> qryMap,Paginator paginator);
	/**
	 * 不分页
	 * @param qryMap
	 * @return
	 */
	List<techsupport> getFinishList(Map<String,Object> qryMap);
	List<techsupport> getUnFinishList(Map<String,Object> qryMap);
	/**
	 * 办理业务，修改进度、处理人、更新时间
	 * @author Liar
	 * @param techsupport
	 * @return
	 */
	int work(techsupport techsupport);
}
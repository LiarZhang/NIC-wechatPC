package com.litt.nic.pojo;

/**
 *技术支持业务实体类
 */
public class techsupport {
	
	private Integer techsupportId;//技术支持业务id
	private Integer userId;//用户id
	private String techsupportDepartment;//部门
	private String techsupportDevicename;//设备
	private String techsupportLocation;//地点
	private String techsupportDescribe;//描述
	private String techsupportPicture;//图片
	private String techsupportFeedback;//反馈
	private String techsupportUptime;//提交时间
	private String techsupportEndtime;//完成时间
	private Integer statusId;//状态id
	private Integer managerId;//管理员id
	private String type;//业务类型

	public Integer getTechsupportId() {
		return techsupportId;
	}
	public void setTechsupportId(Integer techsupportId) {
		this.techsupportId = techsupportId;
	}
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTechsupportDepartment() {
		return techsupportDepartment;
	}

	public void setTechsupportDepartment(String techsupportDepartment) {
		this.techsupportDepartment = techsupportDepartment == null ? null
				: techsupportDepartment.trim();
	}

	public String getTechsupportDevicename() {
		return techsupportDevicename;
	}

	public void setTechsupportDevicename(String techsupportDevicename) {
		this.techsupportDevicename = techsupportDevicename == null ? null
				: techsupportDevicename.trim();
	}

	public String getTechsupportLocation() {
		return techsupportLocation;
	}

	public void setTechsupportLocation(String techsupportLocation) {
		this.techsupportLocation = techsupportLocation == null ? null
				: techsupportLocation.trim();
	}

	public String getTechsupportDescribe() {
		return techsupportDescribe;
	}

	public void setTechsupportDescribe(String techsupportDescribe) {
		this.techsupportDescribe = techsupportDescribe == null ? null
				: techsupportDescribe.trim();
	}

	public String getTechsupportPicture() {
		return techsupportPicture;
	}

	public void setTechsupportPicture(String techsupportPicture) {
		this.techsupportPicture = techsupportPicture == null ? null
				: techsupportPicture.trim();
	}

	public String getTechsupportFeedback() {
		return techsupportFeedback;
	}

	public void setTechsupportFeedback(String techsupportFeedback) {
		this.techsupportFeedback = techsupportFeedback == null ? null
				: techsupportFeedback.trim();
	}

	public String getTechsupportUptime() {
		return techsupportUptime;
	}

	public void setTechsupportUptime(String techsupportUptime) {
		this.techsupportUptime = techsupportUptime;
	}

	public String getTechsupportEndtime() {
		return techsupportEndtime;
	}

	public void setTechsupportEndtime(String techsupportEndtime) {
		this.techsupportEndtime = techsupportEndtime;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}

	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "techsupport [techsupportId=" + techsupportId + ", userId=" + userId + ", techsupportDepartment="
				+ techsupportDepartment + ", techsupportDevicename=" + techsupportDevicename + ", techsupportLocation="
				+ techsupportLocation + ", techsupportDescribe=" + techsupportDescribe + ", techsupportPicture="
				+ techsupportPicture + ", techsupportFeedback=" + techsupportFeedback + ", techsupportUptime="
				+ techsupportUptime + ", techsupportEndtime=" + techsupportEndtime + ", statusId=" + statusId
				+ ", managerId=" + managerId + ", type=" + type + "]";
	}

	
}

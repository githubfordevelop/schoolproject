package com.chengxusheji.po;

import org.json.JSONException;
import org.json.JSONObject;

public class Info {

	private int id;
	private String projectName;

	private String point;
	private String createTime;
	private UserInfo userObj;
	
	private String updateTime;
	private String state;
	private String allponit;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public UserInfo getUserObj() {
		return userObj;
	}
	public void setUserObj(UserInfo userObj) {
		this.userObj = userObj;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAllponit() {
		return allponit;
	}
	public void setAllponit(String allponit) {
		this.allponit = allponit;
	}
	 public JSONObject getJsonObject() throws JSONException {
	    	JSONObject jsonAchievement=new JSONObject(); 
	    	jsonAchievement.accumulate("id", this.getId());
	    	jsonAchievement.accumulate("projectName", this.getProjectName());
	    	jsonAchievement.accumulate("point", this.getPoint());
	    	jsonAchievement.accumulate("createTime", this.getCreateTime());
	    	jsonAchievement.accumulate("updateTiem", this.getUpdateTime());
	    	jsonAchievement.accumulate("userObj", this.getUserObj().getName());
	    	jsonAchievement.accumulate("state", this.getState());
	    	jsonAchievement.accumulate("allponit", this.getAllponit());
			return jsonAchievement;
	    }
	
}

package com.chengxusheji.po;

import org.json.JSONException;
import org.json.JSONObject;

public class Achievement {
	
	private int achievement_id;
	private String achievement_ponit;
	private String achievement_desc;
	private String result;
	private String achievement_type;
	private UserInfo userObj;
	private String publish_date;
	private String project_name;
	private String achievement_state;
	private String oneOther;
	private String Other;
	
	
	public String getOther() {
		return Other;
	}
	public void setOther(String other) {
		Other = other;
	}
	public String getOneOther() {
		return oneOther;
	}
	public void setOneOther(String oneOther) {
		this.oneOther = oneOther;
	}
	public String getAchievement_state() {
		return achievement_state;
	}
	public void setAchievement_state(String achievement_state) {
		this.achievement_state = achievement_state;
	}
	public int getAchievement_id() {
		return achievement_id;
	}
	public void setAchievement_id(int achievement_id) {
		this.achievement_id = achievement_id;
	}
	public String getAchievement_ponit() {
		return achievement_ponit;
	}
	public void setAchievement_ponit(String achievement_ponit) {
		this.achievement_ponit = achievement_ponit;
	}
	public String getAchievement_desc() {
		return achievement_desc;
	}
	public void setAchievement_desc(String achievement_desc) {
		this.achievement_desc = achievement_desc;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAchievement_type() {
		return achievement_type;
	}
	public void setAchievement_type(String achievement_type) {
		this.achievement_type = achievement_type;
	}
	
	public UserInfo getUserObj() {
		return userObj;
	}
	public void setUserObj(UserInfo userObj) {
		this.userObj = userObj;
	}
	
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	 
	 public JSONObject getJsonObject() throws JSONException {
	    	JSONObject jsonAchievement=new JSONObject(); 
	    	jsonAchievement.accumulate("achievement_id", this.getAchievement_id());
	    	jsonAchievement.accumulate("achievement_ponit", this.getAchievement_ponit());
	    	jsonAchievement.accumulate("achievement_desc", this.getAchievement_desc());
	    	jsonAchievement.accumulate("result", this.getResult());
	    	jsonAchievement.accumulate("achievement_type", this.getAchievement_type());
	    	jsonAchievement.accumulate("userObj", this.getUserObj().getName());
	    	jsonAchievement.accumulate("publish_date", this.getPublish_date().length()>19?this.getPublish_date().substring(0,19):this.getPublish_date());
	    	jsonAchievement.accumulate("project_name", this.getProject_name());
	    	jsonAchievement.accumulate("achievement_state", this.getAchievement_state());
	    	jsonAchievement.accumulate("oneOther", this.getOneOther());
	    	jsonAchievement.accumulate("Other", this.getOther());
			return jsonAchievement;
	    }
	
	

}

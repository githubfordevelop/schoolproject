package com.chengxusheji.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chengxusheji.mapper.AchievementMapper;
import com.chengxusheji.mapper.ThesisMapper;
import com.chengxusheji.po.Achievement;
import com.chengxusheji.po.Thesis;
import com.chengxusheji.po.UserInfo;

@Service
public class AchievementService {
	
	@Resource AchievementMapper achievementMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }
	public void addAchievement(Achievement achievement) throws Exception {
		// TODO Auto-generated method stub
		achievementMapper.addAchievement(achievement);
	}

	
	 /*按照查询条件分页查询论文记录*/
    public ArrayList<Achievement> queryAchievement(String achievement_type, String project_name,String  publish_date,UserInfo userObj, String achievement_ponit, int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(!achievement_type.equals("")) where = where + " and t_achievement.achievement_type like '%" + achievement_type + "%'";
    	if(!project_name.equals("")) where = where + " and t_achievement.PROJECT_NAME like '%" + project_name + "%'";
    	if(!publish_date.equals("")) where = where + " and t_achievement.PUBLISH_DATE like '%" + publish_date + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_achievement.userObj='" + userObj.getUser_name() + "'";
    	if(!achievement_ponit.equals("")) where = where + " and t_achievement.ACHIEVEMENT_PONIT like '%" + achievement_ponit + "%'";
  
    	int startIndex = (currentPage-1) * this.rows;
    	return achievementMapper.queryAchievement(where, startIndex, this.rows);
    }
	
    /*按照查询条件查询所有记录*/
    public ArrayList<Achievement> queryAchievement(String achievement_type, String project_name,String  publish_date,UserInfo userObj, String achievement_ponit) throws Exception  { 
    	String where = "where 1=1";
    	if(!achievement_type.equals("")) where = where + " and t_achievement.achievement_type like '%" + achievement_type + "%'";
    	if(!project_name.equals("")) where = where + " and t_achievement.PROJECT_NAME like '%" + project_name + "%'";
    	if(!publish_date.equals("")) where = where + " and t_achievement.PUBLISH_DATE like '%" + publish_date + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_achievement.userObj='" + userObj.getUser_name() + "'";
    	if(!achievement_ponit.equals("")) where = where + " and t_achievement.ACHIEVEMENT_PONIT like '%" + achievement_ponit + "%'";
    	return achievementMapper.queryAchievementList(where);
    }
    
    
    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(String achievement_type, String project_name,String  publish_date,UserInfo userObj, String achievement_ponit) throws Exception {
     	String where = "where 1=1";
     	if(!achievement_type.equals("")) where = where + " and t_achievement.achievement_type like '%" + achievement_type + "%'";
    	if(!project_name.equals("")) where = where + " and t_achievement.PROJECT_NAME like '%" + project_name + "%'";
    	if(!publish_date.equals("")) where = where + " and t_achievement.PUBLISH_DATE like '%" + publish_date + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_achievement.userObj='" + userObj.getUser_name() + "'";
    	if(!achievement_ponit.equals("")) where = where + " and t_achievement.ACHIEVEMENT_PONIT like '%" + achievement_ponit + "%'";
        recordNumber = achievementMapper.queryAchievementCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    
    /*根据主键获取论文记录*/
    public Achievement getAchievement(int achievement_id) throws Exception  {
    	Achievement achievement = achievementMapper.getAchievement(achievement_id);
        return achievement;
    }
    
    public int deleteAchievements (String achievement_ids) throws Exception {
    	String _achievement_ids[] = achievement_ids.split(",");
    	for(String _achievement_id: _achievement_ids) {
    		achievementMapper.deleteAchievement(Integer.parseInt(_achievement_id));
    	}
    	return _achievement_ids.length;
    }
    
    /*更新论文记录*/
    public void updateAchievement(Achievement achievement) throws Exception {
    	achievementMapper.updateAchievement(achievement);
    }

	
}

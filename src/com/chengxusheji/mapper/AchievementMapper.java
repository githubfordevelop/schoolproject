package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import com.chengxusheji.po.Achievement;
import com.chengxusheji.po.Thesis;

public interface AchievementMapper {
	/*添加业绩信息*/
	public void addAchievement(Achievement achievement) throws Exception;

	/*按照查询条件分页查询业绩记录*/
	public ArrayList<Achievement> queryAchievement(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有论文记录*/
	public ArrayList<Achievement> queryAchievementList(@Param("where") String where) throws Exception;

	/*按照查询条件的业绩记录数*/
	public int queryAchievementCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条业绩记录*/
	public Achievement getAchievement(int achievement_id) throws Exception;

	/*更新业绩记录*/
	public void updateAchievement(Achievement achievement) throws Exception;

	/*删除业绩记录*/
	public void deleteAchievement(int achievement_id) throws Exception;

	
	

	

}

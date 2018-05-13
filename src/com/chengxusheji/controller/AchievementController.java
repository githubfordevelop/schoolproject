package com.chengxusheji.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chengxusheji.po.Achievement;
import com.chengxusheji.po.DeptName;
import com.chengxusheji.po.DeptVO;
import com.chengxusheji.po.Result;
import com.chengxusheji.po.Thesis;
import com.chengxusheji.po.UserInfo;
import com.chengxusheji.po.Yeji;
import com.chengxusheji.service.AchievementService;
import com.chengxusheji.service.ThesisService;
import com.chengxusheji.service.UserInfoService;
import com.chengxusheji.utils.ExportExcelUtil;
import com.chengxusheji.utils.UserException;

//Achievement管理控制层
@Controller
@RequestMapping("/Achievement")
public class AchievementController extends BaseController{

    /*业务层对象*/
    @Resource AchievementService achievementService;

    @Resource UserInfoService userInfoService;
	@InitBinder("userObj")
	public void initBinderuserObj(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("userObj.");
	}
	@InitBinder("achievement")
	public void initBinderThesis(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("achievement.");
	}
	@RequestMapping(value = "/search")
    public String seacrh(HttpServletRequest r,HttpServletResponse response,Model model) throws Exception {
	  List<UserInfo> list=userInfoService.queryAllUserInfo();
	  Set<String> set=new HashSet();
	   response.setContentType("text/json;charset=UTF-8");
	        PrintWriter out = response.getWriter();
			//将要被返回到客户端的对象 
	        List<DeptVO> list1=new ArrayList();
			for(UserInfo userinfo:list) {
				set.add(userinfo.getDepartment());
			    }
				for(String str:set) {
					List<UserInfo> listUser=userInfoService.queryUserDept(str);
				    DeptVO deptvo=new DeptVO();
				    deptvo.setDept(str);
				    List list3=new ArrayList();
				    for(UserInfo userinfo2:listUser) {
				    	DeptName deptname=new DeptName();
				    	deptname.setId((int) (Math.random()*1000));
				    	String username=(String) r.getSession().getAttribute("user_name");
				    	System.out.println(username+"登录用户的信息");
				    	System.out.println(userinfo2.getUser_name()+"用户");
				    	if(userinfo2.getUser_name().equals(username)) {
				    		model.addAttribute("username",userinfo2.getName());
				    		
				    	}else {
				    		deptname.setName(userinfo2.getName());
					    	list3.add(deptname);
				    	}
				    }
				   deptvo.setDept_name(list3);
				   list1.add(deptvo);
			}
			model.addAttribute("result",list1);
			
			System.out.println(list1);
			return "Achievement/achievement_frontUserAdd";
    }
	
	/*用户前台客户端ajax方式提交添加论文信息*/
	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public void userAdd(Achievement achievement, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		String message = "";
		boolean success = false;
		UserInfo userObj = new UserInfo();
		userObj.setUser_name(session.getAttribute("user_name").toString());
		
		achievement.setUserObj(userObj);
		achievement.setAchievement_state("待审核");
		System.out.println(achievement.getAchievement_state());
		
		achievementService.addAchievement(achievement);
        message = "添加成功!";
        success = true;
        writeJsonResponse(response, success, message);
	}
	
	
	
	/*用户前台按照查询条件分页查询论文信息*/
	@RequestMapping(value = { "/userFrontlist" }, method = {RequestMethod.GET,RequestMethod.POST})
	public String userFrontlist(String achievement_type,String project_name,String publish_date,@ModelAttribute("userObj") UserInfo userObj,String achievement_ponit,Integer currentPage, Model model, HttpServletRequest request,HttpSession session ,HttpServletResponse response) throws Exception  {
		if (currentPage==null || currentPage == 0) currentPage = 1;
		if (achievement_type == null) achievement_type = "";
		if (project_name == null) project_name = "";
		if (publish_date == null) publish_date = "";
		if (achievement_ponit == null) achievement_ponit = "";
		userObj = new UserInfo();
		userObj.setUser_name(session.getAttribute("user_name").toString());
		List<Achievement> achievementList = achievementService.queryAchievement(achievement_type, project_name, publish_date, userObj, achievement_ponit,currentPage);
	    /*计算总的页数和总的记录数*/
		achievementService.queryTotalPageAndRecordNumber(achievement_type, project_name, publish_date, userObj, achievement_ponit);
	    /*获取到总的页码数目*/
	    int totalPage = achievementService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = achievementService.getRecordNumber();
	    request.setAttribute("achievementList",  achievementList);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("recordNumber", recordNumber);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("achievement_type", achievement_type);
	    request.setAttribute("project_name", project_name);
	    request.setAttribute("publish_date", publish_date);
	   
	    request.setAttribute("userObj", userObj);
	 
	    request.setAttribute("achievement_ponit", achievement_ponit);
	    List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
	    request.setAttribute("userInfoList", userInfoList);
		return "Achievement/achievement_frontUserquery_result"; 
	}
	
	/*ajax方式显示论文修改jsp视图页*/
	@RequestMapping(value="/{achievement_id}/update",method=RequestMethod.GET)
	public void update(@PathVariable Integer achievement_id,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
        /*根据主键achievement_id获取achievement对象*/
		
		Achievement achievement = achievementService.getAchievement(achievement_id);

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象 
		JSONObject jsonAchievement = achievement.getJsonObject();
		out.println(jsonAchievement.toString());
		out.flush();
		out.close();
	}

	/*ajax方式删除多条论文记录*/
	@RequestMapping(value="/deletes",method=RequestMethod.POST)
	public void delete(String achievement_ids,HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException {
		String message = "";
    	boolean success = false;
        try { 
        	int count = achievementService.deleteAchievements(achievement_ids);
        	success = true;
        	message = count + "条记录删除成功";
        	writeJsonResponse(response, success, message);
        } catch (Exception e) { 
            //e.printStackTrace();
            message = "有记录存在外键约束,删除失败";
            writeJsonResponse(response, success, message);
        }
	}
	
	
	/*ajax方式更新论文信息*/
	@RequestMapping(value = "/{achievement_id}/update", method = RequestMethod.POST)
	public void update(@Validated Achievement achievement, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
    	boolean success = false;
		if (br.hasErrors()) { 
			message = "输入的信息有错误！";
			writeJsonResponse(response, success, message);
			return;
		}
		
		
		try {
			achievementService.updateAchievement(achievement);
			message = "业绩更新成功!";
			success = true;
			writeJsonResponse(response, success, message);
		} catch (Exception e) {
			e.printStackTrace();
			message = "业绩更新失败!";
			writeJsonResponse(response, success, message); 
		}
	}
	
	
	/*ajax方式按照查询条件分页查询论文信息*/
	@RequestMapping(value = { "/list" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void list(String achievement_type,String project_name,String publish_date,@ModelAttribute("userObj") UserInfo userObj,String achievement_ponit  ,Integer page,Integer rows, Model model, HttpServletRequest request,HttpSession session ,HttpServletResponse response) throws Exception {
		System.out.println(achievement_ponit+"AAAAAAAAAAAAAAAAAA");
		if (page==null || page == 0) page = 1;
		if (achievement_type == null) achievement_type = "";
		if (project_name == null) project_name = "";
		if (publish_date == null) publish_date = "";
		if (achievement_ponit == null) achievement_ponit = "";
		if(rows != 0)achievementService.setRows(rows);
		List<Achievement> achievementList = achievementService.queryAchievement(achievement_type, project_name, publish_date, userObj, achievement_ponit,page);
	    /*计算总的页数和总的记录数*/
		achievementService.queryTotalPageAndRecordNumber(achievement_type, project_name, publish_date, userObj, achievement_ponit);
	    /*获取到总的页码数目*/
	    int totalPage = achievementService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = achievementService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象
		JSONObject jsonObj=new JSONObject();
		jsonObj.accumulate("total", recordNumber);
		JSONArray jsonArray = new JSONArray();
		for(Achievement achievement:achievementList) {
			JSONObject jsonAchievement = achievement.getJsonObject();
			jsonArray.put(jsonAchievement);
		}
		jsonObj.accumulate("rows", jsonArray);
		out.println(jsonObj.toString());
		System.out.println(jsonObj.toString());
		out.flush();
		out.close();
	}
	
	
	/*按照查询条件导出论文信息到Excel*/
	@RequestMapping(value = { "/OutToExcel" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void OutToExcel(String achievement_type,String project_name,String publish_date,@ModelAttribute("userObj") UserInfo userObj,String achievement_ponit,String achievement_state,String result, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        
		if (achievement_type == null) achievement_type = "";
		if (project_name == null) project_name = "";
		if (publish_date == null) publish_date = "";
		if (achievement_ponit == null) achievement_ponit = "";
        List<Achievement> achievementList = achievementService.queryAchievement( achievement_type,  project_name,  publish_date, userObj,  achievement_ponit);
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "Achievement信息记录"; 
        String[] headers = { "著作id","类别","著作名称","主编","副主编","业绩点","出版社","发布日期","提交用户","审核状态"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        for(int i=0;i<achievementList.size();i++) {
        	Achievement achievement = achievementList.get(i); 
        	dataset.add(new String[]{achievement.getAchievement_id() + "",achievement.getAchievement_type(),achievement.getProject_name(),achievement.getOther(),achievement.getOneOther(),achievement.getAchievement_ponit(),achievement.getResult(),achievement.getPublish_date(),achievement.getUserObj().getName(),achievement.getAchievement_state()});
        }
        /*
        OutputStream out = null;
		try {
			out = new FileOutputStream("C://output.xls");
			ex.exportExcel(title,headers, dataset, out);
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		OutputStream out = null;//创建一个输出流对象 
		try { 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"Achievement.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,_title,headers, dataset, out);
			out.flush();
		} catch (IOException e) { 
			e.printStackTrace(); 
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
			} 
		}
    }
	
	@RequestMapping(value = "/search1")
    public String seacrh1(HttpServletRequest r,HttpServletResponse response,Model model) throws Exception {
	
	  List<Yeji> list2=	 userInfoService.selectPoint();
	
	  r.setAttribute("list", list2);

	  
	  return null;
    }
	
	
	
	
	
}

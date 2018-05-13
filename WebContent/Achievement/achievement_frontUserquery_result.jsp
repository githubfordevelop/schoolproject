<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Achievement" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page import="com.chengxusheji.po.Thesis" %>
<%
   
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Achievement> achievementList = (List<Achievement>)request.getAttribute("achievementList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String achievement_type = (String)request.getAttribute("achievement_type"); //作者查询关键字
    String project_name = (String)request.getAttribute("project_name"); //指导老师查询关键字
    String publish_date = (String)request.getAttribute("publish_date"); //发布日期查询关键字
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String achievement_ponit = (String)request.getAttribute("achievement_ponit"); //学科门类查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>著作查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Achievement/userFrontlist">著作信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>Achievement/thesis_frontAdd.jsp" style="display:none;">添加著作</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<achievementList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		Achievement achievement = achievementList.get(i); //获取到业绩对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>Thesis/<%=achievement.getAchievement_id() %>/frontshow"></a>
			     <div class="showFields">
			     	 
			     	<div class="field">
	            		类别:<%=achievement.getAchievement_type() %>
			     	</div>
			     	<div class="field">
	            		著作名称:<%=achievement.getProject_name() %>
			     	</div>
			     	<div class="field">
	            		主编:<%=achievement.getOther() %>
			     	</div>
			     	<div class="field">
	            		副主编:<%=achievement.getOneOther()%>
			     	</div>
			     	
			     	<div class="field">
	            		业绩点:<%=achievement.getAchievement_ponit() %>
			     	</div>
			     	<div class="field">
	            		出版社:<%=achievement.getResult() %>
			     	</div>
			     	<div class="field">
	            		发布日期:<%=achievement.getPublish_date() %>
			     	</div>
			     		<div class="field">
	            		审核状态:<%=achievement.getAchievement_state() %>
			     	</div>
			     	<div class="field">
	            		备注:<%=achievement.getAchievement_desc() %>
			     	</div>
			        <a class="btn btn-primary top5" onclick="achievementEdit('<%=achievement.getAchievement_id() %>');">修改</a>
			        <a class="btn btn-primary top5" onclick="achievementDelete('<%=achievement.getAchievement_id() %>');">删除</a>
			     </div>
			</div>
			<%  } %>

		<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						<%
								int startPage = currentPage- 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %> 
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>
	

	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>著作查询</h1>
		</div>
		<form name="achievementQueryForm" id="achievementQueryForm" action="<%=basePath %>Achievement/userFrontlist" class="mar_t15">
			<div class="form-group">
				<label for="author">类别:</label>
				<input type="text" id="author" name="achievement_type" value="<%=achievement_type %>" class="form-control" placeholder="请输入类别">
			</div>
			<div class="form-group">
				<label for="teacher">项目名称:</label>
				<input type="text" id="teacher" name="project_name" value="<%=project_name %>" class="form-control" placeholder="请输入项目名称">
			</div>
			<div class="form-group">
				<label for="publishDate">发布日期:</label>
				<input type="text" id="publish_date" name="publish_date" class="form-control"  placeholder="请选择发布日期" value="<%=publish_date %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <div class="form-group" style="display:none;">
            	<label for="userObj_user_name">提交用户：</label>
                <select id="userObj_user_name" name="userObj.user_name" class="form-control">
                	<option value="">不限制</option>
	 				<%
	 				for(UserInfo userInfoTemp:userInfoList) {
	 					String selected = "";
 					if(userObj!=null && userObj.getUser_name()!=null && userObj.getUser_name().equals(userInfoTemp.getUser_name()))
 						selected = "selected";
	 				%>
 				 <option value="<%=userInfoTemp.getUser_name() %>" <%=selected %>><%=userInfoTemp.getName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="xkml">业绩点:</label>
				<input type="text" id="achievement_ponit" name="achievement_ponit" value="<%=achievement_ponit %>" class="form-control" placeholder="请输入业绩点">
			</div>
			
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="thesisEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="width:900px;" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;著作信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="thesisEditForm" id="thesisEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="thesis_thesisId_edit" class="col-md-3 text-right">著作id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="achievement_achievement_id_edit" name="achievement.achievement_id" class="form-control" placeholder="请输入业绩id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="thesis_xkml_edit" class="col-md-3 text-right">类别:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_achievement_type_edit" name="achievement.achievement_type" class="form-control" placeholder="请输入类别">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_name_edit" class="col-md-3 text-right">著作名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_project_name_edit" name="achievement.project_name" class="form-control" placeholder="请输入著作名称">
			 </div>
		  </div>
		   <div class="form-group">
		  	 <label for="thesis_name_edit" class="col-md-3 text-right">主编:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_Other_edit" name="achievement.Other" class="form-control" placeholder="请输入主编名称">
			 </div>
		  </div>
		   <div class="form-group">
		  	 <label for="thesis_name_edit" class="col-md-3 text-right">副主编:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_oneOther_edit" name="achievement.oneOther" class="form-control" placeholder="请输入副主编名称">
			 </div>
		  </div>
		  
		 
		  <div class="form-group">
		  	 <label for="thesis_author_edit" class="col-md-3 text-right">业绩点:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_achievement_ponit_edit" name="achievement.achievement_ponit" class="form-control" placeholder="请输入业绩点">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_teacher_edit" class="col-md-3 text-right">出版社:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="achievement_result_edit" name="achievement.result" class="form-control" placeholder="请输入验收结果">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_publishDate_edit" class="col-md-3 text-right">发布日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date thesis_publishDate_edit col-md-12" data-link-field="thesis_publishDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="achievement_publish_date_edit" name="achievement.publish_date" size="16" type="text" value="" placeholder="请选择发布日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="achievement_achievement_desc_edit" class="col-md-3 text-right">备注:</label>
		  	 <div class="col-md-9">
			 	<textarea name="achievement.achievement_desc" id="achievement_achievement_desc_edit" style="width:100%;height:500px;"></textarea>
			 </div>
		  </div>
	
		  <div class="form-group"  style="display:none;">
		  	 <label for="achievement_userObj_user_name_edit" class="col-md-3 text-right">提交用户:</label>
		  	 <div class="col-md-9">
			    <select id="achievement_userObj_user_name_edit" name="achievement.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
		</form> 
	    <style>#thesisEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxAchievementModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var achievement_achievement_desc_edit = UE.getEditor('achievement_achievement_desc_edit'); //论文介绍编辑器
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.achievementQueryForm.currentPage.value = currentPage;
    document.achievementQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.achievementQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.achievementQueryForm.currentPage.value = pageValue;
    documentachievementQueryForm.submit();
}

/*弹出修改论文界面并初始化数据*/
function achievementEdit(achievement_id) {
	$.ajax({
		url :  basePath + "Achievement/" + achievement_id + "/update",
		type : "get",
		dataType: "json",
		success : function (achievement, response, status) {
			if (achievement) {
				$("#achievement_achievement_id_edit").val(achievement.achievement_id);
				$("#achievement_achievement_type_edit").val(achievement.achievement_type);
				$("#achievement_project_name_edit").val(achievement.project_name);
				$("#achievement_Other_edit").val(achievement.Other);
				$("#achievement_oneOther_edit").val(achievement.oneOther);
	
				$("#achievement_achievement_ponit_edit").val(achievement.achievement_ponit);
				$("#achievement_result_edit").val(achievement.result);
				$("#achievement_publish_date_edit").val(achievement.publish_date);
				achievement_achievement_desc_edit.setContent(achievement.achievement_desc, false);
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#achievement_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
		        		});
		        		$("#achievement_userObj_user_name_edit").html(html);
		        		$("#achievement_userObj_user_name_edit").val(thesis.userObjPri);
					}
				});
				$('#thesisEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除论文信息*/
function achievementDelete(achievement_id) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Achievement/deletes",
			data : {
				achievement_ids : achievement_id,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#achievementQueryForm").submit();
					//location.href= basePath + "Thesis/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交论文信息表单给服务器端修改*/
function ajaxAchievementModify() {
	$.ajax({
		url :  basePath + "Achievement/" + $("#achievement_achievement_id_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#thesisEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#achievementQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();

    /*发布日期组件*/
    $('.thesis_publishDate_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
})
</script>
</body>
</html>


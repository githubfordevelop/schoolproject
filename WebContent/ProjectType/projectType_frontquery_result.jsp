﻿<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ProjectType" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<ProjectType> projectTypeList = (List<ProjectType>)request.getAttribute("projectTypeList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>项目性质查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="row"> 
		<div class="col-md-12 wow fadeInDown" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li><a href="<%=basePath %>index.jsp">首页</a></li>
			    	<li role="presentation" class="active"><a href="#projectTypeListPanel" aria-controls="projectTypeListPanel" role="tab" data-toggle="tab">项目性质列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>ProjectType/projectType_frontAdd.jsp" style="display:none;">添加项目性质</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="projectTypeListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold"><td>序号</td><td>项目性质id</td><td>项目性质名称</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i=0;i<projectTypeList.size();i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		ProjectType projectType = projectTypeList.get(i); //获取到项目性质对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=projectType.getProjectTypeId() %></td>
 											<td><%=projectType.getProjectTypeName() %></td>
 											<td>
 												<a href="<%=basePath  %>ProjectType/<%=projectType.getProjectTypeId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="projectTypeEdit('<%=projectType.getProjectTypeId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="projectTypeDelete('<%=projectType.getProjectTypeId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
 											</td> 
 										</tr>
 										<%}%>
				    				</table>
				    				</div>
				    			</div>
				    		</div>

				    		<div class="row">
					            <div class="col-md-12">
						            <nav class="pull-left">
						                <ul class="pagination">
						                    <li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						                     <%
						                    	int startPage = currentPage - 5;
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
			</div>
		</div>
	</div> 
<div id="projectTypeEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;项目性质信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="projectTypeEditForm" id="projectTypeEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="projectType_projectTypeId_edit" class="col-md-3 text-right">项目性质id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="projectType_projectTypeId_edit" name="projectType.projectTypeId" class="form-control" placeholder="请输入项目性质id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="projectType_projectTypeName_edit" class="col-md-3 text-right">项目性质名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="projectType_projectTypeName_edit" name="projectType.projectTypeName" class="form-control" placeholder="请输入项目性质名称">
			 </div>
		  </div>
		</form> 
	    <style>#projectTypeEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxProjectTypeModify();">提交</button>
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
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.projectTypeQueryForm.currentPage.value = currentPage;
    document.projectTypeQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.projectTypeQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.projectTypeQueryForm.currentPage.value = pageValue;
    documentprojectTypeQueryForm.submit();
}

/*弹出修改项目性质界面并初始化数据*/
function projectTypeEdit(projectTypeId) {
	$.ajax({
		url :  basePath + "ProjectType/" + projectTypeId + "/update",
		type : "get",
		dataType: "json",
		success : function (projectType, response, status) {
			if (projectType) {
				$("#projectType_projectTypeId_edit").val(projectType.projectTypeId);
				$("#projectType_projectTypeName_edit").val(projectType.projectTypeName);
				$('#projectTypeEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除项目性质信息*/
function projectTypeDelete(projectTypeId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "ProjectType/deletes",
			data : {
				projectTypeIds : projectTypeId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#projectTypeQueryForm").submit();
					//location.href= basePath + "ProjectType/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交项目性质信息表单给服务器端修改*/
function ajaxProjectTypeModify() {
	$.ajax({
		url :  basePath + "ProjectType/" + $("#projectType_projectTypeId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#projectTypeEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.href= basePath + "ProjectType/frontlist";
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

})
</script>
</body>
</html>

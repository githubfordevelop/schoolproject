<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_manager_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thesis.css" /> 

<div id="achievement_manage"></div>
<div id="achievement_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="achievement_manage_tool.edit();">审核</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="achievement_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="achievement_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="achievement_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="achievement_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="achievementQueryForm" method="post">
			类别：<input type="text" class="textbox" id="achievement_type" name="achievement_type" style="width:110px" />
			著作名称：<input type="text" class="textbox" id="project_name" name="project_name" style="width:110px" />
			发布日期：<input type="text" id="publish_date" name="publish_date" class="easyui-datebox" editable="false" style="width:100px">
			提交用户：<input class="textbox" type="text" id="userObj_user_name_query" name="userObj.user_name" style="width: auto"/>
			业绩点：<input type="text" class="textbox" id="achievement_ponit" name="achievement_ponit" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="achievement_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="achievementEditDiv">
	<form id="achievementEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">业绩id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="achievement_achievement_id_edit" name="achievement.achievement_id" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">类别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_xkml_edit" name="achievement.achievement_type" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">著作名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_name_edit" name="achievement.project_name" style="width:200px" />

			</span>

		</div>
		
		<div>
			<span class="label">业绩点:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_author_edit" name="achievement.achievement_ponit" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出版社:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_teacher_edit" name="achievement.result" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_publishDate_edit" name="achievement.publish_date" />

			</span>

		</div>
		<div>
			<span class="label">备注:</span>
			<span class="inputControl">
				<script name="achievement.achievement_desc" id="thesis_thesisDesc_edit" type="text/plain"   style="width:100%;height:500px;"></script>

			</span>

		</div>
		<div style="display:none;">
			<span class="label">提交用户:</span>
			<span class="inputControl">
				<input class="textbox"  id="achievement_userObj_user_name_edit" name="achievement.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">审核状态:</span>
			<span class="inputControl">
				<select id="achievement_achievement_state" name="achievement.achievement_state">
					<option value="待审核">待审核</option>
					<option value="审核通过">审核通过</option>
					<option value="审核拒绝">审核拒绝</option>
				</select>
				
			</span>

		</div>
	</form>
</div>
<script>
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc_edit'); //论文介绍编辑器
</script>
<script type="text/javascript" src="Achievement/js/achievement_manage.js"></script> 

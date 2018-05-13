var achievement_manage_tool = null; 
$(function () { 
	initThesisManageTool(); //建立Thesis管理对象
	achievement_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#achievement_manage").datagrid({
		url : 'Achievement/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "achievement_id",
		sortOrder : "desc",
		toolbar : "#achievement_manage_tool",
		columns : [[
			{
				field : "achievement_id",
				title : "业绩id",
				width : 70,
			},
			{
				field : "achievement_type",
				title : "类别",
				width : 140,
			},
			{
				field : "project_name",
				title : "项目名称",
				width : 140,
			},
			{
				field : "achievement_ponit",
				title : "业绩点",
				width : 140,
			},
			{
				field : "result",
				title : "验收结果",
				width : 140,
			},
			{
				field : "publish_date",
				title : "发布日期",
				width : 140,
			},
			{
				field : "userObj",
				title : "提交用户",
				width : 140,
			},
			{
				field : "achievement_state",
				title : "审核状态",
				width : 140,
			}
		]],
	});

	$("#achievementEditDiv").dialog({
		title : "修改管理",
		top: "10px",
		width : 1000,
		height : 600,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#achievementEditForm").form("validate")) {
					//验证表单 
					if(!$("#achievementEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#achievementEditForm").form({
						    url:"Achievement/" + $("#achievement_achievement_id_edit").val() + "/update",
						    onSubmit: function(){
								if($("#achievementEditForm").form("validate"))  {
				                	$.messager.progress({
										text : "正在提交数据中...",
									});
				                	return true;
				                } else { 
				                    return false; 
				                }
						    },
						    success:function(data){
						    	$.messager.progress("close");
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#achievementEditDiv").dialog("close");
			                        achievement_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#achievementEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#achievementEditDiv").dialog("close");
				$("#achievementEditForm").form("reset"); 
			},
		}],
	});
});

function initThesisManageTool() {
	achievement_manage_tool = {
		init: function() {
			$.ajax({
				url : "UserInfo/listAll",
				type : "post",
				success : function (data, response, status) {
					$("#userObj_user_name_query").combobox({ 
					    valueField:"user_name",
					    textField:"name",
					    panelHeight: "200px",
				        editable: false, //不允许手动输入 
					});
					data.splice(0,0,{user_name:"",name:"不限制"});
					$("#userObj_user_name_query").combobox("loadData",data); 
				}
			});
		},
		
		reload : function () {
			$("#achievement_manage").datagrid("reload");
		},
		redo : function () {
			$("#achievement_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#achievement_manage").datagrid("options").queryParams;
			queryParams["achievement_type"] = $("#achievement_type").val();
			queryParams["project_name"] = $("#project_name").val();
			queryParams["publish_date"] = $("#publish_date").datebox("getValue"); 
			queryParams["userObj.user_name"] = $("#userObj_user_name_query").combobox("getValue");
			queryParams["result"] = $("#achievement_result").val();
			queryParams["achievement_ponit"] = $("#achievement_ponit").val();
			$("#achievement_manage").datagrid("options").queryParams=queryParams; 
			$("#achievement_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#achievementQueryForm").form({
			    url:"Achievement/OutToExcel",
			});
			//提交表单
			$("#achievementQueryForm").submit();
		},
		remove : function () {
			var rows = $("#achievement_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var achievement_ids = [];
						for (var i = 0; i < rows.length; i ++) {
							achievement_ids.push(rows[i].achievement_id);
						}
						$.ajax({
							type : "POST",
							url : "Achievement/deletes",
							data : {
								achievement_ids : achievement_ids.join(","),
							},
							beforeSend : function () {
								$("#achievement_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#achievement_manage").datagrid("loaded");
									$("#achievement_manage").datagrid("load");
									$("#achievement_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#achievement_manage").datagrid("loaded");
									$("#achievement_manage").datagrid("load");
									$("#achievement_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function () {
			var rows = $("#achievement_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Achievement/" + rows[0].achievement_id +  "/update",
					type : "get",
					data : {
						//thesisId : rows[0].thesisId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (achievement, response, status) {
						$.messager.progress("close");
						if (achievement) { 
							$("#achievementEditDiv").dialog("open");
							$("#achievement_achievement_id_edit").val(achievement.achievement_id);
							$("#achievement_achievement_id_edit").validatebox({
								required : true,
								missingMessage : "请输入业绩id",
								editable: false
							});
							$("#thesis_xkml_edit").val(achievement.achievement_type);
							$("#thesis_xkml_edit").validatebox({
								required : true,
								missingMessage : "请输入业绩类别",
							});
							$("#thesis_name_edit").val(achievement.project_name);
							$("#thesis_name_edit").validatebox({
								required : true,
								missingMessage : "请输入项目名称",
							});
							$("#thesis_author_edit").val(achievement.achievement_ponit);
							$("#thesis_author_edit").validatebox({
								required : true,
								missingMessage : "请输入业绩点",
							});
							$("#thesis_teacher_edit").val(achievement.result);
							$("#thesis_teacher_edit").validatebox({
								required : true,
								missingMessage : "请输入验收结果",
							});
							$("#thesis_publishDate_edit").datebox({
								value: achievement.publish_date,
							    required: true,
							    showSeconds: true,
							});
							$("#achievement_achievement_state").val(achievement.achievement_state);
							$("#achievement_achievement_state").validatebox({
								required : true,
								missingMessage : "请输入审核状态",
							});
							thesis_thesisDesc_editor.setContent(achievement.achievement_desc, false);
							$("#achievement_userObj_user_name_edit").combobox({
								url:"UserInfo/listAll",
							    valueField:"user_name",
							    textField:"name",
							    panelHeight: "auto",
						        editable: false, //不允许手动输入 
						        onLoadSuccess: function () { //数据加载完毕事件
									$("#achievement_userObj_user_name_edit").combobox("select", thesis.userObjPri);
									//var data = $("#thesis_userObj_user_name_edit").combobox("getData"); 
						            //if (data.length > 0) {
						                //$("#thesis_userObj_user_name_edit").combobox("select", data[0].user_name);
						            //}
								}
							});
						} else {
							$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
						}
					}
				});
			} else if (rows.length == 0) {
				$.messager.alert("警告操作！", "编辑记录至少选定一条数据！", "warning");
			}
		},
	};
}

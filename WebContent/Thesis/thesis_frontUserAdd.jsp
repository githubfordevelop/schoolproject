<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>论文提交</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="js/jquery.min.js"></script>
    
<script src="http://apps.bdimg.com/libs/layer/2.1/layer.js"></script>

    <link rel="stylesheet" type="text/css" href="css/select.css">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Thesis/userFrontlist">论文管理</a></li>
  			<li class="active">添加论文</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="thesisAddForm" id="thesisAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
				  	 <label for="thesis_xkml" class="col-md-2 text-right">学科门类:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_xkml" name="thesis.xkml" class="form-control" placeholder="请输入学科门类">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_name" class="col-md-2 text-right">论文名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_name" name="thesis.name" class="form-control" placeholder="请输入论文名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_lwfm" class="col-md-2 text-right">论文封面图:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="thesis_lwfmImg" border="0px"/><br/>
					    <input type="hidden" id="thesis_lwfm" name="thesis.lwfm"/>
					    <input id="lwfmFile" name="lwfmFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_author" class="col-md-2 text-right">老师:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_author" name="thesis.author" readonly value="${username}" class="form-control" placeholder="请输入 老师">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_teacher" class="col-md-2 text-right">参编老师:</label>
				  	 <div class="col-md-8">
					    <input type="text" name="thesis.teacher" class="form-control"  readonly id="area_btn_y2" onclick="show_lay(2)"  lay-verify="phone" autocomplete="off" class="layui-input" placeholder="请输入参与老师">
					 </div>
				  </div>
				   <div class="form-group">
				  	 <label for="thesis_name" class="col-md-2 text-right">业绩点:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_yeji" name="thesis.yeji" onchange="yeji()" id="ye" class="form-control" placeholder="请输入业绩点">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_publishDateDiv" class="col-md-2 text-right">发布日期:</label>
				  	 <div class="col-md-8">
		                <div id="thesis_publishDateDiv" class="input-group date thesis_publishDate col-md-12" data-link-field="thesis_publishDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="thesis_publishDate" name="thesis.publishDate" size="16" type="text" value="" placeholder="请选择发布日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_thesisDesc" class="col-md-2 text-right">论文介绍:</label>
				  	 <div class="col-md-8">
							    <textarea name="thesis.thesisDesc" id="thesis_thesisDesc" style="width:100%;height:500px;"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_thesisFile" class="col-md-2 text-right">论文文件:</label>
				  	 <div class="col-md-8">
					    <a id="thesis_thesisFileImg" border="0px"></a><br/>
					    <input type="hidden" id="thesis_thesisFile" name="thesis.thesisFile"/>
					    <input id="thesisFileFile" name="thesisFileFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group" style="display:none;">
				  	 <label for="thesis_xgyj" class="col-md-2 text-right">修改意见:</label>
				  	 <div class="col-md-8">
					    <textarea id="thesis_xgyj" name="thesis.xgyj" rows="8" class="form-control" placeholder="请输入修改意见"></textarea>
					 </div>
				  </div>
				  <div class="form-group" style="display:none;">
				  	 <label for="thesis_userObj_user_name" class="col-md-2 text-right">提交用户:</label>
				  	 <div class="col-md-8">
					    <select id="thesis_userObj_user_name" name="thesis.userObj.user_name" class="form-control">
					    </select>
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxThesisAdd();" class="btn btn-primary bottom5 top5">我要提交论文</span>
		          </div> 
		          <style>#thesisAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<div class="fade_layer"></div>
<div class="detail_layer select_peo">
        <div class="title">选择人员</div>
        <div class="select_peo_con">
            <div class="left">
                <div class="areas_list" id="list">
                    <ul class="yiji" id="ulwrite">
                       <c:forEach var="i" items="${result}">
                           <li class="areas_list_one"><a>${i.dept}</a></li>
                            <ul class="areas_list_two">
                           <c:forEach var="j" items="${i.dept_name}">
                          <li><span id='${j.id}'>${j.name}</span> </li>
                         </c:forEach> 
                        </ul>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="center">
                <a id="list_add"><img src="images/addicon.jpg"></a>
            </div>
            <div class="right">
                <ul class="send_to">
                </ul>
            </div>
            <div class="clear"></div>
            <div class="bot_btn">
                <a onclick="do_add(this)" class="a_con do_add">确定</a><a class="a_con close_btn">取消</a> 
            </div>
        </div>
    </div>
<script type="text/javascript">
//点击下拉人员效果
$('.detail_layer').find('.left .areas_list .areas_list_one > a').click(function(){
    if($(this).parent().hasClass('on')){
        $(this).parent().removeClass('on');
        $(this).parent().next('.areas_list_two').css('height','0');
        //隐藏下一级目录
        $(this).siblings('dl').hide();

        //初始化
        $(this).siblings('dl').find('dl').hide();
        $(this).siblings('dl').find('a').removeClass('on');
        //console.log($(this).siblings('dl').find('ul.areas_list_two').length);
        $(this).siblings('dl').find('ul.areas_list_two').css('height','0');
    }else {
        //解绑子级分类点击事件
        $(this).siblings('dl').children('dd').children('a').unbind('click');

        $(this).parent().addClass('on');
        //如果下面还有下一级
        if($(this).siblings('dl').length>0){
                //显示子类
                $(this).siblings('dl').show();
                //子级分类点击事件
                $(this).siblings('dl').children('dd').children('a').click(function(){
                    //解绑子级分类点击事件
                    $(this).siblings('dl').children('dd').children('a').unbind('click');
                    //切换隐藏
                    if($(this).hasClass('on')){
                        $(this).removeClass('on');
                        $(this).parent().next('.areas_list_two').css('height','0');
                        //隐藏下一级目录
                        $(this).siblings('dl').hide();
                    }else{

                        $(this).addClass('on');
                        $(this).parent().next('.areas_list_two').css('height','auto');
                        //如果还有下一级
                        if($(this).siblings('dl').length>0){
                            $(this).siblings('dl').show().css('padding-left','30px');
                            $(this).siblings('dl').children('dd').children('a').click(function(){
                                //解绑子级分类点击事件
                                $(this).siblings('dl').children('dd').children('a').unbind('click');
                                if($(this).hasClass('on')){
                                    $(this).removeClass('on');
                                    $(this).parent().next('.areas_list_two').css('height','0');
                                    //隐藏下一级目录
                                    $(this).siblings('dl').hide();
                                }else{
                                    $(this).addClass('on');
                                    $(this).parent().next('.areas_list_two').css('height','auto');
                                    //如果还有下一级
                                    if($(this).siblings('dl').length>0){
                                        $(this).siblings('dl').show().css('padding-left','30px');
                                        $(this).siblings('dl').children('dd').children('a').click(function(){
                                            console.log(1233);
                                            if($(this).hasClass('on')){
                                                $(this).removeClass('on');
                                                $(this).parent().next('.areas_list_two').css('height','0');
                                                //隐藏下一级目录
                                                $(this).siblings('dl').hide();
                                            }else{
                                                $(this).addClass('on');
                                                $(this).parent().next('.areas_list_two').css('height','auto');
                                            }
                                        });
                                    }else{
                                        //console.log($(this).parent().next('.areas_list_two').html());
                                        
                                        $(this).parent().next('.areas_list_two').css('height','auto');
                                    }
                                }
                            });
                        }else{
                            //console.log($(this).parent().next('.areas_list_two').html());
                            
                            $(this).parent().next('.areas_list_two').css('height','auto');
                        }
                    }
                    
                   
                    
                });
        }else{
            $(this).parent().next('.areas_list_two').css('height','auto');
        }
        
    }
    
});
//显示弹窗效果
function show_lay(id) {
    // alert(id);
    $('.detail_layer').show();
    $('.detail_layer').attr('id','y'+id);
    $('.fade_layer').fadeIn();
    
}
//插入元素
    $('.detail_layer').find('.areas_list_two li').click(function(){
        //对勾切换效果
        if(!$(this).find('span').hasClass('hover')){
            $(this).find('span').addClass('hover');
        }else{
            $(this).find('span').removeClass('hover');
        }
        //获取选中元素html
        var val_prev = $(this).find('span').attr('id');
        $message_peo = $(this).html();
        
        //获取添加后的数组
        var attrid =$(this).parents('.select_peo_con').find('.right ul.send_to li').map(function(){
            return $(this).find('span').attr('id');
        });
        //判断数字是否存在数组里
        if( jQuery.inArray(val_prev, attrid) ==-1){
            $(this).parents('.select_peo_con').find('.right ul.send_to').append("<li>"+$message_peo +"</li>");
        }else{
            // alert('已存在列表中');
            while ($(this).parents('.select_peo_con').find('.right ul.send_to').find("#" + val_prev).length > 0)  
            {  
               $(this).parents('.select_peo_con').find('.right ul.send_to').find("#" + val_prev).parent().remove();  
            }  
        }
    
    });

//选择人员插入当前点击的input里面
function do_add(elm){
        var id = $(elm).parents('div.detail_layer').attr('id');
        var temp='';
        var nruid='' ;
        var temp1='';
        var eid='' ;
        $(elm).parents('#'+id).find('ul.send_to li').each(function(i,e){
            text = $(e).find('span');
            for (var i = 0; i < text.length; i++) {
                var val=$(text[i]).html();
                if(val!=''){
                    temp+=val+',';
                }
                var id = $(text[i]).attr('id');
                if(id!=''){
                    nruid+=id+',' ;
                }
            };
        });

        var temps=temp.substring(0,temp.length-1);
        $('#area_btn_'+id).val(temps);
        $('#nruid_'+id).val(nruid) ;
        $('#eid').val(eid) ;
        $(elm).parents('.detail_layer').fadeOut();
        //清空选择人员
        $('.detail_layer .right ul li').remove();
        $(elm).parents('.select_peo_con').find('ul.areas_list_two').css('height','0');
        $(elm).parents('.select_peo_con').find('.areas_list_one').removeClass('on');
        $(elm).parents('.select_peo_con').find('.areas_list_two li span').removeClass('hover');
        $('.fade_layer').fadeOut();
};    
//取消按钮关闭事件
$('a.close_btn').click(function(){
    $(this).parents('.detail_layer').fadeOut();
        //清空选择人员
        $('.detail_layer .right ul li').remove();
        $(this).parents('.select_peo_con').find('ul.areas_list_two').css('height','0');
        $(this).parents('.select_peo_con').find('.areas_list_one').removeClass('on');
        $(this).parents('.select_peo_con').find('.areas_list_two li span').removeClass('hover');
        $('.fade_layer').fadeOut();
});

</script>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc'); //论文介绍编辑器
var basePath = "<%=basePath%>";
	//提交添加论文信息
	function ajaxThesisAdd() { 
		//提交之前先验证表单
		$("#thesisAddForm").data('bootstrapValidator').validate();
		if(!$("#thesisAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		if(thesis_thesisDesc_editor.getContent() == "") {
			alert('论文介绍不能为空');
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Thesis/userAdd",
			dataType : "json" , 
			data: new FormData($("#thesisAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#thesisAddForm").find("input").val("");
					$("#thesisAddForm").find("textarea").val("");
					thesis_thesisDesc_editor.setContent("");
				} else {
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
	//验证论文添加表单字段
	$('#thesisAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"thesis.xkml": {
				validators: {
					notEmpty: {
						message: "学科门类不能为空",
					}
				}
			},
			"thesis.name": {
				validators: {
					notEmpty: {
						message: "论文名称不能为空",
					}
				}
			},
			"thesis.author": {
				validators: {
					notEmpty: {
						message: "作者不能为空",
					}
				}
			},
			"thesis.teacher": {
				validators: {
					notEmpty: {
						message: "指导老师不能为空",
					}
				}
			},
			"thesis.publishDate": {
				validators: {
					notEmpty: {
						message: "发布日期不能为空",
					}
				}
			},
		}
	}); 
	//初始化提交用户下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#thesis_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
    		});
    		$("#thesis_userObj_user_name").html(html);
    	}
	});
	//发布日期组件
	$('#thesis_publishDateDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd',
		minView: 2,
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#thesisAddForm').data('bootstrapValidator').updateStatus('thesis.publishDate', 'NOT_VALIDATED',null).validateField('thesis.publishDate');
	});
})
function yeji(){
		var num=$("#ye").val();
		var yeji_name=$("#thesis_name").val();
		
		var list=new Array();
		var str=$("#area_btn_y2").val();
		list=str.split(",");
		list.push($("#thesis_author").val())
		var a='';
		
		var listyeji=new Array();
        for(var i = 0;i<list.length;i++){  //循环LIST
            var yeji={"user_name":"username","yeji_name":"yejiname","yeji_num":"yejinum","status":0}
        	j='<div class="layui-form-item">'
            +'<label class="layui-form-label">'+list[i]+'的业绩点</label>'
            +'<div class="layui-input-block">'
              +'<input name="info.ponit" lay-verify="title" autocomplete="off"   class="layui-input" type="text">'
            +'</div></div>';
            yeji.user_name=list[i];
      	    yeji.yeji_name=yeji_name;
      	    yeji.status=0;
      	    listyeji.push(yeji);
            a=a+j;
        }
		
       layer.open({
    	      type: 1,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['500px', '600px'], //宽高
			  btn: ['确定', '取消'],
			  title: false,
			  area: '300px;',
			  id: 'LAY_layuipro',
			  moveType: 1 ,
			  shade: 0.8,
			  btnAlign: 'c',
		      content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请分配业绩点:'+num+'<br>'+a+'</div>',
			  success: function(layero){
		          var btn = layero.find('.layui-layer-btn');
		          btn.find('.layui-layer-btn0').click(function(){
		        	  var listnum= [];
		        	  jQuery('.layui-input').each(function(key,value){ 
		        		  listnum[key] = $(this).val();
		        	  });
		        	  var a=0;
		        	  for(var i = 0;i<listyeji.length;i++){
		            	listyeji[i].yeji_num=listnum[i];
		            	a=a+ parseInt(listnum[i]);
		            	
		        	 }
		        	 if(a>num){
		        		 layer.msg("分配业绩不能大于总业绩");
		        		 return false
		        	 }
		        	 $.ajax({ 
		        		 url: "<%=basePath %>Project/yeji",
		        		 type:"post",
		        		 data:JSON.stringify({"data":listyeji}),
		        	     dataType:"json",
		        	     contentType : "application/json",
		                 success: function(result){
		        	    	 if(result.success){
		        	    		 layer.msg('业绩分配成功');
		        	    	 }
		        	     }
		        		    			
		        	 })                    //传值给后台
		        	 })
		    
		        	  
		        }
		        })
			
		
	}
</script>
</body>
</html>

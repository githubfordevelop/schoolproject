<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            	<a href="http://www.baidu.com" target=_blank>开发人员：李世鑫 郝子健 王雅</a> | 
				<a href="http://www.baidu.com">教师端：李世鑫</a> | 
				<a href="http://www.baidu.com">系部管理：王雅</a> | 
				<a href="http://www.baidu.com">管理员：郝子健</a> | 
				<a href="http://www.baidu.com" target=_blank>李世鑫制作</a> | 
				<a href="<%=basePath%>login.jsp">后台登录</a>
            </div>
        </div>
    </div>
</footer>
<!--footer--> 

 


 
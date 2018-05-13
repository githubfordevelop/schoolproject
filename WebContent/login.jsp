<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>信息管理系统_用户登录</title>

<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>


<div id="login">
	<p>登录帐号：<input type="text"  id="manager" class="textbox"></p>
	<p>登录密码：<input type="password" id="password" class="textbox"></p>
	<p>&nbsp;  &nbsp;身份：
		<select name="identify" id="identify">
			<option value="manager">系部管理员</option> 
			<option value="admin">系统管理员</option>
		</select>
	</p>
	
	 
</div>

<div id="btn">
	<a href="#" class="easyui-linkbutton">登录</a>
</div>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js" ></script>
<script type="text/javascript" src="easyui/jquery.cookie.js"></script>
<script type="text/javascript" src="js/login.js"></script>

</body>
</html>
</html>

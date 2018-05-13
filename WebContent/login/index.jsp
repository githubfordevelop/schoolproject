








    
    
    
        







<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="width=device-width,initial-scale=0.8, minimum-scale=0.8, maximum-scale=3"
          name="viewport"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta property="qc:admins" content="754034015366713545637571540352652"/>
    <meta property="wb:webmaster" content="1ad39047f32b5b6b"/>
    <title>统一身份认证</title>
</head>
<script>
    

</script>


<link href="login.css" tppabs="http://authserver.zut.edu.cn/authserver/custom/css/login.css" rel="stylesheet">
<link href="custom-1.css" tppabs="http://authserver.zut.edu.cn/authserver/custom/css/iCheck/custom.css" rel="stylesheet">




<body onload="loadFresh();">
<div class="auth_bg">
    <img src="login-bg-autumn.jpg" tppabs="http://authserver.zut.edu.cn/authserver/custom/images/login-bg-autumn.jpg" alt="">
</div>
<div class="auth-language">Language:
    <div class="auth-language-select">
        <select id="language" onchange="changeLanguage()">
            <option value="zh_CN">简体中文</option>
            <option value="en">English</option>
        </select>
    </div>
</div>
<div class="auth_page_wrapper">
<div class="auth_logo">
    <img src="login-logo.png" tppabs="http://authserver.zut.edu.cn/authserver/custom/images/login-logo.png" alt="logo"/>
</div>
<div class="auth_login_content">
    <div class="auth_login_left">
        <div class="auth_others">
            
        </div>
    </div>
    
        
        
            
        
        
    
    <div class="auth_login_right">
        <div class="auth_tab">
            <div class="auth_tab_links">
                <ul>
                    <li id="accountLogin" style="width:100%;" class="selected" tabid="01"><span>账号登录</span></li>
                    

                </ul>
            </div>
            <div class="clearfloat"></div>
            <div class="auth_tab_content">
                <div tabid="01" class="auth_tab_content_item">
                    <form id="casLoginForm" class="fm-v clearfix amp-login-form" role="form" action="http://authserver.zut.edu.cn/authserver/login" method="post">
                        

                        <p>
                            <i class="auth_icon auth_icon_user"></i>
                            <input id="username" name="username" placeholder="用户名" class="auth_input" type="text" value=""/>
                            <span id="usernameError" style="display:none;" class="auth_error">请输入用户名</span>
                        </p>

                        <p>
                            <i class="auth_icon auth_icon_pwd"></i>
                            <input id="password" name="password" placeholder="密码" class="auth_input" type="password" value="" autocomplete="off"/>
                            <span id="passwordError" style="display:none;" class="auth_error">请输入密码</span>
                        </p>

                        <p id="cpatchaDiv">

                        </p>

                        
                            <p>
                                <input type="checkbox" name="rememberMe" id="rememberMe"/> <label
                                    onmousedown="javascript:$('.iCheck-helper').click();">一周内免登录</label>
                            </p>
                        

                        <p>
                            <button type="submit" class="auth_login_btn primary full_width">登录
                            </button>
                        </p>
                        <a id="getBackPasswordMainPage" href="getBackPasswordMainPage.do.htm" tppabs="http://authserver.zut.edu.cn/authserver/getBackPasswordMainPage.do" class="auth_login_forgetp">
                            <small>忘记密码？</small>
                        </a>

                        <input type="hidden" name="lt" value="LT-19889-w2fQS5d2yBPDkZihsSPYpBcbBOy0sy1525948625558-waFE-cas"/>
                        <input type="hidden" name="dllt" value="userNamePasswordLogin"/>
                        <input type="hidden" name="execution" value="e2s1"/>
                        <input type="hidden" name="_eventId" value="submit"/>
                        <input type="hidden" name="rmShown" value="1">
                    </form>
                </div>
                
                
                
            </div>
        </div>
    </div>
</div>

<div id="hidenCaptchaDiv" style="display: none;">
    <i class="auth_icon auth_icon_bar"></i>
    <input type="text" placeholder="验证码" id="captchaResponse" name="captchaResponse"
           class="auth_input captcha-input"/>
    <img id="captchaImg" class="captcha-img"  alt="验证码" title="验证码"/>
            <span style="cursor: pointer;color: #1dadff;margin-left: 2px;" id="changeCaptcha"
                  class="chk_text"></span>
    <span id="cpatchaError" style="display:none;" class="auth_error">请输入验证码</span>
</div>


<div class="clearfloat"></div>
<div class="auth_login_footer">
    

 <span>
     Copyright&nbsp;©&nbsp;2017 ZUT &nbsp;All&nbsp;Rights&nbsp;Reserved&nbsp;&nbsp;&nbsp;&nbsp;
       <!-- &nbsp;&nbsp;江苏金智教育信息股份有限公司   -->
  </span>

</div>
</div>

<script type="text/javascript" src="jquery.min-1.js" tppabs="http://authserver.zut.edu.cn/authserver/custom/js/jquery.min.js"></script>
<script type="text/javascript" src="login-language.js" tppabs="http://authserver.zut.edu.cn/authserver/custom/js/login-language.js"></script>
<script type="text/javascript" src="icheck.min.js" tppabs="http://authserver.zut.edu.cn/authserver/custom/js/icheck.min.js"></script>

<script type="text/javascript" src="login.js" tppabs="http://authserver.zut.edu.cn/authserver/custom/js/login.js"></script>
<script type="text/javascript" src="login-wisedu.js" tppabs="http://authserver.zut.edu.cn/authserver/custom/js/login-wisedu.js"></script>

<script type="text/javascript">

    // 选中tab框
    var dllt = '';
    if (dllt != '' && dllt == 'dynamicLogin') {
        selectLi($("#dyLogin"));
    } else {
        selectLi($("#accountLogin"));
    }

    $(document).ready(function () {
        $("#captchaImg").attr("src","captcha.html?ts=" + new Date().getMilliseconds());
        

        var service = GetQueryString("service");
        if (service) {
            $("#getBackPasswordMainPage").attr("href", "getBackPasswordMainPage.do?service=" + encodeURIComponent(service));
        }
    });


</script>
</body>

</html>
    


<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>教师管理-戴氏教育教师签课时系统</title>
    <%@include file="/include/head.jsp" %>

    <!--[if gte IE 9]>
      <style type="text/css">
        .gradient,.gradient:hover{
           filter: none;
        }
      </style>
    <![endif]-->
</head>

<body>
<header>
    <div id="header-wrap">
        <div id="header">
            <h1>戴氏教育教师签课时系统v1.0</h1>
        </div>
    </div>
</header>
<main id="main-wrap">
    <div id="container" class="clearfix">
        <div id="login-wrap">
            <div id="login-switch" class="clearfix">
                <a href="#" class="active">教师登录</a><a href="#">教务登录</a>
            </div>
            <div id="loginform">
                <div id="login-teacher" class="login-form">
                    <form name="teacher" method="post" action="/t/login.do">
                        <div class="login-user">
                            <input type="text" name="loginname" id="username" placeholder="输入用户名" autocomplete="off">
                        </div>
                        <div class="login-password">
                            <input type="password" name="pwd" id="userpwd" placeholder="输入6位数字的密码">
                        </div>
                        <div class="error-tips"><span class="error-message hide">用户名或者密码不正确</span></div>
                        <div class="login-submit">
                            <input type="submit" name="btn-login" id="btn-login" value="立即登录" class="gradient">
                        </div>
                    </form>
                </div>
                <div id="login-admin" class="login-form hide">
                    <form name="admin" method="post" action="/m/login.do">
                        <div class="login-user">
                            <input type="text" name="loginname" id="adminname" placeholder="输入管理员账号" autocomplete="off">
                        </div>
                        <div class="login-password">
                            <input type="password" name="pwd" id="adminpwd" placeholder="输入6位数字的密码">
                        </div>
                        <div class="error-tips"><span class="error-message hide">用户名或者密码不正确</span></div>
                        <div class="login-submit">
                            <input type="submit" name="btn-admin-login" id="btn-admin-login" value="立即登录"
                                   class="gradient">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/include/footer.jsp" %>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!doctype html>
<html>
<%@include file="/include/head.jsp" %>

<!--包括IE9以及IE9以下的-->
<!--[if lte IE 9]>
  <style>
  	.select-wrap:after{
    	display:none;}
    .keshi-form select{
    padding-right:1px;}
  </style>
<![endif]-->

</head>

<body>
<%@include file="/include/header.jsp" %>
<main id="main-wrap">
    <div id="container" class="clearfix neiye">
        <div id="admin-wrap" class="fl">
            <div class="adminschool-title">
                <nav>
                    <ul class="clearfix">
                        <li><a href="adminSchool.jsp">课程管理</a></li>
                        <li><a href="adminClass.jsp">班级管理</a></li>
                        <li><a href="adminRoom.jsp">教室管理</a></li>
                        <li><a href="adminTime.jsp">时间管理</a></li>
                        <li><a href="adminXishu.jsp" class="active">系数管理</a></li>
                    </ul>
                </nav>
            </div>
            <div class="adminschool-wrap">
                <p>该功能暂时未开放</p>

            </div>


        </div>
        <%@include file="/include/adminRight.jsp" %>
    </div>
</main>
<%@include file="/include/footer.jsp" %>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>戴氏教育教师签课时系统v1.0</title>
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
            <div id="admin-teacher-head" class="clearfix">
                <div class="fr">
                    <span class="buttons" id="addTeacher">添加新老师</span>
                    <span class="buttons" id="viewAll"><a href="/admin/selectAllTeacher.do">查看全部老师</a></span>
                </div>
                <!--添加新老师-->
                <div class="change-wrap record-bg hide">
                    <div class="addteacher-wrap  changeRecord">
                        <h3>添加新老师</h3>
                        <form name="addTeacher" method="post" action="/admin/addTeacher.do">
                            <div class="teacher">
                                <input type="text" name="loginname" placeholder="姓名" id="newTeacher" autocomplete="off">
                            </div>
                            <div class="error-tips"><span class="error-message hide" id="newTeacher-name"></span></div>
                            <div class="teacher">
                                <input type="password" name="pwd1" placeholder="输入新密码，6到12个字符或数字" id="newTeacherPwd1">
                            </div>
                            <div class="error-tips"><span class="error-message hide" id="newteacherpwd-message1">密码必须是6到12个字符或数字</span>
                            </div>

                            <div class="teacher">
                                <input type="password" name="pwd" placeholder="确认新密码保持一致" id="newTeacherPwd2">
                            </div>
                            <div class="error-tips"><span class="error-message hide" id="newteacherpwd-message2">两个新密码不一致</span>
                            </div>
                            <div class="teacher">
                                <input type="submit" value="点击确认添加" class="btn-submit off" id="btn-teacherSubmit">
                            </div>
                        </form>

                    </div>
                </div>
                <div id="searchTeacher" class="fr">
                    <form name="searchTeacher" method="post" action="/admin/selectTeacher.do">
                        <input type="text" placeholder="输入教师名字" id="teachername" name="loginname">
                        <button type="submit" id="btn-teacher"><i class="iconfont icon-search"></i></button>
                    </form>
                </div>

            </div>
            <div id="teacher-list">
                <div class="group">
                    <ul class="clearfix">
                        <c:forEach var="teacher" items="${list}" varStatus="st">


                            <li>
                                <div class="touxiang"><a
                                        href="${pageContext.request.contextPath}/page/adminRecordList.jsp?tId=${teacher.id}&tname=${teacher.loginname}"><img
                                        src="${pageContext.request.contextPath}${teacher.url}"></a></div>
                                <div class="teachername"><a href="#">${teacher.loginname}<span
                                        class="hide">隐藏</span></a></div>
                            </li>


                        </c:forEach>
                    </ul>
                </div>
                <!--  <div class="group">
                	<h3>UI组</h3>
                	<ul class="clearfix">
                    	<li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/1.jpg"></a></div>
                        	<div class="teachername"><a href="#">赵岚稹 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/2.jpg"></a></div>
                        	<div class="teachername"><a href="#">何艳 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/3.jpg"></a></div>
                        	<div class="teachername"><a href="#">汪帆 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/4.jpg"></a></div>
                        	<div class="teachername"><a href="#">刘勇 <span class="hide">隐藏</span></a></div>
                        </li>
                    </ul>
                </div>
            	<div class="group">
                	<h3>Java组</h3>
                	<ul class="clearfix">
                    	<li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/1.jpg"></a></div>
                        	<div class="teachername"><a href="#">赵岚稹 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/2.jpg"></a></div>
                        	<div class="teachername"><a href="#">何艳 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/3.jpg"></a></div>
                        	<div class="teachername"><a href="#">汪帆 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/4.jpg"></a></div>
                        	<div class="teachername"><a href="#">刘勇 <span class="hide">隐藏</span></a></div>
                        </li>
                    </ul>
                </div>
                <div class="group">
                	<h3>大数据组</h3>
                	<ul class="clearfix">
                    	<li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/1.jpg"></a></div>
                        	<div class="teachername"><a href="#">赵岚稹 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/2.jpg"></a></div>
                        	<div class="teachername"><a href="#">何艳 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/3.jpg"></a></div>
                        	<div class="teachername"><a href="#">汪帆 <span class="hide">隐藏</span></a></div>
                        </li>
                    </ul>
                </div>
                <div class="group">
                	<h3>python组</h3>
                	<ul class="clearfix">
                    	<li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/1.jpg"></a></div>
                        	<div class="teachername"><a href="#">赵岚稹 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/2.jpg"></a></div>
                        	<div class="teachername"><a href="#">何艳 <span class="hide">隐藏</span></a></div>
                        </li>
                        
                        
                    </ul>
                </div>
                <div class="group">
                	<h3>其他组</h3>
                	<ul class="clearfix">
                    	<li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/1.jpg"></a></div>
                        	<div class="teachername"><a href="#">赵岚稹 <span class="hide">隐藏</span></a></div>
                        </li>
                        <li>
                        	<div class="touxiang"><a href="adminRecordList.jsp"><img src="${pageContext.request.contextPath}/page/images/touxiang/2.jpg"></a></div>
                        	<div class="teachername"><a href="#">何艳 <span class="hide">隐藏</span></a></div>
                        </li>
                        
                        
                    </ul>
                </div>-->
            </div>
        </div>

        <%@include file="/include/adminRight.jsp" %>

    </div>
</main>
<%@include file="/include/footer.jsp" %>
</body>
<script type="text/javascript">

    /*function addOneTeacher(){
        var a = $("#newTeacher").val();
        alert(a);
        var b = $("#newTeacherPwd1").val();
        alert(b);
        $.post("/teacher/addTeacher.do", { loginname: a,pwd:b }, function(rs){

            alert("添加成功");
            selectTeacher();
        });
    }
    function selectTeacher(){
        //var a = $("#teachername").val();
        $.post("/teacher/selectTeacher.do",  function(rs){
                var tb="";
                for (var int = 0; int < rs.length; int++){
                if(int%4==0){
                         tb+="<div class='group'>";
                         tb+="<ul class='clearfix'>";
                    }
                    tb+="<li>";
                    tb+="<div class='touxiang'><a href='adminRecordList.jsp'><img src='${pageContext.request.contextPath}"+rs[int].url+"'></a></div>";
				tb+="<div class='teachername'><a href='#'>"+rs[int].loginname+" <span class='hide'>隐藏</span></a></div>";
				tb+="</li>";
				if(int%4==3){
					tb+="</ul>";
				 	tb+="</div>";
			 	}
			}
	
			 var table=document.getElementById("teacher-list");
			 table.innerHTML=tb;
	});
}

*/


</script>
</html>

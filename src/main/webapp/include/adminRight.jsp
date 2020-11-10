<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<aside class="fr">
    <div id="slidebar" class="fr">
        <div id="teacher-info">
            <div id="touxiang">
                <a href="#"><img src="${pageContext.request.contextPath}${m.url}" alt="管理员头像"></a></div>
            <h1 class="center">${pageContext.request.contextPath}${m.nicename}</h1>
        </div>
        <nav id="teacher-menu">
            <div id="menulist">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/selectAllTeacher.do">教师信息管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/page/adminSchool.jsp" class="active">教务教学管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/page/keshiCount.jsp">课时统计管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/page/adminInfo.jsp">管理员管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/page/admindata.jsp">数据备份/恢复</a></li>
                    <li><a href="#" onclick="mExit()" name=mExit>退出管理系统</a></li>
                </ul>
            </div>
        </nav>
    </div>
</aside>
</body>
<script type="text/javascript">
    function mExit() {
        $("a[name='mExit']").attr({href: "#"});
        if (confirm("确认要退出吗？")) {
            //alert("选择的是 确定！")
            $("a[name='mExit']").attr({href: "${pageContext.request.contextPath}/m/exit.do"});
        } else {
            //alert("flase")
        }
        return false;
    }
</script>
</html>
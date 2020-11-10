<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<%@include file="/include/head.jsp" %>
<body>
<%@include file="/include/header.jsp" %>
<main id="main-wrap">
    <div id="container" class="clearfix neiye">
        <div id="admin-wrap" class="fl">
            <div class="adminschool-title">
                <nav>
                    <ul class="clearfix">
                        <li><a href="${pageContext.request.contextPath}/page/adminSchool.jsp" class="active">课程管理</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/page/adminClass.jsp">班级管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminRoom.jsp">教室管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminTime.jsp">时间管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminXishu.jsp">系数管理</a></li>
                    </ul>
                </nav>
            </div>
            <div class="adminschool-wrap">
                <div class="add">
                    <form action="${pageContext.request.contextPath}/course/addCourse.do" method="post">
                        <input type="text" placeholder="输入新的课程名称" name="tname">
                        <input type="submit" class="btn-add" value="添加新课程">
                    </form>
                </div>
                <form name="adminCourse">
                    <table width="720" border="0" cellspacing="0" cellpadding="0">


                    </table>

                </form>
            </div>
            <div class="pagebar center">
                <a href="javascript:checktype(1);" class="current">1</a>
                <a href="javascript:checktype(2);">2</a>
                <a href="javascript:checktype(3);">3</a>
                <a href="javascript:checktype(4);">4</a>
            </div>
            <!--修改课程-->
            <div class="changeAllWrap hide">
                <div class="changeWrap">

                    <form name="changeCourse" action="${pageContext.request.contextPath}/course/updateCourse.do"
                          method="post">
                        <input type="hidden" name="id"/>
                        <input type="text" name="tname"/>
                        <input type="submit" value="确定修改" class="btn-submit" id="btn-submitCourse">

                    </form>
                    <i class="iconfont icon-close"></i>
                </div>
            </div>
        </div>
        <%@include file="/include/adminRight.jsp" %>
    </div>
</main>
<%@include file="/include/footer.jsp" %>
<script>
    //页面加载完成后立即执行

    $(function () {
        checktype(1);
        //修改课程
        $('.change').click(function () {
            var $content1 = $(this).parent().prev().prev().text();
            var $content2 = $(this).parent().prev().text();
            changePanel($content1, $content2);
        });
    });

    function checktype(typeId) {

        var url = "${pageContext.request.contextPath}/course/selectCourseAll.do";
        var $table = $("table");
        var data = {n: typeId, m: 10};
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            cache: false,
            async: false,
            dataType: "json",
            success: function (msg) {
                var t = "";
                t = t + '<tr><th scope="col">ID</th>';
                t = t + '<th scope="col">课程名称</th>';
                t = t + '<th scope="col">操作</th>';
                t = t + "</tr>";

                $table.empty();
                $(msg).each(function (k, v) {

                    t = t + "<tr>";
                    t = t + "<td>" + v.id + "</td><td>" + v.tname + "</td><td>";
                    t = t + "<a href='javascript:updateSchool(" + v.id + ",\"" + v.tname + "\")' class='change' >修改</a>&nbsp;";
                    t = t + "<a href='/course/deleteCourse.do?tname=" + v.tname + "'  onclick='javascript:return del();' class='del'>删除</a></td>";
                    t = t + "</tr>";

                })
                $table.append($(t));
            }
        });

    }

    //修改班级
    function updateSchool($content1, $content2) {
        changePanel($content1, $content2);
    }

    //删除课程
    function del() {
        if (confirm("确定本删除课程？")) {
            return true;
        } else {
            return false;
        }
    }

</script>
</body>
</html>

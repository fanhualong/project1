<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>教师管理-戴氏教育教师签课时系统</title>
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
                        <li><a href="${pageContext.request.contextPath}/page/adminSchool.jsp">课程管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminClass.jsp">班级管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminRoom.jsp" class="active">教室管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminTime.jsp">时间管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminXishu.jsp">系数管理</a></li>
                    </ul>
                </nav>
            </div>
            <div class="adminschool-wrap">
                <div class="add">
                    <form name="add" action="${pageContext.request.contextPath}/course/adminRoom.do" method="post">
                        <input type="text" placeholder="输入新的教室名称" name="roomname">
                        <input type="submit" class="btn-add" value="添加新教室">
                    </form>
                </div>
                <form name="adminClass">
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
            <!--修改教室-->
            <div class="changeAllWrap hide">
                <div class="changeWrap">

                    <form name="changeClass" action="${pageContext.request.contextPath}/course/updateRoom.do"
                          method="post">
                        <input type="hidden" name="id">
                        <input type="text" name="roomname">
                        <input type="submit" value="确定修改" class="btn-submit" id="btn-submitClass">

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

    $(function () {
        checktype(1);
        //修改班级
        $('.change').click(function () {
            var $content1 = $(this).parent().prev().prev().text();
            var $content2 = $(this).parent().prev().text();
            changePanel($content1, $content2);
        })
    })


    function checktype(typeId) {
        var url = "${pageContext.request.contextPath}/course/selectRoom.do"
        var $table = $("table");
        var data = {n: typeId, m: 10};
        $.ajax({
            type: "POST",
            url: url,
            cache: false,
            async: false,
            data: data,
            dataType: "json",
            success: function (msg) {
                var t = "";
                t = t + '<tr><th scope="col">ID</th>';
                t = t + '<th scope="col">教室名称</th>';
                t = t + '<th scope="col">操作</th>';
                t = t + "</tr>";

                $table.empty();
                //得到前json数组，开始遍历排版

                $(msg).each(function (k, v) {


                    t = t + "<tr>";
                    t = t + "<td>" + v.id + "</td><td>" + v.roomname + "</td><td>";
                    t = t + "<a href='javascript:updateRoom(" + v.id + ",\"" + v.roomname + "\")' class='change' >修改</a>&nbsp;";
                    t = t + "<a href='/course/deleteRoom.do?roomname=" + v.roomname + "'  onclick='javascript:return del();' class='del'>删除</a></td>";
                    t = t + "</tr>";

                })
                $table.append($(t));


            }
        });


    }

    //修改
    function updateRoom($content1, $content2) {

        changePanel($content1, $content2);
    }

    //删除班级

    function del() {
        if (confirm("确定删除该班级吗？")) {
            return true;
        } else {
            return false;
        }
    }


</script>
</body>
</html>

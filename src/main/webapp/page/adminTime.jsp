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
                        <li><a href="${pageContext.request.contextPath}/page/adminSchool.jsp">课程管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminClass.jsp">班级管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminRoom.jsp">教室管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminTime.jsp" class="active">时间管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/page/adminXishu.jsp">系数管理</a></li>
                    </ul>
                </nav>
            </div>
            <div class="adminschool-wrap">
                <div class="add">
                    <form name="add" action="/course/addTimeModel.do" method="post">
                        <input type="text" placeholder="添加时间，比如08:45" name="createtime">
                        <input type="submit" class="btn-add" value="添加新时间">
                    </form>
                </div>
                <form name="adminClass" action="" method="post">
                    <table width="720" border="0" cellspacing="0" cellpadding="0">

                    </table>

                </form>
            </div>
            <div class="pagebar center">
                <a href="javascript:checktype(1)" class="current">1</a>
                <a href="javascript:checktype(2)">2</a>
                <a href="javascript:checktype(3)">3</a>
                <a href="javascript:checktype(4)">4</a>

            </div>
            <!--修改时间-->
            <div class="changeAllWrap hide">
                <div class="changeWrap">

                    <form name="changeClass" action="${pageContext.request.contextPath}/course/updateTime.do"
                          method="post">
                        <input type="hidden" name="id">
                        <input type="text" name="createtime">
                        <input type="submit" value="确定修改" class="btn-submit" id="btn-submitClass">

                    </form>
                    <i class="iconfont icon-close"></i>
                </div>
            </div>

        </div>
        <%@include file="/include/adminRight.jsp" %>
    </div>
</main>
<footer id="footer-wrap">
    <div id="footer">
        <p>课时系统兼容IE9+、谷歌、火狐等现代浏览器，浏览器版本过低会影响用户体验</p>
        <p>Copyright @2018成都华信智原有限公司版权所有</p>
        <p>课时系统兼容IE8+，以及谷歌、火狐等现代浏览器</p>
        <p>设计+前端开发：赵岚稹
        </p>
        <p>后端开发：汪武斌</p>
    </div>
</footer>
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
        var url = "${pageContext.request.contextPath}/course/selectTimeAll.do";
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
                t = t + '<th scope="col">时间</th>';
                t = t + '<th scope="col">操作</th>';
                t = t + "</tr>";

                $table.empty();
                //得到前json数组，开始遍历排版

                $(msg).each(function (k, v) {

                    t = t + "<tr>";
                    t = t + "<td>" + v.id + "</td><td>" + v.createtime + "</td><td>";
                    t = t + "<a href='javascript:updateTime(" + v.id + ",\"" + v.createtime + "\")' class='change' >修改</a>&nbsp;";
                    t = t + "<a href='/course/deleteTime.do?createtime=" + v.createtime + "' onclick='javascript:return del(); class='del'>删除</a></td>";
                    t = t + "</tr>";


                })
                $table.append($(t));


            }
        });


    }


    //修改
    function updateTime($content1, $content2) {

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

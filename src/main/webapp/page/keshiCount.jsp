<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>课时统计-华信智原教师签课时系统</title>
    <link rel="stylesheet" type="text/css" href="/page/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="/page/css/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/page/css/base.css">
    <link rel="stylesheet" type="text/css" href="/page/css/style.css">
    <link rel="stylesheet" type="text/css" href="/page/js/kalendae/kalendae.css">
    <link rel="stylesheet" type="text/css" href="/page/css/newkalendae.css">
    <script type="text/javascript" src="/page/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/page/js/kalendae/kalendae.standalone.js"></script>
    <script type="text/javascript" src="/page/js/keshi.js"></script>

    <!--包括IE9以及IE9以下的-->
    <!--[if lte IE 9]>
      <style>
          .select-wrap:after{
            display:none;}
        .recordSelect-form select{
        padding:6px 6px 6px 10px;}
         .keshi-form select{
        padding-right:1px;}
      </style>
    <![endif]-->

</head>

<body>
<%@include file="/include/header.jsp" %>
<main id="main-wrap">
    <div id="container" class="clearfix neiye">
        <div id="recordList-wrap" class="fl">
            <div id="recordList">
                <div class="pass-wrap record-wrap">
                    <div class="recordSelect clearfix">
                        <div class="recordSelect-form fr">
                            <form name="selectPage" method="post" action="">
                                <ul class="clearfix">
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectMonth" onchange="selByDate(1)">
                                                <script>
                                                    var date = new Date;
                                                    var month = date.getMonth() + 1;
                                                    for (var i = 1; i <= 12; i++) {
                                                        if (month == i) {
                                                            document.write('<option  value="' + (i < 10 ? '0' + i : i) + '" selected ="selected">' + (i < 10 ? '0' + i : i) + '</option>');
                                                        } else {
                                                            document.write(' <option value="' + (i < 10 ? '0' + i : i) + '">' + (i < 10 ? '0' + i : i) + '</option>');
                                                        }
                                                    }
                                                </script>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectYear">
                                                <script>
                                                    var myDate = new Date();
                                                    var year = myDate.getFullYear();
                                                    for (var i = year; i >= 2015; i--) {
                                                        document.write(' <option value="' + i + '">' + i + '</option>')
                                                    }
                                                </script>
                                            </select>
                                        </div>
                                    </li>
                                </ul>
                            </form>
                        </div>
                        <div class="fl recordCount">
                            本绩效计算运行时将占用大量系统资源，建议在系统空闲时间使用本功能。
                        </div>
                    </div>
                    <div class="recordList-table checkList countKeshi">
                        <table width="840" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">姓名</th>
                                <th scope="col">总课时数</th>
                                <th scope="col">授课</th>
                                <th scope="col">值班</th>
                                <th scope="col">操作</th>
                            </tr>
                        </table>
                        <div class="pagebar center" id="pageNum">
                        </div>
                    </div>
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
        selByDate(1);

    })

    function selByDate(p) {
        var y = $("select[name='selectYear']").find("option:selected").attr("value");
        var m = $("select[name='selectMonth']").find("option:selected").attr("value");
        $.ajax({
            type: "post",
            url: "/keshi/getSimpleTable.do",
            data: {year: y, month: m, page: p},
            dataType: "json",
            success: function (data) {
                $('table tr:not(:first)').empty();
                $("#pageNum").empty();
                for (var i = 0; i < data[0].length; i++) {
                    $('table').append('<tr><td>' + data[0][i].tId + '</td><td>' + data[0][i].tName
                        + '</td><td>' + data[0][i].allHour + '</td><td>' + data[0][i].doneHour + '</td><td>'
                        + data[0][i].onDuty + '</td><td><a href="#" onclick="openDetail(' + data[0][i].tId + ',\'' + data[0][i].tName + '\')">查看课时详情</a></td></tr>')
                }
                var pages = data[1];
                for (var i = 0; i < pages; i++) {
                    $("#pageNum").append('<a class="current" onclick="selByDate(' + (i + 1) + ')">' + (i + 1) + '</a>');
                }
            },
        });
    }

    function openDetail(tId, tname) {
        var url = "adminRecordList.jsp?tId=" + tId + "&tname=" + tname + "&m="
            + parseInt($("select[name='selectMonth']").find("option:selected").attr("value")) + "&y="
            + parseInt($("select[name='selectYear']").find("option:selected").attr("value"));
        window.location.href = url;
    }
</script>
</body>
</html>

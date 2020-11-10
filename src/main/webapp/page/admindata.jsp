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
        <div id="teacherInfo-wrap" class="fl">
            <div class="admindata-wrap">
                <a href="javascript:;">数据备份</a>
                <a href="javascript:;">数据恢复</a>
            </div>
            <div class="admindata-info">
                <p>1、请定期执行备份操作，保证数据不受到意外损坏。</p>

                <p>2、执行备份的过程中将占用大量系统资源，有可能导致本系统的其它功能暂时失效。建议在系统空间时间执行备份操作。</p>

                <p>3、慎用恢复数据功能，恢复后本系统的全部数据将回到上一次备份时候的状态。</p>
            </div>
        </div>
        <%@include file="/include/adminRight.jsp" %>
    </div>
</main>
<%@include file="/include/footer.jsp" %>
</body>
</html>

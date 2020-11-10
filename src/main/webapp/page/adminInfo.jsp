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
            <div id="teacher-clear" class="adminInfo">
                <h1>基本资料</h1>
            </div>
            <div id="teacherInfo">
                <form name="adminInfo" method="post" action="/m/update.do">
                    <div class="teacher oldpwd">
                        <input type="password" name="managerpwd1" placeholder="输入原密码"
                               id="oldpwd">
                    </div>
                    <div class="error-tips">
                        <span class="error-message hide" id="newpwd-message">密码必须是6到12个字符或数字</span>
                    </div>
                    <div class="teacher">
                        <input type="password" name="managerpwd2"
                               placeholder="输入新密码，6到12个字符或数字" id="newpwd1">
                    </div>
                    <div class="error-tips">
                        <span class="error-message hide" id="newpwd-message1">密码必须是6到12个字符或数字</span>
                    </div>

                    <div class="teacher">
                        <input type="password" name="teacherpwd" placeholder="确认新密码保持一致"
                               id="newpwd2">
                    </div>
                    <div class="error-tips">
                        <span class="error-message hide" id="newpwd-message2">两个新密码不一致</span>
                    </div>
                    <div class="teacher">
                        <input type="submit" value="点击确认修改" class="btn-submit off"
                               id="btn-admininfoSubmit">
                    </div>
                </form>
            </div>
            <div class="changeAllWrap hide">
                <div class="upload">
                    <form name="upload" method="post" action="/m/fileupload.do"
                          enctype="multipart/form-data" onsubmit="return fileupload()">
                        <input type="file" name="ml" class="uploadPic"
                               multiple="multiple"><span>(头像大小尺寸185px*185px)</span>
                        <input type="submit" class="btn-submit" id="btn-upload"
                               value="确定上传" onclick="fileupload()">
                    </form>
                    <i class="iconfont icon-close"></i>
                </div>
            </div>
        </div>
        <aside class="fr">
            <div id="slidebar" class="fr">
                <div id="teacher-info">
                    <div id="touxiang">
                        <a href="#"><img src="${pageContext.request.contextPath}${m.url}" alt="管理员头像"></a>
                    </div>
                    <div class="changeImg">
                        <a href="javascript:;">修改头像</a>
                    </div>
                    <h1 class="center">${pageContext.request.contextPath}${m.nicename}</h1>
                </div>
                <nav id="teacher-menu">
                    <div id="menulist">
                        <ul>
                            <li><a
                                    href="${pageContext.request.contextPath}/admin/selectAllTeacher.do">教师信息管理</a></li>
                            <li><a href="adminSchool.jsp">教务教学管理</a></li>
                            <li><a href="keshiCount.jsp">课时统计管理</a></li>
                            <li><a href="adminInfo.jsp" class="active">管理员管理</a></li>
                            <li><a href="admindata.jsp">数据备份/恢复</a></li>
                            <li><a href="#" onclick="mExit()" name=mExit>退出管理系统</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </aside>
    </div>
</main>
<%@include file="/include/footer.jsp" %>
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

    //文件上传判断是否为空
    function fileupload() {
        var upload = $(".uploadPic").val();
        if (upload == '') {
            alert("上传文件不能为空！");
            return false;
        }
    }
</script>
</html>

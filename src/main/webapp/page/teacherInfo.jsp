<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <title>教师个人信息-戴氏教育教师签课时系统</title>

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
            <div id="teacher-clear">
                <h1>基本资料</h1>
                <input type="button" value="清空预设签课时记录" name="btn-clearInfo" id="btn-clearInfo">
                <span>备注：清空以前签课时的班级、教室等预设信息</span>
            </div>
            <!--确定清空预设-->
            <div class="delete-wrap record-bg hide">
                <div class="deleteRecord center">
                    <form name="clearInfo" method="post"
                          action="">
                        <p>确定清空预设信息吗？</p>
                        <input type="submit" id="btn-clear" name="btn-clear" value="确定">
                        <input type="button" id="btn-cancel" value="取消">

                    </form>
                </div>
            </div>
            <div id="teacherInfo">
                <form name="teacherInfo" method="post" action="/teacher/update.do">
                    <div class="teacher oldpwd">
                        <input type="password" name="teacherpwd1" placeholder="输入原密码" id="oldpwd">
                    </div>
                    <div class="error-tips"><span class="error-message hide" id="newpwd-message">密码必须是6到12个字符或数字</span>
                    </div>
                    <div class="teacher">
                        <input type="password" name="teacherpwd2" placeholder="输入新密码，6到12个字符或数字" id="newpwd1">
                    </div>
                    <div class="error-tips"><span class="error-message hide" id="newpwd-message1">密码必须是6到12个字符或数字</span>
                    </div>

                    <div class="teacher">
                        <input type="password" name="teacherpwd" placeholder="确认新密码保持一致" id="newpwd2">
                    </div>
                    <div class="error-tips"><span class="error-message hide" id="newpwd-message2">两个新密码不一致</span></div>
                    <div class="teacher">
                        <input type="submit" value="点击确认修改" class="btn-submit off" id="btn-infoSubmit">
                    </div>
                </form>
            </div>
        </div>
        <aside class="fr">
            <div id="slidebar" class="fr">
                <div id="teacher-info">
                    <div id="touxiang">
                        <a href="#"><img src="${pageContext.request.contextPath}${t.url}" alt="教师头像"></a></div>
                    <div class="changeImg"><a href="#">修改头像</a></div>
                    <h1 class="center">${t.loginname}</h1>
                </div>
                <nav id="teacher-menu">
                    <div id="menulist">
                        <ul>
                            <li><a href="/page/teacher.jsp">实时课时签到</a></li>
                            <li><a href="/page/recordList.jsp">课时签到报表</a></li>
                            <li><a href="/page/teacherInfo.jsp" class="active">个人资料设置</a></li>
                            <li><a href="#" onclick="teacherExit()" name=teacherExit>退出课时系统</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </aside>
        <div class="changeAllWrap hide">
            <div class="upload">
                <form name="upload" method="post" action="/teacher/fileupload.do" enctype="multipart/form-data"
                      onsubmit="return fileupload()">
                    <input type="file" name="f1" class="uploadPic" multiple="multiple"><span>(头像大小尺寸185px*185px)</span>
                    <input type="submit" class="btn-submit" id="btn-upload" value="确定上传" onclick="fileupload()">
                </form>
                <i class="iconfont icon-close"></i>
            </div>
        </div>
    </div>
</main>
<%@include file="/include/footer.jsp" %>
</body>
<script type="text/javascript">
    function teacherExit() {
        $("a[name='teacherExit']").attr({href: "#"});
        if (confirm("确认yao退出吗？")) {
            //alert("选择的是 确定！")
            $("a[name='teacherExit']").attr({href: "/teacher/exit.do"});
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
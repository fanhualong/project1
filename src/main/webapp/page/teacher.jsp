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
        <div class="keshi-form fl">
            <form name="keshi" method="post" action="#" onsubmit="return keshixt()">
                <table width="840" border="0" cellspacing="0" cellpadding="10">
                    <tr>
                        <th>日期</th>
                        <th>时间段</th>
                        <th>班级</th>
                        <th>地点</th>
                        <th>节数</th>
                        <th>备注</th>
                    </tr>
                    <tr>
                        <td rowspan="2"><input type="text" id="select-date"
                                               name="select-date" class="auto-kal"
                                               data-kal="mode:'multiple',format:'YYYY-MM-DD'" autocomplete="off"></td>
                        <td>
                            <div class="check">
                                <input type="checkbox" id="allday" name="allday" value="allday"><label
                                    for="allday" id="allday-label"><span>全天</span></label>
                            </div>
                        </td>
                        <td rowspan="2">
                            <div class="select-wrap">
                                <select id="select-class" name="select-class">
                                    <option value="">--请选择班级--</option>
                                </select>
                            </div>
                        </td>
                        <td rowspan="2">
                            <div class="select-wrap">
                                <select id="classroom" name="classroom">
                                    <option value="">--请选择教室--</option>
                                </select>
                            </div>
                        </td>
                        <td rowspan="2">
                            <div class="select-wrap">
                                <select id="count" name="count">
                                    <option value="">--请选择课时数--</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="check">
                                <input type="checkbox" id="zhiban" name="zhiban" value="zhiban"><label
                                    for="zhiban"><span>值班</span></label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">
                            <div class="select-wrap">
                                <select id="start-time" name="start-time">
                                    <option value="08:40">08:40</option>
                                    <option value="10:00">10:10</option>
                                    <option value="10:20">10:20</option>
                                    <option value="11:50">11:50</option>
                                </select>
                            </div>
                            <span class="splite-time">到</span>
                            <div class="select-wrap">
                                <select id="end-time" name="end-time">
                                    <option value="13:40">13:40</option>
                                    <option value="14:00">14:00</option>
                                    <option value="15:00">15:00</option>
                                    <option value="16:00">16:00</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="20:00">20:00</option>
                                </select>
                            </div>
                        </td>
                        <td><label for="beizhu"><span class="sub-info">其他信息请注明：</span></label><br>
                            <input type="text" id="beizhu" name="beizhu"></td>
                    </tr>
                </table>
                <div id="submit-wrap" class="center">
                    <input type="submit" value="点击确定" class="btn-submit"
                           id="btn-listSubmit">
                </div>
            </form>
            <div class="info">
                <strong>温馨提示：</strong>
                <p>1、日期可以多选，上课班级一致的课时可以多选日期实现一键签所有课时。</p>
                <p>2、勾选全天后，上午下午的课时一起签。</p>
                <p>3、如果当前上下午课时不一样，请当天单独选择时间段签课时。</p>
            </div>
        </div>
        <aside class="fr">
            <div id="slidebar" class="fr">
                <div id="teacher-info">
                    <div id="touxiang">
                        <a href="#"><img
                                src="${pageContext.request.contextPath}${t.url}" alt="教师头像"></a>
                    </div>
                    <h1 class="center">${t.loginname}</h1>
                </div>
                <nav id="teacher-menu">
                    <div id="menulist">
                        <ul>
                            <li><a href="/page/teacher.jsp" class="active">实时课时签到</a></li>
                            <li><a href="/page/recordList.jsp">课时签到报表</a></li>
                            <li><a href="/page/teacherInfo.jsp">个人资料设置</a></li>
                            <li><a href="" onclick="teacherExit()" name=teacherExit>退出课时系统</a></li>
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
    //页面载入事件
    $(document).ready(function () {
        //页面加载时，执行ajax，从数据库中取出班级和教室
        //取出班级
        $.get("/class_record/getClassName.do", function (data) {
            var $select = $("#select-class");
            //$select.empty();
            //$tab.attr({ width: "840", border: "0" ,cellspacing: "0",cellpadding: "0", class: "tab"});
            //$tab.append("<tr><th scope='col'>日期</th><th scope='col'>星期</th><th scope='col'>时间段</th><th scope='col'>班级</th><th scope='col'>地点</th><th scope='col'>节数</th><th scope='col'>备注</th> <th scope='col'>操作</th></tr>");
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                $select.append("<option value=" + d.tname + ">" + d.tname + "</option>");
            }
        });
        //取出教室
        $.get("/class_record/getClassRoom.do", function (data) {
            var $select = $("#classroom");
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                $select.append("<option value=" + d.roomname + ">" + d.roomname + "</option>");
            }
        });
    });

    function keshixt() {
        //form点击确认 submit事件
        //判断每个元素是否为空
        var date = $("#select-date").val();//日期
        if (date == '') {
            alert("输入不能为空，请重新输入！");
            return false;
        }
        var $date = new Date(date);//转换格式
        var $year = $date.getFullYear();
        var $month = $date.getMonth() + 1;
        var $day = $date.getDate();
        var d = $year + "-" + $month + "-" + $day;
        var $s = $('#allday').is(':checked');//判断全天是否选中，选中为true
        if ($s) {
            var $starttime = "3:00";
            var $endtime = "6:00";
        } else {
            var $starttime = $("#start-time").val();
            var $endtime = $("#end-time").val();
        }
        var flag1 = $starttime == '' || $endtime == '';//开始时间和结束时间只要一个为null就为true
        var $class = $("#select-class").val();//班级
        var $classroom = $("#classroom").val();//教室
        var $count = $("#count").val();//课时数
        var $zb = $('#zhiban').is(':checked');//判断值班是否选中，选中为true--可以为空
        if ($zb) {
            $zhiban = "1";
        } else {
            $zhiban = "0";
        }
        var $beizhu = $("#beizhu").val();//其他信息--就是备注--可以为空
        var flag = $class == '' || $classroom == ''
            || $count == '';//只要一个为空就为true
        if (flag) {
            alert("输入不能为空，请重新输入！");
            return false;
        }
        var today = new Array('日', '一', '二', '三', '四', '五', '六');
        var week = today[$date.getDay()];
        $.ajax({
            type: "POST",
            url: "/class_record/insertrecord.do",
            async: false,
            data: {
                rtime: d,
                begintime: $starttime,
                endtime: $endtime,
                classname: $class,
                roomname: $classroom,
                sectionnumber: $count,
                onduty: $zhiban,
                remark: $beizhu,
                createtime: new Date(),
                timeweek: week,
                year: $year,
                cmonth: $month,
                day: $day,
                rtype: "1",
                enable: "1"
            },
            success: function (dddd) {
                if (dddd = 1) {
                    alert("添加成功！" + dddd);
                } else {
                    alert("添加失败！" + dddd);
                }
            }
        });
        /* $.post("/class_record/insertrecord.do",{
            rtime : d,
            begintime : $starttime,
            endtime : $endtime,
            classname : $class,
            roomname : $classroom,
            sectionnumber : $count,
            onduty : $zhiban,
            remark : $beizhu,
            createtime : new Date(),
            timeweek : week,
            year : $year,
            cmonth : $month,
            day : $day,
            rtype : "1",
            enable : "1"
        } ,

        function(dddd){
            if(dddd=1){
             alert("添加成功！" + dddd);
            }else{
             alert("添加失败！" + dddd);
            }

        }
        ); */
    }

    function teacherExit() {
        if (confirm("确认要退出吗？")) {
            //alert("选择的是 确定！")
            $("a[name='teacherExit']").attr({
                href: "/teacher/exit.do"
            });
        } else {
            //alert("flase")
        }
        return false;
    }
</script>
</html>

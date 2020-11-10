<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <!--选项卡切换菜单-->
            <div id="recordTitle">
                <nav>
                    <ul class="clearfix">
                        <li class="active">个人 课程查看</li>
                    </ul>
                </nav>
            </div>
            <div id="recordList">
                <!--待审核课时-->
                <div class="check-wrap record-wrap">
                    <div class="recordSelect clearfix">
                        <div class="recordSelect-form fr">
                            <form name="selectPage" method="post" action="">
                                <ul class="clearfix">
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectPage-count" class="uncheckRecord">
                                                <option value="10">每页显示10条</option>
                                                <option value="20">每页显示20条</option>
                                                <option value="30">每页显示30条</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectMonth">
                                                <script>
                                                    var myDate = new Date();
                                                    var month = myDate.getMonth() + 1;
                                                    //先找出本月月份
                                                    /*  for(var j=1;j<=12;j++){
                                                         if(j==month){
                                                             document.write(' <option value="'+j+'">'+j+'</option>')
                                                         }
                                                     } */
                                                    for (var i = 1; i <= 12; i++) {
                                                        if (month == i) {
                                                            document.write(' <option  selected="selected" value="' + (i < 10 ? '0' + i : i) + '">' + (i < 10 ? '0' + i : i) + '</option>')
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
                        <div class="fr recordCount">
                            7月共25条记录，预计<span>180</span>课时，<span>2</span>次值班
                        </div>
                    </div>
                    <div class="recordList-table checkList">
                        <table width="840" border="0" cellspacing="0" cellpadding="0" class="tab">
                            <tr>
                                <th scope="col">日期</th>
                                <th scope="col">星期</th>
                                <th scope="col">时间段</th>
                                <th scope="col">班级</th>
                                <th scope="col">地点</th>
                                <th scope="col">节数</th>
                                <th scope="col">备注</th>
                                <th scope="col">操作</th>
                            </tr>

                        </table>
                        <div class="pagebar center" id="page">
                            <a href="#" class="current" value="1">1</a>
                            <a href="#" value="2">2</a>
                            <a href="#" value="3">3</a>
                        </div>
                    </div>
                </div>
                <!--删除课时-->
                <div class="deleted-wrap record-wrap hide">
                    <div class="recordSelect clearfix">
                        <div class="recordSelect-form fr">
                            <form name="selectPage" method="post" action="" onsubmit="return affirmchange(id2)">
                                <ul class="clearfix">
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectPage-count">
                                                <option value="10">每页显示10条</option>
                                                <option value="20">每页显示20条</option>
                                                <option value="30">每页显示30条</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectMonth">
                                                <script>
                                                    var myDate = new Date();
                                                    var month = myDate.getMonth() + 1;
                                                    for (var i = 1; i <= 12; i++) {
                                                        if (month == i) {
                                                            document.write(' <option  selected="selected" value="' + (i < 10 ? '0' + i : i) + '">' + (i < 10 ? '0' + i : i) + '</option>')
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
                                            <select name="" id="">
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
                    </div>
                    <div class="recordList-table checkList">
                    </div>
                </div>
            </div>
            <!--修改课时-->
            <div class="change-wrap record-bg hide">
                <div class="keshi-form changeRecord">
                    <form name="changekeshi" method="post" action="#">
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
                                <td rowspan="2"><input type="text" id="select-date" name="select-date" class="auto-kal"
                                                       data-kal="mode:'multiple',format:'YYYY-MM-DD'"
                                                       autocomplete="off"></td>
                                <td>
                                    <div class="check">
                                        <input type="checkbox" id="allday" name="allday" value="allday"><label
                                            for="allday" id="allday-label"><span>全天</span></label>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="select-class" name="select-class">
                                        </select>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="classroom" name="classroom">
                                        </select>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="count" name="count">
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
                                        </select></div>
                                    <span class="splite-time">到</span>
                                    <div class="select-wrap"><select id="end-time" name="end-time">
                                        <option value="13:40">13:40</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="20:00">20:00</option>
                                    </select></div>
                                </td>
                                <td><label for="beizhu"><span class="sub-info">其他信息请注明：</span></label><br><input
                                        type="text" id="beizhu" name="beizhu"></td>
                            </tr>
                        </table>
                        <div id="submit-wrap" class="center">
                            <input type="submit" value="点击确定" class="btn-submit" onclick="affirmchange(id2)">
                        </div>
                    </form>
                </div>
            </div>
            <!--删除课时-->
            <div class="delete-wrap record-bg hide">
                <div class="deleteRecord center">
                    <form name="delete" method="post" action="#">
                        <p>确定删除该课时吗？</p>
                        <input type="submit" id="btn-delete" name="btn-delete" value="确定" onclick="affirmdel(id1)">
                        <input type="button" id="btn-cancel" value="取消">
                    </form>
                </div>
            </div>
        </div>
        <aside class="fr">
            <div id="slidebar" class="fr">
                <div id="teacher-info">
                    <div id="touxiang">
                        <a href="#"><img src="${pageContext.request.contextPath}${t.url}" alt="教师头像"></a></div>
                    <h1 class="center">${t.loginname} </h1>
                </div>
                <nav id="teacher-menu">
                    <div id="menulist">
                        <ul>
                            <li><a href="/page/teacher.jsp">实时课时签到</a></li>
                            <li><a href="/page/recordList.jsp" class="active">课时签到报表</a></li>
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

    /* 页面载入事件，查询所有的class_record，返回页面 */
    $(document).ready(function () {

        var $page = $("a[class='current']").text();
        var $pageSize = $("select[name='selectPage-count']").val();
        var $date = new Date();
        var $year = $date.getFullYear();
        var $month = $date.getMonth() + 1;
        //设置月份为当前月

        //设置年为当前年
        $("select[name='selectYear']").val($year);

        selectPage($page, $pageSize, $year, $month);
        //每页个数发生改变事件
        //匹配所有select，当一个改变，获取其他的所有值
        $("select").change(function () {
            $year = $("select[name='selectYear']").val();
            $month = $("select[name='selectMonth']").val();
            $pageSize = $("select[name='selectPage-count']").val();
        });

        //页数page
        $("a").click(function () {
            $page = $(this).attr("value");
            selectPage($page, $pageSize, $year, $month);
        });

        //整个页面改变事件
        $(document).change(function () {
            //alert($year+"年  "+$month+"月 "+$pageSize+" 个数"+year);
            selectPage($page, $pageSize, $year, $month);
        });

        var id1 = 0;
        var id2 = 0;
    });

    //分页查询事件
    function selectPage($page, $pageSize, $year, $month) {
        $.get("/class_record/selectpage.do", {
            page: $page,
            pageSize: $pageSize,
            year: $year,
            cmonth: $month
        }, function (data) {
            var $tab = $("table[class='tab']");
            $tab.empty();
            $tab.attr({width: "840", border: "0", cellspacing: "0", cellpadding: "0", class: "tab"});
            $tab.append("<tr><th scope='col'>日期</th><th scope='col'>星期</th><th scope='col'>时间段</th><th scope='col'>班级</th><th scope='col'>地点</th><th scope='col'>节数</th><th scope='col'>备注</th> <th scope='col'>操作</th></tr>");
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                $tab.append("<tr><td>" + d.cmonth + "-" + d.day + "</td>" +
                    "<td>" + d.timeweek + "</td>" +
                    "<td>" + d.begintime + "-" + d.endtime + "</td>" +
                    "<td>" + d.classname + "</td>" +
                    "<td>" + d.roomname + "</td>" +
                    "<td>" + d.sectionnumber + "</td>" +
                    "<td>" + d.remark + "</td>" +
                    "<td><a href='#' class='change111'  onclick='return changeeven(" + d.id + ")'>修改</a> <a href='#' class='del'  onclick='return deleven(" + d.id + ")'>删除</a></td></tr>");
            }
        });
    }

    //点击修改事件--弹出修改框
    function changeeven(id) {
        $("div[class='change-wrap record-bg hide']").attr("class", "change-wrap record-bg");
        //点击修改的时候，将用户信息取出来，回显到修改表单上
        $.post("/class_record/getTeacher.do", {id: id}, function (data) {
            //日期
            $("#select-date").attr("value", data.rtime);
            //判断是否是全天
            if (data.begintime == "3:00" && data.endtime == "6:00") {
                $("#allday").prop("checked", true);
                $('#allday').attr('onclick', alldaychange());
            } else {
                $("#allday").prop("checked", false);
                $('#allday').attr('onclick', alldaychange());
                $('#start-time').attr('disabled', false);
                $('#end-time').attr('disabled', false);
                $("#start-time").append("<option selected='selected' value=" + data.begintime + ">" + data.begintime + "</option>");
                $("#end-time").append("<option selected='selected' value=" + data.endtime + ">" + data.endtime + "</option>");
            }
            //班级
            var $select = $("#select-class");
            $select.append("<option value=" + data.classname + ">" + data.classname + "</option>");
            //教室
            var select = $("#classroom");
            select.append("<option value=" + data.roomname + ">" + data.roomname + "</option>");
            //节数
            $("#count").append("<option selected='selected' value=" + data.sectionnumber + ">" + data.sectionnumber + "</option>");
            //值班
            if (data.onduty == 1) {
                $("#zhiban").prop("checked", true);
            } else if (data.onduty == 0) {
                $("#zhiban").prop("checked", false);
            }
            //备注
            $("#beizhu").val(data.remark);
        });
        //取出班级  id=select-class
        $.get("/class_record/getClassName.do", function (data) {
            var $select = $("#select-class");
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                $select.append("<option value=" + d.tname + ">" + d.tname + "</option>");
            }
        });
        //取出教室  id=classroom
        $.get("/class_record/getClassRoom.do", function (data) {
            var $select = $("#classroom");
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                $select.append("<option value=" + d.roomname + ">" + d.roomname + "</option>");
            }
        });

        id2 = id;
        return id2;
    }

    function affirmchange(id2) {
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
            url: "/class_record/update.do",
            async: false,
            data: {
                id: id2,
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
                day: $day
            },
            success: function (dddd) {
                if (dddd = 1) {
                    alert("修改成功！" + dddd);
                } else {
                    alert("修改失败！" + dddd);
                }
            }
        });
        /* $.post("/class_record/update.do",
            {	id:id2,
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
                day : $day 	} ,
        function(data){
            alert(data);
            /* if(dddd=1){
             alert("修改成功！" + dddd);
            }else{
             alert("修改失败！" + dddd);
            }

           }
        );*/
    }

    //点击删除事件--改变隐藏属性
    function deleven(id) {
        $("div[class='delete-wrap record-bg hide']").attr("class", "delete-wrap record-bg");
        id1 = id;
        return id1;
    }

    //点击确认删除事件--确认删除
    function affirmdel(id1) {
        $.post("/class_record/delById.do", {id: id1},
            function (data) {
            });
    }

    function teacherExit() {
        if (confirm("确认要退出吗？")) {
            //alert("选择的是 确定！")
            $("a[name='teacherExit']").attr({href: "/teacher/exit.do"});
        } else {
            //alert("flase")
        }
        return false;
    }

    //签课时页面
    function alldaychange() {
        var $allDay = $('#allday');
        var $startTime = $('#start-time');
        var $endTime = $('#end-time');
        var $isChecked = $('#allday').is(':checked');//先获取默认值
        $('#allday-label').click(function () {
            $isChecked = !$isChecked; //点击后取反
            if ($isChecked) {
                $startTime.attr('disabled', true);
                $endTime.attr('disabled', true);
            } else {
                $('#start-time').attr('disabled', false);
                $('#end-time').attr('disabled', false);
            }
        })
    }
</script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<% String m = request.getParameter("m");%>
<% String y = request.getParameter("y");%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>课时报表查看-华信智原教师签课时系统</title>
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
            <!--选项卡切换菜单-->
            <div id="recordTitle">
                <nav>
                    <ul class="clearfix" id="selRType">
                        <li class="active" value="1" onclick="selByDate(1,1)">待审核</li>
                        <li value="2" onclick="selByDate(1,2)">已通过</li>
                        <li value="3" onclick="selByDate(1,3)">已删除</li>
                    </ul>
                </nav>
            </div>
            <div id="recordList">
                <!--待审核课时-->
                <div class="check-wrap record-wrap active">
                    <div class="recordSelect clearfix">
                        <div class="fl"><h1></h1></div>
                        <div class="recordSelect-form fr">
                            <form name="selectPage" method="post" action="">
                                <ul class="clearfix">
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectPage-count" onchange="selByDate(1)">
                                                <option value="10">每页显示10条</option>
                                                <option value="20">每页显示20条</option>
                                                <option value="30">每页显示30条</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="select-wrap">
                                            <select name="selectMonth" onchange="selByDate(1)">
                                                <script>
                                                    var m =<%=m%>;
                                                    for (var i = 1; i <= 12; i++) {
                                                        if (m == i) {
                                                            document.write('<option  value="' + (i < 10 ? '0' + i : i) + '" selected ="selected">' + (i < 10 ? '0' + i : i) + '</option>');
                                                        } else {
                                                            document.write('<option value="' + (i < 10 ? '0' + i : i) + '">' + (i < 10 ? '0' + i : i) + '</option>');
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
                                                    var y =<%=y%>;
                                                    var myDate = new Date();
                                                    var year = myDate.getFullYear();
                                                    for (var i = year; i >= 2015; i--) {
                                                        if (y == i) {
                                                            document.write(' <option value="' + i + '" selected ="selected">' + i + '</option>')
                                                        } else {
                                                            document.write(' <option value="' + i + '">' + i + '</option>')
                                                        }
                                                    }
                                                </script>
                                            </select>
                                        </div>
                                    </li>
                                </ul>
                            </form>
                        </div>
                        <div class="fr recordCount">

                        </div>
                    </div>
                    <div class="recordList-table checkList">
                        <form name='shenhekeshi' action="" method="post">
                            <table width="840" border="0" cellspacing="0" cellpadding="0" class="admin-recordList"
                                   id="table_detail">

                            </table>
                            <div class="fr checkAll-box">
                                <input type="checkbox" id="checkAll"> <label for="checkAll">全选</label>
                                <input type="submit" class="btn-submit" onclick="submitChecked()">
                            </div>
                            <div class="pagebar center" id="pageNum">
                            </div>

                        </form>
                    </div>
                </div>

            </div>


            <!-- -->


            <!--修改课时-->
            <div class="change-wrap record-bg hide">
                <div class="keshi-form changeRecord">
                    <form name="changekeshi" method="post" action="/keshi/updateRecordDetail.do" id="id_form">
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
                                        <input type="checkbox" id="allday" name="allday" onclick=checkValue(this)
                                               value=1><label for="allday" id="allday-label"><span>全天</span></label>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="select-class" name="select-class">
                                            <optgroup label="全部班级">
                                            </optgroup>
                                        </select>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="classroom" name="classroom">
                                            <optgroup label="全部教室">
                                            </optgroup>
                                        </select>
                                    </div>
                                </td>
                                <td rowspan="2">
                                    <div class="select-wrap">
                                        <select id="count" name="count">
                                            <optgroup label="全部课时数">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <div class="check">
                                        <input type="checkbox" id="zhiban" name="zhiban" onclick=checkValue(this)
                                               value=0><label for="zhiban"><span>值班</span></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="center">
                                    <div class="select-wrap">
                                        <select id="start-time" name="start-time">
                                        </select></div>
                                    <span class="splite-time">到</span>
                                    <div class="select-wrap">
                                        <select id="end-time" name="end-time">
                                        </select>
                                    </div>
                                </td>
                                <td><label for="beizhu"><span class="sub-info">其他信息请注明：</span></label><br><input
                                        type="text" id="beizhu" name="beizhu"></td>
                            </tr>
                        </table>
                        <div id="submit-wrap" class="center">
                            <input type="hidden" name="m" value=<%=m%>>
                            <input type="hidden" name="y" value=<%=y%>>
                            <input type="submit" value="点击确定" class="btn-submit">
                        </div>
                    </form>
                </div>
            </div>
            <!--删除课时-->
            <div class="delete-wrap record-bg hide">
                <div class="deleteRecord center">
                    <form name="delete" method="post" id="id_delform" action="/keshi/delRecord.do">
                        <p>确定删除该课时吗？</p>
                        <input type="hidden" name="m" value=<%=m%>>
                        <input type="hidden" name="y" value=<%=y%>>
                        <input type="submit" id="btn-delete" name="btn-delete" value="确定">
                        <input type="button" id="btn-cancel" value="取消">
                    </form>
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
        <p>后端开发：黄家骏</p>
    </div>
</footer>
<script>

    $(function () {
        selByDate(0);
        var num = 0;
        //全选
        $("#checkAll").click(
            function () {
                if (this.checked) {
                    $('.checkList').find('input[type=checkbox]').attr('checked', true)
                } else {
                    $('.checkList').find('input[type=checkbox]').attr('checked', false)
                }
            }
        );
        //切换审核、通过、删除选项卡
        $(function () {
            $('#recordTitle').find('li').click(function () {
                $(this).addClass('active').siblings('li').removeClass('active');
            })
        })
        //修改的预设
        $.ajax({
            type: "post",
            url: "/keshi/updateNeed.do",
            dataType: 'json',
            success: function (data) {
                var $opt = $('#select-class').find('optgroup');
                var $room = $('#classroom').find('optgroup');
                var $starttime = $('#start-time');
                var $endTime = $('#end-time');
                $opt.empty();
                $room.empty();
                for (var i = 0; i < data[0].length; i++) {
                    $opt.append('<option value="' + data[0][i].tname + '">' + data[0][i].tname + '</option>');
                }
                for (var i = 0; i < data[1].length; i++) {
                    $room.append('<option value="' + data[1][i].roomname + '">' + data[1][i].roomname + '</option>');
                }
                for (var i = 0; i < data[1].length; i++) {
                    $starttime.append('<option value="' + data[2][i].createtime + '">' + data[2][i].createtime + '</option>');
                    $endTime.append('<option value="' + data[2][i].createtime + '">' + data[2][i].createtime + '</option>');
                }
            }

        });
    })

    //修改URL参数
    function replaceParamVal(paramName, replaceWith) {
        var oUrl = this.location.href.toString();
        var re = eval('/(' + paramName + '=)([^&]*)/gi');
        var nUrl = oUrl.replace(re, paramName + '=' + replaceWith);
        this.location = nUrl;
        window.location.href = nUrl;
    }

    //checkbox是否选中，选中1，未选0
    function checkValue(o) {
        if (o.checked) {
            o.value = 1;
        } else {
            o.value = 0;
        }

    }

    //查询数据
    function selByDate(p, r) {
        var t = getUrlParam("tId");
        var y = $(".record-wrap.active").find("select[name='selectYear']").find("option:selected").attr("value");
        var m = $(".record-wrap.active").find("select[name='selectMonth']").find("option:selected").attr("value");
        if (p == 0) {
            p = 1;
        } else {
            if (r == null) {
                replaceParamVal("y", y);
                replaceParamVal("m", m);
            }
        }
        var rType = ((r == null) ? $("#selRType").find(".active").attr("value") : r);
        var pageCount = $(".record-wrap.active").find("select[name='selectPage-count']").find("option:selected").attr("value");
        $.ajax({
            type: "post",
            url: "/keshi/getRecordDetail.do",
            data: {tId: t, year: y, month: m, page: p, rType: rType, pageCount: pageCount},
            dataType: "json",
            success: function (data) {
                $(".record-wrap").find(".fl").find("h1").text("教师:" + getUrlParam("tname"));
                $('#table_detail').empty();
                $('#table_detail').append('<tr><th scope="col">日期</th><th scope="col">星期</th><th scope="col">时间段</th>'
                    + '<th scope="col">班级</th><th scope="col">地点</th><th scope="col">节数</th><th scope="col">备注</th>'
                    + ((rType == 1) ? '<th scope="col">通过</th>' : '')
                    + '<th scope="col">操作</th></tr>');
                $("#pageNum").empty();
                for (var i = 0; i < data[0].length; i++) {
                    $("#table_detail").append('<tr><td>' + data[0][i].cmonth + '-' + data[0][i].day + '</td><td>'
                        + data[0][i].timeweek + '</td><td>'
                        + ((data[0][i].begintime == "8:40" && data[0][i].endtime == "17:30") ? '全天' : data[0][i].begintime + '-' + data[0][i].endtime)
                        + '</td><td>' + data[0][i].classname + '</td><td>'
                        + data[0][i].roomname + '</td><td>' + data[0][i].sectionnumber + '</td><td>' + data[0][i].remark
                        + '</td>' + ((rType == 1) ? '<td><input type="checkbox" name="checkOne" value="' + data[0][i].id + '"></td>' : '')
                        + '<td>' + ((rType == 3) ? '<a href="#" onclick="recall(' + data[0][i].id + ')">复原</a>' : '<a href="#" class="change" onclick="contentPanel(' + data[0][i].id + ')">修改</a> <a href="#" class="del" onclick="confirmPanel(' + data[0][i].id + ')">删除</a>') + '</td></tr>')
                }
                var pages = data[1];
                for (var i = 0; i < pages; i++) {
                    $("#pageNum").append('<a class="current" onclick="selByDate(' + (i + 1) + ')">' + (i + 1) + '</a>');
                }
                $(".recordCount").empty();
                $(".recordCount").append('' + m + '月共' + data[2].count + '条记录，预计<span>' + data[2].allHour + '</span>课时，<span>' + data[2].onDuty + '</span>次值班');

            },
        });
    }

    //复原
    function recall(id) {
        $.ajax({
            type: "post",
            data: {id: id},
            url: "/keshi/recall.do",
            success: selByDate(1)
        });
    }

    //弹出层
    function contentPanel(i) {
        //ev=ev||event;
        //ev.stopPropagation();
        $('.change-wrap').removeClass('hide');
        $('#id_form').find('input[name="id_hide"]').remove();
        $('#id_form').append('<input type="hidden" value="' + i + '" name="id_hide"/>');
        $('#id_form').find('input[name="name_hide"]').remove();
        $('#id_form').append('<input type="hidden" value="' + getUrlParam("tname") + '" name="name_hide"/>');
        $('#id_form').find('input[name="tid_hide"]').remove();
        $('#id_form').append('<input type="hidden" value="' + getUrlParam("tId") + '" name="tid_hide"/>');

    }


    //删除层
    function confirmPanel(i) {
        $('.delete-wrap').removeClass('hide');
        $('#id_delform').find('input[name="id_hide"]').remove();
        $('#id_delform').append('<input type="hidden" value="' + i + '" name="id_hide"/>');
        $('#id_delform').find('input[name="name_hide"]').remove();
        $('#id_delform').append('<input type="hidden" value="' + getUrlParam("tname") + '" name="name_hide"/>');
        $('#id_delform').find('input[name="tid_hide"]').remove();
        $('#id_delform').append('<input type="hidden" value="' + getUrlParam("tId") + '" name="tid_hide"/>');
    }

    //提交通过请求
    function submitChecked() {
        if ($('input[name="checkOne"]:checked') != null) {
            var str = "";
            $('input[name="checkOne"]:checked').each(function () {
                str += this.value + ",";
            });
            $.ajax({
                type: "post",
                url: "/keshi/updateRecord.do",
                data: {ids: str},
            });
        } else {
            alert("none!!!");
        }


    }

    //得到URL参数
    function getUrlParam(param) {
        var reg = new RegExp("(^|&)" + param + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null)
            return decodeURIComponent(r[2]);
        return null;
    }

</script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" codefile="mes_030.aspx.cs" Inherits="Situation_Center.web.mes_030" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MES 工單管理看板(TYP)</title>
    <link href="../js/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.12.1.min.js"></script>
    <script src="../js/bootstrap-4.3.1/js/bootstrap.min.js"></script>
    <link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .title {
            background: #1a1a1a;
            height: 80px;
            margin-bottom: 10px;
            padding-left: 15px;
            text-align: left;
            font-family: 微軟正黑體;
            font-size: 40px;
            line-height: 80px;
            color: #ffffff;
        }

        .box-wrapper {
            background: linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat;
            background-size: 15px 15px;
            background-color: #20323E;
            padding: 1px;
            height: 180px;
            margin-bottom: 8px;
            position: relative;
            text-align: center;
        }

        .box-content {
            padding: 5px;
            color: #fff;
            font-family: 微軟正黑體;
            font-weight: bold;
            font-size: 20px;
            position: absolute;
            left: 8px;
            top: 1px;
            z-index: 999;
        }

        .box-qty {
            color: #fff;
            font-weight: bold;
            font-family: 微軟正黑體;
            font-size: 70px;
            margin-top: 40px;
            text-align: center;
        }

        .datalist {
            font-family: 微軟正黑體;
            width: 98%;
            margin-top: 13px;
            margin-left: 13px;
            font-weight: bold;
            font-size: 20px;
            color: #ffffff;
        }

            .datalist th {
                background-color: #17FFF3;
                color: #173E3C;
            }

            .datalist td {
                border-bottom: 1px solid #fff;
            }

            .datalist tr {
                height: 52px;
            }

        .chart {
            height: 140px;
        }

        [class*="col-"] {
            padding-right: 4px;
            padding-left: 4px;
        }

        .row {
            margin-left: -17px;
        }

        .typ {
            color: #17BF71;
            font-weight: bold;
            font-family: 微軟正黑體;
            font-size: 18px;
            margin-left: 10px;
        }

        .ttp {
            color: #0A97FB;
            font-weight: bold;
            font-family: 微軟正黑體;
            font-size: 18px;
        }

        .line1 {
            background: linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat;
            background-size: 15px 15px;
            background-color: #20323E;
            padding: 1px;
            height: 100%;
            margin-bottom: 8px;
            position: relative;
            text-align: center;
        }

        .line2 {
            background: linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat;
            background-size: 15px 15px;
            background-color: #20323E;
            padding: 1px;
            height: 218px;
            margin-bottom: 8px;
            position: relative;
            text-align: center;
        }

        .line3 {
            background: linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat;
            background-size: 15px 15px;
            background-color: #20323E;
            padding: 1px;
            height: 45px;
            margin-bottom: 1px;
            position: relative;
            text-align: center;
        }

        #wrap {
            overflow: hidden;
        }

            #wrap .wrapIn {
                width: 8000%;
                height: 30px;
            }

                #wrap .wrapIn div {
                    float: left;
                    margin-right: 50px;
                }

        #date {
            position: fixed;
            top: -15px;
            right: 22px;
            font-family: 微軟正黑體;
            font-size: 28px;
            letter-spacing: 10px;
        }

        #time {
            position: fixed;
            top: 15px;
            right: 0px;
            font-family: 微軟正黑體;
            font-size: 28px;
            letter-spacing: 10px;
        }

        .sidemenu {
            z-index: 999;
            width: 50px;
            height: 100%;
            background: #1a1a1a;
            position: absolute;
            left: -50px;
            font-size: 25px;
            color: #fff;
            text-align: center;
        }

        body {
            font-family: 微軟正黑體;
            background: #000;
            padding-left: 5px;
            position: relative;
        }

        span {
            padding-top: 15px;
            padding-bottom: 15px;
        }

        #title1 {
            position: relative;
        }

        img {
            position: absolute;
            top: 15px;
            left: -0px;
            opacity: 0.9;
        }

        #mach_no1 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 50px;
            color: #ffffff;
            line-height: 218px;
        }

        #mach_no1_2 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 25px;
            color: #ffffff;
            padding-top: 140px;
        }

        #mach_no2 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 50px;
            color: #ffffff;
            line-height: 218px;
        }

        #mach_no2_2 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 25px;
            color: #ffffff;
            padding-top: 140px;
        }

        #PDA_step1 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 25px;
            color: #ffffff;
            padding-top: 160px;
        }

        #PDA_step2 {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 25px;
            color: #ffffff;
            padding-top: 160px;
        }

        marquee {
            font-family: 微軟正黑體;
            font-size: 20px;
        }
    </style>
</head>
<body>
  
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div id="box3" class="line1">
                    <table class="datalist">
                        <thead id="table_head"></thead>
                        <tbody id="wo"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        var no = 0;
        var week = 1;
        var CurrentDate;
        ShowDateTime();
        setInterval(ShowDateTime, 1000);

        wo();
        setInterval(wo, 300000);

        function ShowDateTime() {
            var day_list = ['日', '一', '二', '三', '四', '五', '六'];
            var now = new Date();//生成日期物件(完整的日期資訊)
            var y = now.getFullYear();//年份
            var M = now.getMonth() + 1;//月份
            if (M < 10) {
                M = '0' + M;
            }
            var d = now.getDate();//日期
            if (d < 10) {
                d = '0' + d;
            }
            var h = now.getHours();//小時
            if (h < 10) {
                h = '0' + h;
            }
            var m = now.getMinutes();//分鐘
            if (m < 10) {
                m = '0' + m;
            }
            var s = now.getSeconds();//秒數
            if (s < 10) {
                s = '0' + s;
            }

            var day = now.getDay();
            $('#date').html(y + '-' + M + '-' + d);
            $('#time').html(h + ':' + m + ':' + s + '星期' + day_list[day]);
            CurrentDate = y + '-' + M + '-' + d + ' ' + h + ':' + m + ':' + s;
        }

        function wo() {
            var tablehead = $("#table_head");
            tablehead.html("");
            tablehead.append('<tr></tr>');
            var tr = $('tr:last', tablehead);
            tr.append('<th class="text-center">No</th>');
            tr.append('<th class="text-center">機台編號</th>');
            tr.append('<th class="text-center">工單編號</th>');
            tr.append('<th class="text-center">料號</th>');
            tr.append('<th class="text-center">品名</th>');
            tr.append('<th class="text-center">槽號</th>');
            tr.append('<th class="text-center">生產數量</th>');
            tr.append('<th class="text-center">目前作業站</th>');
            tr.append('<th class="text-center">預估完工時間</th>');
            tr.append('<th class="text-center">下一站</th>');

            var tableBody = $("#wo");
            tableBody.html("");

            $.ajax({
                type: "POST",
                url: "dashboard.ashx",
                data: "fun_na=mes_030",
                dataType: "json",
                async: false,
                success: function (data) {
                    var i = 1;
                    for (var i = 0; i < data.length; i++) {
                        tableBody.append('<tr></tr>');
                        var tr = $('tr:last', tableBody);
                        tr.append('<td class="text-center">' + (i + 1) + '</td>');
                        tr.append('<td class="text-center">' + data[i].eqp_id + '</td>');
                        tr.append('<td class="text-center">' + data[i].wo_id + '</td>');
                        tr.append('<td class="text-center">' + data[i].item_id + '</td>');
                        tr.append('<td class="text-center">' + data[i].item_name + '</td>');
                        tr.append('<td class="text-center">' + data[i].carrier_id + '</td>');
                        tr.append('<td class="text-center">' + data[i].wo_qty + '</td>');

                        if (data[i].wo_status != 'Release') {
                            tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-success">' + data[i].step_name + '</button></td>');
                        }
                        else {
                            tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-danger">待啟動生產</button></td>');
                        }

                        if (data[i].wo_status != 'Release') {

                            if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                tr.append('<td class="text-center"><font color="#FC7272">' + data[i].step_finish_datetime.substring(0, 16) + '</font></td>');
                            }
                            else {
                                tr.append('<td class="text-center">' + data[i].step_finish_datetime.substring(0, 16) + '</td>');
                            }
                        }
                        else {
                            tr.append('<td class="text-center"></td>');
                        }

                        if (data[i].wo_status == 'Release' || data[i].step_name == 'COA站') {
                            tr.append('<td class="text-center"></td>');
                        }
                        else {
                            tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-warning">' + data[i].next_step + '</button></td>');
                        }
                    }
                }
            });
        }

        $(document).ready(function () {
            var w = document.documentElement.clientWidth;
            $('#msg').width(w - 80);
            var h = document.documentElement.clientHeight;
            //$('.line1').height(h - 100);
        });

        $('#TTP_mach').click(function (e) {
            e.preventDefault();
            window.open('MES_CCB_TTP.html', '_self');
        });

        $('#TYP_mach').click(function (e) {
            e.preventDefault();
            window.open('MES_CCB_TYP.html', '_self');
        });

        $('#TYP_wo').click(function (e) {
            e.preventDefault();
            window.open('MES_WO_TYP.html', '_self');
        });
    </script>



</body>
</html>

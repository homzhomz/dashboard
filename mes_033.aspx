<%@ Page Language="C#" AutoEventWireup="true" codefile="mes_033.aspx.cs" Inherits="Situation_Center.web.mes_033" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MES 機台管理看板(TTP)</title>
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
            font-size: 22px;
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

        .box {
            background: linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left top no-repeat, linear-gradient( to bottom, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right top no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to right, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) left bottom no-repeat, linear-gradient( to top, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat, linear-gradient( to left, #D0D7CC 0px, #D0D7CC 1px, transparent 2px, transparent 100% ) right bottom no-repeat;
            background-size: 15px 15px;
            background-color: #20323E;
            padding: 1px;
            height: 118px;
            margin-bottom: 8px;
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

        .wo_id {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 20px;
            color: #fff;
            line-height: 150px;
        }

        .item_desc {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 20px;
            color: #fff;
            line-height: 250px;
        }

        .station {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 20px;
            color: #17FFF3;
            line-height: 350px;
        }

        .min {
            position: absolute;
            z-index: 99;
            width: 100%;
            height: 100%;
            font-family: 微軟正黑體;
            font-size: 23px;
            color: #fff;
            line-height: 400px;
        }

        marquee {
            font-family: 微軟正黑體;
            font-size: 20px;
        }
    </style>
</head>
<body>
   

 

    <div class="container-fluid">
        <div class="row" id="row1">
            <div class="col-md-2"><div class="box-content">CCB 1-1</div><div id="mach_no1" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 1-2</div><div id="mach_no2" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 1-3</div><div id="mach_no3" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 1-4</div><div id="mach_no4" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 1-5</div><div id="mach_no5" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 1-6</div><div id="mach_no6" class="box"></div></div>
        </div>

        <div class="row" id="row2">
            <div class="col-md-2"><div class="box-content">CCB 2-1</div><div id="mach_no7" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 2-2</div><div id="mach_no8" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 2-3</div><div id="mach_no9" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB 2-4</div><div id="mach_no10" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB H01</div><div id="mach_no11" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB H02</div><div id="mach_no12" class="box"></div></div>
        </div>

        <div class="row" id="row3">
            <div class="col-md-2"><div class="box-content">CCB H03</div><div id="mach_no13" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB H04</div><div id="mach_no14" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB FAB2-1</div><div id="mach_no15" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB FAB2-2</div><div id="mach_no16" class="box"></div></div>
            <div class="col-md-2"><div class="box-content">CCB A01</div><div id="mach_no17" class="box"></div></div>
        </div>

        <div class="row" id="row4">
        </div>

        <div class="row" id="row5">
        </div>
    </div>

    <script>
        var no = 0;
        var week = 1;
        var CurrentDate;
        ShowDateTime()
        setInterval(ShowDateTime, 1000);
        mach();
        setInterval(mach, 300000);

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

        function mach() {
            $.ajax({
                type: "POST",
                url: "dashboard.ashx",
                data: "fun_na=mes_033",
                dataType: "json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        switch (data[i].e_tank_area_id) {
                            case 'CCB1-1':
                                mach_no = $("#mach_no1");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no1').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no1').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB1-2':
                                mach_no = $("#mach_no2");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no2').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no2').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB1-3':
                                mach_no = $("#mach_no3");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no3').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no3').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB1-4':
                                mach_no = $("#mach_no4");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no4').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no4').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB1-5':
                                mach_no = $("#mach_no5");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no5').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no5').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB1-6':
                                mach_no = $("#mach_no6");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no6').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no6').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB2-1':
                                mach_no = $("#mach_no7");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no7').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no7').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB2-2':
                                mach_no = $("#mach_no8");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no8').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no8').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB2-3':
                                mach_no = $("#mach_no9");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no9').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no9').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCB2-4':
                                mach_no = $("#mach_no10");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no10').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no10').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBH01':
                                mach_no = $("#mach_no11");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no11').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no11').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBH02':
                                mach_no = $("#mach_no12");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no12').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no12').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBH03':
                                mach_no = $("#mach_no13");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no13').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no13').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBH04':
                                mach_no = $("#mach_no14");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no14').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no14').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBFAB2-1':
                                mach_no = $("#mach_no15");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no15').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no15').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBFAB2-2':
                                mach_no = $("#mach_no16");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no16').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no16').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            case 'CCBA01':
                                mach_no = $("#mach_no17");
                                if ((Date.parse(data[i].step_finish_datetime)).valueOf() < (Date.parse(CurrentDate)).valueOf()) {
                                    $('#mach_no17').css({ 'background-color': '#6C272C' });
                                }
                                else {
                                    $('#mach_no17').css({ 'background-color': '#054D0C' });
                                }
                                break;
                            default:

                        }
                        mach_context(data[i].wo_id, data[i].item_name, data[i].step_name, data[i].step_finish_datetime);
                    }
                }
            });
        }

        function mach_context(wo_id, item_name, step_name, step_finish_datetime) {
            mach_no.html("");
            mach_no.append('<div class="wo_id">' + wo_id + '</div>')
            mach_no.append('<div class="item_desc">' + item_name + '</div>')
            mach_no.append('<div class="station">' + step_name + '</div>')
            //mach_no.append('<div class="min">' + step_finish_datetime + '-預估</div>')
        }

        $(document).ready(function () {
            var w = document.documentElement.clientWidth;
            $('#msg').width(w - 80);
            var h = document.documentElement.clientHeight;
            $('.line1').height(h - 375);
            $('.box').height(((h - 120) / 3));
        });

        $('#TTP_mach').click(function (e) {
            e.preventDefault();
            window.open('MES_CCB_TTP.html', '_self');
        });

        $('#TYP_mach').click(function (e) {
            e.preventDefault();
            window.open('MES_CCB_TYP.html', '_self');
        });

        $('#TTP_wo').click(function (e) {
            e.preventDefault();
            window.open('MES_WO_TTP.html', '_self');
        });
    </script>
</body>
</html>
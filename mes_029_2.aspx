<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mes_029_2.aspx.vb" Inherits="mes_029_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SO出貨作業看板-TTP</title>
    <link href="../js/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.12.1.min.js"></script>
    <script src="../js/bootstrap-4.3.1/js/bootstrap.min.js"></script>

    <style>
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

        .datalist {
            font-family: 微軟正黑體;
            width: 98%;
            margin-top: 13px;
            margin-left: 18px;
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

        body {
            font-family: 微軟正黑體;
            background: #000;
            margin: 10px 0 10px 0;
            position: relative;
        }

        #version {
            border: 1px #808080 solid;
            color: #808080;
            font-size: 16px;
            position: relative;
            left: 5px;
            padding-right: 10px;
            padding-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="line1">
                    <table class="datalist">
                        <thead id="table_head">
                            <tr>
                                <th class="text-center">No</th>
                                <th class="text-center">SO<span id="version"><a href="mes_029.aspx">TTP</a></span></th>
                                <th class="text-center">品名</th>
                                <th class="text-center">批號</th>
                                <th class="text-center">客戶<br>
                                    廠區</th>
                                <th class="text-center">槽號</th>
                                <th class="text-center">車牌</th>
                                <th class="text-center">出貨<br>
                                    過磅</th>
                                <th class="text-center">出貨<br>
                                    點檢</th>
                                <th class="text-center">出廠<br>
                                    時間</th>
                                <th class="text-center">預計<br>
                                    返廠</th>
                            </tr>
                        </thead>
                        <tbody id="table_body"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        var w = document.documentElement.clientWidth;
        var h = document.documentElement.clientHeight;
        job();
        setInterval(job, 300000);
        setInterval(ShowDateTime, 1000);

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
            $('#date').html(y + '-' + M + '-' + d + ' 星期' + day_list[day]);
            $('#time').html(h + ':' + m + ':' + s);
        }

        function job() {
            var no = 0;
            var tableBody = $("#table_body");
            tableBody.html("");
            $.ajax({
                type: "POST",
                url: "dashboard.ashx",
                data: "fun_na=mes_029&site=TTP",
                async: false,
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]['fact_in'] == '') {
                            no += 1;

                            tableBody.append('<tr></tr>');
                            var tr = $('tr:last', tableBody);
                            tr.append('<td class="text-center">' + (no) + '</td>');
                            tr.append('<td class="text-center">' + data[i]['ship_no'] + '</td>');
                            tr.append('<td class="text-center">' + data[i]['item_desc'] + '</td>');
                            tr.append('<td class="text-center">' + data[i]['lot_no'] + '</td>');
                            tr.append('<td class="text-center">' + data[i]['ship_to'] + '</td>');
                            tr.append('<td class="text-center">' + data[i]['tank_no'] + '</td>');
                            tr.append('<td class="text-center">' + data[i]['car_no'] + '</td>');

                            if (data[i]['scale'] == '') {
                                if (data[i]['tank_no'] == '') {
                                    tr.append('<td class="text-center"></td>');
                                }
                                else {
                                    tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-danger">未過磅</button></td>');
                                }

                            }
                            else {
                                if (data[i]['tank_no'] == '') {
                                    tr.append('<td class="text-center"></td>');
                                } else {
                                    tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-success">' + data[i]['scale'] + '</button></td>');
                                }
                            }

                            if (data[i]['oqc'] == '') {
                                tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-danger">未點檢</button></td>');
                            }
                            else {
                                tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-success">' + data[i]['oqc'] + '</button></td>');
                            }

                            if (data[i]['fact_out'] == '1900/1/1 00:00:00') {
                                tr.append('<td class="text-center"></td>');
                            } else {
                                tr.append('<td class="text-center">' + data[i]['fact_out'] + '</td>');
                            }


                            if (data[i]['fact_in'] == '') {
                                if (data[i]['fact_return'] == '') {
                                    tr.append('<td class="text-center"></td>');
                                }
                                else {
                                    tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-warning">' + data[i]['fact_return'] + '</button></td>');
                                }

                            }
                            else {
                                tr.append('<td class="text-center">' + data[i]['fact_in'] + '</td>');
                            }
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>

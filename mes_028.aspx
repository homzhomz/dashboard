<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mes_028.aspx.vb" Inherits="mes_028" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TYP天車區-待拉出清單</title>
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
                background-color: #00FFA9;
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
                        <thead id="table_head"></thead>
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

        function job() {
            $.ajax({
                type: "POST",
                url: "dashboard.ashx",
                data: "fun_na=mes_028",
                async: false,
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        //表頭
                        if (i == 0) {
                            var tablehead = $("#table_head");
                            tablehead.html("");
                            tablehead.append('<tr></tr>');
                            var tr = $('tr:last', tablehead);

                            var table_head = data[i];
                            tr.append('<th class="text-center">No</th>');
                            for (key in table_head) {
                                if (key != 'result') {
                                    tr.append('<th class="text-center">' + key + '</th>');
                                }

                            }
                            var tableBody = $("#table_body");
                            tableBody.html("");
                        }

                        //表身
                        tableBody.append('<tr></tr>');
                        var tr = $('tr:last', tableBody);
                        tr.append('<td class="text-center">' + (i + 1) + '</td>');
                        var table_body = data[i];
                        for (key in table_body) {
                            if (key == '需求原因') {
                                if (table_body[key] == '待出貨') {
                                    tr.append('<td class="text-center"><button type="button" class="btn btn-sm btn-danger">' + table_body[key] + '</button></td>');
                                }
                                else {
                                    tr.append('<td class="text-center">' + table_body[key] + '</td>');
                                }
                            }
                            else if (key != 'result') {
                                tr.append('<td class="text-center">' + table_body[key] + '</td>');
                            }
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>

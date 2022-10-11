<%@ WebHandler Language="VB" Class="MES_WO" %>

Imports System
Imports System.Web
Imports System.Data
Imports EasySoft

Public Class MES_WO : Implements IHttpHandler

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Dim sql As String = ""
        Dim result As String = ""
        Dim tot As Integer = 0
        Dim seq As Integer = 0
        Dim so_no_bef As String = ""
        Dim sb As New StringBuilder
        Select Case context.Request("fun_na")
            Case "TYP"
                sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '150' and a.step_id  in ('P1-1413','P1-1414','P1-1515','P1-1516','P1-0318','W1-1602','W1-2003','W1-2004','P1-0319','P1-0420','P1-0321','P1-0422','W1-2005','W1-2006','P1-1529','P1-0323','P1-1426','P1-1425','P1-0424') and convert(varchar,last_trx_date,111) >= '2020/08/26' order by last_trx_date"
                'sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '150' and node_flat_id not in ('060','070','080','090') and convert(varchar,last_trx_date,111) >= '2020/08/26' order by last_trx_date"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "TTP"
                sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '85' and a.step_id  in ('P1-1413','P1-1414','P1-1515','P1-1516','P1-0318','W1-1602','W1-2003','W1-2004','P1-0319','P1-0420','P1-0321','P1-0422','W1-2005','W1-2006','P1-1529','P1-0323','P1-1426','P1-1425','P1-0424')  and convert(varchar,last_trx_date,111) >= '2021/02/01' order by last_trx_date"
                'sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '85' and node_flat_id not in ('060','070','080','090') and convert(varchar,last_trx_date,111) >= '2021/02/01' order by last_trx_date"
                'sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb2].[MES_TEST].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb2].[MES_TEST].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '85' and /*node_flat_id not in ('070','080','090') and */ convert(varchar,last_trx_date,111) >= '2020/09/29' order by last_trx_date"
                'sql = "select distinct wo_status,wo_id,item_id,entity_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb2].[MES_TEST].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb2].[MES_TEST].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '85' and /*node_flat_id not in ('070','080','090') and */ convert(varchar,last_trx_date,111) >= '2020/09/29' order by last_trx_date"
                result = EasySoft.Json.GetcmdJson(sql)
        End Select
        context.Response.Write(result)
    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class
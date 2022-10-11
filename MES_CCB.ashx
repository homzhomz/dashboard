<%@ WebHandler Language="VB" Class="MES_CCB" %>

Imports System
Imports System.Web
Imports System.Data
Imports EasySoft

Public Class MES_CCB : Implements IHttpHandler

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
                sql = "SELECT factory_id,step_name,step_key,eqp_id,e_tank_area_id,wo_id,entity_id,item_name,item_id,datediff(minute,last_trx_date,getdate()) mins,last_trx_date,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_RELEASE] a where isnull(eqp_id,'') <> '' and factory_id='150' and step_name not in ('檢驗分析站','入庫待驗站','樣瓶收樣站','COA站')"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "TTP"
                sql = "SELECT factory_id,step_name,step_key,eqp_id,e_tank_area_id,wo_id,entity_id,item_name,item_id,datediff(minute,last_trx_date,getdate()) mins,last_trx_date,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_RELEASE] a where isnull(eqp_id,'') <> '' and factory_id='85' and step_name not in ('檢驗分析站','入庫待驗站','樣瓶收樣站','COA站')"
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
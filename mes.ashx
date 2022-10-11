<%@ WebHandler Language="VB" Class="mes" %>

Imports System
Imports System.Web
Imports EasySoft
Public Class mes : Implements IHttpHandler
    Dim result As String = ""
    Dim sql As String = ""
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Select Case context.Request("fun_na")
            Case "v_wo_eqp"
                sql = "select factory_name,eqp_id,isnull(wo_id,'') wo_id,item_name from v_wo_eqp where factory_name='" & context.Request("fact") & "' order by factory_name,eqp_name,eqp_id"
                result = Json.GetcmdJson(sql)
            Case "so_dashboard"
                sql = "select * from [eep-sql-svr].[fms].[dbo].dashboard_so where fac='" & context.Request("site") & "'"
                'sql = "select distinct isnull(substring(convert(varchar,g.update_date,120),12,5),'') oqc,iif(charindex('9999',a.item_no)=0,'-',substring(convert(varchar,f.scale_date,120),12,5)) scale" &
                '        ",iif(charindex('虛擬位置',d.tank_no)>0,'',isnull(d.tank_no,'')) tank_no" &
                '        ",c.car_no" &
                '        ",ship_no" &
                '        ",a.ship_to" &
                '        ",a.item_desc" &
                '        ",a.lot_no" &
                '        ",iif(REPLACE(ISNULL(CONVERT(DATE, c.delivery_time), ''), '1900-01-01', '')='','',substring(convert(varchar,c.delivery_time,120),6,11)) fact_out" &
                '        ",iif(REPLACE(ISNULL(CONVERT(DATE, c.backfac_datetime), ''), '1900-01-01', '')='','',substring(convert(varchar,c.backfac_datetime,120),6,11)) fact_in" &
                '        ",iif(isnull(cost_time,'')<> '' and isnull(c.delivery_time,'')<> '' and isnull(d.tank_no,'') <> '',substring(convert(varchar,dateadd(minute,cost_time,c.delivery_time),120),6,11),'') fact_return" &
                '        " from [ppcek].[mycom].dbo.[CF_SO_DATA_FOR_CLS_V] a " &
                '        " left join [ppcek].[mycom].dbo.tms_shipping_d b on (b.delivery_no = a.so_no or b.delivery_no = a.ship_no or b.delivery_no = a.dn) and b.lotno = a.lot_no" &
                '        " join [ppcek].[mycom].dbo.tms_shipping_h c on b.main_id = c.seq_id" &
                '        " join [eep-sql-svr].[fms].[dbo].FMS_cls_wo d on a.lot_no = d.lot_no" &
                '        " left join [ppcek].[mycom].[dbo].[view_tms_ship_time] e on b.fac = e.ship_from_factory and b.ship_to =  e.ship_to" &
                '        " left join [eep-sql-svr].[fms].[dbo].FMS_lms_TANKTRX_TMP f on  a.ship_no = f.DOC_NO " &
                '        " left join [eep-sql-svr].[fms].[dbo].FMS_tms_OQC g on (a.so_no = g.delivery_no or  a.ship_no = g.delivery_no or  a.dn = g.delivery_no)" &
                '        " where convert(varchar,ship_date,111)='" & Now.ToString("yyyy/MM/dd") & "'" &
                '        " and p_data like '%銷%' and b.fac='" & context.Request("site") & "' order by iif(REPLACE(ISNULL(CONVERT(DATE, c.delivery_time), ''), '1900-01-01', '')='','',substring(convert(varchar,c.delivery_time,120),6,11)) "
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
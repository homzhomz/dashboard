<%@ WebHandler Language="VB" Class="dashboard" %>

Imports System
Imports System.Web
Imports EasySoft
Public Class dashboard : Implements IHttpHandler
    Dim result As String = ""
    Dim sql As String = ""
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Select Case context.Request("fun_na")
            Case "mes_027"
                If context.Request("site") = "TYP" Then
                    sql = "select * from [eep-sql-svr].[fms].[dbo].dash_wo_01 where 工單 like 'PW%'"
                Else
                    sql = "select * from [eep-sql-svr].[fms].[dbo].dash_wo_01 where 工單 like 'EW%'"
                End If
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_028"
                sql = "SELECT DEMAND_DATE 需求日期,槽號,品名,lot_no 批號,TANK_USAGE 需求原因 FROM [192.168.181.11].[Crane].[dbo].[儲位狀態記錄] a " &
                        " join [eep-sql-svr].[fms].[dbo].FMS_lms_SCH_INFO b on a.槽號=b.tank_no where status=0 union " &
                        " SELECT ship_date,[槽號],[品名],lot_no,'待出貨' FROM [192.168.181.11].[Crane].[dbo].[儲位狀態記錄] c " &
                        " join [eep-sql-svr].[fms].[dbo].[view_mes_wo] a on c.槽號 = a.e_tank_no" &
                        " join [eep-sql-svr].[fms].[dbo].[FMS_cls_SO] b on a.e_erp_entity_id = b.lot_no " &
                        " where convert(varchar,ship_date,111) >= convert(varchar,getdate(),111) and e_tank_no <> ''" &
                        " and c.槽號 not in (SELECT tank_no FROM [eep-sql-svr].[fms].[dbo].V_FMS_lms_SCALE_SHIPDATA where convert(varchar,scale_date,111) = convert(varchar,getdate(),111) and scale_type='回廠')" &
                        " union SELECT DEMAND_DATE 需求日期,槽號,品名,'','原料還櫃' FROM [192.168.181.11].[Crane].[dbo].[儲位狀態記錄] a " &
                        " join [eep-sql-svr].[fms].[dbo].V_FMS_lms_SCH_TODAY b on a.槽號=b.tank_no where convert(varchar,demand_date,111) =convert(varchar,getdate(),111)"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_029"
                sql = "select * from [eep-sql-svr].[fms].[dbo].dash_so_01 where item_no <>'' and isnull(dn,'') <> '' and convert(varchar,ship_date,111) = convert(varchar,getdate(),111)  and fac='" & context.Request("site") & "'"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_030"
                sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '150' and a.step_id  in ('P1-1413','P1-1414','P1-1515','P1-1516','P1-0318','W1-1602','W1-2003','W1-2004','P1-0319','P1-0420','P1-0321','P1-0422','W1-2005','W1-2006','P1-1529','P1-0323','P1-1426','P1-1425','P1-0424') and convert(varchar,last_trx_date,111) >= '2020/08/26' order by last_trx_date"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_031"
                sql = "select factory_id,step_name,step_key,eqp_id,e_tank_area_id,wo_id,entity_id,item_name,item_id,datediff(minute,last_trx_date,getdate()) mins,last_trx_date,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_RELEASE] a where isnull(eqp_id,'') <> '' and factory_id='150' and step_name not in ('檢驗分析站','入庫待驗站','樣瓶收樣站','COA站')"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_032"
                sql = "select distinct wo_status,wo_id,item_id,item_name,convert(numeric(10,0),wo_qty) wo_qty,step_name,stay_mins,next_step,pda_step,eqp_id,carrier_id,last_trx_date,NODE_FLAT_ID,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '85' and a.step_id  in ('P1-1413','P1-1414','P1-1515','P1-1516','P1-0318','W1-1602','W1-2003','W1-2004','P1-0319','P1-0420','P1-0321','P1-0422','W1-2005','W1-2006','P1-1529','P1-0323','P1-1426','P1-1425','P1-0424')  and convert(varchar,last_trx_date,111) >= '2021/02/01' order by last_trx_date"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "mes_033"
                sql = "select factory_id,step_name,step_key,eqp_id,e_tank_area_id,wo_id,entity_id,item_name,item_id,datediff(minute,last_trx_date,getdate()) mins,last_trx_date,convert(varchar,dateadd(minute,(select AVG(mins) FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] where step_key=a.step_key and wo_qty=a.wo_qty order by times desc,mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_RELEASE] a where isnull(eqp_id,'') <> '' and factory_id='85' and step_name not in ('檢驗分析站','入庫待驗站','樣瓶收樣站','COA站')"
                result = EasySoft.Json.GetcmdJson(sql)

            Case "ccb_id"
                sql = "SELECT ccb_id,weight  FROM [typ-new-lims-db].[DW].[dbo].[v_plc_ccb]"
                result = EasySoft.Json.GetcmdJson(sql)
            Case "typ_ccb"
                sql = "select Left(a.TANK_AREA_DESC, 3) As factory, " &
                    "a.TANK_AREA_DESC as ccb_location, " &
                    "a.TANK_AREA_ID As ccb_id, " &
                    "isnull(b.weight, 0) As ccb_weight, " &
                    "c.wo_id, " &
                    "c.ENTITY_ID As entity_id, " &
                    "c.item_name, " &
                    "c.carrier_id," &
                    "c.step_name, " &
                    "c.stay_mins, " &
                    "c.step_finish_datetime " &
                    "from [ttp-mesdb1].[MES_PROD].[dbo].[CBRM_TANK_AREA] a " &
                    "Left Join  [typ-New-lims-db].[DW].[dbo].[v_plc_ccb] b on a.TANK_AREA_ID = b.ccb_id " &
                    "Left Join( select distinct tank_area_id,wo_id, ENTITY_ID, item_name, carrier_id, step_name, stay_mins, " &
                    "Convert(varchar, DateAdd(Minute, (select AVG(mins) " &
                    "FROM ( SELECT TOP 3 mins FROM [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_QTY_FORCAST_MINS] " &
                    "where step_key = a.step_key And wo_qty = a.wo_qty order by times desc, mins desc ) as mins),LAST_TRX_DATE),120) step_finish_datetime " &
                    "from [ttp-mesdb1].[MES_PROD].[dbo].[V_WO_AREA_STATUS] a where FACTORY_ID = '150' and " &
                    "a.step_id  in ('P1-1413','P1-1414','P1-1515','P1-1516','P1-0318','P1-0424','P1-0425','P1-0426' ) and " &
                    "Convert(varchar, last_trx_date, 111) >= '2020/08/26' ) as c on a.TANK_AREA_ID = c.tank_area_id " &
                    "where left(a.TANK_AREA_DESC,3) = '" & context.Request("factory") & "'"
                result = EasySoft.Json.GetcmdJson(sql)


                'Case "typ_ccb"
                '    sql = "select left(a.TANK_AREA_DESC,3) as factory, " &
                '            "a.TANK_AREA_DESC as ccb_location, " &
                '            "a.TANK_AREA_ID as ccb_id, " &
                '            "isnull(b.weight,0) as ccb_weight " &
                '            "from [ttp-mesdb1].[MES_PROD].[dbo].[CBRM_TANK_AREA] a " &
                '            "left join  [typ-new-lims-db].[DW].[dbo].[v_plc_ccb] b on a.TANK_AREA_ID = b.ccb_id " &
                '            "where left(a.TANK_AREA_DESC,3) = '" & context.Request("factory") & "'"

                '    result = EasySoft.Json.GetcmdJson(sql)


                '" & context.Request("fact") & "' 
            Case "typ_factory"
                sql = "Select distinct TANK_AREA_DESC as ccb_area_name from [ttp-mesdb1].[MES_PROD].[dbo].[CBRM_TANK_AREA] where TANK_AREA_DESC Like '%" & context.Request("factory") & "%'"
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
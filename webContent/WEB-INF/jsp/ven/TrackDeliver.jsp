<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/dhcc/easyui.css">
<link href="<%=request.getContextPath()%>/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/ord/datagrid-detailview.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/ven/TrackDeliver.js"></script>			
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>	

</head>
<body>
	
	
	
	
	
	
	<table id="datagrid" ></table>	

	<div id="detail" class="dialog" title="发货单明细"
		data-options="modal:true,width:900,height:350,closed:true,maximizable:true"
		style="vertical-align: middle">
		<table id="detailgrid" />
	</div>
	
	
	<div id="toolbar" style="height: auto">
	    <div  style="margin-bottom:5px;margin-top:5px">
			订单接收开始时间: <input class="datetimebox" style="width:200px" id="acpStDate">
			订单接收结束时间: <input class="datetimebox" style="width:200px" id="acpEdDate">
			医&nbsp;&nbsp;&nbsp;&nbsp;院:
			<input class="combobox" panelHeight="auto" style="width:250px" id="hopSearch"/>
			
		</div>
		<div style="margin-bottom:5px">
			订单发货开始日期: <input class="datetimebox" style="width:200px" id="delStDate">
			订单发货结束日期: <input class="datetimebox" style="width:200px" id="delEdDate">
			入库科室:
			<input class="combobox" panelHeight="auto" style="width:250px" id="purlocSearch"/>
			
		 </div>
		 <div style="margin-bottom:5px">
		 	加急:<input type="checkbox" id="emflag"/>
			订单发货状态
			<input class="combobox" panelHeight="auto" style="width:250px" id="delFlag"/>
			
		 	<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		 </div>
			
		 </div>	
		 
		 		
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/metro-blue/easyui.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/ord/datagrid-detailview.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/ven/VenOrderState.js"></script>
<!--  -->	
<link href="<%=request.getContextPath()%>/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />	


</head>
<body>
	
	<table id="datagrid" ></table>
   
   
   
   
	<div id="detail" class="dialog" title="订单明细"
		data-options="modal:true,width:700,height:350,closed:true,maximizable:true"
		style="vertical-align: middle">
		<table id="detailgrid" style="width: 100%"/>
	</div>
	
	
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			订单开始日期: <input class="datetimebox" style="width:200px" id="stdate">
			结束日期: <input class="datetimebox" style="width:200px" id="eddate">
			状态:
			<input class="combobox" panelHeight="auto" style="width:150px" id="state"/>
			医院:
			<input class="combobox" panelHeight="auto" style="width:250px" id="hop"/>
			
			
		 </div>
		 <div style="margin-bottom:5px">
			要求到达日期: <input class="datetimebox" style="width:200px" id="reqStDate">
			结束日期: <input class="datetimebox" style="width:200px" id="reqEdDate">
			加急:<input type="checkbox" id="emflag"/>
		</div>
		<div>	
			入库科室:
			<input class="combobox" panelHeight="auto" style="width:250px" id="purloc"/>
			收货科室:
			<input class="combobox" panelHeight="auto" style="width:250px" id="recloc"/>
			<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		</div>
			
	</div>			
</body>
</html>

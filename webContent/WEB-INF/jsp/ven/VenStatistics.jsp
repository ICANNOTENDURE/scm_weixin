<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ven/VenStatistics.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">

			开始日期:<input type="text"  name="dto.ordStart" class="datebox"  style="width:100px" id="StDate"/>
			结束日期:<input type="text" name="dto.ordEnd" class="datebox" style="width:100px" id="EdDate">
			商品名称:<input type="text" name="dto.venincname"  style="width:100px">
			医院名称:<input type="text" name="dto.hosp"  style="width:100px">
		<a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
		<a
			class="linkbutton" data-options="iconCls:'icon-save',plain:true"
			id="down">下载</a>	 	 	
	</div>


	<table id="datagrid" style="height: 250px" title="药品汇总统计出货单"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

</body>
</html>

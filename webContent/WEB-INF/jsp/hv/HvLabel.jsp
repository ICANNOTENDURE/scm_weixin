<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hv/hvLabel.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
	
			医嘱开始日期:<input type="text"  name="dto.ordStart" class="datebox"  style="width:100px" id="StDate"/>
			医嘱结束日期:<input type="text" name="dto.ordEnd" class="datebox" style="width:100px" id="EdDate">
			发票号:<input type="text" name="dto.invno"  style="width:100px">
			商品名称:<input type="text" name="dto.incname"  style="width:100px">
			同步标志:<select class="combobox" panelHeight="auto" style="width:100px"  name="dto.flag">
								<option value="0">空</option>
								<option value="1">已同步</option>
								<option value="2">未同步</option>
							</select>	
		<a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
		<a
			class="linkbutton" data-options="iconCls:'icon-save',plain:true"
			onclick="javascript:save()">保存</a>
		<a
			class="linkbutton" data-options="iconCls:'icon-save',plain:true"
			id="down">下载</a>
		<br>	
		按第一行填写发票<input type="checkbox" id="auto">	 	 	
	</div>


	<table id="datagrid" style="height: 250px" title="高值发票录入"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

</body>
</html>

<!-- zxx 2014-04-19 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ven/Vendor.js"></script>
</head>
<body>
	<!-- toolbar -->
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>

	<!-- grid -->
	<table id="datagrid" title='供应商管理'
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true"   >
	</table>

	<!-- 增加界面 -->
	<div id="addWin" class="dialog" 
		data-options="modal:true,width:750,height:500,closed:true,maximizable:true,resizable:true"
		style="vertical-align: top;">
		<iframe id="addFrame"  style="width:100%;height:100%;"  frameborder="0" ></iframe>
	</div>
	<!-- 修改界面 -->
	<div id="editWin" class="dialog" 
		data-options="modal:true,width:750,height:500,closed:true,maximizable:true" style="vertical-align: middle;">
		<iframe id="editFrame"  style="width:100%;height:100%;" frameborder="0" ></iframe>
	</div>
	<!-- 查询条件 -->
	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:300,height:200,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<br>
		<div align="center">
			<label>代码：</label> <input type="text" name="dto.vendor.code" />
		</div>
		<br>
		<div align="center">
			<label>名称：</label> <input type="text" name="dto.vendor.name" />
		</div>
		<br>
		<div align="center">
			<label>别名：</label> <input type="text" name="dto.vendor.alias" />
		</div>
		<br>
		<div id="searchBtnDiv" align="center">
			<a id="selectBt" class="linkbutton"
				data-options="iconCls:'icon-save'">提交</a> <a id="selectCanBt"
				class="linkbutton" data-options="iconCls:'icon-cancel'"
				onclick="javascript:selectCanBtClick()">取消</a>
		</div>
	</div>
</body>
</html>

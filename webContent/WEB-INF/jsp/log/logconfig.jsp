<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/log/logconfig.js"></script>
<title>日志配置管理</title>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>
	<table id="datagrid" style="height: 250px"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true" title="日志配置">
	</table>

	<div id="detailWin" class="dialog" title="新增日志信息"
		data-options="modal:true,width:600,height:500,closed:true"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<div align="center">
				<input type="hidden" name="dto.logConfigure.id" id="id"/>
			</div>
			<br>
			<div align="center">
				<label for="personName">操作名称:</label>
				<textarea id="title" name="dto.logConfigure.title"></textarea>
			</div>
			<br>
			<div align="center">
				<label for="birth">接口设置:</label>
				<textarea id="method" name="dto.logConfigure.method"></textarea>
			</div>
			<br>
			<div align="center">
				<label for="address">参数设置:</label>
				<textarea id="args" name="dto.logConfigure.args"></textarea>
			</div>
			<br>
			<div align="center">
				<a id="submitBtn" class="linkbutton"
					data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
					class="linkbutton" data-options="iconCls:'icon-cancel'"
					onclick="javascript:cancelClick()">放弃</a>
			</div>
		</form>
	</div>


	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:600,height:500,closed:true"
		style="vertical-align: middle;">
		<br>
		<div align="center">
			<label for="personName">操作名称:</label>
			<textarea id="title1" name="dto.logConfigure.title"></textarea>
		</div>
		<br>
		<div align="center">
			<label for="phone">接口设置:</label>
			<textarea id="method1" name="dto.logConfigure.method"></textarea>
		</div>
		<br>
		<div align="center">
			<label for="phone">参数设置:</label>
			<textarea id="args1" name="dto.logConfigure.args"></textarea>
		</div>
		<br>
		<div align="center">
			<a id="selectBt" class="linkbutton"
				data-options="iconCls:'icon-save'">提交</a> <a id="selectCanBt"
				class="linkbutton" data-options="iconCls:'icon-cancel'"
				onclick="javascript:selectCanBtClick()">放弃</a>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/config/config.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:reStart()">重启</a>
	</div>
	<div id="hibtoolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:reStart()">重启</a>
	</div>
	<div id="tt" class="tabs" style="height: 900px">
		<div title="修改应用服务器信息" style="padding:20px;">   
			<table id="datagrid" 
				data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true">
			</table>
		</div>
		<div title="修改数据库配置信息" style="padding:20px">   
			<table id="hibdatagrid" 
				data-options="toolbar:'#hibtoolbar',fitColumns:true,singleSelect:true">
			</table>
		</div>
	</div>
	<div id="detailWin" class="dialog" title="新增"
		data-options="modal:true,width:400,height:150,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table style="width: 100%;">
				<input name="dto.actionName" id="actionName" type="hidden" />
				<tr>
					<td class="textLabel">属性名:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.confItem.key"
						data-options="required:true" id="key"/></td>					
				</tr>
				<tr>
					<td class="textLabel">属性值:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.confItem.value"
						data-options="required:true" id="value"/></td>					
				</tr>
			</table>								
			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	
</body>
</html>
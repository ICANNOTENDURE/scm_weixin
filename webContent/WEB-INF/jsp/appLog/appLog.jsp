<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台运维及安全管理-日志管理</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/appLog/appLog.js"></script>
</head>
<body>
	<table id="appLogGrid" class="datagrid" fit="true"
		data-options="rownumbers:true,toolbar:'#toolbar',method:'post',url:'appLogCtrl.htm',
		    queryParams:{'dto.appLog.logType': '3'},
		    pagination:true,fitColumns:true,singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'logType',hidden:true">日志类型</th>
				<th data-options="field:'dealStatus',width:100,align:'center'">交易状态</th>
				<th data-options="field:'operateAccount',width:100,align:'center'">操作人员</th>
				<th data-options="field:'operateRole',width:100,align:'center'">操作人员角色</th>
				<th data-options="field:'dealStartTime',width:100,align:'center'">交易开始时间</th>
				<th data-options="field:'dealEndTime',width:100,align:'center'">交易结束时间</th>
				<th data-options="field:'operateOrgCode',width:150,align:'center'">交易发起机构</th>
				<th data-options="field:'rootDealCode',width:100,align:'center'">根交易号</th>
				<th data-options="field:'currentDealCode',width:100,align:'center'">当前交易号</th>
			</tr>
		</thead>
	</table>

	<div id="queryByTimeWindow" class="window"
		style="width: 450px; height: 150px; padding: 10px;"
		data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,onClose:function(){clear();}">
		<form id="queryByTimeForm" method="post">
			<table>
				<tr>
					<td style="text-align: right; width: 70px;">时间范围:</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.logStartTimeS" id="logStartTimeSByTime"
						data-options="required:true" style="width: 145px;" /></td>
					<td style="text-align: right; width: 15px;">至</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.logStartTimeE" id="logStartTimeEByTime"
						data-options="required:true" style="width: 145px;" /></td>
				</tr>
				<tr>
					<td style="text-align: left" colspan="4"><input
						class="validatebox" name="dto.appLog.logType" hidden="true"
						id="logTypeByTime" type="text" data-options="required:false"
						style="width: 310px;" /></td>
				</tr>
			</table>
			<div style="margin-top: 30px;" align="center">
				<a id="queryByTimeBtn" href="###" class="linkbutton"
					data-options="iconCls:'icon-save'">查询</a> <a
					id="queryByTimeResetBtn" href="###" class="linkbutton"
					data-options="iconCls:'icon-cancel'">重置</a>
			</div>
		</form>
	</div>
	<div id="queryAppLogWindow" class="window"
		style="width: 400px; height: 150px; padding: 10px;"
		data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,onClose:function(){}">

		<form id="queryAppLogForm" method="post">
			<table>
				<tr>
					<td style="text-align: right; width: 70px;">时间范围:</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.logStartTimeS" id="logStartTimeS"
						data-options="required:true" style="width: 120px;" /></td>
					<td style="text-align: right; width: 15px;">至</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.logStartTimeE" id="logStartTimeE"
						data-options="required:true" style="width: 120px;" /></td>
				</tr>
				<tr>
					<td style="text-align: right; width: 70px;">日志类型:</td>
					<td style="text-align: left"><input id="logType"
						class="combobox" name="dto.appLog.logType"
						data-options="
			              dict:'log_type',
			              valueField:'value',
			              textField:'desc',
			              multiple:true,
			              panelHeight:'auto'" />
					</td>
				</tr>
			</table>
			<div style="margin-top: 30px;" align="center">
				<a id="queryAppLogBtn" href="###" class="linkbutton"
					data-options="iconCls:'icon-save'">查询</a> <a
					id="queryAppLogResetBtn" href="###" class="linkbutton"
					data-options="iconCls:'icon-cancel'">重置</a>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台运维及安全管理-日志管理</title>
<jsp:include page="../common/scriptInc.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/appLog/appLogAudit.js"></script>
</head>
<body>
	<table id="datagrid" class="datagrid" fit="true"
		data-options="rownumbers:true,toolbar:'#toolbar',method:'post',url:'appLogAuditCtrl.htm',
			queryParams:{'dto.appLogAudit.logType': '3'},
			pagination:true,fitColumns:true,singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'rootDealCode',width:100,align:'center'">根交易号</th>
				<th data-options="field:'logType',hidden:true">日志类型</th>
				<th data-options="field:'operateOrg',width:150,align:'center'">交易发起机构</th>
				<th data-options="field:'operateAccount',width:100,align:'center'">操作人员</th>
				<th data-options="field:'operateRole',width:100,align:'center'">操作人员角色</th>
				<th data-options="field:'dealStartTime',width:100,align:'center'">交易开始时间</th>
				<th data-options="field:'dealEndTime',width:100,align:'center'">交易结束时间</th>
				<th
					data-options="field:'operateDescription',width:200,align:'center'">交易描述</th>
				<th data-options="field:'logNum',width:100,align:'center'">相关日志数量</th>
			</tr>
		</thead>
	</table>

	<div id="queryTimeWindow" class="window"
		style="width: 450px; height: 150px; padding: 10px;"
		data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,onClose:function(){clear();}">
		<form id="queryTimeForm" method="post">
			<table>
				<tr>
					<td style="text-align: right; width: 70px;">时间范围:</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.dealStartTimeS"
						id="queryTime_dealStartTimeS" data-options="required:true"
						style="width: 145px;" /></td>
					<td style="text-align: right; width: 15px;">至</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.dealStartTimeE"
						id="queryTime_dealStartTimeE" data-options="required:true"
						style="width: 145px;" /></td>
				</tr>
				<tr>
					<td style="text-align: left" colspan="4"><input
						class="validatebox" name="dto.appLogAudit.logType" hidden="true"
						id="queryTime_logType" type="text" data-options="required:false"
						style="width: 310px;" /></td>
				</tr>
			</table>
			<div style="margin-top: 30px;" align="center">
				<a id="queryTime_btn" href="###" class="linkbutton"
					data-options="iconCls:'icon-save'">查询</a> <a
					id="queryTime_resetBtn" href="###" class="linkbutton"
					data-options="iconCls:'icon-cancel'">重置</a>
			</div>
		</form>
	</div>
	<div id="queryWindow" class="window"
		style="width: 400px; height: 150px; padding: 10px;"
		data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,onClose:function(){}">

		<form id="queryForm" method="post">
			<table>
				<tr>
					<td style="text-align: right; width: 70px;">时间范围:</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.dealStartTimeS" id="query_dealStartTimeS"
						data-options="required:true" style="width: 120px;" /></td>
					<td style="text-align: right; width: 15px;">至</td>
					<td style="text-align: left"><input class="datetimebox"
						type="text" name="dto.dealStartTimeE" id="query_dealStartTimeE"
						data-options="required:true" style="width: 120px;" /></td>
				</tr>
				<tr>
					<td style="text-align: right; width: 70px;">日志类型:</td>
					<td style="text-align: left"><input id="query_logType"
						class="combobox" name="dto.appLogAudit.logType"
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
				<a id="query_btn" href="###" class="linkbutton"
					data-options="iconCls:'icon-save'">查询</a> <a id="query_resetBtn"
					href="###" class="linkbutton" data-options="iconCls:'icon-cancel'">重置</a>
			</div>
		</form>
	</div>
</body>
</html>
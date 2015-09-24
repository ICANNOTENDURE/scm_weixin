<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/serverManage/server.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/serverListMode.js"></script>
</head>
<body>
	<div class="listModeBody">
		<div id="toolbar" class="toolbar" style="height: auto">
			<span style="padding-top: 4px; margin-left: 10px;">服务器类型:</span> <input
				id="serverType" class="combobox" name="serverDto.server.serverType"
				data-options="
        dict:'server_type',
        valueField:'value',
        textField:'desc',
        multiple:false,
        required:false,
        panelHeight:'auto'" />
		</div>
		<table id="datagrid" class="datagrid" fit="true"
			data-options="
      toolbar:'#toolbar',
      rownumbers:true,
      method:'post',
      url:'serverCtrl!getServerList.htm',
      pagination:true,
      fitColumn:true,
      singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'serverType',width:140,align:'center'">服务器类型</th>
					<th data-options="field:'serverName',width:150,align:'center'">服务器名称</th>
					<th data-options="field:'port',width:100,align:'center'">端口号</th>
					<th data-options="field:'ip',width:120,align:'center'">IP地址</th>
					<th data-options="field:'ipType',width:80,align:'center'">IP类型</th>
					<th data-options="field:'onlineState',width:100,align:'center'">在线状态</th>
					<th data-options="field:'regTime',width:170,align:'center'">注册时间</th>
					<th
						data-options="field:'serverId',width:200,align:'center',formatter:hyperlink">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>
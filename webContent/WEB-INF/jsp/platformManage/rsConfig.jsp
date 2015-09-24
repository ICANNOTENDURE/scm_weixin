<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/rsConfig.js"></script>
</head>
<body>
	<!-- <div id="toolbar" class="toolbar" style="height:auto">
      <a class="linkbutton" data-options="iconCls:'icon-add',plain:true"
        onclick="javascript:addRow()">添加</a>
      <a class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
        onclick="javascript:editRow()">更新</a>
      <a class="linkbutton" data-options="iconCls:'icon-remove',plain:true"
        onclick="javascript:delRow()">删除</a>
      <a class="linkbutton" data-options="iconCls:'icon-search',plain:true"
        onclick="condSearchClick()">条件查找</a>
    <div style="float:left;position:absolute;right:100px;">
      <span style="margin-left:300px;">查询条件:</span>
    </div> -->
	</div>
	<table id="datagrid" class="datagrid" fit="true"
		data-options="
    toolbar:'#toolbar',
    rownumbers:true,
    method:'post',
    url:'receiveServerConfigCtrl!findRsPriorityList',
    pagination:true,
    fitColumn:true,
    singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'gatewayId',hidden:true">接收服务器唯一标识符</th>
				<th data-options="field:'serverName',width:120,align:'left'">接收服务器名称</th>
				<th data-options="field:'ip',width:100,align:'left'">IP地址</th>
				<th data-options="field:'port',width:60,align:'left'">端口号</th>
				<th data-options="field:'priorityCode',width:80,align:'left'">优先级代码</th>
				<th data-options="field:'useState',width:70,align:'left'">使用状态</th>
				<th data-options="field:'certId',width:120,align:'left'">证书信息</th>
				<th data-options="field:'systemType',width:100,align:'left'">系统类型</th>
				<th data-options="field:'onlineState',width:90,align:'left'">系统在线状态</th>
				<th data-options="field:'version',width:70,align:'left'">版本信息</th>
				<th data-options="field:'updateTime',width:180,align:'left'">系统更新时间</th>
				<th data-options="field:'regTime',width:180,align:'left'">服务器接入时间</th>
			</tr>
		</thead>
	</table>

	<div id="rsConfigWin" class="window" style="verticle-align: middle;"
		data-options="modal:true,width:400,height:'auto',closed:true,onClose:function(){clear();}">
		<form id="rsConfigForm" method="post">
			<br>
			<table id="addRsConfig">
				<tr class="row" align="right" style="display: none">
					<td>接收服务器唯一标识符:</td>
					<td><input name="rsPriorityDto.rsPriority.gatewayId"
						type="text" data-options="required:false" style="width: 240px;">
					</td>
				</tr>
				<tr align="right">
					<td width="100">接收服务器名称:</td>
					<td><input name="rsPriorityDto.server.serverName" type="text"
						data-options="required:true" style="width: 240px;"></td>
				</tr>
				<tr align="right">
					<td width="100">IP地址:</td>
					<td><input name="rsPriorityDto.server.ip" type="text"
						data-options="required:true" style="width: 240px;"></td>
				</tr>
				<tr align="right">
					<td width="100">端口号:</td>
					<td><input name="rsPriorityDto.server.port" type="text"
						data-options="required:true" style="width: 240px;"></td>
				</tr>
				<tr align="right">
					<td width="100">优先级代码:</td>
					<td><input class="validatebox"
						name="rsPriorityDto.rsPriority.priorityCode" type="text"
						data-options="required:true" style="width: 240px;"></td>
				</tr>
				<tr align="right">
					<td width="100">使用状态:</td>
					<td style="text-align: left"><select class="combobox"
						name="rsPriorityDto.rsPriority.useSatate"
						data-options="editable:false,multiple:false,width:200,panelHeight:'auto'">
							<option value="使用" selected="true">使用</option>
							<option value="停用">停用</option>
					</select> <!-- <input class="combobox" name="rsPriorityDto.rsPriority.useSatate" style="width:155px;" data-options="
            required:false,
            valueField:'value',
            textFiled:'show',
            panelHeight:'auto',
            data: [{
              show: '在线',
              value: '1'
            },{
              show: '离线',
              value: '0'
            }]"/> --></td>
				</tr>
				<tr align="right">
					<td width="100">证书信息:</td>
					<td><input class="validatebox"
						name="rsPriorityDto.cert.certId" type="text"
						data-options="required:false" style="width: 240px;"></td>
				</tr>
				<tr align="right">
					<td width="100">系统类型:</td>
					<td style="text-align: left"><input class="combobox"
						name="rsPriorityDto.gateway.systemType" style="width: 200px;"
						data-options="
              url:'',
              required:false,
              method:'get',
              valueField:'gatewayId',
              textField:'systemType',
              multiple:false,
              panelHeight:'auto'">
					</td>
				</tr>
				<tr align="right">
					<td width="100">系统在线状态:</td>
					<td style="text-align: left"><input class="combobox"
						name="rsPriorityDto.gateway.onlineState" type="text"
						data-options="required:false" style="width: 200px;"></td>
				</tr>
				<tr align="right">
					<td width="100">版本信息:</td>
					<td><input class="validatebox"
						name="rsPriorityDto.gateway.version" type="text"
						data-options="required:false" style="width: 240px;"></td>
				</tr>
				<tr id="row" align="right" style="display: none;">
					<td width="100">系统更新时间:</td>
					<td><input class="validatebox"
						name="rsPriorityDto.gateway.updateTime" type="text"
						data-options="required:false" style="width: 240px;"></td>
				</tr>
				<tr id="row" align="right" style="display: none;">
					<td width="100">服务器接入时间:</td>
					<td><input class="validatebox"
						name="rsPriorityDto.server.regTime" type="text"
						data-options="required:false" style="width: 240px;"></td>
				</tr>
			</table>
			<br>

			<div id="winBtn" align="center">
				<a id="submitBtn" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">提交</a> <a
					id="querySubmitBtn" class="linkbutton"
					data-options="iconCls:'icon-search',plain:true">查询</a> <a
					id="cancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>
</body>
</html>
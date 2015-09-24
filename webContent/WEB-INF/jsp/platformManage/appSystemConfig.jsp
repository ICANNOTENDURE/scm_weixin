<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/appSystemConfig.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar" style="height: auto">
		<span">查询条件:</span> <select id="gatewayColumnName" panelHeight="auto">
			<option value="onlineState" selected="true"
				name="gatewayDto.gateway.onlineState">在线状态</option>
			<option value="useState" name="gatewayDto.gateway.useState">使用状态</option>
		</select> <input id="gatewayColumnValue" type="text" /> <a id="searchBtn"
			class="linkbutton" data-options="iconCls:'icon-search'">快速查找</a>
	</div>
	<table id="datagrid" class="datagrid" fit="true"
		data-options="
  	toolbar:'#toolbar',
  	rownumbers:true,
  	method:'post',
  	url:'appSystemConfigCtrl!gatewayList.htm',
  	pagination:true,
  	fitColumn:true,
  	singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'gatewayId',hidden:true">唯一标识符</th>
				<th data-options="field:'systemType',width:115,align:'center'">应用系统类型</th>
				<th data-options="field:'port',width:95,align:'center'">应用系统端口号</th>
				<th data-options="field:'version',width:80,align:'center'">版本信息</th>
				<th data-options="field:'useState',width:80,align:'center'">使用状态</th>
				<th data-options="field:'regTime',width:145,align:'center'">注册时间</th>
				<th data-options="field:'updateTime',width:145,align:'center'">更新时间</th>
				<th data-options="field:'certSerialNum',width:115,align:'center'">证书序列号</th>
				<th data-options="field:'serverName',width:130,align:'center'">已安装的服务器
				</th>
				<th data-options="field:'serverType',width:130,align:'center'">服务器类型</th>
				<th data-options="field:'onlineState',width:80,align:'center'">在线状态</th>

				<!-- <th data-options="field:'gatewayId',width:105,align:'left',hidden:true">服务器配置入口</th> -->
			</tr>
		</thead>
	</table>

	<div id="detailWin" class="dialog" style="verticle-align: middle;"
		data-options="modal:true,width:400,heiht:'auto',closed:true,onClose:function(){clear();}">
		<form id="detail" method="post">
			<br>
			<table>
				<tr id="rowId" align="right" style="display: none">
					<td width="100">应用系统编号:</td>
					<td style="text-align: left"><input class="validatebox"
						name="gatewayDto.gateway.gatewayId" type="text"
						data-options="requird:false" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td>应用系统类型:</td>
					<td style="text-align: left"><input class="validatebox"
						name="gatewayDto.gateway.systemType" type="text"
						data-options="required:true" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td width="100">应用系统端口号:</td>
					<td style="text-align: left"><input class="validatebox"
						name="gatewayDto.gateway.port" type="text"
						data-options="requird:false" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td>版本信息:</td>
					<td style="text-align: left"><input class="validatebox"
						name="gatewayDto.gateway.version" type="text"
						data-options="required:true" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td>使用状态:</td>
					<td style="text-align: left"><input id="useState"
						class="combobox" name="gatewayDto.gateway.useState"
						data-options="
              dict:'use_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:200,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td>注册时间:</td>
					<td><input id="regTime" class="datetimebox"
						name="gatewayDto.gateway.regTime" type="text"
						data-options="required:false" style="width: 256px;" /></td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td>更新时间:</td>
					<td><input id="updateTime" class="datetimebox"
						name="gatewayDto.gateway.updateTime" type="text"
						data-options="required:false" style="width: 256px;" /></td>
				</tr>
				<!-- <tr align="right">
		    <td width="100">安装的服务器:</td>
		    <td style="text-align:left"><input class="validatebox" name="gatewayDto.gatewayVo.serverName"
		      type="text" data-options="required:true" style="width:250px;"/>
		    </td>
		  </tr>
		  <tr align="right">
		    <td>证书序列号:</td>
		    <td style="text-align:left"><input class="validatebox" name="gatewayDto.gatewayVo.certSerialNum"
		      type="text" data-options="required:false" style="width:250px;"/>
		    </td>
		  </tr> -->
				<tr class="row" align="right" style="display: none">
					<td>在线状态:</td>
					<td style="text-align: left"><input id="onlineState"
						class="combobox" name="gatewayDto.gateway.onlineState"
						data-options="
              dict:'online_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:200,
              panelHeight:'auto'" />
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
				<a id="submitBtn" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true" hidden:true>提交</a> <a
					id="cancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>

	<div id="queryWin" class="dialog" style="vertical-align: middle;"
		data-options="modal:true,width:400,height:'auto',closed:true,onClose:function(){clear();}">
		<form id="queryForm" method="post">
			<br>
			<table>
				<tr align="right">
					<td width="100">应用系统类型:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="gatewayDto.gateway.systemType"
						type="text" data-options="required:false" style="width: 250px;" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">应用系统端口号:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="gatewayDto.gateway.port" type="text"
						data-options="required:false" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td width="100">版本信息:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="gatewayDto.gateway.version" type="text"
						data-options="required:false" style="width: 250px;" /></td>
				</tr>
				<tr align="right">
					<td width="100">使用状态:</td>
					<td colspan="3" style="text-align: left"><input
						class="combobox" name="gatewayDto.gateway.useState"
						data-options="
              dict:'use_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:256,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">证书序列号:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="gatewayDto.cert.certSerialNum"
						type="text" data-options="required:false" style="width: 250px;" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">安装的服务器:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="gatewayDto.server.serverName"
						type="text" data-options="required:false" style="width: 250px;" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">在线状态:</td>
					<td colspan="3" style="text-align: left"><input
						class="combobox" name="gatewayDto.gateway.onlineState"
						data-options="
              dict:'online_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:256,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">注册时间:</td>
					<td style="text-align: left"><input class="datetimebox"
						name="gatewayDto.regTimeS" type="text"
						data-options="required:false" style="width: 120px;" /></td>
					<td style="text-align: left">至</td>
					<td style="text-align: left"><input class="datetimebox"
						name="gatewayDto.regTimeE" type="text"
						data-options="required:false" style="width: 120px;" /></td>
				</tr>
				<tr align="right">
					<td width="100">更新时间:</td>
					<td style="text-align: left"><input class="datetimebox"
						name="gatewayDto.updateTimeS" type="text"
						data-options="required:false" style="width: 120px;" /></td>
					<td style="text-align: left">至</td>
					<td style="text-align: left"><input class="datetimebox"
						name="gatewayDto.updateTimeE" type="text"
						data-options="required:false" style="width: 120px;" /></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<a id="querySubmitBtn" class="linkbutton"
					data-options="iconCls:'icon-search',plain:true">查找</a> <a
					id="queryCancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>
</body>
</html>
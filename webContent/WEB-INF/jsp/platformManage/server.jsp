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
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/server.js"></script>
</head>
<body>
	<div class="fhead">
		<div class="fTop">
			<div class="middle">
				<div id="health">
					<label>健康值: 80</label> <img class="sign" alt="red_light"
						src="../images/serverManage/red.png" style="display: none">
					<img class="sign" alt="yellow_light"
						src="../images/serverManage/yellow.png" style="display: none">
					<img class="sign" alt="green_light"
						src="../images/serverManage/green.png"> <img class="sign"
						alt="gray_light" src="../images/serverManage/gray.png"> <img
						class="sign" alt="gray_light"
						src="../images/serverManage/gray.png">
				</div>
				<div id="images">
					<a id="user" class="user"><img
						src="../images/serverManage/user.png"></a> <a id="mail"
						class="mail"><img src="../images/serverManage/mail.png"></a>
					<a id="warning" class="warning"><img
						src="../images/serverManage/warning.png"></a>
				</div>
			</div>
			<div class="top">
				<img src="../images/serverManage/chat.png">
				<p>数据库服务器运行状况良好！&nbsp;&nbsp;&nbsp;&nbsp;日志服务器运行状况良好！&nbsp;&nbsp;&nbsp;&nbsp;接收服务器运行状况良好！</p>
			</div>
		</div>
	</div>

	<div id="addServerWin" class="window" style="vertical-align: middle;"
		data-options="modal:true,width:400,height:'auto',shadow:false,closed:true,onClose:function(){clear();}">
		<form id="addServerForm" method="post">
			<table>
				<tr align="right" style="display: none;">
					<td width="80">服务器编号:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="serverDto.server.serverId" type="text"
						data-options="required:false" style="width: 270px;"></td>
				</tr>
				<tr align="right">
					<td>服务器类型:</td>
					<td colspan="3" style="text-align: left"><input
						class="combobox" name="serverDto.server.serverType"
						style="width: 276px;"
						data-options="
                dict:'server_type',
                valueField:'value',
                textField:'desc',
                multiple:false,
                required:true,
                panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td>服务器名称:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="serverDto.server.serverName"
						style="width: 270px;" data-options="required:true" /></td>
				</tr>
				<tr align="right">
					<td>在线状态:</td>
					<td colspan="3" style="text-align: left"><input
						class="combobox" name="serverDto.server.onlineState"
						style="width: 276px;"
						data-options="
            dict:'online_state',
            valueField:'value',
            textField:'desc',
            multiple:false,
            required:false,
            panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td>服务器端口:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="serverDto.server.port"
						style="width: 270px;" data-options="required:true"></td>
				</tr>
				<tr border="1">
					<td>
				<tr id="newIp" align="right">
					<td>服务器IP:</td>
					<td style="text-align: left"><input class="combobox"
						name="serverDto.server.serverIps.ipType" style="width: 100px;"
						data-options="
                dict:'ip_type',
            	valueField:'value',
            	textField:'desc',
            	multiple:false,
            	required:true,
            	panelHeight:'auto'" />
					</td>
					<td style="text-align: left"><input class="validatebox"
						name="serverDto.server.serverIps.ip" style="width: 140px;"
						data-options="required:true" /></td>
					<td><a id="addIpBtn" class="linkbutton"
						data-options="iconCls:'icon-add',plain:true"
						onclick="javascript:addIp()" disabled="false"></a></td>
				</tr>
				<tr align="right">
					<td>IP使用状态:</td>
					<td colspan="3" style="text-align: left"><input
						class="combobox" name="serverDto.server.serverIps.useState"
						style="width: 276px;"
						data-options="
                dict:'use_state',
                valueField:'value',
                textField:'desc',
                multiple:false,
                required:false,
                panelHeight:'auto'" />
					</td>
				</tr>
				</td>
				</tr>
			</table>
			<br>

			<div align="center">
				<a id="submitBtn" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">提交</a> <a
					id="cancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>

	<div id="serverPanel" border="true" class="" style="overflow: hidden;">
		<iframe scrolling="auto" frameborder="0"
			src="serverCtrl!serverTopoMode.htm"
			style="width: 100%; height: 490px;"></iframe>
	</div>
</body>
</html>
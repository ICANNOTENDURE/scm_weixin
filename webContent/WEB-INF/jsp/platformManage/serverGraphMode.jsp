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
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/serverGraphMode.js"></script>
</head>
<body>
	<!-- <div class="lower">
    <label>区域卫生信息平台服务器图示</label>
  </div> -->
	<div id="mainBody" class="graphMainBody">
		<div id="serverImg">
			<table>
				<tr>
					<td id="DBServer"><h2 class="black-underspanne" align="center">数据库服务器</h2></td>
				</tr>
				<tr>
					<td id="DBServerImg" style="padding-left: 40px;"></td>
				</tr>
				<tr>
					<td id="logServer"><h2 class="black-underspanne"
							align="center">日志服务器</h2></td>
				</tr>
				<tr>
					<td id="logServerImg" style="padding-left: 40px;"></td>
				</tr>
				<tr>
					<td id="appServer"><h2 class="black-underspanne"
							align="center">应用服务器</h2></td>
				</tr>
				<tr>
					<td id="appServerImg" style="padding-left: 40px;"></td>
				</tr>
				<tr>
					<td id="webServer"><h2 class="black-underspanne"
							align="center">WEB服务器</h2></td>
				</tr>
				<tr>
					<td id="webServerImg" style="padding-left: 40px;"></td>
				</tr>
				<tr>
					<td id="receiveServer"><h2 class="black-underspanne"
							align="center">接收服务器</h2></td>
				</tr>
				<tr>
					<td id="receiveServerImg" style="padding-left: 40px;"></td>
				</tr>
				<tr>
					<td id="frontServer"><h2 class="black-underspanne"
							align="center">前置机服务器</h2></td>
				</tr>
				<tr>
					<td id="frontServerImg" style="padding-left: 40px;"></td>
				</tr>
			</table>
		</div>

		<div id="serverBtn">
			<div id="dataBase" class="unselectedBtn">
				<a href="#DBServer"> <img
					src="../images/serverManage/database_server_btn.png"><label>数据库服务器</label></a>
			</div>
			<div class="unselectedBtn">
				<a href="#logServer"> <img
					src="../images/serverManage/log_server_btn.png"><label>日志服务器</label></a>
			</div>
			<div class="unselectedBtn">
				<a href="#appServer"> <img
					src="../images/serverManage/app_server_btn.png"><label>应用服务器</label></a>
			</div>
			<div class="unselectedBtn">
				<a href="#webServer"> <img
					src="../images/serverManage/web_server_btn.png"><label>WEB服务器</label></a>
			</div>
			<div class="unselectedBtn">
				<a href="#receiveServer"> <img
					src="../images/serverManage/receive_server_btn.png"><label>接收服务器</label></a>
			</div>
			<div class="unselectedBtn">
				<a href="#frontServer"> <img
					src="../images/serverManage/front_server_btn.png"><label>前置机服务器</label></a>
			</div>
		</div>

		<div id="mm" class="menu">
			<div id="mm-serverInfo">服务器资源监控</div>
			<!-- <div id="mm-serverConfig">服务器信息配置</div> -->
			<div>
				<span>应用系统管理</span>
				<div>
					<div id="mm-systemInstall">应用安装</div>
					<div>应用升级</div>
					<div>启动应用</div>
					<div>停止应用</div>
				</div>
			</div>
			<div id="mm-network">网络测试</div>
			<div id="mm-org">前置机接入机构</div>
			<!-- <div id="mm-systemVer">上传安装包</div> -->
		</div>

		<div id="rightClickMenuWin" class="dialog"
			style="vertical-align: middle;"
			data-options="modal:true,width:400,height:'auto',shadow:false,closed:true,onClose:function(){clear();}">
			<form id="rightClickMenuForm" method="post">
				<table id="configInfo">
					<tr align="right">
						<td width="70">服务器编号:</td>
						<td><input class="validatebox"
							name="serverDto.server.serverId" type="text"
							data-options="required:false" style="width: 260px;"></td>
					</tr>
					<tr align="right">
						<td>服务器名称:</td>
						<td><input class="validatebox"
							name="serverDto.server.serverName" type="text"
							data-options="required:false" style="width: 260px;"></td>
					</tr>
					<tr align="right">
						<td>服务器类型:</td>
						<td style="text-align: left"><input id="serverClass"
							class="combobox" name="serverDto.server.serverType"
							style="width: 266px;"
							data-options="
                dict:'server_type',
                valueField:'value',
                textField:'desc',
                multiple:false,
                required:false,
                panelHeight:'auto'" />
						</td>
					</tr>
					<!-- <tr align="right">
            <td>系统IP地址:</td>
            <td><input class="validatebox" name="serverDto.server.ip"
              type="text" data-options="required:false" style="width:260px;">
            </td>
          </tr>
          <tr align="right">
            <td>系统端口号:</td>
            <td><input class="validatebox" name="serverDto.server.port"
              type="text" data-options="required:false" style="width:260px;">
            </td>
          </tr>
          <!-- <tr align="right">
            <td>账户名:</td>
            <td><input class="validatebox" name="serverDto.server.userName"
              type="text" data-options="required:false" style="width:260px;">
            </td>
          </tr>
          <tr align="right">
            <td>账户密码:</td>
            <td><input id="password" type="password" name="serverDto.server.password"
              type="text" data-options="required:false" style="width:260px;">
            </td>
          </tr> -->
					<tr align="right">
						<td>在线状态:</td>
						<td style="text-align: left"><input id="on-offline"
							class="combobox" style="width: 266px;"
							name="serverDto.server.onlineState"
							data-options="
                dict:'online_state',
                valueField:'value',
                textField:'desc',
                multiple:false,
                required:false,
                panelHeight:'auto'" />
						</td>
					</tr>
				</table>

				<table id="testNet" style="display: none">
					<tr>
						<td></td>
					</tr>
				</table>

				<div id="menuWinBtn" align="center">
					<a id="menuSubmitBtn" class="linkbutton"
						data-options="iconCls:'icon-save',plain:true">提交</a> <a
						id="netTestBtn" class="linkbutton"
						data-options="iconCls:'icon-save',plain:true"
						style="display: none">测试</a> <a id="menuCancelBtn"
						class="linkbutton" data-options="iconCls:'icon-cancel',plain:true">放弃</a>
				</div>
				<br>
			</form>
		</div>

		<div id="rightClickMenuInstallWin" class="dialog"
			style="vertical-align: middle;"
			data-options="modal:true,width:400,height:'auto',shadow:false,closed:true,onClose:function(){clear();}">
			<form id="installForm" method="post">
				<table id="install" style="display: none">
					<tr align="right">
						<td width="70">服务器编号:</td>
						<td><input class="validatebox"
							name="gatewayDto.gateway.serverId" type="text"
							data-options="required:false" style="width: 260px;"></td>
					</tr>
					<tr align="right">
						<td>系统名称:</td>
						<td><input class="combobox"
							name="gatewayDto.gateway.systemType" style="width: 266px;"
							data-options="
              url:'serverCtrl!getSystemVersion.htm',
              valueField:'systemType',
              textField:'systemName'" />
						</td>
					</tr>
					<tr align="right">
						<td>系统版本:</td>
						<td><input class="combobox" name="gatewayDto.gateway.version"
							style="width: 266px;"
							data-options="
              url:'serverCtrl!getSystemVersion.htm',
              valueField:'version',
              textField:'version'" />
						</td>
					</tr>
				</table>

				<div id="menuInstallWinBtn" align="center">
					<a id="installBtn" class="linkbutton"
						data-options="iconCls:'icon-save',plain:true"
						style="display: none">安装</a> <a id="installCancelBtn"
						class="linkbutton" data-options="iconCls:'icon-cancel',plain:true">放弃</a>
				</div>
				<br>
			</form>
		</div>
	</div>
</body>
</html>
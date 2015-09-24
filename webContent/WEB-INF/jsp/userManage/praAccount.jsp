<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/userManage/praAccount.js"></script>
<style type="text/css">
.textLabel {
	margin-top: 0px;
	margin-left: 0px;
	font-size: 12px;
	text-align: left;
	background-color: #E6F1FA;
}

.textParent {
	margin-top: 0px;
	margin-left: 0px;
	font-size: 12px;
	text-align: left;
	background-color: #F5FAFD;
}

.textLine {
	border: 0px;
	border-bottom: 1px solid #6A7885;
	background-color: transparent;
	color: #000000;
	text-align: left;
}
</style>
</head>
<body class="layout">

	<div data-options="region:'center',border:false"
		class="praAccountCenter" id="praAccountCenter">
		<table id="datagrid" class="datagrid" title="从业人员账户信息列表"
			data-options="
			 fit:true,
			 rownumbers:true,
			 toolbar:'#toolbar',
			 url:'praAccountCtrl!praAccountList.htm',
			 method:'get',
			 pagination:true,
			 fitColumns:true,
			 singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'accountName',width:30">账户代码</th>
					<th data-options="field:'accountAlias',width:30">账户名</th>
					<th
						data-options="field:'useState',width:30,formatter:function(value,row,index){if (value==1){return '可用';} else {return '停用';}}">使用状态</th>
					<th
						data-options="field:'onlineState',width:30,formatter:function(value,row,index){if (value==1){return '在线';} else if(value==2) {return '离线';} else {return '未知';}}">在线状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="toolbar" style="height: auto">
		<span>查询条件:</span> <select id="praAccountColumnName"
			panelHeight="auto" style="width: 100px">
			<option value="accountName">账户代码</option>
			<option value="accountAlias">账户名</option>
		</select> <input id="praAccountColumnValue" style="width: 200px;" type="text" />
		<a id="searchPraAccountBtn" href="#" class="linkbutton"
			iconCls="icon-search">查询</a>
	</div>

	<div id="praAccountDialog" class="dialog" title="添加从业人员账户"
		style="width: 700px; height: 280px; background-color: #F5FAFD;"
		data-options="
				buttons:'#praAccountDialogButton',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onClose:function(){clear();}">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable" width="100%">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">账户名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.accountAlias"
						type="text" style="width: 200px;"
						data-options="
		            required:true,
					validType:['accountAlias']
			  " />
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">使用状态:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="useState" class="combobox"
						name="praAccountDto.praAccount.useState" style="width: 200px;"
						data-options="
              dict:'use_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:true,
              width:200,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">真实姓名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.realName" type="text"
						style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">性别:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="praUserSex" class="combobox"
						name="praAccountDto.praAccount.praUser.sex" style="width: 200px;"
						data-options="
              dict:'sex_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:200,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">民族:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.praUser.nation"
						type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">籍贯:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.province" type="text"
						style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">出生日期:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="praUserBirthday" class="datebox" type="text"
						name="praAccountDto.praAccount.praUser.birthday"
						style="width: 200px;"></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">身份证号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.praUser.idCard"
						type="text" style="width: 200px;"
						data-options="
					validType:['idCard']
			  " /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">手机号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.telphone" type="text"
						style="width: 200px;"
						data-options="
					validType:['telphone']
			  " /></td>
					<td class="textLabel" style="text-align: right; width: 20%">住址:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.address" type="text"
						style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">电子邮件:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.praUser.email"
						type="text" style="width: 200px;"
						data-options="
					validType:['email']
			  " /></td>
					<td class="textLabel" style="text-align: right; width: 20%">邮编:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.zipCode" type="text"
						style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">描述:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.description"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">唯一标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.accountId"
						type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">账户密码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.password"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">会话密钥:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.sessionKey"
						type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">用户信息标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.praUser.userId"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">注册时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="regTime" class="datebox" type="text"
						name="praAccountDto.praAccount.regTime"></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">登录次数:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.logNum"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">最近更新时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="updateTime" class="datebox" type="text"
						name="praAccountDto.praAccount.updateTime" style="width: 200px;"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">最近登录时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="loginTime" class="datebox" type="text"
						name="praAccountDto.praAccount.loginTime" style="width: 200px;"></input>
					</td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">在线状态:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="onlineState" class="combobox"
						name="praAccountDto.praAccount.onlineState" style="width: 200px;"
						data-options="
              dict:'online_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:200,
              panelHeight:'auto'" />
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">账户代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.accountName"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">从业人员标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.userCenterId" type="text"
						style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">机构唯一标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.praAccount.praUser.orgId"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">从业人员岗位类别:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox"
						name="praAccountDto.praAccount.praUser.postCategory" type="text"
						style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">更新账户名</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						class="validatebox" name="praAccountDto.accountAliasOld"
						type="text" style="width: 200px;" /></td>
				</tr>
			</table>

		</form>
	</div>
	<div id="praAccountDialogButton" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="submitFuncBtn"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a> <a
					id="cancelFuncBtn" href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">重置</a></td>
			</tr>
		</table>
	</div>

	<div id="showPraAccountWindow" class="window" title="从业人员账户详细信息"
		style="width: 700px; height: 280px; background: #F5FAFD;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="showTable" width="100%">
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">账户代码:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.accountName"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">账户名:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.accountAlias"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">使用状态:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.useState"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">在线状态:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.onlineState"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">登录次数:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.logNum" type="text"
					style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">注册时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.regTime"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">最近登录时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.loginTime"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">最近更新时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.updateTime"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">真实姓名:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.realName"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">性别:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.sex"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">民族:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.nation"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">籍贯:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.province"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">出生日期:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.birthday"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">身份证号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.idCard"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">手机号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.telphone"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">住址:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.address"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">电子邮件:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.email"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">邮编:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.praUser.zipCode"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">描述:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					class="textLine" name="praAccountDto.praAccount.description"
					type="text" style="width: 200px;" /></td>
			</tr>
		</table>
	</div>

	<div id="praAccountRoleWindow" class="window" title="角色分配"
		style="width: 700px; height: 400px"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="praAccountRoleDatagrid" class="datagrid" fit="true"
			data-options="
		    rownumbers:true,
		    singleSelect:false,
		    toolbar:'#praAccountRoleToolbar',
		    method:'get',
		    pagination:false,
		    fitColumns:true">
			<thead>
				<tr>
					<th data-options="field:'checkboxFlag',checkbox:true"></th>
					<th data-options="field:'roleCode',width:100,align:'center'">角色代码</th>
					<th data-options="field:'roleName',width:100,align:'center'">角色名称</th>
					<th
						data-options="field:'useState',width:50,align:'center',formatter:function(value,row,index){if (value==1){return '启用';} else {return '禁用';}}">使用状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="praAccountRoleToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: left; padding-left: 2px"><a
					id="savePraAccountRole" href="javascript:void(0)"
					class="linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
				</td>
				<td style="text-align: right; padding-right: 2px"><span>系统名称:</span>
					<input id="systemTypeSelect" class="combobox"
					data-options="
					           valueField:'systemType',
					           textField:'systemName',
					           multiple:false,
					           required:false,
					           width:200,
					           panelHeight:'auto'" />
					<span>查询条件:</span> <select id="roleColumnName" panelHeight="auto"
					style="width: 100px">
						<option value="roleCode">角色代码</option>
						<option value="roleName">角色名称</option>
				</select> <input id="roleColumnValue" style="width: 100px;" type="text"
					value="" /> <a id="searchPraAccountRole" href="#"
					class="linkbutton" iconCls="icon-search">查询</a></td>
			</tr>
		</table>
	</div>

	<div id="praAccountFuncWindow" class="window" title="该从业人员账户所有权限"
		style="width: 350px; height: 500px;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<ul class="tree" id="praAccountFuncTree"
			data-options="method:'get',animate:true,checkbox:false"></ul>
	</div>


</body>
</html>
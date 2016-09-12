<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/userManage/normalAccount.js"></script>
<style type="text/css">
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
	<!-- toolbar -->
	
	<div data-options="region:'center',border:false"
		class="normalAccountCenter" id="normalAccountCenter">
		<table id="datagrid" class="datagrid" title="普通用户账户信息列表"
			data-options="
			 fit:true,
			 rownumbers:true,
			 toolbar:'#toolbarCenter',
			 method:'get',
			 url:'normalAccountCtrl!normalAccountList.htm?',
			 pagination:true,
			 fitColumns:true,
			 singleSelect:true,
	              pageSize:20,
	    		  pageList:[20,30,40,100],">
			<thead>
				<tr>
					<!-- 
					<th data-options="field:'accountName',width:30">账户名</th>
					<th data-options="field:'accountAlias',width:30">账户别名</th>
					<th
						data-options="field:'useState',width:30,formatter:function(value,row,index){if (value==1){return '可用';} else if(value==2) {return '停用';} else {return '待审核';}}">使用状态</th>
					<th
						data-options="field:'onlineState',width:30,formatter:function(value,row,index){if (value==1){return '在线';} else if(value==2) {return '离线';} else {return '未知';}}">在线状态</th>
					 -->
					 <th data-options="field:'userid',hidden:true">userid</th>
					 <th data-options="field:'accountid',hidden:true">accountid</th>
					 <th data-options="field:'account',width:50">账户名</th>
					 <th data-options="field:'type',width:20,formatter:function(value,row,index){if (value==0){return '平台用户';} else if(value==1) {return '医院用户';} else if(value==2) {return '供应商用户';}else if(value==3) {return '护士';}}">账号类型</th>
					 <th data-options="field:'hop',width:50">医院</th>
					 <th data-options="field:'loc',width:50">科室</th>
					 <th data-options="field:'ven',width:100">供应商</th>
					 <th data-options="field:'state',width:20,formatter:function(value,row,index){if (value==1){return '使用';} else if(value==2) {return '停用';} else if(value==3) {return '未审批';}}">状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="toolbarCenter" style="height: auto">
		账号		
		<input id="normalAccountColumnValue" style="width: 150px;" type="text" /> 
		医院:
		<input style="width: 155px;" class="combobox" type="text" id="hopPar" />
		科室:
		<input style="width: 155px;" class="combobox" type="text"   id="locPar" />
		供应商:
		<input style="width: 255px;" class="combobox" type="text"  id="venPar" />				 				 
		<a id="searchNormalAccountBtn" href="#"
			class="linkbutton" iconCls="icon-search">查询</a>
		<a id="addBt" class="linkbutton" onclick="javascript:addNormalAccount()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editNormalAccount()">修改</a> 
		<!-- 
		<a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:cancelNormalAccount()">删除</a> 
		 -->
		<a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:normalAccountRole()">角色分配</a>
			 <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:normalAccountFunc()">权限查询</a>	
	</div>

	<div id="normalAccountDialog" class="dialog" title="添加普通用户账户"
		style="width: 700px; height: 320px; background-color: #F5FAFD;"
		data-options="
				buttons:'#normalAccountDialogButton',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onClose:function(){clear();}">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">账户名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.accountAlias"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
			      required:true
			      " />
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">使用状态:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="useState" class="combobox" style="width: 200px;"
						name="normalAccountDto.normalAccount.useState"
						data-options="
	              dict:'usestate',
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
						name="normalAccountDto.normalAccount.normalUser.realName"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">性别:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="normalUserSex" class="combobox" style="width: 200px;"
						name="normalAccountDto.normalAccount.normalUser.sex"
						data-options="
	              dict:'gender',
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
						name="normalAccountDto.normalAccount.normalUser.nation"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">籍贯:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.province"
						class="validatebox" type="text" style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">出生日期:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="normalUserBirthday" class="datebox" style="width: 200px;"
						type="text"
						name="normalAccountDto.normalAccount.normalUser.birthday"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">身份证号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.idCard"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
					validType:['idCard']
			      " /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">手机号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.telephone"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
					validType:['telphone']
			      " /></td>
					<td class="textLabel" style="text-align: right; width: 20%">住址:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.address"
						class="validatebox" type="text" style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">电子邮件:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.email"
						class="validatebox" type="text" style="width: 200px;"
						data-options="
					validType:['email']
			      " /></td>
					<td class="textLabel" style="text-align: right; width: 20%">邮编:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.zipCode"
						class="validatebox" type="text" style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">健康卡号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.healthNumber"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">社保卡号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.ssNumber"
						class="validatebox" type="text" style="width: 200px;" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">描述:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.description"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">人员类型:</td>
					<td class="textParent" style="text-align: left; width: 30%">
					<select class="combobox" panelHeight="auto" style="width:200px"  
					     name="normalAccountDto.normalAccount.normalUser.type" id="type"
					     data-options="required:true">
					<option value="0">工作人员</option>
					<option value="1">医院用户</option>
					<option value="2">供应商用户</option>
					<option value="3">护士</option>
					</select></td>	
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">医院:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					 class="combobox" id="hop"/></td>
					<td class="textLabel" style="text-align: right; width: 20%">科室:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					name="normalAccountDto.normalAccount.normalUser.locId"  class="combobox" id="loc"/></td>	
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">供应商:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					name="normalAccountDto.normalAccount.normalUser.vendorId"  class="combobox" id="ven"/></td>	
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">会话密钥:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.sessionKey"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">账户密码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.password" class="validatebox"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">普通账户信息标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.accountId"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">普通用户信息标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.userId"
						class="validatebox" type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">数据中心的居民标识符:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.normalUser.userCenterId"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">用户在线状态:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="onlineState" class="combobox" style="width: 200px;"
						name="normalAccountDto.normalAccount.onlineState"
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
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">用户最近更新时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="updateTime" class="datebox" type="text" style="width: 200px;"
						name="normalAccountDto.normalAccount.updateTime"></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">用户最近登录时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="loginTime" class="datebox" type="text" style="width: 200px;"
						name="normalAccountDto.normalAccount.loginTime"></input></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">用户注册时间:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="regTime" class="datebox" type="text" style="width: 200px;"
						name="normalAccountDto.normalAccount.regTime"></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">用户登录次数:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.logNum" class="validatebox"
						type="text" style="width: 200px;" /></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel" style="text-align: right; width: 20%">账户代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.normalAccount.accountName"
						class="validatebox" type="text" style="width: 200px;" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">修改账户代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="normalAccountDto.accountAliasOld" class="validatebox"
						type="text" style="width: 200px;" /></td>
				</tr>
			</table>

		</form>
	</div>
	<div id="normalAccountDialogButton" align="center">
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

	<div id="showNormalAccountWindow" class="window" title="普通用户账户详细信息"
		style="width: 700px; height: 300px; background: #F5FAFD;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="showTable" style="width: 100%;">
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">账户名:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.accountName" class="textLine"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">在线状态:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.onlineState" class="textLine"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">登录次数:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.logNum" class="textLine"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">注册时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.regTime" class="textLine"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">最近登录时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.loginTime" class="textLine"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">最近更新时间:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.updateTime" class="textLine"
					type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">真实姓名:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.realName"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">性别:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.sex"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">民族:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.nation"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">籍贯:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.province"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">出生日期:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.birthday"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">身份证号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.idCard"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">手机号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.telephone"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">住址:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.address"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">电子邮件:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.email"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">邮编:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.zipCode"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">健康卡号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.healthNumber"
					class="textLine" type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">社保卡号:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.normalUser.ssNumber"
					class="textLine" type="text" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">使用状态:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.useState" class="textLine"
					type="text" style="width: 200px;" /></td>
				<td class="textLabel" style="text-align: right; width: 20%">描述:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					name="normalAccountDto.normalAccount.description" class="textLine"
					type="text" style="width: 200px;" /></td>
			</tr>
		</table>
	</div>

	<div id="normalAccountRoleWindow" class="window" title="角色分配"
		style="width: 700px; height: 400px"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="normalAccountRoleDatagrid" class="datagrid" fit="true"
			data-options="
		    rownumbers:true,
		    singleSelect:false,
		    toolbar:'#normalAccountRoleToolbar',
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
	<div id="normalAccountRoleToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: left; padding-left: 2px"><a
					id="saveNormalAccountRole" href="javascript:void(0)"
					class="linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a>
	
					<span>查询条件:</span> <select id="roleColumnName" panelHeight="auto"
					style="width: 100px">
						<option value="roleCode">角色代码</option>
						<option value="roleName">角色名称</option>
				</select> <input id="roleColumnValue" style="width: 100px;" type="text"
					value="" /> <a id="searchNormalAccountRole" href="#"
					class="linkbutton" iconCls="icon-search">查询</a></td>
			</tr>
		</table>
	</div>

	<div id="normalAccountFuncWindow" class="window" title="该普通用户账户所有权限"
		style="width: 350px; height: 500px;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<ul class="tree" id="normalAccountFuncTree"
			data-options="method:'get',animate:true,checkbox:false"></ul>
	</div>
	
	
	<div id="vendorCombo" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
					<span>查询条件:</span>
					药品名称: <input id="vendorName" style="width: 200px;" type="text" /> <a id="searchVendor" href="#"
					class="linkbutton" iconCls="icon-search">查询</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
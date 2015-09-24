<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/userManage/role.js"></script>
<style type="text/css">
.textLabel {
	margin-top: 0px;
	margin-left: 0px;
	font-size: 12px;
	text-align: right;
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
	border-bottom: 1px solid #6A7885; /* 下划线效果 */
	background-color: transparent; /* 背景色透明 */
	color: #000000;
	text-align: left;
}
</style>
</head>
<body class="layout">
	<!-- toolbar -->
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addRole()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRole()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:cancelRole()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
			<a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:saveRoleFuncs()">权限分配</a>
			
			<a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:saveLocs()">科室分配</a> 
			<a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:saveVendors()">供应商分配</a>  
			
			<a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:searchRoleNormalAccount()">普通用户</a> 
	</div>
	<div data-options="region:'center',border:false" class="roleCenter"
		id="roleCenter">

		<table id="datagrid" class="datagrid" fit="true" title="角色管理1"
			data-options="
		    rownumbers:true,
		    toolbar:'#toolbar',
		    method:'get',
		    pagination:true,
		    fitColumns:true,
		    singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'roleId',hidden:true">id</th>
					<th data-options="field:'roleCode',width:100,align:'center'">角色代码</th>
					<th data-options="field:'roleName',width:100,align:'center'">角色名称</th>
					<th data-options="field:'createTime',width:100,align:'center'">创建时间</th>
					<th
						data-options="field:'useState',width:50,align:'center',formatter:function(value,row,index){if (value==1){return '可用';} else {return '停用';}}">使用状态</th>
					<th data-options="field:'description',width:300,align:'center'">角色描述</th>
				</tr>
			</thead>
		</table>

	</div>
	<div id="toolbar" style="height: auto">
		<span>查询条件:</span> <select id="roleColumnName" panelHeight="auto"
			style="width: 100px">
			<option value="roleCode">角色代码</option>
			<option value="roleName">角色名称</option>
		</select> <input id="roleColumnValue" style="width: 200px;" type="text" /> <a
			id="searchFuncBtn" href="#" class="linkbutton" iconCls="icon-search">查询</a>
	</div>

	<div id="roleDialog" class="dialog" title="添加角色"
		style="width: 400px; height: 230px; background-color: #F5FAFD;"
		data-options="
				buttons:'#roleDialogButton',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onClose:function(){clear();}">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable" width="100%">
				<tr style="display: none">
					<td>id</td>
					<td><input type="text" name="roleDto.role.roleId" value=""></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">角色代码:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 230px;" class="validatebox" type="text"
						name="roleDto.role.roleCode" data-options="required:true"></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">角色名称:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 230px;" class="validatebox" type="text"
						name="roleDto.role.roleName" data-options="required:true"></input>
					</td>
				</tr>
				<tr style="display: none">
					<td class="textLabel" style="text-align: right; width: 40%">创建时间:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						id="createTime" style="width: 230px;" class="datebox" type="text"
						name="roleDto.role.createTime"></input></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">使用状态:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						id="useState" style="width: 230px;" name="roleDto.role.useState"
						class="combobox"
						data-options="
	              dict:'usestate',
	              valueField:'value',
	              textField:'desc',
	              multiple:false,
	              required:true,
	              width:230,
	              panelHeight:'auto'" />
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">角色描述:</td>
					<td class="textParent" style="text-align: left; width: 60%"><textarea
							id="description" style="resize: none; font-size: 12px;"
							name="roleDto.role.description"></textarea></td>
				</tr>
			</table>

		</form>
	</div>
	<div id="roleDialogButton" align="center">
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

	<div id="showRoleWindow" class="window" title="角色详细信息"
		style="width: 400px; height: 200px; background: #F5FAFD;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="showTable" width="100%">
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">角色代码:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 230px;" class="textLine" type="text"
					name="roleDto.role.roleCode"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">角色名称:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 230px;" class="textLine" type="text"
					name="roleDto.role.roleName"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">使用状态:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 230px;" class="textLine" type="text"
					name="roleDto.role.useState"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">创建时间:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 230px;" class="textLine" type="text"
					name="roleDto.role.createTime"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">角色描述:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 230px;" class="textLine" type="text"
					name="roleDto.role.description"></input></td>
			</tr>
		</table>
	</div>

	<div id="saveRoleFuncsDialog" class="dialog" title="权限分配"
		style="width: 350px; height: 500px;"
		data-options="
			    modal:true,
		        closed:true,
				toolbar: '#saveRoleFuncsToolbar'
			">
		<ul class="tree" id="saveRoleFuncsTree"
			data-options="method:'get',animate:true,checkbox:true"></ul>
	</div>

	<div id="saveRoleFuncsToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="padding-left: 2px"><a
					onclick="javascript:giveFunc();" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a></td>
			</tr>
		</table>
	</div>
	
	
	<div id="saveLocsDialog" class="dialog" title="科室分配"
		style="width: 350px; height: 500px;"
		data-options="
			    modal:true,
		        closed:true,
				toolbar: '#saveLocsToolbar'
			">
		<ul class="tree" id="saveLocsTree"
			data-options="method:'get',animate:true,checkbox:true"></ul>
	</div>
	
	<div id="saveLocsToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="padding-left: 2px"><a
					onclick="javascript:giveLoc();" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a></td>
			</tr>
		</table>
	</div>
	
	
	
	<div id="saveVensDialog" class="dialog" title="供应商分配"
		style="width: 350px; height: 500px;"
		data-options="
			    modal:true,
		        closed:true,
				toolbar: '#saveVensToolbar'
			">
		<ul class="tree" id="saveVensTree"
			data-options="method:'get',animate:true,checkbox:true"></ul>
	</div>
	
	<div id="saveVensToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="padding-left: 2px"><a
					onclick="javascript:giveVen();" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a></td>
			</tr>
		</table>
	</div>
	
	
	<div id="searchRolePraAccountWindow" class="window"
		title="拥有该角色的从业人员账户" style="width: 700px; height: 400px"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="searchRolePraAccountDatagrid" class="datagrid"
			data-options="
			 fit:true,
			 rownumbers:true,
			 toolbar:'#searchRolePraAccountToolbar',
			 method:'get',
			 url:'roleCtrl!praAccountList.htm',
			 pagination:true,
			 fitColumns:true,
			 singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'accountName',width:30">账户名</th>
					<th data-options="field:'accountAlias',width:30">账户别名</th>
					<th
						data-options="field:'useState',width:30,formatter:function(value,row,index){if (value==1){return '启用';} else {return '禁用';}}">使用状态</th>
					<th
						data-options="field:'onlineState',width:30,formatter:function(value,row,index){if (value==1){return '在线';} else if(value==2) {return '离线';} else {return '未知';}}">在线状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="searchRolePraAccountToolbar" style="height: auto">
		<span>查询条件:</span> <select id="praAccountColumnName"
			panelHeight="auto" style="width: 100px">
			<option value="accountName">账户名</option>
			<option value="accountAlias">账户别名</option>
		</select> <input id="praAccountColumnValue" style="width: 200px;" type="text" />
		<a id="searchRolePraAccountBtn" href="#" class="linkbutton"
			iconCls="icon-search">查询</a>
	</div>

	<div id="searchRoleNormalAccountWindow" class="window"
		title="拥有该角色的用户" style="width: 700px; height: 400px"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="searchRoleNormalAccountDatagrid" class="datagrid"
			data-options="
			 fit:true,
			 rownumbers:true,
			 toolbar:'#searchRoleNormalAccountToolbar',
			 method:'get',
			 url:'roleCtrl!normalAccountList.htm',
			 pagination:true,
			 fitColumns:true,
			 singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'accountName',width:30">账户名</th>
					<th data-options="field:'accountAlias',width:30">账户别名</th>
					<th
						data-options="field:'useState',width:30,formatter:function(value,row,index){if (value==1){return '启用';} else {return '禁用';}}">使用状态</th>
					<th
						data-options="field:'onlineState',width:30,formatter:function(value,row,index){if (value==1){return '在线';} else if(value==2) {return '离线';} else {return '未知';}}">在线状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="searchRoleNormalAccountToolbar" style="height: auto">
		<span>查询条件:</span> <select id="normalAccountNameColumnName"
			panelHeight="auto" style="width: 100px">
			<option value="accountName">账户名</option>
			<option value="accountAlias">账户别名</option>
		</select> <input id="normalAccountColumnValue" style="width: 200px;"
			type="text" /> <a id="searchRoleNormalAccountBtn" href="#"
			class="linkbutton" iconCls="icon-search">查询</a>
	</div>

</body>
</html>
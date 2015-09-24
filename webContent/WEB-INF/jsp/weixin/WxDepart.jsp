<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/weixin/wxDepart.js"></script>
</head>
<body>
	<div id="toolbarDepart" class="toolbar">
		<a class="linkbutton" onclick="javascript:addDepartClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editDepart()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delDepart()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-reload',plain:true"
			onclick="javascript:syncLoc()">同步科室</a><a class="linkbutton"
			data-options="iconCls:'icon-reload',plain:true"
			onclick="javascript:syncVen()">同步供应商</a><input style='width: 250px;'
			type='text' id="queryDepart"></input><a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectDepart()">查询</a>
	</div>

	<div id="toolbarUser" class="toolbar">
		<a class="linkbutton" onclick="javascript:addUser()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editUser()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delUser()">删除</a><input style='width: 250px;'
			type='text' id="queryUser"></input> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectUser()">查询</a>
	</div>

	<div class="layout" data-options="fit:'true',border:true">
		<div
			data-options="region:'west',title:'微信部门',iconCls:'icon-ok',split:true"
			style="width: 430px">
			<table id="datagridDepart" style="height: 250px" class="datagrid"
				data-options="toolbar:'#toolbarDepart',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 pageSize:15,
	    						 pageList:[15,30,45],
	    						 onClickRow:departClick,
	    						 url:'<%=request.getContextPath()%>/weixin/wxDepartCtrl!list.htm'
								 ">

				<thead>
					<tr>
						<th data-options="field:'wxDepartId',hidden:true">wxDepartId</th>
						<th data-options="field:'wxDepartName',sortable:true,width:100">部门名称</th>
						<th
							data-options="field:'wxDepartParentId',sortable:true,hidden:true">wxDepartParentId</th>
						<th data-options="field:'wxDepartScmId',sortable:true,hidden:true">wxDepartScmId</th>
					</tr>
				</thead>
			</table>

		</div>
		<div data-options="region:'center',title:'微信人员',iconCls:'icon-ok'">
			<table id="datagridUser" style="height: 250px" class="datagrid"
				data-options="toolbar:'#toolbarUser',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 pageSize:15,
	    						 pageList:[15,30,45],
	    						 url:'<%=request.getContextPath()%>/weixin/wxUserCtrl!list.htm'
								 ">

				<thead>
					<tr>
						<th data-options="field:'wxUserId',hidden:true">wxUserId</th>
						<th data-options="field:'wxUserName',sortable:true,width:100">姓名</th>
						<th data-options="field:'wxUserEmail',sortable:true,width:100">邮箱</th>
						<th data-options="field:'wxUserTel',sortable:true,width:100">电话</th>
						<th data-options="field:'wxUserWeixinId',sortable:true,width:100">微信号</th>
						<th data-options="field:'wxUserScmId',sortable:true">wxUserScmId</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div id="departWin" class="dialog"
		data-options="title:'微信部门',modal:true,width:400,height:200,closed:true,buttons:'#btnDivDepart'"
		style="vertical-align: middle;">
		<form id="depart" method="post">
			<table style="width: 100%;">
				<input type="hidden" name="dto.wxDepart.wxDepartId" />
				<input type="hidden" name="dto.wxDepart.wxDepartParentId" />
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>部门名称:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						data-options="required:true" name='dto.wxDepart.wxDepartName'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>上级部门:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						class="combotree" id="parentId"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>平台部门id:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.wxDepart.wxDepartScmId'></input></td>
				</tr>
			</table>
			<div id="btnDivDepart" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="subDepartBtn"
							class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
							id="cancelBtn" class="linkbutton"
							data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>


	<div id="userWin" class="dialog"
		data-options="title:'微信用户',modal:true,width:500,height:250,closed:true,buttons:'#btnDivUser'"
		style="vertical-align: middle;">
		<form id="user" method="post">
			<table style="width: 100%;">
				<input type="hidden" name="dto.wxUser.wxUserId" />
				<input type="hidden" name="dto.wxUser.wxUserDepartId" />
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>用户姓名:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox'
						data-options="required:true" type='text'
						name='dto.wxUser.wxUserName'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>邮箱:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox'
						data-options="required:true" type='text'
						name='dto.wxUser.wxUserEmail'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>电话:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.wxUser.wxUserTel'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>微信号:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.wxUser.wxUserWeixinId'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>部门:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						class="combotree" id="userDepartId"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>wxUserScmId:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox'
						data-options="required:true" type='text'
						name='dto.wxUser.wxUserScmId'></input></td>
				</tr>
			</table>
			<div id="btnDivUser" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="subUserBtn"
							class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
							id="cancelBtn" class="linkbutton"
							data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>

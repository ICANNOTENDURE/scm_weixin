<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/userManage/func.js"></script>
<style type="text/css">
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
		<a id="addBt" class="linkbutton" onclick="javascript:addFunc()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editFunc()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:cancelFunc()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>
	<div data-options="region:'center',border:false" class="funcCenter"
		id="funcCenter">
		<table id="datagrid" class="treegrid" fit="true" title="权限管理"
			data-options="
		    rownumbers:true,
		    toolbar:'#toolbar',
		    method:'get',
		    fitColumns:true,
		    singleSelect:true,
		    idField: 'funcId',
			treeField: 'funcName'">
			<thead>
				<tr>
					<th data-options="field:'funcName',width:100,align:'left'">权限名称</th>
					<th data-options="field:'menuSeq',width:50,align:'center'">权限编号</th>
					<th
						data-options="field:'useState',width:50,align:'center',formatter:function(value,row,index){if (value==1){return '可用';} else {return '停用';}}">权限状态</th>
					<th data-options="field:'url',align:'center',width:120">权限访问地址</th>
					<th data-options="field:'secutiryUrl',align:'center',width:120">权限内部访问地址</th>

					<th data-options="field:'funcId',hidden:true">funcId</th>
					<th data-options="field:'isLeaf',hidden:true">isLeaf</th>
					<th data-options="field:'parentId',hidden:true">parentId</th>
					<th data-options="field:'levelNum',hidden:true">levelNum</th>
					<th data-options="field:'seq',hidden:true">seq</th>
					<th data-options="field:'backColor',hidden:true">backColor</th>
				</tr>
			</thead>
		</table>
	</div>

	<div id="funcDialog" class="dialog" title="添加权限"
		style="width: 700px; height: 230px; background-color: #F5FAFD;"
		data-options="
				buttons:'#funcDialogButton',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onClose:function(){clear();}">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">权限名称:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.funcName" data-options="required:true"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">权限编号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.menuSeq" data-options="required:true" /></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">使用状态:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="useState" style="width: 250px;" name="funcDto.func.useState"
						class="combobox"
						data-options="
		              dict:'usestate',
		              valueField:'value',
		              textField:'desc',
		              multiple:false,
		              required:true,
		              width:250,
		              panelHeight:'auto'"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">上级权限:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="parentName" style="width: 250px;" class="combotree" /></td>
	
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">JavaScript函数:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.url" data-options="required:false"></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">内部访问地址:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.secutiryUrl" data-options="required:true"></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">菜单图片Url:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.imgUrl" data-options="required:false"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">背景色:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.backColor" data-options="required:false"></input>
					</td>
				</tr>
				<tr style="display: none">
					<td class="textLabel" style="text-align: right; width: 20%">funcId</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						name="funcDto.func.funcId" value=""></input></td>
					<td class="textLabel" style="text-align: right; width: 20%">是否是叶子节点:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.isLeaf" data-options="required:false"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">更新权限编号</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.menuSeqOld" data-options="required:false"></input></td>
				</tr>
				<tr style="display: none">
					<td class="textLabel" style="text-align: right; width: 20%">上级权限parentId:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.parentId" /></td>
					<td class="textLabel" style="text-align: right; width: 20%">旧有的上级权限parentId:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="funcDto.func.parentIdOld" /></td>
				</tr>
			</table>

		</form>

	</div>
	<div id="funcDialogButton" align="center">
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

	<div id="showFuncWindow" class="window" title="权限详细信息"
		style="width: 400px; height: 230px; background: #F5FAFD;"
		data-options="
		  modal:true,
		  closed:true,
		  collapsible:false,
		  minimizable:false,
		  maximizable:false">
		<table id="showTable" style="width: 100%;">
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">权限名称:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.funcName"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">权限编号:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.menuSeq"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">使用状态:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.useState"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">系统名称:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.systemType"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">版本号:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.version"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">菜单访问地址:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.url"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">内部访问地址:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.secutiryUrl"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">菜单图片Url:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 280px;" class="textLine" type="text"
					name="funcDto.func.imgUrl"></input></td>
			</tr>
		</table>
	</div>

	<div id="addFuncsDialog" class="dialog" title="批量导入权限"
		style="width: 400px; height: 100px; background-color: #F5FAFD;"
		data-options="
				buttons:'#addFuncsDialogButton',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				onClose:function(){clear();}">
		<form id="addFuncsForm" method="post" enctype="multipart/form-data">

			<table id="addFuncsTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 250px;" class="validatebox" type="file"
						name="upload"></input></td>
				</tr>
			</table>

		</form>

	</div>
	<div id="addFuncsDialogButton" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="addFuncsSubmitFuncBtn"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">确定</a> <a
					id="addFuncsCancelFuncBtn" href="javascript:void(0)"
					class="linkbutton" data-options="iconCls:'icon-cancel',plain:true">关闭</a>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/dhcc/pms/platformManage/maintain.js"></script>
</head>
<body>
	<!--   <div id="toolbar" class="toolbar" style="height:auto">
    <a id="addMaintainBtn" href="javascript:void(0)" class="linkbutton"
      data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="editMaintainBtn" href="javascript:void(0)" class="linkbutton"
      data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a id="removeMaintainBtn" href="javascript:void(0)" class="linkbutton"
      data-options="iconCls:'icon-remove',plain:true">删除</a>
    <a id="searchMaintainBtn" href="javascript:void(0)" class="linkbutton"
      data-options="iconCls:'icon-search',plain:true">检索</a>
  </div> -->

	<table id="datagrid" class="datagrid" fit="true"
		data-options="rownumbers:true,toolbar:'#toolbar',method:'post',url:'maintainCtrl!maintainList.htm',pagination:true,fitColumn:true,singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'maintainId',hidden:true">唯一标识符</th>
				<th data-options="field:'serverId',width:120,align:'left'">维护的服务器</th>
				<th data-options="field:'gatewayId',width:120,align:'left'">维护的应用系统</th>
				<th data-options="field:'maintainType',width:100,align:'left'">运维类型</th>
				<th data-options="field:'maintainHandle',width:150,align:'left'">处理方法</th>
				<th data-options="field:'maintainTime',width:100,align:'left'">花费时间</th>
				<th data-options="field:'result',width:150,align:'left'">操作结果</th>
				<th data-options="field:'description',width:200,align:'left'">备注</th>
				<th data-options="field:'createTime',width:120,align:'left'">记录时间</th>
			</tr>
		</thead>
	</table>

	<div id="maintainWin" class="window" style="vertical-align: middle;"
		data-options="modal:true,width:400,heigth:'auto',closed:true,onClose:function(){clear();}">
		<form id="maintainForm" method="post">
			<br>
			<table>
				<tr class="row" align="right" style="display: none">
					<td width="100">运维记录编号:</td>
					<td><input class="validatebox"
						name="maintainDto.maintain.maintainId" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td width="100">维护系统:</td>
					<td><input class="validatebox"
						name="maintainDto.maintain.gatewayId" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr align="right">
					<td width="100">运维类型:</td>
					<td style="text-align: left"><input class="combobox"
						name="maintainDto.maintain.maintainType"
						data-options="
            dict:'maintain_type',
            valueField:'value',
            textField:'desc',
            multiple:false,
            required:true,
            width:155,
            panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td width="100">处理方法:</td>
					<td><textarea rows="1" cols="20"
							name="maintainDto.maintain.maintainHandle" readonly="true"></textarea></td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td width="100">花费时间:</td>
					<td><input class="validatebox"
						name="maintainDto.maintain.maintainTime" type="text"
						data-options="editable:false,required:false" style="width: 100px;">
					</td>
					<td>分钟</td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td width="100">操作结果:</td>
					<td><textarea rows="3" cols="4"
							name="maintainDto.maintain.result" readonly="true"></textarea></td>
				</tr>
				<tr clas="row" align="right" style="display: none">
					<td width="100">备注:</td>
					<td><textarea rows="3" cols="4"
							name="maintainDto.maintain.description"></textarea></td>
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
</body>
</html>
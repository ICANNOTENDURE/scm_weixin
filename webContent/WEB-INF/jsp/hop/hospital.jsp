<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hospital.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>

	<table id="datagrid" title='医院信息管理'
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>
	
	<div id="hospInfoWin" class="dialog" title="新增医院信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#btnDiv0'"
		style="vertical-align: middle;">
		<form id="hospdetail" method="post">
			<table style="width: 100%;">
				<tr style="display: none">
					<input type="hidden" name="dto.hospital.hospitalId" />
				</tr>
				<tr>
					<td class="textLabel">医院代码:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hospital.hospitalCode"
						data-options="required:true" id="hospCode" /></td>					
				</tr>
				<tr>
					<td class="textLabel">医院描述:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hospital.hospitalName"
						data-options="required:true" id="hospName" /></td>					
				</tr>
				<tr>
					<td class="textLabel">His医院:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hospital.hospitalHisdr"
						data-options="required:true" id="hospHisdr" /></td>					
				</tr>
				<tr>
					<td class="textLabel">地址:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hospital.hospitalDestination"
					/></td>					
				</tr>	
			</table>							
			<div id="btnDiv0" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateHospBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>	

	<div id="searchHospWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#searchBtnDiv0'"
		style="vertical-align: middle;">
		<table style="width: 100%;" cellspacing="10">				
			<tr>
				<td class="textLabel">医院代码:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hospital.hospitalCode"
					id="hospitalCodes" /></td>					
			</tr>
			<tr>
				<td class="textLabel">医院描述:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hospital.hospitalName"
					id="hospitalNames" /></td>					
			</tr>
			<tr>
				<td class="textLabel">His医院:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hospital.hospitalHisdr"
					id="hospHisids" /></td>					
			</tr>	
		</table>
		<div id="searchBtnDiv0" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchHospInfoBt" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="searchHospCanBt"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hopCtloc.js"></script>
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

	<table id="datagrid" title='医院科室信息管理'
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>	
		
	<div id="ctlocInfoWin" class="dialog" title="新增科室信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="ctlocdetail" method="post">
			<table style="width: 100%;" >
				<tr style="display: none">
					<input type="hidden" name="dto.hopCtloc.hopCtlocId" />
				</tr>
				<tr>
					<td class="textLabel">科室代码:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtloc.code"
						data-options="required:true" id="ctlocCode" /></td>					
				</tr>
				<tr>
					<td class="textLabel">科室描述:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtloc.name"
						data-options="required:true" id="ctlocName" /></td>					
				</tr>
				<tr>
					<td class="textLabel">医院:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.hopCtloc.hospid"
						data-options="required:true" id="dicHospid" /></td>					
				</tr>
				<tr>
					<td class="textLabel">his科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtloc.hisid"
						data-options="required:true" id="ctlocHisid" /></td>					
				</tr>
				<tr>
					<td class="textLabel">科室类型:</td>
					<td class="textParent" >
						<select class="combobox" panelHeight="auto" style="width:250px"  name="dto.hopCtloc.type">
							<option value="1">入库科室</option>
							<option value="2">收货科室</option>
							<option value="3">全部</option>
						</select>
					</td>					
				</tr>	
			</table>							
			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateCtlocBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<div id="searchCtlocWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<table style="width: 100%;" cellspacing="10">				
			<tr>
				<td class="textLabel">科室代码:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopCtloc.code"
					id="ctlocCodes" /></td>					
			</tr>
			<tr>
				<td class="textLabel">科室描述:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopCtloc.name"
					id="ctlocNames" /></td>					
			</tr>
			<tr>
				<td class="textLabel">医院:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.hopCtloc.hospid"
					id="ctlocHospid" /></td>					
			</tr>
			<tr>
				<td class="textLabel">his科室:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopCtloc.hisid"
					id="ctlocHisids" /></td>					
			</tr>	
		</table>
		<div id="searchBtnDiv" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchCtlocInfoBt" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="searchCtlocCanBt"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	
</body>
</html>
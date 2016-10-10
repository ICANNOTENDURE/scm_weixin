<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>
<script src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/sys/sysBanner.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a>
	</div>


	<table id="datagrid" style="height: 250px" title="登录页图片管理"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

	<div id="detailWin" class="dialog"
		data-options="modal:true,width:400,height:350,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
				<input type="hidden" name="dto.sysBanner.bannerPath" id="path"/>
				<input type="hidden" name="dto.sysBanner.bannerId" id="bannerId"/>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>序号:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.sysBanner.bannerSeq'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>使用状态:</td>
					<td class='textParent' style='text-align: left; width: 30%'>
						<select class="combobox" panelHeight="auto" style="width:250px" name="dto.sysBanner.bannerStatus">
							<option value="0">使用</option>
							<option value="1">停用</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style='text-align: right; width: 20%'>上传图片:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						id="upload" name="upload" type="file" multiple="true"
						style="width: 100%"></td>
				</tr>
			</table>
			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn"
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

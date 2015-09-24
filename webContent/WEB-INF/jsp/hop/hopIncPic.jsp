<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/appLog/appLog.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hopIncPic.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/uploadify.css">
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


	<table id="datagrid" title="药品图片信息维护"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>
		
	<div id="drugPicInfoWin" class="dialog" title="新增药品图片信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#btnDiv1'"
		style="vertical-align: middle;">
		<form id="incpicdetail" method="post">
		<table style="width: 100%;" cellspacing="10">
			<tr style="display: none">
				<input type="hidden" name="dto.hopIncPic.hopIncPicId" />
			</tr>
			<tr>
				<td class="textLabel">药品:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combogrid" type="text" name="dto.hopIncPic.incPicIncid"
					data-options="required:true" id="hopIncPicIncid" /></td>
			</tr>			
			<tr>
				<td class="textLabel">图片顺序:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopIncPic.incPicSeq"
					data-options="required:true" id="hopIncPicSeq" /></td>
			</tr>					
			<tr>
				<td class="textLabel">图片路径</td>
				<td class="textParent"><input type="file" 
					id ="uploadPics" name="upload" value="上传图片"/>
				</td>
			</tr>
		</table>									
																
		<div id="btnDiv1" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="saveOrUpdateIncpicBtn" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:cancelClick()">取消</a></td>
				</tr>
			</table>
		</div>
		</form>
	</div>
	
	<div id="updateWin" class="dialog" title="修改药品图片信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
		<table style="width: 100%;" cellspacing="10">
			<tr style="display: none">
				<input type="hidden" name="dto.hopIncPic.hopIncPicId" />
			</tr>
			<tr>
				<td class="textLabel">药品:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combogrid" type="text" name="dto.hopIncPic.incPicIncid"
					data-options="required:true" id="update_hopIncPicIncid" /></td>
			</tr>			
			<tr>
				<td class="textLabel">图片顺序:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopIncPic.incPicSeq"
					data-options="required:true" id="update_hopIncPicSeq" /></td>
			</tr>					
			<tr>
				<td class="textLabel">图片路径</td>
				<td class="textParent"><input type="file" 
					id ="update_uploadPics" name="upload" value="上传图片"/>
				</td>
			</tr>
		</table>									
																
		<div id="btnDiv" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="UpdateIncpicBtn" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:cancelClick()">取消</a></td>
				</tr>
			</table>
		</div>
		</form>
	</div>
			
	<div id="searchIncPicWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:200,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<table style="width: 100%;" cellspacing="10">				
			<tr>
				<td class="textLabel">药品:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combogrid" type="text" name="dto.hopIncPic.incPicIncid"
					id="hopIncPicIncids" /></td>
			</tr>
		</table>					
		<div id="searchBtnDiv" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchIncPicBtn" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="searchCtlocCanBt"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>
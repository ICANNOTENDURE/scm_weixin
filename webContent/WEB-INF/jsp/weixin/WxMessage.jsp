<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/kindeditor.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/weixin/wxMessage.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">新增消息</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> </a> <a class="linkbutton"
			data-options="iconCls:'icon-add',plain:true"
			onclick="javascript:sendClick()">推送</a>
	</div>


	<table id="datagrid" style="height: 250px" title="微信消息推送"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:false,pagination:true">
	</table>

	<div id="detailWin" class="dialog"
		data-options="modal:true,width:800,height:500,closed:true,buttons:'#btnDiv',maximizable:true"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
				<input type="hidden" name="dto.wxMessage.wxMessageId" />
				<input type="hidden" name="dto.wxMessage.wxMessagePicUrl" />
				<input type="hidden" name="dto.wxMessage.wxMessageUrl" />
				<input name='dto.wxMessage.wxMessageToPartyId' type="hidden"></input>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>选择范围(不选默认是@all):</td>
					<td class='textParent' style='text-align: left; width: 80%'><a
						class="linkbutton" data-options="iconCls:'icon-add',plain:true"
						onclick="javascript:selectUsers()">部门列表</a>
						<div id="departName"></td>
					</div>
				</tr>
				<!-- 
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>url:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 300px;' class='validatebox'
						name='dto.wxMessage.wxMessageUrl'></input></td>
				</tr>
				 -->
				<tr id="PicTr">
					<td class='textLabel' style='text-align: right; width: 20%'>图片:</td>
					<td class='textParent' style='text-align: left; width: 80%'><input
						style='width: 300px;' type="file" name="upload" id="Upload"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>标题:</td>
					<td class='textParent' style='text-align: left; width: 80%'><input
						style='width: 450px;' class='validatebox' type="text"
						data-options="required:true" name='dto.wxMessage.wxMessageTitle'></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>内容:</td>
					<td class='textParent' style='text-align: left; width: 80%'><textarea
							style='width: 500px; height: 300px'
							name='dto.wxMessage.wxMessageContent' id="content"></textarea></td>
				</tr>
			</table>

			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn"
							class="linkbutton" data-options="iconCls:'icon-save'">保存</a> <a
							id="cancelBtn" class="linkbutton"
							data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>


	<div id="saveUsersDialog" class="dialog" title="选择部门"
		style="width: 350px; height: 500px;"
		data-options="
			    modal:true,
		        closed:true,
				toolbar: '#saveUsersToolbar'
			">
		<ul class="tree" id="saveUsersTree"
			data-options="method:'get',animate:true,checkbox:true"></ul>
	</div>

	<div id="saveUsersToolbar" style="padding: 2px 0">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="padding-left: 2px"><a
					onclick="javascript:giveDepart();" class="linkbutton"
					data-options="iconCls:'icon-add',plain:true">确定</a></td>
				<td style="padding-left: 2px">
			</tr>
		</table>
	</div>
</body>
</html>

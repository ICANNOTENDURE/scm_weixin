<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/weixin/mpUser.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">推送消息</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">解除绑定</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>


	<table id="datagrid" style="height: 250px" title="关注公众号列表"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

	<div id="detailWin" class="dialog"
		data-options="modal:true,width:500,height:400,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
				<input type="hidden" name="dto.mpUser.wxMpUserId" />
				<input type="hidden" name="dto.mpUser.wxMpHeadimgurl" />
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>微信MpOpenId:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.mpUser.wxMpOpenId' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>wxMpSciPointer:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.mpUser.wxMpSciPointer' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>微信MpUnionid:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.mpUser.wxMpUnionid' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>微信昵称:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' class='validatebox' type='text'
						name='dto.mpUser.wxMpNickname' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>关注公众号时间:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' type='text'
						name='dto.mpUser.wxMpSubscribeWxTime' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>绑定时间:</td>
					<td class='textParent' style='text-align: left; width: 30%'><input
						style='width: 250px;' type='text'
						name='dto.mpUser.wxMpSubscribeSciTime' readonly="readonly"></input></td>
				</tr>
				<tr>
					<td class='textLabel' style='text-align: right; width: 20%'>推送消息:</td>
					<td class='textParent' style='text-align: left; width: 30%'><select
						class="combobox" name="dto.mpUser.wxMpSend" style="width: 200px;">
							<option value="1">推送</option>
							<option value="0">不推送</option>
					</select></td>
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

	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:200,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">

		<table style="width: 100%;">
			<tr>
				<td class="textLabel">微信昵称:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.mpUser.wxMpNickname" /></td>
			</tr>
			<tr>
				<td class="textLabel">绑定开始时间:</td>
				<td class="textParent"><input style="width: 250px;"
					class="datebox" type="text" name="dto.startDate" /></td>
			</tr>
			<tr>
				<td class="textLabel">绑定结束时间:</td>
				<td class="textParent"><input style="width: 250px;"
					class="datebox" type="text" name="dto.endDate" /></td>
			</tr>
		</table>
		<div id="searchBtnDiv" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="selectBt"
						class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
						id="cancelBtn" class="linkbutton"
						data-options="iconCls:'icon-cancel'"
						onclick="javascript:cancelClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

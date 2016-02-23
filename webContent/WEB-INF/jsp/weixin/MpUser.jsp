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
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
	</div>


	<table id="datagrid" style="height: 250px" title="xxx"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

	<div id="detailWin" class="dialog" 
		data-options="modal:true,width:400,height:200,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
				<input type="hidden" name="dto.mpUser.wxMpUserId"/><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpOpenId:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.mpUser.wxMpOpenId' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpSciPointer:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.mpUser.wxMpSciPointer' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpUnionid:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.mpUser.wxMpUnionid' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpNickname:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.mpUser.wxMpNickname' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpSubscribeWxTime:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='datebox' type='text' name='dto.mpUser.wxMpSubscribeWxTime' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpSubscribeSciTime:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='datebox' type='text' name='dto.mpUser.wxMpSubscribeSciTime' ></input></td></tr><tr><td class='textLabel' style='text-align: right; width: 20%'>wxMpHeadimgurl:</td><td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.mpUser.wxMpHeadimgurl' ></input></td></tr>
			</table>
			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:350,height:150,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<table id="saveOrUpdateTable" style="width: 100%;">
			</table>	
			<div id="searchBtnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="selectBt" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div>
	</div>
</body>
</html>

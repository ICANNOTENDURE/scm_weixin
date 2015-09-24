<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hopCtlocDes.js"></script>
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


	<table id="datagrid" title='科室收货地址管理'
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>
		
	<div id="detailWin" class="dialog" title="新增收货信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#btnDiv1'"
		style="vertical-align: middle;">
		<form id="ctlocDesDestail" method="post">
			<table style="width: 100%;" >
				<tr style="display: none">
					<input type="hidden" name="dto.hopCtlocDestination.hopCtlocDestinationId" id="hopCtlocDestinationId"/>
				</tr>
				<tr>
					<td class="textLabel">科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.hopCtlocDestination.ctlocDr"
						 id="comboCtloc" required="true"/></td>					
				</tr>
				
				<tr>
					<td class="textLabel">联系人员:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.hopCtlocDestination.contact"
						 id="contact" /></td>					
				</tr>
				<tr>
					<td class="textLabel">联系电话:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtlocDestination.tel"
						 id="tel" /></td>					
				</tr>
				<tr>
					<td class="textLabel">邮箱:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtlocDestination.mail"
						 id="mail" /></td>					
				</tr>
				<tr>
					<td class="textLabel">代码:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.hopCtlocDestination.code"
						 id="code" class="validatebox" required="true"/></td>					
				</tr>
				<tr>
					<td class="textLabel">地址:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopCtlocDestination.destination"
						data-options="required:true" id="destination" class="validatebox" required="true"/></td>					
				</tr>
				<tr>
					<td class="textLabel">默认收货地址:</td>
					<td class="textParent"><input style="width: 50px;" type="checkbox" id="defaultFlag"/></td>					
				</tr>
			</table>			
			<div id="btnDiv1" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateCtlocDesBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<div id="searchCtlocDesWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:150,closed:true,buttons:'#searchBtnDivs'"
		style="vertical-align: middle;">
		<table style="width: 100%;" >				
			<tr>
				<td class="textLabel">科室描述:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.hopCtlocDestination.ctlocDr"
				    id="ctlocDesDr" /></td>					
			</tr>
			<tr>
				<td class="textLabel">收货地点:</td>
				<td class="textParent"><input style="width: 250px;"
					class="validatebox" type="text" name="dto.hopCtlocDestination.destination" 
					id="destinations" /></td>					
			</tr>			
		</table>		
		<div id="searchBtnDivs" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchCtlocDesInfoBt" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="searchCtlocDesCanBt"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
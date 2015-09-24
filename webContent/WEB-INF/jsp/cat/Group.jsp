<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/cat/Group.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		名&nbsp;&nbsp;称: <input id="queryPar" style="width: 100px;"
			type="text" />
		<a class="linkbutton"
			data-options="iconCls:'icon-search'"
			onclick="javascript:selectClick()">查询</a>
		<br>	
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a> 
	</div>
	
	<div id="toolbar2" class="toolbar">
		名&nbsp;&nbsp;称: <input id="queryPar2" style="width: 100px;"
			type="text" />	
		<a class="linkbutton"
			data-options="iconCls:'icon-search'"
			onclick="javascript:selectClick2()">查询</a>
	</div>


	<div id="detailWin" class="dialog" 
		data-options="modal:true,width:400,height:150,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
			    <tr style="display: none">
					<input type="hidden" name="dto.group.sgId" id="sgId"/>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.group.sgCode" data-options="required:true" id="sgCode"></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">描述</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.group.sgDesc" id="sgDesc" data-options="required:true"></input>
					</td>
				</tr>
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


	
	<div class="layout" data-options="fit:'true',border:true">
		<div data-options="region:'center',title:'大类维护',iconCls:'icon-ok'">
			<table id="datagrid" 
				data-options="toolbar:'#toolbar', fit:true, fitColumns:true,singleSelect:true,pagination:true">
			</table>
		</div>
		<div data-options="region:'east',title:'类祖',iconCls:'icon-edit'"  style="width: 650px">
            <table id="datagrid2" style="width:250px "  class="datagrid"
				data-options="toolbar:'#toolbar2', fit:true,fitColumns:true,pagination:true"> 
			</table>
        </div>
  
    </div>
</body>
</html>

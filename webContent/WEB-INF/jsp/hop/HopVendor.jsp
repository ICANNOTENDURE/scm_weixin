<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/HopVendor.js"></script>

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
			<a class="linkbutton"
			data-options="iconCls:'icon-save',plain:true"
			onclick="javascript:exportClick()">导入</a>
	</div>


	<table id="datagrid" style="height: 250px" title="xxx"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

	<div id="detailWin" class="dialog" 
		data-options="modal:true,width:600,height:200,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table id="saveOrUpdateTable" style="width: 100%;">
			    <tr style="display: none">
					<input type="hidden" name="dto.hopVendor.hopVendorId" />
					<input type="hidden" name="dto.hopVendor.hopVenId" />
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopCode" data-options="required:true"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">名称:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopName" data-options="required:true"></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">别名:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopAlias" data-options="required:true"></input>
					</td>
					<td class="textLabel" style="text-align: right; width: 20%">类型:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopType" data-options="required:true"></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%" colspan="2">工商执照注册号/统一社会信用代码:</td>
					<td class="textParent" style="text-align: left; width: 30%" colspan="2"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.businessRegNo" data-options="required:true"></input>
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

	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:400,height:200,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<table id="saveOrUpdateTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">医院供应商代码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopCode" ></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">医院供应商名称:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopName" ></input>
					</td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">医院供应商类别:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input
						style="width: 250px;" class="validatebox" type="text"
						name="dto.hopVendor.hopType" ></input>
					</td>
				</tr>
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
	
	
	<div id="importDialog" class="dialog" title="导入供应商"
		style="width: 1000px; height: 400px; background-color: #F5FAFD;"
		data-options="
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
			<table id="addFuncsTable" style="width: 100%;">

				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 250px;" class="validatebox" type="file"
						name="upload" id="orderUpload"></input></td>
				</tr>
			</table>
			<table>
	    		<tr id="impModel">
	    			<td class="time">模版 </td>
	    		</tr>
	    	</table>
	    	<div id="err"></div>
	</div>
<div id="gg" class="dialog" title="请等待"
		style="width: 1020px; height: 450px; padding: 10px;"
		data-options="
				modal:true,
				draggable:false,
				closable:false,
				closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">

		<p1>正在处理上传数据，请等待</p1>
	</div>
	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/hop/hopInc.js"></script>
	
	<style type="text/css">

.item{
 text-align:center;
 border:1px solid #499B33;
 background:#fafafa;
 color:#444;
 width:160px;
}
</style>
	
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
			onclick="javascript:importOrder()">导入</a>
	</div>


	<table id="datagrid" title="医院商品信息维护"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>
	
	<div id="drugInfoWin" class="dialog" title="新增药品信息"
		data-options="modal:true,width:750,height:220,closed:true,buttons:'#btnDiv0'"
		style="vertical-align: middle;">
		<form id="incdetail" method="post">
			<table style="width: 100%;" >
				<tr style="display: none">
					<input type="hidden" name="dto.hopInc.incId" />
					<input type="hidden" name="dto.hopInc.hopId" />
				</tr>
				<tr>
					<td class="textLabel">商品代码:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incCode"
						data-options="required:true" id="inciCode" /></td>
					<td class="textLabel">商品名称:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incName"
						data-options="required:true" id="inciName"/></td>
				</tr>								
				<tr>
					<td class="textLabel">单位代码:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incUomcode"
						data-options="required:true" id="incUomcode" /></td>
					<td class="textLabel">单位名称:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incUomname"
						data-options="required:true" id="incUomname"/></td>
				</tr>
				<tr style="display: none;">
					<td class="textLabel">小单位代码:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.hopInc.incBuomcode"
						 id="incBuomcode" /></td>
					<td class="textLabel">小单位名称:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incBuomname"
						data-options="required:true" id="incBuomname"/></td>
				</tr>
				<tr>
					<td class="textLabel">厂商:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.hopInc.incManfid"
						data-options="required:true" id="incManfid" /></td>
						
					<!--  -->	
					<td class="textLabel">医院:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.hopInc.incHospid"
						data-options="required:true" id="incHospid" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="textLabel">规格:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incSpec"
						data-options="required:true" id="incFac" /></td>
					<td class="textLabel">进价:</td>
					<td class="textParent"><input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incRp"
						data-options="required:true" id="incRp" /></td>
				</tr>
				<tr>
					<td class="textLabel">分类:</td>
					<td class="textParent">
					<!-- 改成下拉列表  duyadong-->
					<input id="incCat" class="combobox" type="text" name="dto.hopInc.incCat"
						data-options="required:true" />
    				<!--  
					<input style="width: 250px;"
						class="validatebox" type="text" name="dto.hopInc.incCat"
						data-options="required:true" />
					-->
					</td>
					<td class="textLabel">售价:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.hopInc.incSp"
						 /></td>
				</tr>
				<tr>
					<td class="textLabel">别名:</td>
					<td class="textParent" colspan="3"><input style="width: 400px;"
						class="validatebox" type="text" name="dto.hopInc.incAliaS"
						id="incAliaS"/>(多个别名用逗号分割)</td>
				</tr>										
			</table>			
					
			<div id="btnDiv0" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateIncBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>	
			
	<div id="searchIncWin" class="dialog" title="查询药品信息"
		data-options="modal:true,width:400,height:250,closed:true,buttons:'#searchBtnDiv0'"
		style="vertical-align: middle;">
		<table style="width: 100%;" >				
			<tr>
				<td class="textLabel">商品代码:</td>
				<td class="textParent"><input style="width: 250px;"
					type="text" name="dto.hopInc.incCode"
					id="incCodes" /></td>
			</tr>
			<tr>
				<td class="textLabel">商品描述:</td>
				<td class="textParent"><input style="width: 250px;"
					type="text" name="dto.hopInc.incName"
					id="incNames" /></td>
			</tr>
			<tr>
				<td class="textLabel">厂商:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.hopInc.incManfid"
					id="incManfs" /></td>
			</tr>
			<tr>
				<td class="textLabel">医院:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.hopInc.incHospid"
					id="incHosps" /></td>
			</tr>
			<tr>
				<td class="textLabel">His药品:</td>
				<td class="textParent"><input style="width: 250px;"
					type="text" name="dto.hopInc.incHissysid"
					id="incHissysids" /></td>
			</tr>
		</table>
		<div id="searchBtnDiv0" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchIncInfoBtn" class="linkbutton"
						data-options="iconCls:'icon-save'">提交</a> <a id="searchHospCanBt"
						class="linkbutton" data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	
	
	<div id="importDialog" class="dialog" title="导入药品"
		style="width: 1020px; height: 450px; background-color: #F5FAFD;"
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
	</div>
</body>
</html>
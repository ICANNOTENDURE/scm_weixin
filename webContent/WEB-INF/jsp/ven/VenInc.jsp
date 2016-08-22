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
	src="<%=request.getContextPath()%>/js/dhcc/pms/ven/VenInc.js"></script>
<style>
.idContainer {
	border: 1px solid #000;
	width: 300px;
	height: 250px;
	background: #FFF center no-repeat;
	position: absolute;
	align: "center";
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
			onclick="javascript:selectClick()">查询</a> <a class="linkbutton"
			data-options="iconCls:'icon-save',plain:true"
			onclick="javascript:importClick()">导入</a><a class="linkbutton"
			data-options="iconCls:'icon-print',plain:true"
			onclick="javascript:printHvClick()">打印高值条码</a>
	</div>


	<table id="datagrid" title="供应商商品信息维护"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>

	<div id="drugInfoWin" class="dialog"
		data-options="modal:true,width:900,height:600,closed:true,buttons:'#btnDiv0'"
		style="vertical-align: top;">
		<form id="incdetail" method="post">
			<div id="tt" class="tabs" style="width: 900; height: 600;">
				<div title="基本信息">
					<table style="width: 900;" id="tableDetail">
						<tr style="display: none">
							<input type="hidden" name="dto.venInc.venIncId" />
							<input type="hidden" name="dto.venInc.venIncVenid" />
							<input type="hidden" name="dto.venInc.venIncOrderQty" />
							<input type="hidden" name="dto.venInc.venIncCommentNum" />
							<input type="hidden" name="dto.venInc.venIncResQty" />
							<input type="hidden" name="dto.venInc.venIncAvailQty" />
						</tr>
						<tr>
							<td class="textLabel">商品代码:</td>
							<td class="textParent"><input style="width: 250px;"
								class="validatebox" type="text" name="dto.venInc.venIncCode"
								 id="venIncCode" /></td>
							<td class="textLabel">商品名称:</td>
							<td class="textParent"><input style="width: 250px;"
								class="validatebox" type="text" name="dto.venInc.venIncName"
								data-options="required:true" id="venIncName" /></td>
						</tr>
						<tr>
							<td class="textLabel">单位代码:</td>
							<td class="textParent"><input style="width: 250px;"
								class="validatebox" type="text" name="dto.venInc.venIncUomcode"
								 id="venIncUomcode" /></td>
							<td class="textLabel">单位名称:</td>
							<td class="textParent"><input style="width: 250px;"
								class="validatebox" type="text" name="dto.venInc.venIncUomname"
								data-options="required:true" id="venIncUomname" /></td>
						</tr>
						<tr>
							<td class="textLabel">商品条码:</td>
							<td class="textParent" colspan="3"><input style="width: 100%;"
								class="validatebox" type="text" name="dto.venInc.venIncBarCode"
								 id="venIncUomcode" /></td>
						</tr>
						<tr>
							<td class="textLabel">价格:</td>
							<td class="textParent"><input style="width: 250px;"
								class="validatebox" type="text" name="dto.venInc.venIncPrice"
								id="venIncPrice" /></td>
							<td class="textLabel">别名:</td>
							<td class="textParent"><input style="width: 250px;"
								type="text" name="dto.venInc.venIncAlias" id="venIncAlias" /></td>
						</tr>
						<tr>
							<td class="textLabel">库存:</td>
							<td class="textParent"><input type="text"
								name="dto.venInc.venIncQty" style="width: 250px;" /></td>
							<td class="textLabel">厂商:</td>
							<td class="textParent"><input style="width: 250px;"
								class="combobox" type="text" name="dto.venInc.venIncManfid"
								data-options="required:true" id="venIncManfid" /></td>
						</tr>
						<tr>
							<td class="textLabel">大类:</td>
							<td class="textParent"><input id="group" class="combobox"
								type="text" style="width: 250px;" /></td>
							<td class="textLabel">类组:</td>
							<td class="textParent"><input style="width: 250px;"
								class="combobox" id="catgroup" /></td>
						</tr>
						<tr id="incCat">
							<td class="textLabel" >小类:</td>
							<td class="textParent"><input id="subcatgroup"
								class="combobox" type="text" name="dto.venInc.venIncCatId"
								 id="venIncCat"
								style="width: 250px;" /></td>
						</tr>
						<tr>
							<td class="textLabel">上传图片:</td>
							<td class="textParent" style="text-align: left; width: 30%"><input
								id="upload" name="upload" type="file" multiple="true"
								style="width: 100%"></td>

							<td class="textLabel">顺序:</td>
							<td class="textParent" style="text-align: left; width: 30%"><input
								style="width: 250px;" type="text" id="venIncSeq" value="1" /></td>
						</tr>
					</table>

				</div>
				<div title="资质信息" data-options="" style="overflow: auto;">
					<table style="width: 100%;" id="qualifyDetail">
					</table>
				</div>
			</div>



			<div id="btnDiv0" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateIncBtn"
							class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
							id="cancelBtn" class="linkbutton"
							data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div id="searchIncWin" class="dialog" title="查询商品信息"
		data-options="modal:true,width:400,height:300,closed:true,buttons:'#searchBtnDiv0'"
		style="vertical-align: middle;">
		<table style="width: 100%;">
			<tr>
				<td class="textLabel">商品代码:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venInc.venIncCode" id="venIncCodes" /></td>
			</tr>
			<tr>
				<td class="textLabel">商品描述:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venInc.venIncName" id="venIncNames" /></td>
			</tr>
			<tr>
				<td class="textLabel">厂商:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.venInc.venIncManfid"
					id="venIncManfids" /></td>
			</tr>
			<tr>
				<td class="textLabel">供应商:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.venInc.venIncVenid"
					id="venIncVenids" /></td>
			</tr>
			<tr>
				<td class="textLabel">别名:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venInc.venIncAlias" /></td>
			</tr>
			<tr>
				<td class="textLabel">大类:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.venInc.groupId"
					id="searchGroup" /></td>
			</tr>
			<tr>
				<td class="textLabel">类组:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.venInc.catGroupId"
					id="searchCatgroup" /></td>
			</tr>
			<tr>
				<td class="textLabel">小类:</td>
				<td class="textParent"><input style="width: 250px;"
					class="combobox" type="text" name="dto.venInc.venIncCatId"
					id="venIncCat" /></td>
			</tr>
		</table>
		<div id="searchBtnDiv0" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchIncInfoBtn"
						class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
						id="searchIncCanBt" class="linkbutton"
						data-options="iconCls:'icon-cancel'"
						onclick="javascript:selectCanBtClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	
	<!-- 打印高值条码 -->
	<div id="printHvWin" class="dialog" title="打印高值条码 "
		data-options="modal:true,width:400,height:300,closed:true,buttons:'#printHvBtn'"
		style="vertical-align: middle;">
		<table style="width: 100%;">
			<input type="hidden" name="dto.venIncIdPrn" />
			<tr>
				<td class="textLabel">供应商代码:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venCodePrn" /></td>
			</tr>
			<tr>
				<td class="textLabel">商品编码:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venIncCodePrn" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="textLabel">商品名称:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.venIncNamePrn" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="textLabel">效期:</td>
				<td class="textParent"><input style="width: 250px;"
					class="datebox" type="text" name="dto.venExpPrn"
				id="venExpPrn"	/></td>
			</tr>
			<tr>
				<td class="textLabel">打印次数:</td>
				<td class="textParent"><input style="width: 250px;"
					 type="text" name="dto.venCountPrn"
					/></td>
			</tr>
			<tr>
				<td class="textLabel">重复次数:</td>
				<td class="textParent"><input style="width: 250px;"
					 type="text" name="dto.venReaptPrn"
					/></td>
			</tr>
		</table>
		<div id="printHvBtn" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="searchIncInfoBtn"
						class="linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:printSelectHv()"> 打印</a> </td>
				</tr>
			</table>
		</div>
	</div>

	<div id="importDialog" class="dialog" title="导入商品"
		style="width: 600px; height: 400px; background-color: #F5FAFD;"
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
					style="width: 250px;" class="validatebox" type="file" id="import"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">下载模版:</td>
				<td class="textParent"><a href="../tmpl/importVenInc.xls">下载</a></td>
			</tr>
		</table>
		<table>
			<tr id="impModel">
				<td class="time">模版</td>
			</tr>
		</table>
		<div id="err"></div>
	</div>
	


	<div id="gg" class="dialog" title="请等待"
		style="width: 600px; height: 400px; padding: 10px;"
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
	<style type="text/css">
.item {
	text-align: center;
	border: 1px solid #499B33;
	background: #fafafa;
	color: #444;
	width: 90px;
}
</style>
</body>
</html>

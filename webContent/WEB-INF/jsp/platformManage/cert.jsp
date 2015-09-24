<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	cursor: pointer;
	color: red;
}

.textLabel {
	margin-top: 0px;
	margin-left: 0px;
	font-size: 12px;
	text-align: right;
	background-color: #E6F1FA;
	width: 25%;
}

.textParent {
	margin-top: 0px;
	margin-left: 0px;
	font-size: 12px;
	text-align: left;
	background-color: #F5FAFD;
	width: 75%;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/cert.js"></script>
</head>
<body>

	<div id="toolbar" class="toolbar" style="height: auto">
		<span>查询条件:</span> <select id="certColumnName" panelHeight="auto"
			style="width: 100px">
			<option value="certSerialNum" selected="true">证书序列号</option>
		</select> <input id="certColumnValue" style="width: 200px;" type="text" /> <a
			id="searchCertBtn" href="#" class="linkbutton" iconCls="icon-search">查询</a>
	</div>

	<table id="datagrid" class="datagrid" fit="true"
		data-options="
    toolbar:'#toolbar',
    rownumbers:true,
    method:'get',
    url:'certCtrl!certList.htm',
    pagination:true,
    fitColumn:true,
    singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'certSerialNum',width:150,align:'center'">证书序列号</th>
				<th
					data-options="field:'certState',width:100,align:'center',formatter:cenvertCert">证书状态</th>
				<th data-options="field:'organization',width:150,align:'center'">机构名称</th>
				<th data-options="field:'beginTime',width:150,align:'center'">生效时间</th>
				<th data-options="field:'endTime',width:150,align:'center'">过期时间</th>
				<th data-options="field:'createTime',width:150,align:'center'">创建时间</th>
				<th
					data-options="field:'certInfo',width:100,align:'center',formatter:certInfoFormater">下载证书</th>
				<th
					data-options="field:'certKeyInfo',width:150,align:'center',formatter:keyInfoFowformater">下载密钥</th>
			</tr>
		</thead>
	</table>

	<div id="saveOrUpdateWindow" class="dialog"
		style="vertical-align: middle;"
		data-options="buttons:'#saveOrUpdateBtn',modal:true,width:480,heigth:450,closed:true,onClose:function(){clear();}">
		<form id="saveOrUpdateForm" method="post">

			<table id="saveOrUpdateTable"
				style="background-color: #F5FAFD; width: 100%">
				<tr class="hiddenRow">
					<td class="textLabel">有效时间:</td>
					<td><input id="beginTime" class="datetimebox"
						name="certDto.cert.beginTime" type="text"
						data-options="required:true" style="width: 147px;" /> 至 <input
						id="endTime" class="datetimebox" name="certDto.cert.endTime"
						type="text" data-options="required:true" style="width: 147px;" />
					</td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">国家:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.country" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">省份:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.province" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">城市:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.locality" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">组织名称:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.organization" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">组织单位名称:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.section" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">申请者名称:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.commonName" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr class="hiddenRow">
					<td class="textLabel">申请者EMAIL:</td>
					<td colspan="3" style="text-align: left"><input
						class="validatebox" name="certDto.cert.email" type="text"
						data-options="required:true" style="width: 310px;" /></td>
				</tr>
				<tr>
					<td class="textLabel">证书状态:</td>
					<td colspan="3" style="text-align: left"><input id="certState"
						style="width: 310px;" name="certDto.cert.certState"
						class="combobox"
						data-options="
											required:true,
											valueField: 'value',
											textField: 'show',
											panelHeight:'auto',
											data: [{
												show: '未使用',
												value: '1'
											},{
												show: '正常使用',
												value: '2'
											},{
											    show: '吊销',
												value: '3'
											},{
											    show: '到期',
												value: '4'
											}]" />
					</td>
				</tr>
				<tr style="display: none">
					<td>唯一标识符:</td>
					<td><input class="validatebox" name="certDto.cert.certId"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>证书序列号:</td>
					<td><input class="validatebox"
						name="certDto.cert.certSerialNum" type="text"
						data-options="required:false" style="width: 310px;" /></td>
				</tr>
				<tr style="display: none">
					<td>网关编号:</td>
					<td><input class="validatebox" name="certDto.cert.gatewayId"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>创建时间:</td>
					<td><input class="validatebox" name="certDto.cert.createTime"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>证书流信息:</td>
					<td><input class="validatebox" name="certDto.cert.certInfo"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>密钥流信息:</td>
					<td><input class="validatebox" name="certDto.cert.certKeyInfo"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>证书申请者信息:</td>
					<td><input class="validatebox" name="certDto.cert.subjectDn"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr style="display: none">
					<td>颁发者信息:</td>
					<td><input class="validatebox" name="certDto.cert.issuerDn"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
			</table>

		</form>
	</div>
	<div id="saveOrUpdateBtn" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="saveOrUpdateSubmitBtn"
					class="linkbutton" data-options="iconCls:'icon-save',plain:true">提交</a>
					<a id="saveOrUpdateCancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">取消</a></td>
			</tr>
		</table>
	</div>

	<div id="queryWindow" class="dialog" style="vertical-align: middle;"
		data-options="buttons:'#queryBtn',modal:true,width:500,heigth:400,closed:true,onClose:function(){clear();}">
		<form id="queryForm">

			<table id="queryTable" style="background-color: #F5FAFD; width: 100%">
				<tr>
					<td class="textLabel">证书序列号:</td>
					<td><input class="validatebox"
						name="certDto.cert.certSerialNum" type="text"
						data-options="required:false" style="width: 310px;" /></td>
				</tr>
				<tr>
					<td class="textLabel">证书状态:</td>
					<td colspan="3" style="text-align: left"><input
						id="queryCertState" style="width: 230px;"
						name="certDto.cert.certState" class="combobox"
						data-options="
											required: false,
											valueField: 'value',
											textField: 'show',
											panelHeight:'auto',
											data: [{
												show: '未使用',
												value: '1'
											},{
												show: '正常使用',
												value: '2'
											},{
											    show: '吊销',
												value: '3'
											},{
											    show: '到期',
												value: '4'
											}]" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">生效时间:</td>
					<td><input class="datetimebox" name="certDto.beginTimeStart"
						type="text" data-options="required:false" style="width: 147px;" />
						至 <input class="datetimebox" name="certDto.beginTimeEnd"
						type="text" data-options="required:false" style="width: 147px;" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">过期时间:</td>
					<td><input class="datetimebox" name="certDto.endTimeStart"
						type="text" data-options="required:false" style="width: 147px;" />
						至 <input class="datetimebox" name="certDto.endTimeEnd" type="text"
						data-options="required:false" style="width: 147px;" /></td>
				</tr>
				<tr>
					<td class="textLabel">创建时间:</td>
					<td><input class="datetimebox" name="certDto.createTimeStart"
						type="text" data-options="required:false" style="width: 147px;" />
						至 <input class="datetimebox" name="certDto.createTimeEnd"
						type="text" data-options="required:false" style="width: 147px;" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">国家:</td>
					<td><input class="validatebox" name="certDto.cert.country"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">省份:</td>
					<td><input class="validatebox" name="certDto.cert.province"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">城市:</td>
					<td><input class="validatebox" name="certDto.cert.locality"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
				<tr>
					<td class="textLabel">申请者名称:</td>
					<td><input class="validatebox" name="certDto.cert.commonName"
						type="text" data-options="required:false" style="width: 310px;" />
					</td>
				</tr>
			</table>

		</form>
	</div>
	<div id="queryBtn" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="querySubmitBtn"
					class="linkbutton" data-options="iconCls:'icon-search'">查找</a> <a
					id="queryCancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel'">取消</a></td>
			</tr>
		</table>
	</div>

</body>
</html>
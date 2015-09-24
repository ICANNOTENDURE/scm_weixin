<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/org.js"></script>
</head>
<body>
	<table id="datagrid" class="datagrid" fit="true"
		data-options="
    rownumbers:true,
    toolbar:'#toolbar',
    method:'post',
    url:'orgCtrl!orgList.htm',
    pagination:true,
    fitColumn:true,
    singleSelect:true">
		<thead>
			<tr>
				<th data-options="field:'orgId',hidden:true">唯一标识符</th>
				<th data-options="filed:'orgCenterId',hidden:true">数据中心机构标识符</th>
				<th data-options="field:'orgName',width:120,align:'center'">机构名称</th>
				<th data-options="field:'orgCode',width:90,align:'center'">机构代码</th>
				<th data-options="field:'addrState',width:110,align:'center'">地址-省</th>
				<th data-options="field:'addrCity',width:110,align:'center'">地址-市</th>
				<th data-options="field:'addrCounty',width:110,align:'center'">地址-县</th>
				<th data-options="field:'addrTown',width:110,align:'center'">地址-乡</th>
				<th data-options="field:'addrState',width:110,align:'center'">地址-村</th>
				<th data-options="field:'addrStreet',width:80,align:'center'">地址-门牌号</th>
				<th data-options="field:'addrDistrictsCode',width:80,align:'center'">地址-区划码</th>
				<th data-options="field:'useState',width:65,align:'center'">使用状态</th>
				<!-- <th data-options="field:'serverType',hidden:true">服务器类型</th> -->
				<th data-options="field:'serverName',width:120,align:'center'">接入前置机名称</th>
				<!-- <th data-options="field:'ip',width:120">前置机IP</th> -->
			</tr>
		</thead>
	</table>

	<div id="orgInfoWin" class="dialog" style="vertical-align: middle;"
		data-options="modal:true,width:450,height:'auto',closed:true,onClose:function(){clear();}">
		<form id="orgInfoForm" method="post">
			<br>
			<table>
				<tr id="rowId" align="right" style="display: none">
					<td width="150">机构编号:</td>
					<td><input class="validatebox" name="orgDto.org.orgId"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<!-- <tr class="row" align="right" style="display:none">
          <td width="80">数据中心所在机构:</td>
          <td> <input class="validatebox" name="orgDto.org.orgCenterId"
            type="text" data-options="required:false" style="width:250px;">
          </td>
        </tr> -->
				<tr align="right">
					<td width="150">机构名称:</td>
					<td><input class="validatebox" name="orgDto.org.orgName"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">机构代码:</td>
					<td><input class="validatebox" name="orgDto.org.orgCode"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-省(自治区、直辖市):</td>
					<td><input class="validatebox" name="orgDto.org.addrState"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-市(地区、州):</td>
					<td><input class="validatebox" name="orgDto.org.addrCity"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-县(区):</td>
					<td><input class="validatebox" name="orgDto.org.addrCounty"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-乡(镇、街办):</td>
					<td><input class="validatebox" name="orgDto.org.addrTown"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-村(街、路、弄等):</td>
					<td><input class="validatebox" name="orgDto.org.addrStreet"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-门牌号码:</td>
					<td><input class="validatebox"
						name="orgDto.org.addrHouseNumber" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr align="right">
					<td width="150">地址-行政区划码:</td>
					<td><input class="validatebox"
						name="orgDto.org.addrDistrictsCode" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr align="right">
					<td width="150">使用状态:</td>
					<td style="text-align: left"><input id="useState"
						class="combobox" name="orgDto.org.useState"
						data-options="
              dict:'use_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:256,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td width="150">接入前置机:</td>
					<td><input class="validatebox" name="orgDto.server.serverName"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr class="row" align="right" style="display: none">
					<td width="80">前置机IP:</td>
					<td><input class="validatebox" name="orgDto.server.ip"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
				<a id="submitBtn" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">提交</a> <a
					id="cancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>

	<div id="queryOrgWin" class="dialog" style="vertical-align: middle;"
		data-options="modal:true,width:450,height:'auto',closed:true,onClose:function(){clear();}">
		<form id="queryOrgForm" method="post">
			<br>
			<table>
				<!-- <tr align="right">
          <td width="80">机构编号:</td>
          <td> <input class="validatebox" name="orgDto.org.orgId" type="text"
            data-options="required:false" style="width:250px;">
          </td>
        </tr> -->
				<tr align="right">
					<td width="150">机构名称:</td>
					<td><input class="validatebox" name="orgDto.org.orgName"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">机构代码:</td>
					<td><input class="validatebox" name="orgDto.org.orgCode"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-省(自治区、直辖市):</td>
					<td><input class="validatebox" name="orgDto.org.addrState"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-市(地区、州):</td>
					<td><input class="validatebox" name="orgDto.org.addrCity"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-县(区):</td>
					<td><input class="validatebox" name="orgDto.org.addrCounty"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-乡(镇、街办):</td>
					<td><input class="validatebox" name="orgDto.org.addrTown"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-村(街、路、弄等):</td>
					<td><input class="validatebox" name="orgDto.org.addrStreet"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
				<tr align="right">
					<td width="150">地址-门牌号码:</td>
					<td><input class="validatebox"
						name="orgDto.org.addrHouseNumber" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr align="right">
					<td width="150">地址-行政区划码:</td>
					<td><input class="validatebox"
						name="orgDto.org.addrDistrictsCode" type="text"
						data-options="required:false" style="width: 250px;"></td>
				</tr>
				<tr align="right">
					<td width="150">使用状态:</td>
					<td style="text-align: left"><input class="combobox"
						name="orgDto.org.useState"
						data-options="
              dict:'use_state',
              valueField:'value',
              textField:'desc',
              multiple:false,
              required:false,
              width:256,
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr align="right">
					<td width="150">接入前置机:</td>
					<td><input class="validatebox" name="orgDto.server.serverName"
						type="text" data-options="required:false" style="width: 250px;">
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
				<a id="querySubmitBtn" class="linkbutton"
					data-options="iconCls:'icon-search',plain:true">查找</a> <a
					id="queryCancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>
		</form>
	</div>
</body>
</html>
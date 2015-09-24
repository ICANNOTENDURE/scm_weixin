<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/systemVersion.js"></script>
</head>
<body>
	<table id="tt" title="业务系统及安装包目录" class="treegrid" fit="true"
		data-options="
    url:'systemVersionCtrl!getSystemVersionCatalog.htm',
    method:'get',
    animate:true,
    onContextMenu:rightClick,
    idField:'versionId',
    treeField:'systemName'">
		<thead>
			<tr>
				<!-- <th data-options="field:'versionId',hidden:true">唯一标识符</th> -->
				<th data-options="field:'systemName',width:380">业务系统名称</th>
				<th data-options="field:'systemType',width:100">业务系统类型</th>
				<th data-options="field:'contextRoot',width:110">业务系统上下文</th>
				<th data-options="field:'version',width:100">业务系统版本</th>
				<th data-options="field:'filePath',width:380">文件路径</th>
				<th data-options="field:'useState',width:70">使用状态</th>
			</tr>
		</thead>
	</table>

	<div id="addVersionWin" class="window" shadow="false"
		style="vertical-align: middle;"
		data-options="modal:true,width:450,height:'auto',closed:true">
		<form id="addVersionForm" method="post" enctype="multipart/form-data">
			<table>
				<br>
				<tr align="right" style="display: none">
					<td width="90">parentId:</td>
					<td style="text-align: left"><input class="validatebox"
						name="systemVersionDto.systemVersion.parentId"
						style="width: 312px;" type="text" data-options="required:false"></td>
				</tr>
				<tr class="createDir" align="right">
					<td width="90">业务系统类型:</td>
					<td style="text-align: left"><input class="validatebox"
						name="systemVersionDto.systemVersion.systemType" type="text"
						style="width: 312px;" data-options="required:true"> <!-- <input class="combobox" name="systemVersionDto.systemVersion.systemType"
            style="width:318px;" data-options="
              dict:'system_type',
              valueField:'value',
              textField:'desc',
              multiple:false,
              editable:true,
              required:false"> --></td>
				</tr>
				<tr class="createDir" align="right">
					<td width="90">业务系统名称:</td>
					<td style="text-align: left"><input class="validatebox"
						name="systemVersionDto.systemVersion.systemName"
						style="width: 312px;" type="text" data-options="required:false"></td>
				</tr>
				<tr class="createDir" align="right">
					<td width="90">业务系统上下文:</td>
					<td style="text-align: left"><input class="validatebox"
						name="systemVersionDto.systemVersion.contextRoot"
						style="width: 312px;" type="text" data-options="required:false"></td>
				</tr>

				<tr class="addPkg" style="display: none">
					<td style="width: 65px; padding-left: 15px;">安装包存放路径:</td>
					<td style="text-align: left"><input id="catalogue"
						class="combotree" style="width: 318px;"
						name="systemVersionDto.systemVersion.filePath"
						data-options="
              url:'systemVersionCtrl!getSystemVersionCatalog.htm',
              method:'post',
              required:false,
              editable:false,
              idField:'versionId',
              treeField:'systemName',
              panelHeight:'auto'" />
					</td>
				</tr>
				<tr class="addPkg" style="display: none">
					<td style="width: 65px; padding-left: 39px;">选择安装包:</td>
					<td><input type="file" class="validatebox"
						style="width: 312px;" name="appSystem"></td>
				</tr>
				<tr align="right">
					<td width="80">业务系统版本:</td>
					<td style="text-align: left"><input class="validatebox"
						name="systemVersionDto.systemVersion.version"
						style="width: 312px;" type="text" data-options="required:false"></td>
				</tr>
				<tr align="right">
					<td width="80">描述:</td>
					<td><textarea rows="2" cols="36"
							name="systemVersionDto.systemVersion.description"></textarea></td>
				</tr>
				<tr class="addPkg" align="right">
					<td width="80">使用状态:</td>
					<td style="text-align: left"><input class="combobox"
						name="systemVersionDto.systemVersion.useState"
						data-options="
            dict:'use_state',
            valueField:'value',
            textField:'desc',
            multiple:false,
            required:false,
            width:200,
            panelHeight:'auto'" />
					</td>
				</tr>
			</table>
			<br>

			<div id="btn" align="center">
				<a id="createBtn" class="linkbutton"
					data-options="iconCls:'icon-add',plain:true">新建</a> <a
					id="giveUpBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">取消</a> <a
					id="uploadBtn" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">上传</a> <a
					id="cancelBtn" class="linkbutton"
					data-options="iconCls:'icon-cancel',plain:true">放弃</a>
			</div>
			<br>

			<div id="mm" class="menu">
				<div id="mm-subdir" onclick="javascript:createSubdir()">新建子目录</div>
				<div id="mm-rootdir" onclick="javascript:createRootdir()">新建根目录</div>
				<div id="mm-uploadFile" onclick="javascript:uploadFieWin()">上传文件</div>
				<div id="mm-cancel" onclick="javascript:cancelOper()">删除</div>
			</div>
		</form>
	</div>
</body>
</html>
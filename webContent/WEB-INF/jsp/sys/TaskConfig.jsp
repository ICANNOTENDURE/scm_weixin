<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/sys/TaskConfig.js"></script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		<a id="addBt" class="linkbutton" onclick="javascript:addClick()"
			data-options="iconCls:'icon-add',plain:true">增加</a> <a
			class="linkbutton" data-options="iconCls:'icon-edit',plain:true"
			onclick="javascript:editRow()">修改</a> <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">删除</a>
			 <a class="linkbutton"
			data-options="iconCls:'icon-ok',plain:true"
			onclick="javascript:StartTask()">启动</a>
			 <a class="linkbutton"
			data-options="iconCls:'icon-undo',plain:true"
			onclick="javascript:StopTask()">暂停</a>
	</div>


	<table id="datagrid" class="datagrid" 
		data-options="toolbar:'#toolbar',
					  title:'任务管理',
					  pagination:true,
					   fit:true,
					   loadMsg:'加载数据中.....',
					   fitColumns:true,
					   method:'post',
					   nowrap:true,
					   striped:true,
					   pageSize: 20,
					   pageList: [20, 40, 60],
					   singleSelect:true,
					   url:$WEB_ROOT_PATH+'/sys/TaskConfigCtrl!list.htm',
					   ">
					<thead>
					<tr>
						<th data-options="field:'taskId',hidden:true"></th>
						<th data-options="field:'jobName',width:90">任务名称</th>
						<th data-options="field:'jobGroup',width:50">任务组</th>
						<th data-options="field:'triggerName',width:90">触发器名称</th>
						<th data-options="field:'triggerGroup',width:50">触发器组</th>
						<th data-options="field:'taskClass',width:90">类名称</th>
						<th data-options="field:'timePeriodType',width:50,formatter:getTimeType">间隔时间类型</th>
						<th data-options="field:'timePeriod',width:40">间隔时间</th>
						<th data-options="field:'startTime',width:90">任务开始时间</th>
						<th data-options="field:'endTime',width:90">任务结束时间</th>
						<th data-options="field:'taskDescription',width:90">描述</th>
						<th data-options="field:'stat',width:90,formatter:getStatus">状态</th>

			 	    </tr>
			 	    </thead>
		
	</table>

	<div id="detailWin" class="dialog" 
		data-options="modal:true,width:700,height:250,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table style="width: 100%;">
				<tr style="display: none">
					<input type="hidden" name="dto.taskConfig.taskId" />
				</tr>
				<tr>
					<td class="textLabel">任务名称:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.jobName"
						data-options="required:true"  /></td>
					<td class="textLabel">任务组:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.jobGroup"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td class="textLabel">触发器名称:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.triggerName"
						data-options="required:true"  /></td>
					<td class="textLabel">触发器组:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.triggerGroup"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td class="textLabel">间隔时间类型:</td>
					<td class="textParent"><input
						id="useState" style="width: 250px;" name=dto.taskConfig.timePeriodType
						class="combobox"
						data-options="
		              dict:'taskTimeType',
		              valueField:'value',
		              textField:'desc',
		              multiple:false,
		              required:true,
		              width:250,
		              panelHeight:'auto'"></input></td>
					<td class="textLabel">间隔时间:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.timePeriod"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td class="textLabel">任务开始时间:</td>
					<td class="textParent"><input style="width: 250px;"
						 class="datetimebox" name="dto.taskConfig.startTime"
						data-options="required:true"  type="text" /></td>
					<td class="textLabel">任务结束时间:</td>
					<td class="textParent"><input style="width: 250px;"
						 class="datetimebox" name="dto.taskConfig.endTime"
						 /></td>
				</tr>
				<tr>
					<td class="textLabel">类名称:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.taskClass"
						data-options="required:true"  /></td>
				</tr>
				<tr>
					<td class="textLabel">任务状态:</td>
					<td class="textParent">
						<select class="combobox" panelHeight="auto" style="width:100px" name="dto.taskConfig.taskStatus">
						<option value="1">启动</option>
						<option value="2">停止</option>
						</select>
						</td>
				</tr>
				<tr>
					<td class="textLabel">描述:</td>
					<td class="textParent"><input style="width: 250px;"
						 type="text" name="dto.taskConfig.taskDescription"
						 /></td>
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

	
</body>
</html>
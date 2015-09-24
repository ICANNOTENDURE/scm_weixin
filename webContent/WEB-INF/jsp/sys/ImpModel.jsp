<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/sys/ImpModel.js"></script>

</head>
<body>
	<table id="datagrid" title='excel模版自定义(双击修改明细)'
		data-options="fitColumns:true,singleSelect:true">
	</table>
	<div id="detailWin" class="dialog" title='excel模版自定义' 
		data-options="modal:true,width:1100,height:350,closed:true,maximizable:true" style="vertical-align: middle;">
		<iframe id="editFrame"  style="width:100%;height:100%;" frameborder="0" ></iframe>
	</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/serverManage/server.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/platformManage/serverTopoMode.js"></script>
</head>
<body>
	<div class="topoMainBody">
		<img src="../images/serverManage/network_topo.png">
	</div>
</body>
</html>
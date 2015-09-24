<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% request.setCharacterEncoding("utf-8");%>
<title>东华电子商务平台(SCI)</title>
<link rel="stylesheet"	rel="stylesheet" type="text/css"/>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript">
	function goBack(){
		window.location.href=$WEB_ROOT_PATH+'/nur/nurseCtrl!queryAudit.htm';
	}
</script>
</head>
<body>
	没有查询到数据，请填入正确的供应商名称和注册帐号,<a href='javascript:goBack()'>点击回到查询界面!</a>
</body>
</html>
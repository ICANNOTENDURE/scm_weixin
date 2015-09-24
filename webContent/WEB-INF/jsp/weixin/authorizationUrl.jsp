<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximun-scale=1.0, user-scalable=no">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black">	
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<title>东华电子商务</title>
<script type="text/javascript">
	$(function() {
		//$("#authUrl").on('click', function() {
		window.location.href = $("#url").val();
		//});
	});
</script>
</head>
<body>
	<input type="hidden" id="url" value="${dto.authUrl}"/>
	<!-- 
	<header data-am-widget="header" class="am-header am-header-default">
	<div class="am-header-left am-header-nav">
		<a href="#left-link" class=""> <i
			class="am-header-icon am-icon-home"></i>
		</a>
	</div>

	<h1 class="am-header-title">
		<a href="#title-link" class="">东华供应链平台</a>
	</h1>

	<div class="am-header-right am-header-nav">
		<a href="#right-link" class=""> <i
			class="am-header-icon am-icon-bars"></i>
		</a>
	</div>
	</header>
	
	<button type="button" class="am-btn am-btn-primary am-btn-block" id="authUrl">确认用微信帐号登录</button>
	<button type="button" class="am-btn am-btn-default am-btn-block">取消</button>
	 -->
</body>
</html>

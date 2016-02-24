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
<link href="<%=request.getContextPath()%>/css/weixin/ToDoTask.css"
	rel="stylesheet" type="text/css" />
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		
		function SendAuthen(){
			
		}
		$("#search").on(
				'click',
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/weixin/wxMessageCtrl!listToDoTask.htm"
							+ "?dto.state="
							+ $("input[name='state']:checked").val()
							+ "&dto.start=" + $("#start").val();
					+"&dto.end=" + $("#end").val();
					+"&dto.url=searchOrder";
				});
	});
</script>
</head>
<body>
	
	<s:property value="dto.operateResult.resultCode"/>
	<s:property value="dto.mpUser.wxMpOpenId"/>
	<div class="am-container" style="padding-top: 20px">
		<div class="am-form ">
			<section class="am-panel am-panel-primary">
				<header class="am-panel-hd">
					<h3 class="am-panel-title am-text-center">东华医疗供应链用户用户验证</h3>
				</header>
				<div class="am-panel-bd">
					<div class="am-input-group am-input-group-primary">
						<span class="am-input-group-label"><i class="am-icon-user"></i></span>
						<input type="text" name="mp_userName" id="mp_userName"
							v placeholder="请输入用户名">
					</div>
					<span><hr></span>
					<div class="am-input-group am-input-group-primary">
						<span class="am-input-group-label"><i class="am-icon-lock"></i></span>
						<input type="password" name="mp_password" id="mp_password"
							 placeholder="请输入密码">
					</div>
				</div>
			</section>
			<div class="am-cf">
				<button type="button" class="am-btn am-btn-primary am-btn-block"
					onclick="javascript: SendAuthen();">验证</button>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

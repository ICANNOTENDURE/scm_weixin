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
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		$(".am-btn-primary").on( 'click',
				function() {
					$('#common-modal-loading').modal({closeViaDimmer:false});
					$.post($WEB_ROOT_PATH + "/weixin/mpUserCtrl!saveWeiXinOpenId.htm", {
						'dto.mpUser.wxMpOpenId' : $("#openId").val(),
						'dto.username' : $("#mp_userName").val(),
						'dto.passwd' : $("#mp_password").val()
					}, function(data) {
						$('#common-modal-loading').modal('close');
						if (data.resultCode == "0") {
							window.location.reload();
						} else {
							$('#common-alert-bd').html(data.resultContent);
							$('#common-alert').modal();
							
						}
					}, 'json');
		 });
		
		$(".am-btn-danger").on( 'click',
				function() {
					$('#common-modal-loading').modal({closeViaDimmer:false});
					$.post($WEB_ROOT_PATH + "/weixin/mpUserCtrl!deleteWeiXinOpenId.htm", {
						'dto.mpUser.wxMpOpenId' : $("#openId").val()
					}, function(data) {
						if (data.resultCode == "0") {
							window.location.reload();
						} else {
							$('#common-modal-loading').modal('close');
							$('#common-alert-bd').html(data.resultContent);
							$('#common-alert').modal();
						}
					}, 'json');
		 });
	});
</script>
</head>
<body>
	<!--
	<s:property value="dto.operateResult.resultCode" />
	<s:property value="dto.operateResult.resultContent" />
	
	<s:property value="dto.mpUser.wxMpOpenId" />
	<s:property value="dto.mpUser.wxMpHeadimgurl" />
	<s:property value="dto.mpUser.wxMpNickname" />
	<s:property value="dto.mpUser.wxMpUnionid" />
	  
	-->
	<input type="hidden" id="openId"
		value="<s:property value="dto.mpUser.wxMpOpenId"/>" />
	<input type="hidden" id="wxMpHeadimgurl"
		value="<s:property value="dto.mpUser.wxMpHeadimgurl"/>" />
	<input type="hidden" id="wxMpNickname"
		value="<s:property value="dto.mpUser.wxMpNickname"/>" />
	<input type="hidden" id="wxMpUnionid"
		value="<s:property value="dto.mpUser.wxMpUnionid"/>" />
	<s:if test="dto.operateResult.resultCode==1">
		<div class="am-container" style="padding-top: 20px">
			<div class="am-form ">
				<section class="am-panel am-panel-primary">
					<header class="am-panel-hd">
						<h3 class="am-panel-title am-text-center">东华医疗供应链用户验证</h3>
					</header>
					<div class="am-panel-bd">
						<div class="am-input-group am-input-group-primary">
							<span class="am-input-group-label"><i class="am-icon-user"></i></span>
							<input type="text" name="mp_userName" id="mp_userName" v
								placeholder="请输入用户名">
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
					<button type="button" class="am-btn am-btn-primary am-btn-block"">验证</button>
				</div>
			</div>
		</div>
	</s:if>
	<s:else>
		<div class="am-container" style="padding-top: 20px">
			<div class="am-alert am-alert-success" data-am-alert>
  				<button type="button" class="am-close">&times;</button>
 	 			<p>您已经成功关联了东华供应链平台帐号。</p>
			</div>
			<div class="am-form ">
				<div class="am-alert am-alert-success" data-am-alert>
				  <button type="button" class="am-close">&times;</button>
				  <h3>用户信息</h3>
				  <ul>
				    <li>帐号:<s:property value="dto.username"/></li>
				    <li>单位名称:<s:property value="dto.depart"/></li>
				    <li>微信昵称:<s:property value="dto.mpUser.wxMpNickname"/></li>
				    <li>绑定时间:<s:property value="dto.mpUser.wxMpSubscribeSciTime"/></li>
				    <li>关注公众号时间:<s:property value="dto.mpUser.wxMpSubscribeWxTime"/></li>
				    <li>微信openid:<s:property value="dto.mpUser.wxMpOpenId"/></li>
				    <!-- 
				    <li>微信wxMpUnionid:<s:property value="dto.mpUser.wxMpUnionid"/></li>
				  	-->
				  </ul>
				</div>
				<div class="am-cf">
					<button type="button" class="am-btn am-btn-danger am-btn-block"">解除绑定</button>
				</div>
			</div>
		</div>
	
	</s:else>	
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

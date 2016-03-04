<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, maximun-scale=1.0, user-scalable=no">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/weixin/jssdk.js"></script>
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		$('#common-modal-loading').modal({ closeViaDimmer : false});
		$.post($WEB_ROOT_PATH
				+ "/weixin/mpInGdRecCtrl!getWxJsapiSignature.htm", 
		{
			'dto.url' : window.document.location.href
		}, function(data) {
			$('#common-modal-loading').modal('close');
			data.noncestr
			data.noncestr

		}, 'json');
	});


	wx.config({
	    debug: true,
	    appId: '', 
	    timestamp: , 
	    nonceStr: '', 
	    signature: '',
	    jsApiList: ['scanQRCode','chooseImage'] 
	});
</script>
</head>
<body>
	<input type="hidden" id="openId"
		value="<s:property value="dto.mpUser.wxMpOpenId"/>" />
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>
		
			<button type="button" class="am-btn am-btn-primary am-btn-block" id="scanpic">扫一扫</button>

			<button type="button" class="am-btn am-btn-primary am-btn-block" id="uppic">上传图片</button>
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

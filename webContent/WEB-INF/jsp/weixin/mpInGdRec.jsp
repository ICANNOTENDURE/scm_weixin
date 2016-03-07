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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/weixin/jssdk.js"></script>
<title>东华医疗供应链(SCI)</title>
<script type="text/javascript">
	$(function() {
		$('#common-modal-loading').modal({
			closeViaDimmer : false
		});
		$.post(
				$WEB_ROOT_PATH
						+ "/weixin/mpInGdRecCtrl!getWxJsapiSignature.htm", {
					'dto.url' : window.document.location.href
				}, function(data) {
					$('#common-modal-loading').modal('close');
					wx.config({
						debug : true,
						appId : data.appId,
						timestamp : data.timestamp,
						nonceStr : data.noncestr,
						signature : data.signature,
						jsApiList : [ 'scanQRCode', 'chooseImage' ]
					});
				}, 'json');

		$("#scanpic").on('click', function() {
			wx.scanQRCode({
				needResult : 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
				scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
				success : function(res) {
					var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
					alert(result)
				}
			});
		});
		$("#uppic").on('click', function() {
			wx.chooseImage({
				count : 1, // 默认9
				sizeType : [ 'original', 'compressed' ], // 可以指定是原图还是压缩图，默认二者都有
				sourceType : [ 'album', 'camera' ], // 可以指定来源是相册还是相机，默认二者都有
				success : function(res) {
					var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片

				}
			});
		});
	});
</script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>

	<form class="am-form am-form-horizontal">
		<div
			class="am-form-group am-form-success am-form-icon am-form-feedback">
			<label for="doc-ipt-3-a" class="am-u-sm-2 am-form-label">电子邮件</label>
			<div class="am-u-sm-10">
				<input type="email" id="doc-ipt-3-a" class="am-form-field"
					placeholder="输入你的电子邮件"> <span class="am-icon-warning"></span>
			</div>
		</div>
	</form>
	<hr>
	<button type="button" class="am-btn am-btn-primary am-btn-block"
		id="scanpic">扫一扫</button>

	<button type="button" class="am-btn am-btn-primary am-btn-block"
		id="uppic">上传图片</button>
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

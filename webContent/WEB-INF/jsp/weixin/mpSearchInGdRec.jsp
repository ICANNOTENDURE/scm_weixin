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
		$("#search").on(
				'click',
				function() {
					window.location.href = $WEB_ROOT_PATH
							+ "/weixin/mpInGdRecCtrl!mpListInGdRec.htm"
							+ "?dto.startDate=" + $("#start").val()
					+"&dto.endDate=" + $("#end").val();
				});
	});
</script>
</head>
<body>

	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>

	<div class="am-input-group am-datepicker-date" data-am-datepicker
		readonly>
		<input type="text" class="am-form-field" placeholder="开始日期" readonly
			id="start"> <span
			class="am-input-group-btn am-datepicker-add-on">
			<button class="am-btn am-btn-default" type="button">
				<span class="am-icon-calendar"></span>
			</button>
		</span>
	</div>
	<div class="am-input-group am-datepicker-date" data-am-datepicker
		readonly>
		<input type="text" class="am-form-field" placeholder="结束日期" readonly
			id="end"> <span
			class="am-input-group-btn am-datepicker-add-on">
			<button class="am-btn am-btn-default" type="button">
				<span class="am-icon-calendar"></span>
			</button>
		</span>
	</div>
	<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
	<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
	<button type="button" class="am-btn am-btn-primary am-btn-block"
		data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}"
		id="search">查询</button>


	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

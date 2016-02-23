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
		$("#search").on('click', function() {
			window.location.href=$WEB_ROOT_PATH +"/weixin/wxMessageCtrl!listToDoTask.htm"
					+"?dto.state="+$("input[name='state']:checked").val()
					+"&dto.start="+$("#start").val();
				    +"&dto.end="+$("#end").val();
				    +"&dto.url=searchOrder";
		});
	});
</script>
</head>
<body>

	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/WXheader.jsp"%>

	<div class="am-input-group am-datepicker-date" data-am-datepicker
		readonly>
		<input type="text" class="am-form-field" placeholder="开始日期" readonly id="start">
		<span class="am-input-group-btn am-datepicker-add-on">
			<button class="am-btn am-btn-default" type="button">
				<span class="am-icon-calendar"></span>
			</button>
		</span>
	</div>
	<div class="am-input-group am-datepicker-date" data-am-datepicker
		readonly>
		<input type="text" class="am-form-field" placeholder="结束日期" readonly id="end">
		<span class="am-input-group-btn am-datepicker-add-on">
			<button class="am-btn am-btn-default" type="button">
				<span class="am-icon-calendar"></span>
			</button>
		</span>
	</div>
	<div class="am-g">
		<div class="am-u-sm-4 am-u-sm-offset-4 am-u-end">
		<label class="am-radio am-secondary"> <input type="radio"
			name="state" value="1" data-am-ucheck> 新订单
		</label> <label class="am-radio am-secondary"> <input type="radio"
			name="state" value="2" data-am-ucheck> 已接收
		</label> <label class="am-radio am-secondary"> <input type="radio"
			name="state" value="3" data-am-ucheck checked> 已发货
		</label>
		</div>
	</div>
	<button type="button" class="am-btn am-btn-primary am-btn-block"
		data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}" id="search">查询</button>


	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

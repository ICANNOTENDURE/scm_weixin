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
<%@include file="/WEB-INF/jsp/common/bootstrap.jsp"%>
<link
	href="<%=request.getContextPath()%>/css/rating/star-rating.min.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/rating/star-rating.min.js"></script>
<title>东华医疗供应链(SCI)</title>
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">我的评价</div>
			<div class="panel-body">
				<input class="total" data-clearButton="总体评价"> <input
					class="total" data-clearButton="商品包装"> <input class="total"
					data-clearButton="发货速度"> <input class="total"
					data-clearButton="服务态度">
				<textarea class="form-control" rows="4"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6">.col-xs-6</div>
			<div class="col-xs-6">.col-xs-6</div>
		</div>
	</div>

	<script>
		$(function() {
			$(".total").each(
					function(obj, i) {
						$(this).rating(
								{
									clearCaption : '请选择',
									'clearButton' : "<p class='text-primary'>"
											+ $(this).attr("data-clearButton")
											+ "</p>",
									'min' : 0,
									'max' : 5,
									'step' : 1,
									'size' : 'xs',
									'starCaptions' : {
										1 : '很不满意',
										2 : '不满意',
										3 : '一般',
										4 : '好',
										5 : '很好,值得推荐'
									}
								});
					});
			$('.modal').modal()
		});
	</script>
</body>
</html>

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
		$(".am-icon-chevron-left").on('click', function() {
			window.history.back();
		});
	});
</script>

</head>
<body>

	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>

	<s:iterator value="dto.inGdRecPics" status="status" id="inGdRecPicss">
		<div>
			<img width='200' height='200' class='am-radius' src="/uploads/weixin/${inGdRecPicss.ingdrecpicPath}"
				class='am-img-responsive' />
			<button type='button'
				class='am-btn am-btn-default am-radius am-btn-success am-btn-xs'
				onclick='viewPic(this)'>
				预览<i class='am-icon-picture-o'></i>
			</button>
			<button type='button'
				class='am-btn am-btn-default am-radius am-btn-danger am-btn-xs'
				onclick='deletePic(this)'>
				删除<i class='am-icon-remove'></i>
			</button>
		</div>

	</s:iterator>
	<table
		class="am-table am-table-bordered am-table-striped am-table-compact">
		<thead class="title">
			<tr>
				<th>名称</th>
				<th>数量</th>
				<th>单位</th>
				<th>价格</th>
				<th>批号</th>
				<th>效期</th>
				<th>发票号</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="dto.stInGdRecItms" status="status" id="detail">
				<tr>
					<td>${detail.ingdrecitmIncName}</td>
					<td>${detail.ingdrecitmQty}</td>
					<td>${detail.ingdrecitmUom}</td>
					<td>${detail.ingdrecitmRp}</td>
					<td>${detail.ingdrecitmBatNo}</td>
					<td>${detail.ingdrecitmExpDate}</td>
					<td>${detail.ingdrecitmInvNo}</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<s:if test="dto.accpectFlag==1">
		<button type="button" class="am-btn am-btn-danger am-btn-block"
			data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}"
			id="accpectFlagBTN">确认接收定单</button>
	</s:if>
	<!--页脚-->
	<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

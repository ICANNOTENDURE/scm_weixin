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
		$("#accpectFlagBTN").on('click', function() {
			$('#common-modal-loading').modal({closeViaDimmer:false});
			$.post(
					$WEB_ROOT_PATH + "/weixin/mpMessageCtrl!accpectOrder.htm", 
					{
						'dto.orderDetail.orderNo' : $("#orderNo").val()
					}, 
					function(data) {
						$('#common-modal-loading').modal('close');
						if(data.resultCode=="0"){
							$('#common-alert').modal();
							$("#accpectFlagBTN").remove();
						}else{
							  $('#common-confirm-bd').html(data.resultContent);
							  $('#common-confirm').modal({
								    closeViaDimmer:false,
							        relatedTarget: this,
							        onConfirm: function(options) {
							         	window.location.href=$WEB_ROOT_PATH + "/weixin/mpUserCtrl!MpSci.htm"
							        },
							        onCancel: function() {
							        }
							   });
						}
					},
					'json'
			);
			
		});
	});
</script>

</head>
<body>
	
	<!--页头-->
	<%@include file="/WEB-INF/jsp/common/mpWXheader.jsp"%>
	<input type="hidden" id="orderNo" value="${dto.orderDetail.orderNo}"/>
	<table
		class="am-table am-table-bordered am-table-striped am-table-compact">
		<thead class="title">
			<tr>
				<th>名称</th>
				<th>单位</th>
				<th>数量</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="dto.orderDetails" status="status" id="detail">
				<tr>
					<td>${detail.incName}</td>
					<td>${detail.orderVenuom}</td>
					<td>${detail.orderVenQty}</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<s:if test="dto.accpectFlag==1">
		<button type="button" class="am-btn am-btn-danger am-btn-block" data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}" id="accpectFlagBTN">确认接收定单</button>
	</s:if>
	<!--页脚-->
<%@include file="/WEB-INF/jsp/common/WXfooter.jsp"%>
</body>
</html>

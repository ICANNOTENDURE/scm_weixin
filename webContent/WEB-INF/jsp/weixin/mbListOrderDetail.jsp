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
		$(".am-icon-chevron-left").on('click', function() {
			window.location.href=$WEB_ROOT_PATH +"/weixin/wxMessageCtrl!listToDoTask.htm";
		});
		$(".am-btn-danger").on('click', function() {
			var $btn = $(this);
			$btn.button('loading');
			$.post(
					$WEB_ROOT_PATH + "/weixin/wxMessageCtrl!accpectOrder.htm", 
					{
						'dto.orderDetail.orderNo' : $("#orderNo").val()
					}, 
					function(data) {
						$(".am-btn-danger").button('reset');
						if(data.resultCode=="0"){
							add_message("am-btn-success","确认成功",$WEB_ROOT_PATH +"/weixin/wxMessageCtrl!listToDoTask.htm");
						}else{
							if(data.resultCode=="1"){
								add_message("am-btn-danger","登录超时,请重新操作",$WEB_ROOT_PATH + "/weixin/wxMessageCtrl!authorizationUrl.htm");
							}else{
								add_message("am-btn-danger",data.resultContent,"");
							}
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
	<%@include file="/WEB-INF/jsp/common/WXheader.jsp"%>
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
		<button type="button" class="am-btn am-btn-danger am-btn-block" data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...', resetText: '加载过了'}">确认接收定单</button>
	</s:if>
	<!--页脚-->
	<footer data-am-widget="footer" class="am-footer am-footer-default"
		data-am-footer="{}">

		<div class="am-footer-miscs ">
			<p>
				由 <a href="#" title="东华软件" target="_blank" class="">东华软件</a> 提供技术支持
			</p>
			<p>CopyRight©2015 AllMobilize Inc.</p>
		</div>
	</footer>

	<div id="am-footer-modal"
		class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-default">
		<div class="am-modal-dialog">
			<div class="am-modal-hd am-modal-footer-hd">
				<a href="javascript:void(0)" data-dismiss="modal"
					class="am-close am-close-spin " data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				您正在浏览的是 <span class="am-switch-mode-owner"> 云适配 </span> <span
					class="am-switch-mode-slogan"> 为您当前手机订制的移动网站。 </span>
			</div>
		</div>
	</div>
</body>
</html>

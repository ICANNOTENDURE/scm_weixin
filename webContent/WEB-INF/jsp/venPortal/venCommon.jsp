<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>

<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript">
	$(function() {
		var $fullText = $('.admin-fullText');
		$('#admin-fullscreen').on('click', function() {
			$.AMUI.fullscreen.toggle();
		});

		$(document).on(
				$.AMUI.fullscreen.raw.fullscreenchange,
				function() {
					$.AMUI.fullscreen.isFullscreen ? $fullText.text('关闭全屏')
							: $fullText.text('开启全屏');
				});

	});
	//修改密码	
	function editpassword() {
		window.open($WEB_ROOT_PATH
				+ "/normalAccount/normalAccountCtrl!editPassword.htm");
	}
	//修改供应商个人资料
	function editinfo() {
		window.open($WEB_ROOT_PATH
				+ "/normalAccount/normalAccountCtrl!editInfo.htm");
	}
	//退出
	function logout() {
		$.post($WEB_ROOT_PATH + '/authenTicket/authenTicketCtrl!logout.htm',
				function(data) {
					window.location.href = "../";
				});
	}
</script>
</head>

<body>
	<header class="am-topbar  am-topbar-fixed-top admin-header">
	<div class="am-topbar-brand">
		<a href="<%=request.getContextPath()%>/chart/chartCtrl!index.htm"><strong>东华软件(DHCC)</strong>
			<small>电子商务平台(SCI)</small> <span class="am-icon-home am-icon-sm"></span></a>
	</div>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul
			class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list"
			style="margin-top: 0px">
			<!-- 
			<li><a href="javascript:;"><span class="am-icon-envelope-o"></span>
					收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
			 <li><a href="<%=request.getContextPath()%>/ven/vendorCtrl!vendorInc.htm"><span class="am-icon-reorder"></span>
					商品信息<span class="am-badge am-badge-warning">5</span></a></li>
			 -->
			<li><a
				href="<%=request.getContextPath()%>/ven/vendorCtrl!vendorImpInv.htm"><span
					class="am-icon-upload"></span> 上传发票</a></li>
			<li class="am-dropdown" data-am-dropdown><a
				class="am-dropdown-toggle" data-am-dropdown-toggle
				href="javascript:;"><span class="am-icon-book"></span> 订单 <span
					class="am-icon-caret-down"></span></a>
				<ul class="am-dropdown-content">
					<li><a
						href="<%=request.getContextPath()%>/ven/vendorCtrl!vendorReciveOrd.htm?dto.state=1"><span
							class="am-icon-servers"></span> 确认订单/订单查询</a></li>
					<li><a
						href="<%=request.getContextPath()%>/ven/vendorCtrl!vendorSendOrd.htm"><span
							class="am-icon-track"></span> 发货/录发票</a></li>
					<li><a
						href="<%=request.getContextPath()%>/ven/vendorCtrl!vendorPrintOrd.htm"><span
							class="am-icon-barcode"></span> 打印随行单</a></li>
				</ul></li>

			<li class="am-dropdown" data-am-dropdown><a
				class="am-dropdown-toggle" data-am-dropdown-toggle
				href="javascript:;"> <span class="am-icon-cogs"></span>设置<span
					class="am-icon-caret-down"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a href="javascript:editinfo();"><span
							class="am-icon-user"></span> 修改供应商信息</a></li>
					<li><a href="javascript:editpassword();"><span
							class="am-icon-edit"></span> 修改密码</a></li>
					<li><a href="javascript:logout();" id="logout"><span
							class="am-icon-power-off"></span> 退出</a></li>
				</ul></li>
			<li class="am-hide-sm-only"><a href="javascript:;"
				id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span
					class="admin-fullText">开启全屏</span></a></li>
		</ul>
	</div>
	</header>
</body>
</html>
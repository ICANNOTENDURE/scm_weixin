<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台(SCI)</title>
<link href="<%=request.getContextPath()%>/css/ven/venPortal.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurWorkStation.js"></script>	
</head>
<body>
	<div class="infobox-container"
		style="margin-left: 222px; padding-right: 0px;margin-top: 22px">
		<div class="infobox infobox-green" id="IncAdvice">
			<div class="infobox-icon" title="历史咨询">
				<i class="am-icon-weixin"></i>
			</div>

			<div class="infobox-data" title="历史咨询">
				<span class="infobox-data-number">0</span>
				<div class="infobox-content">商品咨询</div>
			</div>
			<div class="stat stat-success" title="已回复咨询">0</div>
		</div>

		<div class="infobox infobox-blue" id="forSend">
			<div class="infobox-icon">
				<i class="am-icon-truck"></i>
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">0</span>
				<div class="infobox-content">待发货</div>
			</div>

			<div class="badge badge-success">
				+32% <i class="icon-arrow-up"></i>
			</div>
		</div>

		<div class="infobox infobox-pink" id="newOrder">
			<div class="infobox-icon">
				<i class="am-icon-shopping-cart"></i>
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">0</span>
				<div class="infobox-content">新订单</div>
			</div>
			
		</div>

		<div class="infobox infobox-red" id="ret">
			<div class="infobox-icon">
				<i class="am-icon-info-circle"></i>
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number" title="不通过">0</span>
				<div class="infobox-content">退货申请不通过</div>
			</div>
			<div class="stat stat-important" title="通过">0</div>
		</div>

		<div class="infobox infobox-orange2" id="recieve">
			<div class="infobox-icon">
				<i class="am-icon-book"></i>
			</div>
			<div class="infobox-data">
				<span class="infobox-data-number">0</span>
				<div class="infobox-content">待收货</div>
			</div>
			<!--  
			<div class="badge badge-success">
				7.2% <i class="icon-arrow-up"></i>
			</div>
			-->
		</div>

		<div class="infobox infobox-blue2" id="comment">
			<div class="infobox-icon">
				<i class="am-icon-rss"></i>
			</div>

			<div class="infobox-data">
				<span class="infobox-data-number">0</span>
				<div class="infobox-content">待评价</div>
			</div>
		</div>
		<!-- 
		<div style="margin-top: 15px;margin-left: 100px" >
			<div class="infobox infobox-green infobox-small infobox-dark">

				<div class="infobox-icon">
					<span class="percent">61</span>%
				</div>
				<div class="infobox-data">
					<div class="infobox-content">订单发货</div>
					<div class="infobox-content">完成</div>
				</div>
			</div>

			<div class="infobox infobox-blue infobox-small infobox-dark">
				<div class="infobox-icon">
					<i class="am-icon-money"></i>
				</div>
				<div class="infobox-data">
					<div class="infobox-content">订单金额</div>
					<div class="infobox-content">$32,000</div>
				</div>
			</div>

			<div class="infobox infobox-grey infobox-small infobox-dark">
				<div class="infobox-icon">
					<i class="am-icon-cloud-download"></i>
				</div>

				<div class="infobox-data">
					<div class="infobox-content">加急订单</div>
					<div class="infobox-content">1,205</div>
				</div>
			</div>
		</div>
		 -->
	</div>
</body>
</html>
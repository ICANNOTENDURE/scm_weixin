<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>

<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/ven/venPortal.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/venPortal/venPortal.js"></script>
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>
</head>

<body>
	<!-- header -->
	<%@include file="/WEB-INF/jsp/venPortal/venCommon.jsp"%>
	<!-- end -->
	<div class="am-g" style="margin-top: 5px">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<div class="am-alert am-alert-mt" data-am-alert>
				<button type="button" class="am-close">&times;</button>
				<p>
					<i class="am-icon-home"></i>欢迎使用东华电子商务系统(v1.0) ,欢迎您提出宝贵的意见.
				</p>
			</div>
		</div>
	</div>
	<div class="am-g">
		<!-- 供应商 main-portal -->
		<div class="am-u-lg-6 am-u-lg-offset-1 infobox-container"
			style="margin-top: 10px">
			<div class="infobox infobox-green" id="IncAdvice">
				<div class="infobox-icon">
					<i class="am-icon-weixin"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">商品咨询</div>
				</div>
				<div class="stat stat-success" id="adviceRate"></div>
			</div>

			<div class="infobox infobox-blue" id="send">
				<div class="infobox-icon">
					<i class="am-icon-truck"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">待发货</div>
				</div>

				<!--  
				<div class="badge badge-success">
					+32% <i class="icon-arrow-up"></i>
				</div>
				-->
			</div>

			<div class="infobox infobox-pink" id="newOrder">
				<div class="infobox-icon">
					<i class="am-icon-shopping-cart"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">新订单</div>
				</div>
				<!-- 
				<div class="stat stat-important">4%</div>
				-->
			</div>

			<div class="infobox infobox-red" id="reqOrder">
				<div class="infobox-icon">
					<i class="am-icon-info-circle"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">退货申请</div>
				</div>
			</div>

			<div class="infobox infobox-orange2" id="news">
				<div class="infobox-icon">
					<i class="am-icon-rss"></i>
				</div>
				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">未读通知</div>
				</div>

			</div>

			<div class="infobox infobox-blue2" id="incQty">
				<div class="infobox-icon">
					<i class="am-icon-book"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number">0</span>
					<div class="infobox-content">商品品种</div>
				</div>
			</div>



			<!-- sub portal 
			<div style="margin-top: 20px" class="am-center">
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
			<!-- sub portal end-->

		</div>
		<!-- 供应商 main-portal end-->


		<!-- 医院通知 -->
		<div class="am-u-lg-4 am-u-end">
			<div class="am-panel am-panel-success" style="margin-bottom: 5px">
				<div class="am-panel-hd am-cf">
					<span class="am-icon-newspaper-o"></span>&nbsp;医院通知<span
						class="am-fr am-text-sm"
						onclick="javascript:window.location.href='<%=request.getContextPath()%>/hop/hopIncNewsCtrl!listNewsMain.htm;'">更多</span>
				</div>
				<div id="collapse-panel-notice"
					class="am-panel-bd am-collapse am-in" >
					<div data-am-widget="list_news"
						class="am-list-news am-list-news-default">
						<div class="am-list-news-bd">
							<ul class="am-list" id="newsList"
								style="margin-top: 0px; margin-bottom: 0px">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 医院通知 end-->
	</div>
	<div class="am-g">
		<div class="am-u-sm-10 am-u-lg-offset-1 am-u-end">
			<div class="am-panel am-panel-success">
				<div class="am-panel-hd">
					<i class="am-icon-line-chart"></i>&nbsp;近七天销售额
				</div>
				<div class="am-panel-bd">
					<div id="sevenDay" style="min-height: 250px"></div>
				</div>
			</div>
		</div>
	</div>
  <div class="am-g">
	 <div class="am-u-sm-10 am-u-lg-offset-1 am-u-end">
		<div class="am-panel am-panel-success">
			<div class="am-panel-hd" >
				<i class="am-icon-signal"></i>&nbsp;热卖商品
			</div>
			<div class="am-panel-bd">
				<table
					class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover" id="hotSale">
					<tbody>
						<tr>
							<th class="am-text-center">序号</th>
							<th>商品名称</th>
							<th>订单量</th>
							<th>库存</th>
							<th>操作</th>
						</tr>

					</tbody>
				</table>
			</div>
	    </div>
	 </div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script src="<%=request.getContextPath()%>/js/esl/esl.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/chart/locIncAmt.js"></script>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />

<title>东华电子商务平台(SCI)</title>
</head>
<body>
	<!--am-topbar-inverse-->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<div class="am-container">
		<div class="am-panel dhcc-panel-mt">
			<div class="am-panel-hd">
				<h3 class="am-panel-title">
					<span class="am-icon-cubes"></span>&nbsp;&nbsp;&nbsp;按商品汇总
				</h3>
			</div>
			<div class="am-panel-bd" style="min-height: 450px">
				<div class="am-g">
					<div class="am-u-lg-6">
						<div class="am-alert am-alert-danger" id="my-alert"
							style="display: none">
							<p>开始日期应小于结束日期！</p>
						</div>
						<div class="am-g" style="padding: 0px">
							<div class="am-u-sm-6">
								<button type="button"
									class="am-btn am-btn-mt am-btn-xs am-margin-right"
									id="my-start">开始日期</button>
								<span id="my-startDate"></span> <input type="hidden"
									name="dto.starDate" id="startDate">
							</div>
							<div class="am-u-sm-6">
								<button type="button"
									class="am-btn am-btn-mt  am-btn-xs am-margin-right" id="my-end">结束日期</button>
								<span id="my-endDate"></span> <input type="hidden"
									name="dto.endDate" id="endDate">
							</div>
						</div>
					</div>

					<div class="am-u-lg-4" style="padding: 0px">

					</div>
					<div class="am-u-lg-1">
						<button class="am-btn am-btn-xs am-btn-mt " id="searchBtn">搜索</button>
					</div>
				</div>

				<div class="am-g">
					<div class="am-u-lg-12" style="padding: 0px; margin: 0px">

						<div data-am-widget="tabs" class="am-tabs am-tabs-one">
							<ul class="am-tabs-nav am-cf">
								<li class=""><a href="[data-tab-panel-0]">表格</a></li>
								<li  class="am-active"><a href="[data-tab-panel-1]">柱状图</a></li>
								<li class=""><a href="[data-tab-panel-2]">饼图</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div data-tab-panel-0 class="am-tab-panel " >
									<table
										class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac">
										<thead>
											<tr>
												<th >名称</th>
												<th >金额</th>
											</tr>
										</thead>
										<tbody id="dataList">

										</tbody>
									</table>
									<div id="page"></div>
								</div>
								<div data-tab-panel-1 class="am-tab-panel am-active">
									<div id="barDiv" style="height: 320px"></div>
								</div>
								<div data-tab-panel-2 class="am-tab-panel ">
									<div id="pieDiv" style="height: 320px"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end bd -->
			</div>
		</div>
	</div>

	</div>


	<!-- foot-->
	<div id="xxx1" style="display: none">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display: none">
		<footer class="footer"
			style="bottom:0;width:100%;position:fixed;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>

</body>
</html>
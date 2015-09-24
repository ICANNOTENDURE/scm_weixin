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
	src="<%=request.getContextPath()%>/js/comment/venIncEval.js"></script>
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
					<span class="am-icon-cubes"></span>&nbsp;&nbsp;&nbsp;供应商商品评价
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


					<div class="am-u-lg-1 ">
						<select data-am-selected="{btnSize: 'xs',searchBox: 1,btnWidth: 300,maxHeight: 300,url:'<%=request.getContextPath()%>/hop/hopVendorCtrl!getHopVenComboxVos.htm'}" id="hopVendorId">
							<option value="">供应商</option>
							<s:iterator value="dto.comboxVos" status="all" id="comboxVos">
								<option value="${comboxVos.id}">${comboxVos.name}</option>
							</s:iterator>
						</select>
					</div>
					<div class="am-u-lg-2 am-u-lg-offset-1" style="padding: 0px">

					</div>
					<div class="am-u-lg-1">
						<button class="am-btn am-btn-xs am-btn-mt " id="searchBtn">搜索</button>
					</div>
				</div>
				<div class="am-g" >
					<div class="am-u-lg-12" style="margin-top: 5px">
						<select
							data-am-selected="{btnSize: 'xs',maxHeight: 300}"
							id="dto.queryResult">
							<option value="">评价结果</option>
							<option value="5">非常满意</option>
							<option value="4">满意</option>
							<option value="3">一般</option>
							<option value="2">不满意</option>
							<option value="1">很不满意</option>
						</select>
						<select
							data-am-selected="{btnSize: 'xs',maxHeight: 300}"
							id="dto.queryCondition">
							<option value="">条件</option>
							<option value="gt">大于</option>
							<option value="ge">大于等于</option>
							<option value="eq">等于</option>
							<option value="lt">小于</option>
							<option value="le">小于等于</option>
						</select>
						<select
							data-am-selected="{btnSize: 'xs',maxHeight: 300}"
							id="dto.queryType">
							<option value="">类型</option>
							<option value="1">百分比</option>
							<option value="2">绝对数</option>
						</select>
						<input type="number" id="dto.queryValue"/>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-lg-12" style="padding: 0px; margin: 0px">

						<div data-am-widget="tabs" class="am-tabs am-tabs-one">
							<ul class="am-tabs-nav am-cf">
								<li class="am-active"><a href="[data-tab-panel-0]">表格</a></li>
								<li class=""><a href="[data-tab-panel-1]">柱状图</a></li>
								<li class=""><a href="[data-tab-panel-2]">雷达图</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div data-tab-panel-0 class="am-tab-panel am-active">


									<table
										class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac">
										<thead>
											<tr >
												<th style="width: 100px" rowspan="2">商品名称</th>
												<th style="width: 100px" rowspan="2">供应商</th>
												<th style="width: 50px;text-align: center;" colspan="2" >很不满意</th>
												<th style="width: 50px;text-align: center;" colspan="2">不满意</th>
												<th style="width: 50px;text-align: center;" colspan="2">一般</th>
												<th style="width: 50px;text-align: center;" colspan="2">满意</th>
												<th style="width: 50px;text-align: center;" colspan="2">非常满意</th>
												<th style="width: 50px" rowspan="2">操作</th>
											</tr>
											<tr>
												
												<th >数量</th>
												<th >百分比</th>
												<th >数量</th>
												<th >百分比</th>
												<th >数量</th>
												<th >百分比</th>
												<th >数量</th>
												<th >百分比</th>
												<th >数量</th>
												<th >百分比</th>
											</tr>
										</thead>
										<tbody id="dataList">

										</tbody>
									</table>
									<div id="page"></div>
								</div>
								<div data-tab-panel-1 class="am-tab-panel ">
									<div id="venEval" style="height:400px"></div>
								</div>
								<div data-tab-panel-2 class="am-tab-panel ">
									<div id="venEvalPie" style="height:400px"></div>
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


	<!-- foot
	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team2.</p>
		</footer>
	</div>
	<div id="xxx2" style="display: none;">
		<footer class="footer"
			style="bottom:0;width:100%;position:fixed;*position:relative;;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	-->
</body>
</html>
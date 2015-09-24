<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>

<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/venPortal/vendReplayAdvice.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/jsp/venPortal/venCommon.jsp"%>
	<!-- end -->

	<div class="am-g" style="margin-top: 5px">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<div class="am-panel dhcc-panel-mt" id="sm">
				<div class="am-panel-hd">商品咨询</div>
				<div class="am-panel-bd" style="min-height: 500px">
					<table
						class="am-table am-table-bordered am-table-striped am-table-hover  table-main am-table-compac">
						<thead>
							<tr>
								<th style="width: 20px">序号</th>
								<th style="width: 150px">商品名称</th>
								<th style="width: 50px">单价</th>
								<th style="width: 50px">单位</th>
								<th style="width: 60px">咨询数</th>
								<th style="width: 30px">操作</th>
							</tr>
						</thead>
						<tbody id="venIncAdviceList">

						</tbody>
					</table>

					<div class="am-g">
						<div class="am-u-lg-6 am-u-lg-offset-6" id="venIncAdviceListPage"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
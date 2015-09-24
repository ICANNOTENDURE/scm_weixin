<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>

<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/replayBox.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/venPortal/vendReplayList.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/jsp/venPortal/venCommon.jsp"%>
	<!-- end -->

	<div class="am-g" style="margin-top: 5px">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<div class="am-panel dhcc-panel-mt" id="sm">
				<div class="am-panel-hd">商品咨询列表</div>
				
				<div class="am-panel-bd" style="min-height: 500px">
					<input type="hidden" id="venincid" value="${dto.venIncAdvice.venIncAdviceIncId}">
					<div id="venReplayList"></div>
					<div class="am-g">
						<div class="am-u-lg-6 am-u-lg-offset-6" id="page"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
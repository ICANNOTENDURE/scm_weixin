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
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurReplayList.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<!-- end -->

	<div class="am-g" style="margin-top: 5px">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<input type="hidden" id="reply" value="${dto.replyFlag}">
			<section data-am-widget="accordion" class="am-accordion dhcc-accordion-mt"
				data-am-accordion='{"multiple": true }' style="padding: 0px;margin: 0px" id="nurReplayList">
				
			</section>
			<div id="page"></div>
		</div>
	</div>
</body>
</html>
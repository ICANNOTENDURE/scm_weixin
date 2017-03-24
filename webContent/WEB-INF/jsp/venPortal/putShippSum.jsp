<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华采购平台</title>

<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/ven/venPortal.css"
	rel="stylesheet" type="text/css" />

</head>

<body>
	<!-- header -->
	<%@include file="/WEB-INF/jsp/venPortal/venCommon.jsp"%>
	<!-- end -->

	<div class="am-g" style="margin-top: 10px">
		<div class="am-u-lg-10 am-u-lg-offset-1 am-u-end">
			<iframe name="mainIframe" frameborder="0"
				src="<%=request.getContextPath()%>/ord/putShippSumCtrl!list.htm"
				style="width: 100%; min-height: 600px;"></iframe>
			
		</div>
	</div>
</body>
</html>
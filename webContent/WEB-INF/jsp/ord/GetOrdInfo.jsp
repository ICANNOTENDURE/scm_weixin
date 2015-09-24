<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/ord/GetOrdInfo.js"></script>	



</head>
<body>
	
	
	<table cellpadding="0" cellspacing="0" class="gwc_tb3">
		<tr>
			<td style="width:155px; text-align:left;float: left" >
				<a href="#" class="back">继续购物</a>
			</td>
			<td class="tb3_td3">合计:<span>￥</span><span style=" color:#ff5500;"><label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></span></td>
			<td class="tb3_td4"><span id="jz1">结算</span><a href="#" style=" display:none;"  class="jz2" id="jz2">结算</a></td>
		</tr>
	</table>
</body>
</html>

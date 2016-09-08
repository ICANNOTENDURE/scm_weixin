<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css" media="print">
.v-h {
	display: none;
}
</style>

</head>
<body>
	<div class="v-h">
		<input name="" type="button" value="打印"
			onclick="javascript:window.print();" />
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<s:iterator value="dto.printByQtyVos" id="printByQtyVos">
			<tr>
				<!-- 
				<td>${seq}</td>
				<td>${venincname}</td>
				 -->
				<td>
					${seq}:${venincname}<br>
					<img
					src="<%=request.getContextPath()%>/sys/qrCodeCtrl!qrAndroid.htm?dto.content=${deliveritmid}&dto.codeType=ByQty&dto.seq=${seq}&dto.code128=${dto.code128}"
					style='height: 100; width: 100px'> </img></td>
			</tr>
		</s:iterator>
	</table>

</body>
</html>

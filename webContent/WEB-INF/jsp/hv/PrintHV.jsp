<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><title>
	订单打印
</title>

    <style type="text/css">
* {margin:0;padding:0}
body {font:12px/1.5  "宋体";color:#333}
.w{width:100%}
.m1 td{height:0.6cm;line-height:0.6cm;}
.t3,.t7,.t6{width:1.6cm}
.t1{width:6.8cm}
.t5{width:1.1cm}
.tb4{border-collapse:collapse;border:1px solid #000}
.tb4 th, .tb4 td,.d1{border:1px solid #000}
.tb4 td {padding:1px}
.tb4 th {height:0.6cm;font-weight:normal}
.m1,.m2,.m3{padding-top:10px}
.d1{padding:10px}
.d2{text-align:right;padding:10px 0;font-size:14px}
.v-h{ text-align:center}
.m2{padding-left:1px}
</style>
<style type="text/css" media="print">
.v-h {display:none;}
</style>

</head>
<body>
	<form name="form1">
		<div class="v-h"><input name="" type="button" value="打印" onclick="javascript:window.print();" /></div>
		
		<s:iterator value="dto.barCodes"  id="barCodes">
		<div class="w">					
			<div class="m1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb1">
					<tr>
						<td class="t1"><strong><s:property value='dto.incname'/></strong> </td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb2">
					<tr>
						<td class="t3"><strong><s:property value='barCodes'/></strong></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tb3">
						<tr>
							<td class="t8"><img
								src="<%=request.getContextPath()%>/sys/qrCodeCtrl!hvAndroid.htm?dto.content=<s:property value='barCodes'/>"
								style='height: 100; width: 100px'> </img></td>

						</tr>
				</table>
			</div>
    	</div>
    </div>
    </s:iterator>
    </form>

</body>
</html>

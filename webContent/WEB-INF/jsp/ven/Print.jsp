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
body {font:18px/1.5  "宋体";color:#333}
.w{width:100%}
.m1 td{height:0.6cm;line-height:0.6cm;}
.t3,.t7,.t6{width:1.6cm}
.t4{width:2.5cm}
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
		
		<s:iterator value="dto.printVos"  id="printVos">
		<div class="w">					
			<div class="m1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb1">
					<tr>
						<td class="t1"><strong>订单编号：</strong><strong style="font-size:140%">${printVos.hisno}</strong></td>
						<td class="t2"><strong>订购时间：</strong>${printVos.orderDate}</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb2">
					<tr>
						<td class="t1"><strong>医院名称：</strong>${printVos.hopname}</td>
						<td class="t2"><strong>收货科室：</strong>${printVos.recloc}</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb3">
					<tr>
						<td class="t1"><strong>收货地址：</strong>${printVos.destination}</td>
						<td class="t2"><strong>供应商：</strong>${printVos.venname}</td>

				    </tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tb3">
						<tr>
							<td class="t8"><img
								src="<%=request.getContextPath()%>/sys/qrCodeCtrl!qrAndroid.htm?dto.content=${dto.printVos[0].ordrid}&dto.codeType=ByOrder&dto.text=${dto.printVos[0].hisno}"
								style='height: 100; width: 100px'> </img></td>

						</tr>
				</table>
			</div>
			<div class="m2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tb4">
					<tr>
						<th class="t3">商品编号</th>
					<!--	<th class="t3">条码</th>  -->
						<th class="t4">商品名称</th>
						<th class="t5">发票</th>
						<th class="t5">批号</th>
						<th class="t5">采购合同号</th>
						<th class="t5">商品注册证</th>
						<th class="t5">效期</th>
						<th class="t4">商品注册证效期</th>
						<th class="t5">请求科室</th>
						<th class="t5">规格</th>
						<th class="t5">数量</th>
						<th class="t5">发货数量</th>
						<th class="t5">产地</th>
						<th class="t5">进价</th>
						<th class="t7">商品金额</th>
				    </tr>
				    <s:iterator value="#printVos.deliverItmVos" status="status"
										id="deliverItmVos">
					    <tr>
							<td>${venincncode}</td>
						<!--  	<td><img  src="<%=request.getContextPath()%>/sys/qrCodeCtrl!qrAndroid.htm?dto.content=${deliveritmid}&dto.codeType='ByInc'" style='height: 100;width: 100px'> </img></td> -->
							<td><div class="p-name">${venincname}</div></td>
							<td>${invno}</td>
							<td>${batno}</td>
							<td>${qualifdpurno}</td>
							<td>${qualifprocer}</td>
							<td>${expdate}</td>
							<td>${qualifdate}</td>
							<td>${purloc}</td>
							<td>${spec}</td>
							<td>${orderqty}</td>
							<td>${sendedqty}</td>
							<td>${manf}</td>
							<td>${rp}</td>
							<td>￥${rpamt}</td>
				    	</tr>
				    </s:iterator>	
														</table>
    	</div>
	    <div class="m3">
	    <!-- 
		    <div class="d1">

		    </div>
		  -->   
		    <div class="d2"><strong>订单支付金额：￥${amt}</strong></div>
	    </div>
    </div>
    </s:iterator>
    </form>

</body>
</html>

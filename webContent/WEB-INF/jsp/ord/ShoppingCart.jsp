<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ord/ShoppingCart.js"></script>	
<link href="../css/ord/shopping.css" rel="stylesheet" type="text/css" />	



</head>
<body>

<div class="gwc" style=" margin:auto;">
	<table cellpadding="0" cellspacing="0" class="gwc_tb1">
		<tr>
			<td class="tb1_td1"><input id="Checkbox1" type="checkbox"  class="allselect"/></td>
			<td class="tb1_td1">全选</td>
			<td class="tb1_td3">商品</td>
			<td class="tb1_td4">商品信息</td>
			<td class="tb1_td5">数量</td>
			<td class="tb1_td6">单价</td>
			<td class="tb1_td7">操作</td>
		</tr>
	</table>
		   

	<s:iterator value="dto.nurseIncVos" status="all"  id="nurseIncVos">
		
		<table cellpadding="0" cellspacing="0" class="gwc_tb2">
			<tr dataid="${shopCartPicVoList.inc}" dataname="${shopCartPicVoList.shop}">
				<td class="tb2_td1"><input type="checkbox" value="1" name="newslist" id="newslist-1" checked="checked"/></td>
				
				<td class="tb2_td2"><a href="#"><img src="../uploadPic/${shopCartPicVoList.path}"/></a></td>
				<td class="tb2_td3"><a href="#">${shopCartPicVoList.name}</a></td>
				<td class="tb1_td4">${shopCartPicVoList.uom}</td>
				<td class="tb1_td5">
					<input id="min1" name=""  style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />
					<input id="text_box1" name="" type="text" value="${shopCartPicVoList.qty}" style=" width:30px; text-align:center; border:1px solid #ccc;" />
					<input id="add1" name="" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />
				</td>
				<td class="tb1_td6"><label id="total1" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">${shopCartPicVoList.rp}</label></td>
				<td class="tb1_td7"><a href="#" class="frok">删除</a></td>
			</tr>
		</table>
	</s:iterator>
	
	<table cellpadding="0" cellspacing="0" class="gwc_tb3">
		<tr>
			<td class="tb1_td1"><input id="checkAll" class="allselect" type="checkbox" /></td>
			<td class="tb1_td1">全选</td>
			<td class="tb3_td1">
				<input id="invert" type="checkbox" checked="checked"/>反选
				<input id="cancel" type="checkbox" />取消
			</td>
			<td style="width:155px; text-align:left;float: left" >
				<a href="#" class="back">继续购物</a>
			</td>
			<td class="tb3_td2">已选商品 <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label> 件</td>
			<td class="tb3_td3">合计:<span>￥</span><span style=" color:#ff5500;"><label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></span></td>
			<td class="tb3_td4"><span id="jz1">结算</span><a href="#" style=" display:none;"  class="jz2" id="jz2">结算</a></td>
		</tr>
	</table>

</div>

<div id="OrdInfoWin" class="dialog" 
		data-options="modal:true,width:400,height:340,closed:true,buttons:'#btnDiv'"
		style="vertical-align: middle;">
		<form id="detail" method="post">
			<table style="width: 100%;" >
				<tr>
					<td class="textLabel">采购科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.ord.purLoc"
						data-options="required:true" id="purId"/></td>					
				</tr>
				<tr>
					<td class="textLabel">收货科室:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.ord.recLoc"
						data-options="required:true" id="locId"/></td>					
				</tr>
				<tr>
					<td class="textLabel">收货地址:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.order.recDestination"
						data-options="required:true" id="recDestination"/></td>					
				</tr>
				<tr>
					<td class="textLabel">供应商:</td>
					<td class="textParent"><input style="width: 250px;"
						class="combobox" type="text" name="dto.order.vendorId"
						data-options="required:true" id="vendorId" "/></td>					
				</tr>
				<tr>
					<td class="textLabel">要求送达时间:</td>
					<td class="textParent"><input style="width: 250px;"
						class="datebox"  name="dto.order.deliveryDate"
						id="deliveryDate"/></td>					
				</tr>
				<tr>
					<td class="textLabel">是否加急:</td>
					<td class="textParent" style="float: left;"><input style="width: 30px;"
						 type="checkbox" name="dto.ord.emFlag"
						id="emFlag"/></td>					
				</tr>
				<tr>
					<td class="textLabel">备注:</td>
					<td class="textParent"><textarea  name="dto.ord.remark" style="width: 250px;height: 100px" id="remark"></textarea></td>					
				</tr>
			</table>			
																
			<div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="saveOrUpdateBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
</div>
</body>
</html>

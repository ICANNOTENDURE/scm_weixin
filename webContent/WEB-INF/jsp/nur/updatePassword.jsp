<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css" />
<title>东华电子商务平台(SCI)</title>
<script type="text/javascript">
	$(function() {
		$("#minus").click(function() {
			qty = $(this).parent().parent().next().val();
			if (qty > 1) {
				$(this).parent().parent().next().val(qty - 1);
			}
		});
		$("#plus").click(function() {
			qty = $(this).parent().parent().prev().val();
			$(this).parent().parent().prev().val(parseInt(qty) + 1);
		});
		$("#shopCart").click(function() {
			$btn = $(this);
			$btn.button('loading');
			venincId = $("#venincid").val();
			incId = $("#incid").val();
			qty = $("#shopQty").val();
			$.post(getContextPath() + '/nur/nurseCtrl!addShopCart.htm', {
				'dto.ordShopping.shopVenIncid' : venincId,
				'dto.ordShopping.shopIncid' : incId,
				'dto.ordShopping.shopQty' : qty
			}, function(data) {
				$btn.button('reset');
				if (data.resultCode == "1") {
					$("#dhcc-popup").modal('toggle')
				} else {
					$("#alert-message").html(data.resultContent);
					$("#my-alert").modal('toggle');
				}
			}, "json");
		});
		$("#jiesuan").click(function() {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nursePay.htm";
		});
		$("#jixu").click(function() {
			window.location.href="<%=request.getContextPath()%>/nur/nurseCtrl!nurseManageMain.htm";
		});
	});	
</script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/nur/nurCommon.jsp"%>
	<%@include file="/WEB-INF/jsp/userManage/password.jsp"%>
		<!-- foot-->

	<div id="xxx1" style="display:none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
			<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display:none;">
		<footer class="footer" style="bottom:0;width:100%;position:fixed;*position:relative;;">
			<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>
 	$(function (){
 		$.post(
 			$WEB_ROOT_PATH +'/normalAccount/normalAccountCtrl!getLoginVendorId.htm',
 			function(data){
 				$("#vendor")[0].src= $WEB_ROOT_PATH + '/ven/vendorCtrl.htm?BLHMI=update&dto.vendor.vendorId=' + data;
 		 	    $CommonUI.getDialog("#Dialog1").dialog("setTitle", "修改供应商");
 		 	    $CommonUI.getDialog("#Dialog1").dialog("center");
 		 	    $CommonUI.getDialog("#Dialog1").dialog("open");
 			},
 			"json"
 		);
 	});

</script>
</head>
<body >
	<div id="Dialog1" class="dialog" title="修改"
		data-options="
				width:900,
				height:550,
				modal:true,
		        closed:true,
				collapsible:true,
				minimizable:false,
				maximizable:true,
				shadow:true">
		
			<iframe id="vendor"  style="width:100%;height:100%;" frameborder="0" ></iframe>
	</div>
</body>
</html>
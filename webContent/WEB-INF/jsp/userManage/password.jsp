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
			$WEB_ROOT_PATH+'/authenTicket/authenTicketCtrl!getUserName.htm',
			function(data){
				$("#accountAlias").val(data);
			}	
		);
		
		$("#submitBtn").on('click',function(){
			if($("#password").val()==""){
				
			}
			if($("#newpassword").val()==""){
				
			}
			if($("#confirmpassword").val()==""){
	
			}
			var isValid = $CommonUI.getForm('#saveOrUpdate').form('validate');
			if(!isValid){
				return isValid;
			}
			//alert(isValid)
			$.post(
				$WEB_ROOT_PATH+'/normalAccount/normalAccountCtrl!updatePassword.htm',
				{
					'normalAccountDto.normalAccount.accountAlias':$("#accountAlias").val(),
					'normalAccountDto.normalAccount.password':$("#password").val(),
					'normalAccountDto.newPassword':$("#confirmpassword").val(),
				},
				function(data){
					if(data.success){
						$CommonUI.alert("操作成功");
					}else{
						$CommonUI.alert(data.message);
					}
				},
				'json'
			);
		});
		$.extend($.fn.validatebox.defaults.rules, {  
		    /*必须和某个字段相等*/
		    equalTo: {
		        validator:function(value,param){
		            return $(param[0]).val() == value;
		        },
		        message:'字段不匹配'
		    }
		           
		});
 	});
    $(document).ready(function () {
    	$CommonUI.getDialog("#Dialog1").dialog("center");
    	$CommonUI.getDialog("#Dialog1").dialog("open");	
    	
    });
    function checkPass(){
		if($("#confirmpassword").val()!=$("#newpassword").val()){
			//$CommonUI.autoCloseCenterMessage("密码两次输入不一致!","warning","错误");
		}
	}
</script>
</head>
<body >
	
	<div id="Dialog1" class="dialog" title="修改密码"
		style="width: 900px;"
		data-options="
				toolbar:'#toolbar',
				buttons:'#Button',
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:true,
				shadow:true">
		<form id="saveOrUpdate" >

			<table id="saveOrUpdateTable" style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">帐号:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					  id="accountAlias" readonly="readonly"/></td>	
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">旧密码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					  id="password" type="password"  class="validatebox" required="true" /></td>	
				</tr>		
				<tr>
					<td class="textLabel" style="text-align: right; width: 20%">新密码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					  id="newpassword" type="password"  class="validatebox" required="true" /></td>	
				</tr>
				<tr>

					<td class="textLabel" style="text-align: right; width: 20%">确认密码:</td>
					<td class="textParent" style="text-align: left; width: 30%"><input style="width: 200px;" 
					 id="confirmpassword" type="password" onBlur="checkPass()" required="true" class="validatebox" validType="equalTo['#newpassword']" invalidMessage="两次输入密码不匹配" tipPosition="right"/></td>	
				</tr>


			</table>

		</form>
	</div>
	<div id="Button" align="center">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="submitBtn"
					href="javascript:void(0)" class="linkbutton"
					data-options="iconCls:'icon-save',plain:true">保存</a></td>
			</tr>
		</table>
	</div>

</body>
</html>
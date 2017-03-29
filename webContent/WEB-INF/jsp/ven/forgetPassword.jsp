<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/ven/regStep.css">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>	
<title>东华电子商务平台(SCI)</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript">
$(function(){
	// 扩展validatebox的validType属性
	$.extend($.fn.validatebox.defaults.rules, {
	  
	    mail:{
	    	validator: function(value, param){ 
	    		var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		    	if (filter.test(value)){
		    		return true;
		    	} else {
		    		return false;
		    	}
	        },  
	        message: '邮箱格式有误'
	    }
	});
	$("#validateEmail").on('click',function(){
		
		 var emailObj=$("#email");
		 if(emailObj.val().trim() == ''){
			 add_message("am-btn-danger","请先输入邮箱!","");
			 emailObj.val("");
			 return;
		 }
		 var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		 if (!filter.test(emailObj.val())){
			 add_message("am-btn-danger","请正确输入邮箱!","");
			 return;
		 }
		  $.post($WEB_ROOT_PATH + "/sys/sendMailCtrl!sendValidate.htm", {
			  'dto.recUser': emailObj.val()
		  },function(data){
			      if(data!="0"){
			    	  add_message("am-btn-danger",data,"");
			      }else{
					  add_message("am-btn-success","验证码发送成功!","");
			      }

		  });
	})
	//OKBtn
	$("#OKBtn").on('click',
		    function() {
					var isValid = $CommonUI.getForm('#detailsForm').form('validate');
					if(!isValid){
						return isValid;
					}
			       $.post($WEB_ROOT_PATH + "/sys/sendMailCtrl!updatePassword.htm", {
			            "email": $("#email").val(),
			            "code": $("#code").val(),
			            "pwd": $("#pwd").val(),
			            "confirmPwd": $("#confirmPwd").val(),
			        },
			        function(data) {
			            if (data.resultCode==0) {
			            	add_message("am-btn-success","操作成功","");
			            } else {
			            	add_message("am-btn-danger",data.resultContent,"");
			            }
			        },
			        "json");
			}
	);
});
</script>
</head>
<body>
	<div class="am-g am-container" style="margin-top: 20px">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">供应商注册</h3>
		</header>
		<form class="am-form am-form-horizontal" id="detailsForm">
			<div class="am-panel-bd" style="min-height: 327px">
				<div class="widget-box">
					<div class="widget-body">
						<div class="widget-main">
	
									<table id="subDetails"
										class="am-table am-table-bordered am-table-hover">
										<tr id="emailtr">
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>注册邮箱:</td>
											<td class="textParent"><input type="text" id="email"
												class="validatebox"
												data-options="required:true,validType:['mail']"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												 <span class="am-kai am-text-default am-text-middle">(邮箱可以直接登录，以后收到医院新订单通知)</span>
												 <button class="am-btn am-btn-success am-btn-xs" type="button" id="validateEmail">发送验证码</button>
											</td>
										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>验证码:</td>
											<td class="textParent"><input type="text"
												class="validatebox" data-options="required:true"
												 id="code"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												<span class="am-kai am-text-default am-text-middle"></span>
											</td>

										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>新密码:</td>
											<td class="textParent"><input type="password"
												class="validatebox" data-options="required:true"
												 id="pwd"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												<span class="am-kai am-text-default am-text-middle"></span>
											</td>

										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>重复新密码:</td>
											<td class="textParent"><input type="password"
												class="validatebox" data-options="required:true"
												id="confirmPwd"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												<span class="am-kai am-text-default am-text-middle">重复新密码</span>
											</td>

										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;" colspan="4">
												<button class="am-btn am-btn-primary" id="OKBtn" type="button" style="margin-right: 400px">
												确认修改
											  </button>
											</td>
										</tr>
									</table>
									
	
						</div>
						<!-- /widget-main -->
					</div>
					<!-- /widget-body -->
				</div>
			</div>
		</form>
		</section>
	</div>
	<!-- content end -->
</body>
</html>
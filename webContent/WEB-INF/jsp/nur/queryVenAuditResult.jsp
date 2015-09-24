<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<link href="<%=request.getContextPath()%>/css/nur/nurse.css"
	rel="stylesheet" type="text/css"/>
<% request.setCharacterEncoding("utf-8");%>
<% response.setCharacterEncoding("utf-8");%>
<title>东华电子商务平台(SCI)</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>		
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>	
<%@include file="/WEB-INF/jsp/common/scriptZoomImage.jsp"%>	
<link rel="stylesheet"	rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(function(){
	$("#submitBtn").on('click',function(){
		var isValid = $CommonUI.getForm('#condition').form('validate');
		if(!isValid){
			return isValid;
		}
		var hopId=$("#hopid").val();
		if((hopId=="")||(hopId=="0")){
			add_message("am-btn-warning","请选择医院进行查询!","");
			return false;
		}
		
		var name=$("#name").val();
		var account=$("#account").val();
		var taxation=$("#taxation").val();
		var hopid=$("#hopid").val();
		window.location.href=$WEB_ROOT_PATH+"/nur/nurseCtrl!auditResult.htm?dto.vendorDto.vendor.name="+name+"&dto.vendorDto.vendor.account="+account+"&dto.vendorDto.vendor.taxation="+taxation+"&dto.hopVendorDto.hopVendor.hopHopId="+hopid;
	});
	
	$("#goIndex").on('click',function(){
		window.location.href="../";
	});
});
</script>
</head>
<body>		
		<div class="am-g am-container" style="margin-top: 20px">
	    	<section class="am-panel dhcc-panel-mt">
				  <header class="am-panel-hd">
				    <h3 class="am-panel-title">请输入查询条件...</h3>
			</header>
	        <form class="am-form am-form-horizontal" id="condition">
	        <div class="am-panel-bd">
	        	<table id="subDetails" class="am-table am-table-bordered am-table-hover">
				<tr>
					 <td class="textLabel" style="width: 10%;">
						  供应商名称:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" class="validatebox" name="dto.vendorDto.vendor.name" id="name" style="width: 80%;">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						  注册帐号:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" class="validatebox" name="dto.vendorDto.vendor.account" id="account" style="width: 80%;">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						  <span style='color:red'>*</span>税务登记号:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" class="validatebox"  data-options="required:true" name="dto.vendorDto.vendor.taxation" id="taxation" style="width: 80%;">
				      </td>
	        	</tr>
	        	<tr>
		        	<td class="textLabel" style="width: 10%;">
							  <span style='color:red'>*</span>医院:	  
					 </td>
			        <td class="textParent">
					    <select id="hopid"  data-am-selected="{btnSize: 'xs',btnStyle: '',searchBox: 1,maxHeight: 300}" name="dto.hopVendorDto.hopVendor.hopHopId">
								<option value="0">请选择医院......</option>
								<s:iterator value="dto.hospital" status="all" id="hospital">
									<option value="${hospital.hospitalId}">${hospital.hospitalName}</option>
								</s:iterator>
						</select>  
					</td>				
	        	</tr>
		        </table>  
		        <div class="am-form-group">
			            <div class="am-u-sm-8 am-u-sm-push-3">
			            	<button type="button" class="am-btn am-btn-mt" id="submitBtn">提交查询&nbsp;<i class="am-icon-search"></i></button>
			            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            	<button type="button" class="am-btn am-btn-mt" id="goIndex">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;<i class="am-icon-user" ></i></button>
			            </div>
		          </div>
	          </div>
	        </form>
	        </section>
	    </div>
	   <!--  
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
	 -->
</body>
</html>
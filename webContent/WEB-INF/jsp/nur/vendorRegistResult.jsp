<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>

<% request.setCharacterEncoding("utf-8");%>
<title>东华电子商务平台(SCI)</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>		

<script type="text/javascript">
$(function() {
	$("#goIndex").on('click',function(){
		window.location.href="../";
	});
});
</script>
</head>
<body>		
		<div class="am-g am-container">
	    	<section class="am-panel dhcc-panel-mt">
				  <header class="am-panel-hd">
				    <h3 class="am-panel-title">供应商注册基本信息</h3>
			</header>
	        <form class="am-form am-form-horizontal">
	        <div class="am-panel-bd">
	        	<table id="subDetails" class="am-table am-table-bordered am-table-hover">
	        			<tr style="display: none">
							<input type="hidden" id="vendorId" name="dto.vendorDto.vendor.vendorId" value="<s:property value='dto.vendorDto.vendor.vendorId'/>" />
						</tr>
						<tr>
							<td class="textLabel" style="width: 10%;">
							         <span style='color:red'>*</span>供应商代码:
					      </td>
					      <td class="textParent">
					      	 <input type="text" name="dto.vendorDto.vendor.code" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.code'/>">	
					      </td>
					     </tr>
				<tr>
					 <td class="textLabel" style="width: 10%;">
						  <span style='color:red'>*</span>供应商名称:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.name" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.name'/>">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						  <span style='color:red'>*</span>工商执照号:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" class="validatebox" data-options="required:true" name="dto.vendorDto.vendor.taxation" style="width: 70%;" value="<s:property value='dto.vendorDto.vendor.taxation'/>">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						  <span style='color:red'>*</span>注册帐号:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.account" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.account'/>">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						            <span style='color:red'>*</span>联系人姓名:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.contact" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.contact'/>">
				      </td>
	        	</tr>
	        	<tr>
					 <td class="textLabel" style="width: 10%;">
						            <span style='color:red'>*</span>联系人电话:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.tel" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.tel'/>">
				      </td>
	        	</tr>
		         <tr>
					 <td class="textLabel" style="width: 10%;">
						            <span style='color:red'>*</span>联系人邮箱:					      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.email" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.email'/>">
				      </td>
	        	</tr>
	        	 <tr>
					 <td class="textLabel" style="width: 10%;">
						            <span style='color:red'>*</span>联系人传真:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.fax" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.fax'/>">
				      </td>
	        	</tr>
			      <tr>
					 <td class="textLabel" style="width: 10%;">
						     <span style='color:red'>*</span>联系人地址:	
				      </td>
				      <td class="textParent">
				      	  <input type="text" name="dto.vendorDto.vendor.address" style="width: 80%;" value="<s:property value='dto.vendorDto.vendor.address'/>" >
				      </td>
	        	</tr> 
		    	   <div class="am-form-group">
			            <div class="am-u-sm-8 am-u-sm-push-3">
			            </div>
		          </div>
		        </table>  
	          </div>
	        </form>
	        </section>
	    </div>
<div class="am-g am-container">
	 <section class="am-panel dhcc-panel-mt">
				  <header class="am-panel-hd">
				    <h3 class="am-panel-title">供应商资质信息</h3>
				  </header>
	   <form class="am-form am-form-horizontal">
	        <div class="am-panel-bd">
	    <table id="subDetail" class="am-table am-table-bordered am-table-hover">
					<s:iterator value="dto.vendorDto.venQualifTypeVOList" status="all"
							id="venQualifys">
						<tr>
							<input type="hidden" id="${venQualifys.type}"
								value="${venQualifys.type}"
								name="dto.vendorDto.venQualificationList.venQualification.venQualifyTypeId" />
							<td class="textLabel" style="width: 10%;"><span style='color:red'>*</span>${venQualifys.name}：</td>
							<s:if test="#venQualifys.fieldtype=='日期'">
								<td class="textParent">
								<div class="am-input-group am-datepicker-date" data-am-datepicker="{format: 'yyyy-mm-dd'}" style="width:80%">
								  <input type="text" value='${venQualifys.expdate}' name='dto.vendorDto.venQualificationList.venQualification.expdate' class="am-form-field" placeholder="选择日期" readonly id="expdate">
								  <span class="am-input-group-btn am-datepicker-add-on">
								    <button class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
								  </span>
								</div>
							</s:if>
							<s:if test="#venQualifys.fieldtype=='文本'">
								<td class="textParent"><input
									style="width: 80%;" type="text" value='${venQualifys.description}'
									name='dto.vendorDto.venQualificationList.venQualification.description' /></td>
							</s:if>
						   <s:if test="#venQualifys.fieldtype=='图片'">
								<td class="textParent" style="text-align: left;">

									 <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-bordered" data-am-gallery="{  }" >
									 <s:iterator value="venQualifPics" status="all" id="venQualifPicss">
										 <li>
										 	 <div class="am-gallery-item">
												<a href="<%=request.getContextPath()%>/uploads/<s:property value="#venQualifPicss.path"/>" >
									 				<img src="<%=request.getContextPath()%>/uploads/<s:property value="#venQualifPicss.path"/>"  />
           		 								</a>
									 		</div>
									 	 </li>
									 </s:iterator>
									 </ul>
								</td>
						  </s:if>
						</tr>
					</s:iterator>
				</table>

				<div class="am-form-group">
		            <div class="am-u-sm-8 am-u-sm-push-3" id="buttons">
		             	<s:if test="dto.success==true">
		              		<button type='button' class='am-btn am-btn-success'>审核通过</button>
		              	</s:if>
		              	<s:if test="dto.success==false">
		              		<button type='button' class='am-btn am-btn-warning'>正在审核中</button>
		              	</s:if>
		              	<button type="button" class="am-btn am-btn-success" id="goIndex">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;</button>
			            
		            </div>
		          </div>
			</div>
		</form>
	</section>
</div>
  <!-- content end -->





</body>
</html>
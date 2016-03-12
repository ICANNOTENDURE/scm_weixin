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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
<%
	request.setCharacterEncoding("utf-8");
%>
<title>东华电子商务平台(SCI)</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptZoomImage.jsp"%>
<link rel="stylesheet" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/vendorRegistInfo.js"></script>
</head>
<body>
	<div class="am-g am-container" style="margin-top: 10px">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">供应商注册基本信息</h3>
		</header>
		<form class="am-form am-form-horizontal" id="detailsForm">
			<div class="am-panel-bd">
				<table id="subDetails"
					class="am-table am-table-bordered am-table-hover">
					<tr style="display: none">
						<input type="hidden" name="dto.vendorDto.vendor.vendorId" />
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>供应商代码:</td>
						<td class="textParent"><input type="text" class="validatebox"
							name="dto.vendorDto.vendor.code" id="code" style="width: 70%;"
							data-options="
			      required:true
			      "></td>

						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>供应商名称:</td>
						<td class="textParent"><input type="text" class="validatebox"
							id="name" data-options="required:true"
							name="dto.vendorDto.vendor.name" style="width: 70%;"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>工商执照号:</td>
						<td class="textParent"><input type="text" class="validatebox"
							data-options="required:true" name="dto.vendorDto.vendor.taxation"
							id="taxation" style="width: 70%;"></td>

						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>注册帐号:</td>
						<td class="textParent"><input type="text" class="validatebox"
							data-options="required:true,
			      validType:['accountAlias']"
							name="dto.vendorDto.vendor.account" id="account"
							style="width: 70%;"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>联系人姓名:</td>
						<td class="textParent"><input type="text" class="validatebox"
							data-options="required:true" name="dto.vendorDto.vendor.contact"
							style="width: 70%;"></td>

						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>联系人电话:</td>
						<td class="textParent"><input type="text"
							name="dto.vendorDto.vendor.tel" class="validatebox"
							data-options="required:true,validType:['telphone']"
							style="width: 70%;"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>联系人邮箱:</td>
						<td class="textParent"><input type="text"
							name="dto.vendorDto.vendor.email" class="validatebox"
							data-options="required:true,validType:['mail']"
							style="width: 70%;"></td>

						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>联系人传真:</td>
						<td class="textParent"><input type="text"
							name="dto.vendorDto.vendor.fax" class="validatebox"
							data-options="required:true" style="width: 70%;"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>联系人地址:</td>
						<td class="textParent"><input type="text"
							name="dto.vendorDto.vendor.address" class="validatebox"
							data-options="required:true" style="width: 70%;"></td>
					</tr>
					<div class="am-form-group">
						<div class="am-u-sm-8 am-u-sm-push-3"></div>
					</div>
				</table>
			</div>
		</form>
		</section>
	</div>
	<div class="am-g am-container">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">供应商资质信息</h3>
		</header>
		<form class="am-form am-form-horizontal" id="detailsFormZZ">
			<div class="am-panel-bd">
				<table id="subDetail"
					class="am-table am-table-bordered am-table-hover">
					<s:iterator value="dto.vendorDto.venQualifTypeList" status="all"
						id="venQualifys">
						<tr>
							<input type="hidden" id="${venQualifys.venQualifTypeId}"
								value="${venQualifys.venQualifTypeId}"
								name="dto.vendorDto.venQualificationList.venQualification.venQualifyTypeId" />
							<td class="textLabel" style="width: 10%;"><span
								style='color: red'>*</span>${venQualifys.name}：</td>
							<s:if test="#venQualifys.type=='日期'">
								<td class="textParent">
									<div class="am-input-group am-datepicker-date"
										data-am-datepicker="{format: 'yyyy-mm-dd'}" style="width: 70%">
										<input type="text" class="validatebox"
											data-options="required:true"
											name='dto.vendorDto.venQualificationList.venQualification.expdate'
											class="am-form-field" placeholder="选择日期" readonly
											id="expdate"> <span
											class="am-input-group-btn am-datepicker-add-on">
											<button class="am-btn am-btn-default" type="button">
												<span class="am-icon-calendar"></span>
											</button>
										</span>
									</div>
							</s:if>
							<s:if test="#venQualifys.type=='文本'">
								<td class="textParent"><input style="width: 70%;"
									type="text" class="validatebox" data-options="required:true"
									name='dto.vendorDto.venQualificationList.venQualification.description' /></td>
							</s:if>
							<s:if test="#venQualifys.type=='图片'">
								<td class="textParent" style="text-align: left;"><input
									id="file_upload${venQualifys.venQualifTypeId}" name="upload"
									type="file" multiple="true" style="width: 70%"
									class="validatebox" data-options="required:true">
									<div id="queue${venQualifys.venQualifTypeId}" name="queue"></div>
									<input type="hidden" value=""
									name="dto.vendorDto.venQualificationList.venQualification.venQualificationId"
									id="${venQualifys.venQualifTypeId}" /></td>
							</s:if>
						</tr>
					</s:iterator>
				</table>

				<div class="am-form-group">
					<div class="am-u-sm-8 am-u-sm-push-3">
						<button type="button" class="am-btn am-btn-primary" id="submitBtn">提交注册</button>
					</div>
				</div>
			</div>
		</form>
		</section>
	</div>
	<!-- content end -->




	<div id="xxx1" style="display: none;">
		<footer class="footer" style="bottom:0;width:100%;*position:relative;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
	<div id="xxx2" style="display: none;">
		<footer class="footer"
			style="bottom:0;width:100%;position:fixed;*position:relative;;">
		<p>Copyright &copy; 2015 东华软件股份公司. by the Dhcc Pharmacy Team.</p>
		</footer>
	</div>
</body>
</html>
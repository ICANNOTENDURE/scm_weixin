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

<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/vendorRegistInfo.js"></script>
</head>
<body>
	<div class="am-g am-container" style="margin-top: 20px">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">供应商注册</h3>
		</header>
		<form class="am-form am-form-horizontal" id="detailsForm">
			<div class="am-panel-bd" style="min-height: 427px">
				<div class="widget-box">
					<div class="widget-body">
						<div class="widget-main">
							<div id="fuelux-wizard" class="row-fluid"
								data-target="#step-container">
								<ul class="wizard-steps">
									<li class="active" id="stepTitle1"><span class="step">1</span>
										<span class="title">填写基本信息</span></li>

									<li data-target="#step2" id="stepTitle2"><span
										class="step">2</span> <span class="title">上传资质信息</span></li>

									<li data-target="#step3" id="stepTitle3"><span
										class="step">3</span> <span class="title">提交审核</span></li>
								</ul>
							</div>

							<hr>
							<div class="step-content" id="step-container">
								<div class="step-pane" id="step1">
									<table id="subDetails"
										class="am-table am-table-bordered am-table-hover">
										<tr style="display: none">
											<input type="hidden" name="dto.vendorDto.vendor.vendorId"
												id="vendorId" />
										</tr>
										<!-- 
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>注册帐号:</td>
											<td class="textParent"><input type="text"
												class="validatebox"
												data-options="required:true,
			      								validType:['accountAlias']"
												name="dto.vendorDto.vendor.account" id="account"
												style="width: 70%;" /></td>
											<td class="textParent" colspan="2" style="border-left: none">
												(注册帐号不能以数字开头，不能包含"@",长度为6-20位)</td>
										</tr>
										 -->
										<tr id="emailtr">
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>注册邮箱:</td>
											<td class="textParent"><input type="text" id="email"
												name="dto.vendorDto.vendor.email" class="validatebox"
												data-options="required:true,validType:['mail']"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												 <span class="am-kai am-text-default am-text-middle">(邮箱可以直接登录，以后收到医院新订单通知)</span>
												 <button class="am-btn am-btn-success am-btn-xs" type="button" id="validateEmail">验证邮箱</button>
											</td>
										</tr>

										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>工商执照号:</td>
											<td class="textParent"><input type="text"
												class="validatebox" data-options="required:true"
												name="dto.vendorDto.vendor.taxation" id="taxation"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												<span class="am-kai am-text-default am-text-middle">(工商执照注册号/统一社会信用代码)</span>
											</td>

										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>供应商名称:</td>
											<td class="textParent"><input type="text"
												class="validatebox" data-options="required:true"
												name="dto.vendorDto.vendor.name" id="name"
												style="width: 100%;"></td>
											<td class="textParent" colspan="2" style="border-left: none">
												<span class="am-kai am-text-default am-text-middle">(机构名称)</span>
											</td>
										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;">传真:</td>
											<td class="textParent"><input type="text"
												name="dto.vendorDto.vendor.fax" 
												style="width: 70%;"></td>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>联系人手机:</td>
											<td class="textParent"><input type="text"
												name="dto.vendorDto.vendor.tel" class="validatebox"
												data-options="required:true,validType:['telphone']"
												style="width: 70%;"></td>
										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>公司地址:</td>
											<td class="textParent"><input type="text"
												name="dto.vendorDto.vendor.address" class="validatebox"
												data-options="required:true" style="width: 70%;"></td>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>联系人姓名:</td>
											<td class="textParent"><input type="text"
												class="validatebox" data-options="required:true"
												name="dto.vendorDto.vendor.contact" style="width: 70%;"></td>
										</tr>
										<tr>
											<td class="textLabel" style="width: 10%;"><span
												style='color: red'>*</span>所服务医院:</td>
											<td class="textParent"><select id="reghopid" multiple
												data-am-selected name="dto.hopVendorDto.hopVendor.hopHopId">
													<s:iterator value="dto.hospital" status="all" id="hospital">
														<option value="${hospital.hospitalId}">${hospital.hospitalName}</option>
													</s:iterator>
											</select></td>
										</tr>
									</table>
								</div>

								<div class="step-pane" id="step2" style="display: none;">
									<table class="am-table am-table-bordered am-table-hover">
										<s:iterator value="dto.vendorDto.venQualifTypeList"
											status="all" id="venQualifys">
											<tr>
												<input type="hidden" id="${venQualifys.venQualifTypeId}"
													value="${venQualifys.venQualifTypeId}"
													name="dto.vendorDto.venQualificationList.venQualification.venQualifyTypeId" />
												<td class="textLabel" style="width: 10%;"><span
													style='color: red'>*</span>${venQualifys.name}：</td>
												<s:if test="#venQualifys.type=='日期'">
													<td class="textParent">
														<div class="am-input-group am-datepicker-date"
															data-am-datepicker="{format: 'yyyy-mm-dd'}"
															style="width: 70%">
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
														type="text" class="validatebox"
														data-options="required:true"
														name='dto.vendorDto.venQualificationList.venQualification.description' /></td>
												</s:if>
												<s:if test="#venQualifys.type=='图片'">
													<td class="textParent" style="text-align: left;"><input
														id="file_upload${venQualifys.venQualifTypeId}"
														name="upload" type="file" multiple="true"
														style="width: 70%" class="validatebox"
														data-options="required:true">
														<div id="queue${venQualifys.venQualifTypeId}" name="queue"></div>
														<input type="hidden" value=""
														name="dto.vendorDto.venQualificationList.venQualification.venQualificationId"
														id="${venQualifys.venQualifTypeId}" />
														<ul data-am-widget="gallery"
															class="am-gallery am-gallery-imgbordered"
															data-am-gallery="{pureview: 1}"
															id="picType${venQualifys.venQualifTypeId}">
														</ul></td>
												</s:if>
											</tr>
										</s:iterator>
									</table>
								</div>

								<div class="step-pane" id="step3" style="display: none;">
									<div>
										<h3 class="am-text-success am-text-center">
											<span class="am-icon-success"></span>注册成功，等待医院用户审核!请在登录界面查询审核结果
										</h3>
										<a href='javascript:goBack()'>点击回到登录界面!</a>
									</div>
								</div>

							</div>

							<hr>
							<div class="wizard-actions">
								<button class="am-btn" id="prePage" type="button">
									<i class="am-icon-arrow-left"></i>&nbsp;&nbsp;&nbsp;上一步
								</button>
								<button class="am-btn am-btn-success" id="nextPage"
									type="button">
									下一步&nbsp;&nbsp;&nbsp;<i class="am-icon-arrow-right"></i>
								</button>
							</div>
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
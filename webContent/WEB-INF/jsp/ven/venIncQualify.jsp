<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/amaze.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<title>东华电子商务平台(SCI)</title>

</head>
<body>
	<hr>
	<div class="am-g am-container">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">供应商商品基本信息</h3>
		</header>

		<form class="am-form am-form-horizontal">
			<div class="am-panel-bd">
				<table id="subDetails"
					class="am-table am-table-bordered am-table-hover">
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>商品代码:</td>
						<td class="textParent"><input type="text" style="width: 80%;"
							value="<s:property value='dto.venInc.venIncCode'/>"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>商品名称:</td>
						<td class="textParent"><input type="text" style="width: 80%;"
							value="<s:property value='dto.venInc.venIncName' />"></td>
					</tr>
					<tr>
						<td class="textLabel" style="width: 10%;"><span
							style='color: red'>*</span>照片:</td>
						<td class="textParent">
							<ul data-am-widget="gallery"
								class="am-gallery am-avg-sm-4 am-gallery-imgbordered"
								data-am-gallery="{pureview:{target: 'a'}}">
								<s:iterator value="dto.incPics" status="all" id="incPic">
									<li>
										<div class="am-gallery-item">
											<a
												href="<%=request.getContextPath()%>/uploadPic/<s:property value="#incPic.venIncPicPath"/>">
												<img
												src="<%=request.getContextPath()%>/uploadPic/<s:property value="#incPic.venIncPicPath"/>" />
											</a>
										</div>
									</li>
								</s:iterator>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</form>
		</section>
	</div>
	<div class="am-g am-container">
		<section class="am-panel dhcc-panel-mt"> <header
			class="am-panel-hd">
		<h3 class="am-panel-title">商品资质信息</h3>
		</header>
		<form class="am-form am-form-horizontal">
			<div class="am-panel-bd">
				<table id="subDetail"
					class="am-table am-table-bordered am-table-hover">
					<s:iterator value="dto.qualifTypeVOs" status="all"
						id="qualifTypeVO">
						<tr>
							<td class="textLabel" style="width: 10%;">${qualifTypeVO.name}：</td>
							<s:if test="#qualifTypeVO.fieldtype=='日期'">
								<td class="textParent">
									<div class="am-input-group am-datepicker-date"
										data-am-datepicker="{format: 'yyyy-mm-dd'}" style="width: 80%">
										<input type="text" value='${qualifTypeVO.expdate}'
											class="am-form-field" placeholder="选择日期" readonly
											id="expdate"> <span
											class="am-input-group-btn am-datepicker-add-on">
											<button class="am-btn am-btn-default" type="button">
												<span class="am-icon-calendar"></span>
											</button>
										</span>
									</div>
							</s:if>
							<s:if test="#qualifTypeVO.fieldtype=='文本'">
								<td class="textParent"><input style="width: 80%;"
									type="text" value='${qualifTypeVO.description}' /></td>
							</s:if>
							<s:if test="#qualifTypeVO.fieldtype=='图片'">
								<td class="textParent" style="text-align: left;">
									<ul data-am-widget="gallery"
										class="am-gallery am-avg-sm-4 am-gallery-imgbordered"
										data-am-gallery="{pureview:{target: 'a'}}">
										<s:iterator value="incqQualifPics" status="all"
											id="incqQualifPics">
											<li>
												<div class="am-gallery-item">
													<a
														href="<%=request.getContextPath()%>/uploadPic/venIncQualify/<s:property value="#incqQualifPics.picPath"/>">
														<img
														src="<%=request.getContextPath()%>/uploadPic/venIncQualify/<s:property value="#incqQualifPics.picPath"/>" />
														<h3 class="am-gallery-title">
															<s:property value="#incqQualifPics.fileName" />
														</h3>
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
			</div>
		</form>
		</section>
	</div>
	<!-- content end -->
</body>
</html>
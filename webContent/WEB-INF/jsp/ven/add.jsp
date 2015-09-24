<!-- zxx 2014-04-19 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/uploadify.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome-ie7.min.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ven/saveOrUpdate.js"></script>
</head>
<body>
	<!-- 增加界面 -->
	<form id="detail" method="post" >
		<table style="width: 100%;">
			<tr style="display: none">
				<input type="hidden" name="dto.vendor.vendorId" />
			</tr>
			<tr>
				<td class="textLabel">代码:</td>
				<td class="textParent"><input type="text" style="width: 250px;"
					name="dto.vendor.code" /></td>
				<td class="textLabel">名称:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.name" /></td>
			</tr>
			<tr>
				<td class="textLabel">地址:</td>
				<td class="textParent"><input type="text" style="width: 250px;"
					name="dto.vendor.address" /></td>
				<td class="textLabel">传真:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.fax" /></td>
			</tr>
			<tr>
				<td class="textLabel">电话:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.tel"></input></td>
				<td class="textLabel">账号:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.account" /></td>
			</tr>

			<tr>
				<td class="textLabel">联系人:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.contact"></input></td>
				<td class="textLabel">上级供应商:</td>
				<td class="textParent"><input style="width: 250px;" 
					name="dto.vendor.parentId" id="parentId" class="combobox"/></td>
			</tr>
			<tr>
				<td class="textLabel">HIS标识:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.hisId"></input></td>
				<td class="textLabel">别名:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.alias"></input></td>	
			</tr>
			<tr>
				<td class="textLabel">邮箱:</td>
				<td class="textParent"><input style="width: 250px;" type="text"
					name="dto.vendor.email"></input></td>
			</tr>
			<tr>
				<table id="subDetail">
					<s:iterator value="dto.venQualifTypeList" status="all"
						id="venQualifys">

						<tr>
							<input type="hidden" id="${venQualifys.venQualifTypeId}"
								value="${venQualifys.venQualifTypeId}"
								name="dto.venQualificationList.venQualification.venQualifyTypeId" />

							<td class="textLabel">${venQualifys.name}：</td>

							<td class="textParent"><input id="expdate" class="datebox"
								style="width: 200px;" type="text"
								name='dto.venQualificationList.venQualification.expdate' /></td>
							<td class="textParent" style="text-align: left; width: 30%">
								<input id="file_upload${venQualifys.venQualifTypeId}"
								name="upload" type="file" multiple="true" style="width: 100%">
								<div id="queue${venQualifys.venQualifTypeId}" name="queue"></div>
							</td>
						</tr>

					</s:iterator>
				</table>
			</tr>
		</table>
	</form>

	<div style="border-top: 1px solid #DEDEDE; background: #F5F5F5">
		<table cellpadding="0" cellspacing="0" style="width: 100%">
			<tr>
				<td style="text-align: center;"><a id="submitBtn"
					href="javascript:void(0)" class="linkbutton" >保存</a> <a id="cancelBtn"
					href="javascript:void(0)" class="linkbutton" >重置</a></td>
			</tr>
		</table>
	</div>
</body>
</html>

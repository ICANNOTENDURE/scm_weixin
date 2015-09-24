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
<title>东华电子商务平台(SCI)</title>
<link rel="stylesheet"	rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/nur/nurDestination.js"></script>
</head>
<body>
	
	<!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">收获地址维护</strong></div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs">
            <button type="button" class="am-btn am-btn-default" id="addNewDest"><span class="am-icon-plus" ></span> 新增</button>
          </div>
        </div>
      </div>
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover" id="myDestination">
            <thead>
              <tr>
                <th class="table-title">收获地址</th><th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody>
    
          </tbody>
        </table>
        </form>
        </div>
        </div>
        </div>
</body>
</html>
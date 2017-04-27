<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/sys/sysMessageTo.js"></script>
</head>
<body>
<!-- <div class="panel-header" style="width: 1287px;">
 <div class="panel-title">通知管理</div>
 <div class="panel-tool"></div>
 </div> -->

<div id="toolbar" style="height: auto">
      <div  style="margin-bottom:5px;margin-top:5px">
			开始日期:<input type="text"  name="dto.ordStart" class="datebox"  style="width:100px" id="StDate"/>
			结束日期:<input type="text" name="dto.ordEnd" class="datebox" style="width:100px" id="EdDate">
			 <a class="linkbutton"
			data-options="iconCls:'icon-search',plain:true"
			onclick="javascript:selectClick()">查询</a>
			 <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRow()">作废</a> 
	</div>
</div>
<div id="toolbar1" style="height: auto">
      <div  style="margin-bottom:5px;margin-top:5px">
		 <a class="linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="javascript:delRowg()">删除</a> 
		
	</div>
</div>
    
    <div style="height: 300px;">
        <!--这个table用easyui的table   -->
       <table id="datagrid" style="height: 250px" title="通知消息"
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>
    </div>
</div>


<div class="bottom" style="height: 350px;">
    <!-- 这里也是用easyui的datagrid-->
    <table id="datagrid1" style="height: 250px" title="通知对象"
		data-options="toolbar:'#toolbar1',fitColumns:true,singleSelect:true,pagination:true">
	</table>

</body>
</html>

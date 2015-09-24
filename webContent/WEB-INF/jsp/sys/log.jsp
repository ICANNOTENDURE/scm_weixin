<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script>
    $(function(){
    	
    	date=new Date();
    	dateAdd(date,'D',-1);
    	$('#StDate').datetimebox('setValue',date.format("yyyy-MM-dd HH:mm:ss"));
    	$('#EdDate').datetimebox('setValue',new Date().format("yyyy-MM-dd HH:mm:ss"));
    	

    	
    	$("#search").on('click', function() {
   		   	$("#datagrid").datagrid({
   			 	url:$WEB_ROOT_PATH+'/sys/LogCtrl!list.htm',
 		    	queryParams: {
 					'dto.startDate': $("#StDate").datetimebox('getValue'),
 					'dto.endDate': $("#EdDate").datetimebox('getValue'),
 				}
   		 	});
   		
   	    });
    	$("#save").on('click', function() {
    		
   		   	window.location.href="downLoadLogCtrl!downLoadLog.htm?stDate="+$("#StDate").datetimebox('getValue')+"&edDate="+$("#EdDate").datetimebox('getValue');
   		
   	    });
    	
    });
	


    </script>
</head>
<body>
	<div id="toolbar" class="toolbar">
		 时间: <input class="datetimebox" style="width:200px" id="StDate">
		 -<input class="datetimebox" style="width:200px" id="EdDate">
		业务名称:
		<input type="text"/>
		 <a class="linkbutton"
			data-options="iconCls:'icon-search'" id="search">查询</a>
		 <a class="linkbutton"
			data-options="iconCls:'icon-save'" id="save" >另存为</a>	
	</div>


	<table id="datagrid" class="datagrid" data-options="toolbar:'#toolbar',
																		   remoteSort:true,						
			 															   pagination:true,
			 															   title:'日志查询',
			 															   fit:true,
			 															   loadMsg:'加载数据中.....',
			 															   fitColumns:true,
			 															   method:'post',
			 															   nowrap:true,
			 															   striped:true,
			 															   pageSize: 20,
    																	   pageList: [20, 40, 60],
    																	   rownumbers:true,
			 															   ">
			 		<thead>
					<tr>
						<th data-options="field:'opDate',width:70,sortable:true">时间</th>
						<th data-options="field:'opUser',width:50,sortable:true">操作人</th>
						<th data-options="field:'opName',width:90,sortable:true">业务名称</th>
						<th data-options="field:'opIp',width:40,sortable:true">ip</th>
						<th data-options="field:'opType',width:40,sortable:true">类型</th>
						<th data-options="field:'opArg',width:190,sortable:true">参数</th>
						<th data-options="field:'opResult',width:150,sortable:true">操作结果</th>
			 	    </tr>
			 	    </thead>
			 	
			 	</table>
</body>
</html>
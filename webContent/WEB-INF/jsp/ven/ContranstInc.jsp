<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ven/ContranstInc.js"></script>
</head>
<body>



	<table id="datagrid" style="height: 250px" title="医院药品和供应商药品对照" class="datagrid"
		data-options="toolbar:'#toolbar',
		 			 fit:true,
					 fitColumns:true,
					 singleSelect:true,
					 pagination:true,
	    			 iconCls:'icon-edit',
	    			 method:'post',
	    			 rownumbers:true,
	    			 striped:true,
	    			 
	    			 singleselect:true,
	    			 url:'<%=request.getContextPath()%>/ven/venIncCtrl!listContrantInc.htm',
	    			 onClickCell: onClickCell,
	    			 onAfterEdit:function(rowIndex, rowData, changes){
	    			 	//alert(2)
						
					 }
					 ">
					 
		<thead>
			<tr>
				<th data-options="field:'hopincid',hidden:true">IncId ID</th>
				<th data-options="field:'hopname',width:90,sortable:true">医院</th>
				<th data-options="field:'hopincname',width:100,sortable:true">药品名称(医院)</th>
				<th data-options="field:'hopincsysid',width:100,sortable:true">his里rowid(医院)</th>
				<th data-options="field:'venincid',hidden:true">venincid</th>
				<th data-options="field:'venincname',width:80,align:'center',
							editor:{
								type:'combogrid',
								
								options:{
									
								    id:'INC',
								    //toolbar:'#toolbarveninc',
								    fitColumns:true,
								    fit: true,//自动大小  
									pagination : true,
									panelWidth:600,
									idField:'venincid',
									textField:'venincname',
									mode:'remote',
									url:'<%=request.getContextPath()%>/ven/venIncCtrl!listInfo.htm',
									//queryParams:{'dto.incDesc':},
									columns:[[
										{field:'venincid',title:'代码',hidden:true},
										{field:'name',title:'供应商',width:120},
										{field:'venincname',title:'名称',width:140},
										{field:'venincvensysid',title:'供应商系统标识',width:100},
										{field:'manfname',title:'产地',width:113}
									]],
									onSelect:function(rowIndex, rowData) {
                       					fillValue(rowIndex, rowData);
                    				}   
								}
							}">药品名称(供应商)</th>
				<th data-options="field:'venname',width:80,align:'center'">(供应商)</th>
				<th data-options="field:'vensysid',width:90">供应商系统里的Id</th>
				
			</tr>
		</thead>
	</table>
	
	
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
		        医院:<input style="width: 250px;"  class="combobox" type="text" id="hopId" />
		        供应商:<input style="width: 250px;"  class="combobox" type="text" id="vendorId" />
			药品名称: <input id="incName" style="width: 200px;"
			type="text" />
			
			<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		 </div>
	</div>
	<div id="toolbarveninc" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			药品名称: <input id="incName" style="width: 200px;"
			type="text" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchVenInc">查询</a>
		 </div>
	</div>			
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/easyui/themes/dhcc/easyui.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common.js"></script>
<!--  -->
<link href="<%=request.getContextPath()%>/js/easyui/themes/icon.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		date = new Date();
		dateAdd(date, 'D', -7);
		$('#stdate')
				.datetimebox('setValue', date.format("yyyy-MM-dd")+" 00:00:00");
		$('#eddate').datetimebox('setValue',
				new Date().format("yyyy-MM-dd")+" 23:59:59");

		$('#datagrid')
				.datagrid(
						{
							title:'审核订单信息(双击查看订单物流)',
							url : 'orderStateCtrl!listVenOrd.htm',
							iconCls : 'icon-edit',//图标
							method : 'post',
							fit : true,
							fitColumns : true,
							striped : true,
							loadMsg : '加载数据中.....',
							toolbar : '#toolbar',
							checkbox : true,
							pagination : true,
							rownumbers : true,
							pageSize : 20,
							pageList : [ 20, 100, 1000 ],
							queryParams : {
								'dto.state' : $("#querystate").val(),
								"dto.stdate" : $("#stdate").datebox('getValue'),
								"dto.eddate" : $("#eddate").datebox('getValue'),
							},

							detailFormatter : function(index, row) {
								return '<div style="padding:2px"><table class="ddv"></table></div>';
							},
							onDblClickRow: function(rowIndex, rowData){
						    	$('#detail').dialog('open');
						    	$('#detailgrid').datagrid({  
						    	    url:getContextPath()+'/nur/nurseCtrl!listOrderStateById.htm?dto.orderStateDto.exeState.ordId='+rowData.orderid,
						    	    method:'post',
						    	    fit:true,
						    	    loadMsg:'加载数据中.....',
						    	    plain:true,
						    	    fitColumns:true,
						    	    rownumbers:true,
						    	    columns:[[  
						    	  	        {field:'statedesc',title:'状态',width:100},
						    	  	        {field:'exeuser',title:'操作人',width:100},
						    	  	        {field:'exedate',title:'时间',width:100},
						    	  	        {field:'tel',title:'电话',width:150},  
						    	  	        {field:'remark',title:'备注',width:150}
						    	  	]],
						    	});
						
							},

						});

		$("#search").on('click', function() {
			$("#datagrid").datagrid('load', {
				"dto.stdate" : $("#stdate").datebox('getValue'),
				"dto.eddate" : $("#eddate").datebox('getValue'),
				"dto.state" : $("#querystate").val(),
				"dto.recLoc" : $("#recloc").combobox('getValue')
			});

		});

		$('#recloc')
				.combobox(
						{
							url : getContextPath()
									+ '/hop/hopCtlocCtrl!findHopLocComboxVos.htm?dto.type=2',
							valueField : 'id',
							textField : 'name'
						});


	});

	
	function RetClick(obj){
		var rows=$("#datagrid").datagrid('getSelections');
		if (rows.length ==0) {
			$.messager.alert('警告','请先选择');    
			return;
		}
		var ordStr=[];
		for(var i=0;i<rows.length;i++){
			ordStr.push(rows[i].orderid);
		}
		if(ordStr.length==0){
			$.messager.alert('警告','没有可操作的数据');    
			return;
		}
		type=$(obj).attr("data-type");
		var state;
		var title="";
		var content="审核意见";
		if(type=="yes"){
			title="审核通过";
		}else{
			title="拒绝通过";
		}
		$.messager.prompt(title,content,function(r){   
		    	$.post(getContextPath() + '/nur/nurseCtrl!hopAuditOrder.htm', {
					"dto.orderIdStr" : ordStr,
					"dto.ordState":$("#querystate").val(),
					"dto.remark":r,
					"dto.type":type
				}, function(data) {
					if (data.resultCode == "1") {
						$('#datagrid').datagrid('load');
						$.messager.alert("提示","操作成功");
					} else {
						$.messager.alert("错误",data.resultContent);
					}
				}, 'json');  
		}); 
	
		
	}
</script>
</head>
<body>

	<input type="hidden" value="${dto.state}" id="querystate"/>
	<table id="datagrid">
		<thead>
			<tr>
				<th data-options="field:'select',checkbox:true">选择</th>
				<th data-options="field:'orderid',hidden:true"></th>
				<th data-options="field:'orderno'">单号</th>
				<th data-options="field:'orderid',hidden:true">名称</th>
				<th data-options="field:'veninccode'">代码</th>
				<th data-options="field:'venincname'">名称</th>
				<th data-options="field:'venqty'">数量</th>
				<th data-options="field:'uom'">单位</th>
				<th data-options="field:'statedesc'">状态</th>
				<th data-options="field:'recloc'">收货科室</th>
				<th data-options="field:'destination'">收货地址</th>
				<th data-options="field:'realname'">订单人</th>
				<th data-options="field:'orderdate'">订单日期</th>
				<th data-options="field:'hopname'">医院</th>
			</tr>
		</thead>
	</table>




	<div id="toolbar" style="height: auto">
		<div style="margin-bottom: 5px; margin-top: 5px">
			订单开始日期: <input class="datetimebox" style="width: 150px" id="stdate">
			结束日期: <input class="datetimebox" style="width:150px" id="eddate">
			收货科室: <input class="combobox"
				panelHeight="auto" style="width: 150px" id="recloc" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="search">查询</a>
		</div>
		<div>
			<a
				 class="linkbutton" onclick="javascript:RetClick(this)"
				data-options="iconCls:'icon-save',plain:true" data-type="yes">审核通过</a>	
			 <a
				 class="linkbutton" onclick="javascript:RetClick(this)"
				data-options="iconCls:'icon-save',plain:true" data-type="no">审核拒绝</a>				
		</div>
	</div>
 	
 	<div id="detail" class="dialog" title="订单明细"
		data-options="modal:true,width:700,height:350,closed:true,maximizable:true"
		style="vertical-align: middle">
		<table id="detailgrid" style="width: 100%"/>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>
 $(function(){
	 
	 $('#datagrid').datagrid({
		 onDblClickRow: function(rowIndex, rowData){		 
			var row =$("#datagrid").datagrid('getSelected');			
		    $('#detail').dialog('open');
		    $('#detailgrid').datagrid({  
	    	    url:$WEB_ROOT_PATH+'/ven/vendorCtrl!listVendorHistory.htm?dto.vendor.vendorId='+row.vendorid,
	    	    method:'post',
	    	    fit:true,
	    	    loadMsg:'加载数据中.....',
	    	    pagination:true,
	    	    fitColumns:true,
	    	    rownumbers:true,
	    	    columns:[[ 
						{field:'name',title:'供应商',width:60,sortable:true}, 
	    	            {field:'loguserid',title:'审核人',width:60,},  	
	    	  	        {field:'logdate',title:'审核时间',width:100,},
	    	  	        {field:'logresult',title:'审核结果',width:60,},
	    	  	        {field:'logip',title:'审核IP',width:100,},
	    	  	]],
	    	  	
		    });   
		    }
		    });
	

 $.extend($.fn.datagrid.methods, {
	 editCell: function(jq,param){
		 return jq.each(function(){
		 opts = $(this).datagrid('options');
		 var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
		 for(var i=0; i<fields.length; i++){
			 var col = $(this).datagrid('getColumnOption', fields[i]);
			 col.editor1 = col.editor;
			 if (fields[i] != param.field){
				 col.editor = null;
			 }
		 }
		 $(this).datagrid('beginEdit', param.index);
		 	for(var i=0; i<fields.length; i++){
		 		var col = $(this).datagrid('getColumnOption', fields[i]);
		 		col.editor = col.editor1;
		 	}
		 });
	 }
 });
 
 })
//审批资质
function AuditT(value,row,index){
		if(row.auditflag=="N"){
				return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-undo l-btn-icon-left"></span>取消拒绝</span></a>';
			}else{
				if(row.auditflag=="Y"){
					return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-no l-btn-icon-left"></span>拒绝</span></a>';
				}else{
					return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-ok l-btn-icon-left"></span>审批</span></a>';
				}
				
			}
		
	};
 function UpdAudit(row){
//	    vendorid=$('#datagrid').datagrid('getRows')[row]['vendorid'];
	    hopvendorid=$('#datagrid').datagrid('getRows')[row]['hopvendorid']; //主键
		$.post(
			$WEB_ROOT_PATH+'/hop/hopVendorCtrl!hopAuditFLag.htm',
			{
//				'dto.hopVendor.hopVenId': vendorid,
				'dto.hopVendor.hopVendorId': hopvendorid,
			},
			function(data){
//				if(data.resultCode=="1"){
				if(data.dto.opFlg=="1"){					
					$CommonUI.alert("操作成功!");
					$CommonUI.getDataGrid('#datagrid').datagrid('reload');
				}else{
					
//				    if(data.dto.opFlg=="0"){
//				    	$CommonUI.alert("您不具备权限!");				    	
//				    }else{
					$CommonUI.alert("操作失败!");				
//					$CommonUI.alert("操作失败!"+data.resultContent);
//				    }
				    
				}
			},
			"json"
		);
	}
 
 
 $(function(){
 	
 	$("#searchVen").on('click', function() {
 		$CommonUI.getDataGrid('#datagrid').datagrid({  
 		    url:$WEB_ROOT_PATH+'/ven/vendorCtrl!listVendor.htm',
 		    queryParams: {
 		    	'dto.vendor.name': $("#venName").val(),
 		    	'dto.inputStr': $("#venInputStr").val(),
 		    	'dto.vendor.alias': $("#venAlias").val(),
 		    	'dto.auditFlag':$("#auditFlag").combobox('getValue'),
 			}
			});
		});
 	 	
 	$("#queryHistory").on('click', function() {
 		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
 			$CommonUI.alert('请选一个供应商');
 			return;
 		}
 		var row =$("#datagrid").datagrid('getSelected');
		$('#detail').dialog('open');
	    $('#detailgrid').datagrid({  
	    	url:$WEB_ROOT_PATH+'/ven/vendorCtrl!listVendorHistory.htm?dto.vendor.vendorId='+row.vendorid,
	    	    method:'post',
	    	    fit:true,
	    	    loadMsg:'加载数据中.....',
	    	    pagination:true,
	    	    fitColumns:true,
	    	    rownumbers:true,
	    	    columns:[[ 
						{field:'name',title:'供应商',width:60,sortable:true}, 
	    	            {field:'loguserid',title:'审核人',width:60,},  	
	    	  	        {field:'logdate',title:'审核时间',width:100,},
	    	  	        {field:'logresult',title:'审核结果',width:60,},
	    	  	        {field:'logip',title:'审核IP',width:100,},
	    	  	]],  
	    	  	
		    });   
 	});
 	
 	$("#queryZiZhi").on('click', function() {
 		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
 			$CommonUI.alert('请选一个供应商');
 			return;
 		}
 		var row =$("#datagrid").datagrid('getSelected');
 		window.open($WEB_ROOT_PATH+'/nur/nurseCtrl!auditResult.htm?dto.vendorDto.vendor.vendorId='+row.vendorid);	
 	});
 	
	$("#queryTimeLine").on('click', function() {
		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
 		    $CommonUI.alert('请选一个供应商');
 			return;
 		}
 		var row =$("#datagrid").datagrid('getSelected');
			window.open($WEB_ROOT_PATH+'/hop/hopVendorCtrl!HistoryDetail.htm?venodrId='+row.vendorid);
			
		});
 });
 var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true;};
		if ($('#datagrid').datagrid('validateRow', editIndex)){
			$('#datagrid').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index, field){
		if (endEditing()){
			$('#datagrid').datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});
			editIndex = index;
		}
	}
    </script>
</head>
<body >
    <div id="detail" class="dialog" title="审核历史"
		             data-options="modal:true,width:500,height:240,closed:true,maximizable:true"
					 style="vertical-align: middle">
		             <table id="detailgrid" ></table>
	            </div>
	                        
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			名称: <input id="venName" style="width: 100px;"
			type="text" />
			
			别名: <input id="venAlias" style="width: 100px;"
			type="text" />
			审核状态:
			<select class="combobox" panelHeight="auto" style="width:105px" id="auditFlag">
			    <option value="3">未审核</option>
				<option value="0">空</option>
				<option value="1">已审核</option>
				<option value="2">审核不通过</option>	
			</select>
			
			邮箱/注册名/工商执照号: <input id="venInputStr" style="width: 200px;"
			type="text" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchVen">查询</a>
			<br>
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryZiZhi">查看供应商资质</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryTimeLine">查看供应商时间轴</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryHistory">查看供应商审核历史</a>
		
		 </div>
	</div>	
    
  <div class="layout" data-options="fit:'true',border:true">
        
        <div data-options="region:'center',title:'医院审核供应商',iconCls:'icon-ok'" >
            <table id="datagrid" style="height: 250px" class="datagrid"
					data-options="toolbar:'#toolbar',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 pageSize:15,
	    						 pageList:[15,30,45],
	    						 
								 ">
								 
					<thead>
						<tr>
							<th data-options="field:'vendorid',hidden:true" width="1/13">IncId ID</th>
							<th data-options="field:'code',sortable:true" width="1/13">代码</th>
							<th data-options="field:'name',sortable:true" width="1/13">供应商</th>
							<th data-options="field:'taxation',sortable:true" width="1/13">工商执照号</th>
							<th data-options="field:'email',sortable:true" width="1/13">邮箱</th>
							<th data-options="field:'contact',sortable:true" width="1/13">联系人</th>
							<th data-options="field:'account',sortable:true" width="1/13">注册帐号</th>
							<th data-options="field:'tel',sortable:true" width="1/13">电话</th>
							<th data-options="field:'fax',sortable:true" width="1/13">传真</th>
							<th data-options="field:'address',sortable:true" width="1/13">联系地址</th>	
                        	<th data-options="field:'hopvendorid',hidden:true" width="1/13">HopVendorId ID</th>
							<th data-options="field:'auditflag',formatter:AuditT,sortable:true" width="1/13">资质</th>	
						</tr>
					</thead>
				</table>			
        </div>
    </div>  
   
</div> 
</body>
</html>
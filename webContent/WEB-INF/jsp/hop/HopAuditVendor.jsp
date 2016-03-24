<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>

 $(function(){
 	
 	$("#searchVen").on('click', function() {
 		$CommonUI.getDataGrid('#datagrid').datagrid({  
 		    url:$WEB_ROOT_PATH+'/ven/vendorCtrl!listVendor.htm',
 		    queryParams: {
 		    	'dto.vendor.name': $("#venName").val(),
 		    	'dto.inputStr': $("#venInputStr").val(),
 		    	'dto.vendor.alias': $("#venAlias").val(),
 		    	'dto.auditFlag':$("#venAuditFlag").combobox('getValue'),
 			}
			});
		});
 	
 	$("#queryAudit").on('click', function() {
 		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
 			$CommonUI.alert('请选一个供应商');
 			return;
 		}
 		var row =$("#datagrid").datagrid('getSelected');
        var vendorId=row.vendorid;
 		$.post(
 				$WEB_ROOT_PATH+'/hop/hopVendorCtrl!hopAuditFLag.htm',
 				{
 					'dto.hopVendor.hopVenId': vendorId,
 				},
 				function(data){
 					if(data.dto.opFlg=="1"){
 						$CommonUI.alert("操作成功!");

 					}
 				},
 				"json"
 			);
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
    </script>

</head>
<body >
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			名称: <input id="venName" style="width: 100px;"
			type="text" />
			
			别名: <input id="venAlias" style="width: 100px;"
			type="text" />
			审核状态:
			<select class="combobox" panelHeight="auto" style="width:105px" id="venAuditFlag">
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
			<a href="#" class="linkbutton" iconCls="icon-save" id="queryAudit">审核通过</a>
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
							<th data-options="field:'vendorid',hidden:true" width="10%">IncId ID</th>
							<th data-options="field:'code',sortable:true" width="10%">代码</th>
							<th data-options="field:'name',sortable:true" width="10%">供应商</th>
							<th data-options="field:'taxation',sortable:true" width="10%">工商执照号</th>
							<th data-options="field:'email',sortable:true" width="10%">邮箱</th>
							<th data-options="field:'contact',sortable:true" width="10%">联系人</th>
							<th data-options="field:'account',sortable:true" width="10%">注册帐号</th>
							<th data-options="field:'tel',sortable:true" width="10%">电话</th>
							<th data-options="field:'fax',sortable:true" width="10%">传真</th>
							<th data-options="field:'address',sortable:true" width="10%">联系地址</th>
							
						</tr>
					</thead>
				</table>
        </div>
    </div>  
   
</div> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
 <script>

	function AuditT(value,row,index){
		if(row.hopauditflag=="Y"){
			return '<a  class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+');" ><span class="l-btn-left"><span class="l-btn-text icon-undo l-btn-icon-left">取消审核</span></span></a>';
		}else{
			return '<a  class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+');" ><span class="l-btn-left"><span class="l-btn-text icon-ok l-btn-icon-left">审核通过</span></span></a>';
			
		}
	};
//	function UpdAudit(row){
//		hopvenid=$('#datagrid2').datagrid('getRows')[row]['hopvenid'];
//		hopAuditFlag=$('#datagrid2').datagrid('getRows')[row]['hopauditflag'];
//		$.post(
//			$WEB_ROOT_PATH+'/hop/hopVendorCtrl!auditFLag.htm',
//			{
//				'dto.hopVendor.hopVendorId': hopvenid,
//				'dto.hopVendor.hopAuditFlag': hopAuditFlag,
//			},
//			function(data){
//				if(data.dto.opFlg=="1"){
//					$CommonUI.alert("操作成功!");
//					$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
//				}
//			},
//			"json"
//		);
//	}
 function ConT(value,row,index){
		if(row.venid==null){
			return '<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:ConTra('+row.hopvenid+')" data-options="iconCls:"icon-save"><span class="l-btn-left"><span class="l-btn-text icon-save l-btn-icon-left">对照</span></span></a>';
		}else{
			return '<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:deleteTra('+row.hopvenid+')" data-options="iconCls:"icon-remove"><span class="l-btn-left"><span class="l-btn-text icon-remove l-btn-icon-left">删除</span></span></a>';
			
		}
	};
	
//	function deleteTra(hopvenid){
//		$.post(
//				$WEB_ROOT_PATH+'/hop/hopVendorCtrl!contranstVendor.htm',
//				{
//					'dto.hopVendor.hopVendorId': hopvenid,
//					'dto.hopVendor.hopVenId': null,
//				},
//				function(data){
//					if(data.dto.opFlg=="1"){
//						//$CommonUI.autoCloseRightBottomMessage("("+row.name+")"+row.name+"对照成功","消息",3000,'slide');
//						$CommonUI.alert("删除对照成功!");
//						$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
//					}
//				},
//				"json"
//		);
//	}
 $(function(){
 	$CommonUI.getDataGrid('#datagrid').datagrid({
 		onDblClickRow: function(rowIndex, rowData){
 			$CommonUI.getDataGrid('#datagrid2').datagrid({
 				url:$WEB_ROOT_PATH+'/hop/hopVendorCtrl!listHopCon.htm',
     		    queryParams: {
     		    	'dto.hopVendor.hopVenId': rowData.vendorid,
     			}
 			});
 		},
 		onClickCell:function(rowIndex, field, value){
 			if(field=="code"){
 				window.open($WEB_ROOT_PATH+'/hop/hopVendorCtrl!HistoryDetail.htm?venodrId='+$('#datagrid').datagrid('getRows')[rowIndex]['vendorid'])
 			}
 		}

 	});
 	
 	$CommonUI.getComboBox("hop").combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName'
		});
 	$("#searchVen").on('click', function() {
 		$CommonUI.getDataGrid('#datagrid').datagrid({  
 		    url:$WEB_ROOT_PATH+'/ven/vendorCtrl!listVendor1.htm',
 		    queryParams: {
 		    	'dto.vendor.name': $("#venName").val(),
 		    	'dto.inputStr': $("#venInputStr").val(),
 		    	'dto.vendor.alias': $("#venAlias").val(),
 		    	'dto.auditFlag':$("#venAuditFlag").combobox('getValue'),
 			}

		 	});
		});
 	
 	//$("#searcHop").on('click', function() {
 	//	$CommonUI.getDataGrid('#datagrid2').datagrid({  
 	//	    url:$WEB_ROOT_PATH+'/hop/hopVendorCtrl!listHopCon.htm',
 	//	    queryParams: {
 	//	    	'dto.hopVendor.hopCode': $("#HopCode").val(),
 	//	    	'dto.hopVendor.hopName': $("#HopName").val(),
 	//	    	'dto.hopVendor.hopAlias': $("#HopAlias").val(),
 	//	    	'dto.flag':$("#flag").combobox('getValue'),
 	//	    	'dto.auditFlag':$("#auditFlag").combobox('getValue'),
 	//	    	'dto.hopVendor.hopHopId': $("#hop").combobox('getValue'),
 	//		}
	//		});
	//	});
 	
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
				<option value="0">空</option>
				<option value="1">已审核</option>
				<option value="2">审核不通过</option>
				<option value="3">未审核</option>
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
            <table id="datagrid" style="height: 250px;width: 100%;"  style="width: 100%;" class="datagrid"
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
							<th data-options="field:'vendorid',hidden:true">IncId ID</th>
							<th data-options="field:'code',sortable:true">代码</th>
							<th data-options="field:'name',sortable:true">供应商</th>
							<th data-options="field:'taxation',sortable:true">工商执照号</th>
							<th data-options="field:'email',sortable:true">邮箱</th>
							<th data-options="field:'contact',sortable:true">联系人</th>
							<th data-options="field:'account',sortable:true">注册帐号</th>
							<th data-options="field:'tel',sortable:true">电话</th>
							<th data-options="field:'fax',sortable:true">传真</th>
							<th data-options="field:'address',sortable:true">联系地址</th>
						</tr>
					</thead>
				</table>
        </div>
    </div>  
   
</div> 
</body>
</html>
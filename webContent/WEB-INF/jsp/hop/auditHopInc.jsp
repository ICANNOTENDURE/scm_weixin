<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>

</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/lightbox.jsp"%>
 <script>
    $(function(){
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
    	 
    	 
    	$('#ven').combobox({
	    	url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm",
	    	panelHeight:"auto",
	        valueField:'vendorId',  
	        textField:'name',
	        mode: 'remote',
	    }); 

    	$("#venIncQualify").on('click',function(){
    		if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
    			$CommonUI.alert('请选一个商品');
    			return;
    		}
    		var row =$("#datagrid2").datagrid('getSelected');
    		window.open($WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl!venIncQualify.htm?dto.venIncId='+row.venincid);	
    	});
    	$("#searchInc").on('click', function() {
    		$CommonUI.getDataGrid('#datagrid2').datagrid({  
    		    url:$WEB_ROOT_PATH+'/ven/venIncCtrl!listVenContranst.htm',
    		    queryParams: {
    		    	'dto.venIncContranstDto.hopIncName': $("#incHopName").val(),
    		    	'dto.venIncContranstDto.hopIncCode': $("#incHopCode").val(),
    		    	'dto.venInc.comgridparam': $("#incHopAlias").val(),
    		    	'dto.venInc.venIncVenid': $("#ven").combobox('getValue'),
    		    	'dto.venIncContranstDto.flag': 1,
    		    	'dto.venIncContranstDto.auditflag': $("#auditFlag").combobox('getValue')
    			}

   		 	});
   		});

    	
    	$('#incHopName').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchInc").click();
    		} 
    	});
    	$('#incHopCode').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchInc").click();
    		} 
    	}); 
    	$('#incHopAlias').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchInc").click();
    		} 
    	});
    	
    
    	$("#auditFlag").combobox('setValue',1);
    	
    	
    });
    function onLoadSuccess(){
    	$('.dhc-light').lightBox({ fixedNavigation: true });
    }
    function ConT(value,row,index){
		return '<a class="dhc-linkbutton l-btn l-btn-plain" data-options="iconCls:icon-edit" onclick="javascript:updateConTra('+index+')" title="保存"><span class="l-btn-left"><span class="l-btn-text icon-edit l-btn-icon-left"></span>保存</span></a>';
	};
	function viewPic(value,row,index){
		$.getJSON($WEB_ROOT_PATH+"/sys/sysQualifTypeCtrl!getVenIncQualify.htm?dto.venIncId="+row.venincid, function(data){
				html="";  
				$.each(data, function(i,item){
				   		if(item.code=='CGHTH'){

					   		html=html+item.description;
				   		}
				   		if(item.code=='CGHTZP'){
					   		 $.each(item.incqQualifPics, function(j,pic){
						   			html=html+"'<a href="+$WEB_ROOT_PATH+"/uploadPic/venIncQualify/"+pic.picPath +"' >";
						   			html=html+"<img src=''../js/easyui/themes/icons/search.png' > </a>";
						   			html=html+"</a>";
								  });
				   		}
				  });
				 alert(html)
				 return html;
		});
}
	//保存对照
	function ConTra(venincid,fac){
		
		if ($CommonUI.getDataGrid("#datagrid").datagrid('getSelections').length != 1) {
			$CommonUI.alert('请选一个医院药品对照');
			return;
		}

		var hopIncrow =$("#datagrid").datagrid('getSelected');
		var hopincid=hopIncrow.hopincid;
		$('#datagrid2').datagrid('endEdit',editIndex);
		var row =$("#datagrid2").datagrid('getSelected');
		
		//var fac=row.fac;
		venfac=row.venfac;
		hopfac=row.hopfac;
		if(parseInt(venfac)<1){
			$CommonUI.alert("请填写分子!");
			return;
		}
		if(parseInt(hopfac)<1){
			$CommonUI.alert("请填写分母!");
			return;
		}
		$.post(
			$WEB_ROOT_PATH+'/ven/venIncCtrl!saveContranstInc.htm',
			{
				'dto.venHopInc.hopIncId': hopincid,
				'dto.venHopInc.venIncId': venincid,
				//'dto.venHopInc.venIncFac': fac,
				'dto.venHopInc.venFac': venfac,
				'dto.venHopInc.hopFac': hopfac,
			},
			function(data){
				if(data.dto.opFlg=="1"){
					$CommonUI.alert("对照成功!");
					$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
				}
			},
			"json"
		);
	}
	//保存对照
	function updateConTra(row){

		
		$('#datagrid2').datagrid('endEdit', row);
		facid=$('#datagrid2').datagrid('getRows')[row]['facid'];
		venfac=$('#datagrid2').datagrid('getRows')[row]['venfac'];
		hopfac=$('#datagrid2').datagrid('getRows')[row]['hopfac'];
		
		$.post(
			$WEB_ROOT_PATH+'/ven/venIncCtrl!updateContranstInc.htm',
			{
				'dto.venHopInc.venHopIncId': facid,
				'dto.venHopInc.venFac': venfac,
				'dto.venHopInc.hopFac': hopfac,
			},
			function(data){
				if(data.dto.opFlg=="1"){
					$CommonUI.alert(",修改对照成功!");
					$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
				}
			},
			"json"
		);
	}
	//删除对照
	function deleteTra(row){
		venHopIncId=$('#datagrid2').datagrid('getRows')[row]['facid'];
		$.post(
				$WEB_ROOT_PATH+'/ven/venIncCtrl!deleteContranstInc.htm',
				{
					'dto.venHopInc.venHopIncId': venHopIncId,
				},
				function(data){
					if(data.resultCode=="1"){
						$CommonUI.alert("删除对照成功!");
						$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
					}else{
						$CommonUI.alert("操作失败!"+data.resultContent);
					}
				},
				"json"
		);
	}
	//审批资质
	function AuditT(value,row,index){
		if(row.facid==null){
		}else{
			if(row.auditflag=="N"){
				return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-undo l-btn-icon-left"></span>取消拒绝</span></a>';
			}else{
				if(row.auditflag=="Y"){
					return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-no l-btn-icon-left"></span>拒绝</span></a>';
				}else{
					return '<a class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:UpdAudit('+index+')" ><span class="l-btn-left"><span class="l-btn-text icon-ok l-btn-icon-left"></span>审批</span></a>';
				}
				
			}
		}
	};
	function UpdAudit(row){
		venHopIncId=$('#datagrid2').datagrid('getRows')[row]['facid'];
		if(venHopIncId==null){
			$CommonUI.alert("请先维护转换关系!");
			return;
		}
		$.post(
				$WEB_ROOT_PATH+'/ven/venIncCtrl!updateAudit.htm',
				{
					'dto.venHopInc.venHopIncId': venHopIncId,
				},
				function(data){
					if(data.resultCode=="1"){
						$CommonUI.alert("操作成功!");
						$CommonUI.getDataGrid('#datagrid2').datagrid('reload');
					}else{
						$CommonUI.alert("操作失败!"+data.resultContent);
					}
				},
				"json"
		);
	}
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true;};
		if ($('#datagrid2').datagrid('validateRow', editIndex)){
			$('#datagrid2').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index, field){
		if (endEditing()){
			$('#datagrid2').datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});
			editIndex = index;
		}
	}
    </script>

</head>
<body >

    <div id="toolbar2" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			商品名称: <input id="incHopName" style="width: 100px;"
			type="text" />
			商品代码: <input id="incHopCode" style="width: 100px;"
			type="text" />
			别名: <input id="incHopAlias" style="width: 100px;"
			type="text" />
			审批状态:
			<select class="combobox" panelHeight="auto" style="width:100px" id="auditFlag">
				<option value="0">空</option>
				<option value="1">未审批</option>
				<option value="2">审批通过</option>
				<option value="3">审批拒绝</option>
			</select>
			</div>
			<div style="margin-bottom:5px;margin-top:5px">

			供应商:<input style="width: 200px;"
						class="combobox" type="text" 
						 id="ven" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchInc" >查询</a>
			<a href="#" class="linkbutton" iconCls="icon-search" id="venIncQualify" >商品资质</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="pass" >通过</a>
			<a href="#" class="linkbutton" iconCls="icon-cancel" id="refuse" >拒绝</a>
		     <span style="color: red;font-size: 20px">注意(比如供应商单位盒(7),医院单位支,那分子就是7，分母是1)</span>
		 </div>
		
	</div>

        	<table id="datagrid2" style="height: 250px"  class="datagrid"
					data-options="toolbar:'#toolbar2',
					 			 fit:true,
								 fitColumns:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 onClickCell:onClickCell,
				    			 title:'医院审核供应商商品',
				    			 iconCls:'icon-ok',
				    			 nowrap: false,
				    			 onLoadSuccess:onLoadSuccess
								 ">
								 
					<thead>
						<tr>
							<th data-options="checkbox:true">IncId ID</th>
							
							<th data-options="field:'venname',width:50,sortable:true">供应商</th>
							<th data-options="field:'venincname',width:100,sortable:true">商品名称</th>
							<th data-options="field:'cghth',width:50,sortable:true,formatter:viewPic">采购合同号</th>
							<th data-options="field:'cghth1',width:50,sortable:true">产品注册证</th>
							<th data-options="field:'cghth2',width:50,sortable:true">消毒合格证</th>
							<th data-options="field:'hoprp',width:20,sortable:true">价格</th>
							<th data-options="field:'spec',width:30,sortable:true">规格</th>
							<th data-options="field:'uom',width:20,sortable:true">单位</th>
							<th data-options="field:'venfac',width:20,sortable:true,editor : {
								type : 'numberbox',
                            	options : {
                                	required : true
                            	}
                        	}">分子</th>
                        	<th data-options="field:'hopfac',width:20,sortable:true,editor : {
								type : 'numberbox',
                            	options : {
                                	required : true
                            	}
                        	}">分母</th>
							<th data-options="field:'hopincuom',width:50,sortable:true">医院单位</th>
							<th data-options="field:'contranst',width:40,formatter:ConT">对照</th>
							<th data-options="field:'auditFlag',width:40,formatter:AuditT">资质</th>
							
							<th data-options="field:'hopinccode',width:60,sortable:true,hidden:true">医院商品代码</th>
							<th data-options="field:'hopincname',width:100,sortable:true,hidden:true">医院商品名称</th>
							<th data-options="field:'manf',width:80,sortable:true,hidden:true">产地</th>
							<th data-options="field:'facid',width:40,hidden:true">对照表rowID</th>
							<th data-options="field:'venincid',hidden:true">venincid</th>
							<th data-options="field:'hopincid',hidden:true">hopincid</th>
						</tr>
					</thead>
				</table>


</body>
</html>

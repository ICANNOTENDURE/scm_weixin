<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>

</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>
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
    	 

     	$("#hop").combobox({
 			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
 			valueField:'hospitalId',							
 			textField:'hospitalName'
 		});
     	
     	$("#conByCodeBTN").on('click', function() {
     		ven=$("#ven").combobox('getValue');
    		if(ven==""){
    			$CommonUI.alert("请选择供应商!");
    			return;
    		}
    		$.post(
    				$WEB_ROOT_PATH+'/hop/hopIncCtrl!autoConByIncCode.htm',
    				{
    					'dto.venId': ven,
    				},
    				function(data){
    					$CommonUI.alert("对照成功："+data+"条数据。");
    				},
    				"json"
    			);
   		});
     	$("#conIncByBarCode").on('click', function() {
    		hopid=$("#hop").combobox('getValue');
    		if(hopid==""){
    			$CommonUI.alert("请选择医院!");
    			return;
    		}
    		$.post(
    				$WEB_ROOT_PATH+'/ven/venIncCtrl!autoConIncByBarCode.htm',
    				{
    					'dto.venIncContranstDto.hopId': hopid,
    				},
    				function(data){
    					$CommonUI.alert("对照成功："+data.resultContent+"条数据。");
    				},
    				"json"
    			);
   		});
    	$('#ven').combobox({
	    	url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm",
	    	panelHeight:"auto",
	        valueField:'vendorId',  
	        textField:'name',
	        mode: 'remote',
	    }); 
    	$("#searchHopInc").on('click', function() {
    		$CommonUI.getDataGrid('#datagrid').datagrid({  
    		    url:$WEB_ROOT_PATH+'/ven/venIncCtrl!listContrantInc.htm',
    		    queryParams: {
    		    	'dto.venIncContranstDto.incName': $("#incHopName").val(),
    		    	'dto.venIncContranstDto.incCode': $("#incHopCode").val(),
    		    	'dto.venIncContranstDto.flag': $("#hopFlag").combobox('getValue'),
    		    	'dto.venInc.venIncAlias': $("#incHopAlias").val(),
    		    	'dto.venIncContranstDto.hopId': $("#hop").combobox('getValue'),
    			}

   		 	});
   		});
    	$("#venIncQualify").on('click',function(){
    		if ($CommonUI.getDataGrid("#datagrid2").datagrid('getSelections').length != 1) {
    			$CommonUI.alert('请选一个商品');
    			return;
    		}
    		var row =$("#datagrid2").datagrid('getSelected');
    		window.open($WEB_ROOT_PATH+'/sys/sysQualifTypeCtrl!venIncQualify.htm?dto.venIncId='+row.venincid);	
    	});
    	$("#searchVenInc").on('click', function() {
    		$CommonUI.getDataGrid('#datagrid2').datagrid({  
    		    url:$WEB_ROOT_PATH+'/ven/venIncCtrl!listVenContranst.htm',
    		    queryParams: {
    		    	'dto.venIncContranstDto.incName': $("#incVenName").val(),
    		    	'dto.venIncContranstDto.incCode': $("#incVenCode").val(),
    		    	'dto.venInc.venIncAlias': $("#incVenAlias").val(),
    		    	'dto.venInc.venIncVenid': $("#ven").combobox('getValue'),
    		    	'dto.venIncContranstDto.flag': $("#venFlag").combobox('getValue'),
    		    	'dto.venIncContranstDto.auditflag': $("#auditFlag").combobox('getValue')
    			}

   		 	});
   		});
    	
    	$CommonUI.getDataGrid('#datagrid').datagrid({
    		onDblClickRow: function(rowIndex, rowData){
    			$CommonUI.getDataGrid('#datagrid2').datagrid({
    				url:$WEB_ROOT_PATH+'/ven/venIncCtrl!listVenContranst.htm',
        		    queryParams: {
        		    	'dto.venHopInc.hopIncId': rowData.hopincid,
        			}
    			});
    			$("#venFlag").combobox('setValue',1);
    		}

    	});
    	
    	$('#incVenName').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchVenInc").click();
    		} 
    	});
    	$('#incVenCode').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchVenInc").click();
    		} 
    	}); 
    	$('#incVenAlias').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchVenInc").click();
    		} 
    	});
    	
    	$('#incHopName').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchHopInc").click();
    		} 
    	});
    	
    	$('#incHopCode').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchHopInc").click();
    		} 
    	});
    	
    	$('#incHopAlias').keydown(function(e){ 
    		if(e.keyCode==13){ 
    			$("#searchHopInc").click();
    		} 
    	});
    	
    	
    	
    	$("#importBTN").on('click', function() {
    		$('#importDialog').dialog('open');
    		$("#import").uploadify({
    	        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
    	        'uploader': $WEB_ROOT_PATH + '/ven/venIncCtrl!uploadConAndroid.htm',
    	        //在浏览窗口底部的文件类型下拉菜单中显示的文本
    	        'buttonText':'Upload',
    	        'fileTypeDesc': '支持的格式：',
    	        'fileTypeExts': '*.xls',
    	        'fileSizeLimit': '300MB',
    	        'width': '60',
    	        'height': '20',
    	        'debug' : false,
    	        'fileObjName':'dto.upload',
    	        'auto': true,
    	        'removeCompleted':true,
    	        //上传成功
    	        'onSelect': function(){  
    	        	$("#gg").dialog("open");
    	        	$("#err").html("");
    	        }, 
    	        'onUploadSuccess':function(file, data, response){
    	        	$("#gg").dialog("close");
    	        	var obj=eval('('+data+')');
    	        	if(obj.opFlg=="0"){
    	        		$CommonUI.alert("导入成功");
    	        		$("#err").html(obj.msg);
    	        	}else{
    	        		$CommonUI.alert("导入失败");
    	        		$("#err").html(obj.msg);
    	        	};
    	        },
    	        //检测FLASH失败调用
    	        'onFallback': function() {
    	        	$("#gg").dialog("close");
    	            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
    	        },
    	        //返回一个错误，选择文件的时候触发
    	        'onSelectError': function(file, errorCode, errorMsg) {
    	        	$("#gg").dialog("close");
    	            switch (errorCode) {
    	            case - 100 : alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
    	                break;
    	            case - 110 : alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
    	                break;
    	            case - 120 : alert("文件 [" + file.name + "] 大小异常！");
    	                break;
    	            case - 130 : alert("文件 [" + file.name + "] 类型不正确！");
    	                break;
    	            }
    	        }
    	    });
   		});
    });
    function ConT(value,row,index){
		if(row.facid==null){
			str='<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:ConTra('+row.venincid+','+row.fac+')" data-options="iconCls:"icon-save"><span class="l-btn-left"><span class="l-btn-text icon-save l-btn-icon-left">对照</span></span></a>'
			return str;
		}else{
			var str='<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:deleteTra('+index+')" data-options="iconCls:"icon-remove" title="删除"><span class="l-btn-left"><span class="l-btn-text icon-remove l-btn-icon-left"></span></span></a>';
			str=str+'<a class="dhc-linkbutton l-btn l-btn-plain" data-options="iconCls:icon-edit" onclick="javascript:updateConTra('+index+')" title="保存"><span class="l-btn-left"><span class="l-btn-text icon-edit l-btn-icon-left"></span></span></a>';
			return str;
			
		}
	};
	
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
	<div id="toolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			商品名称: <input id="incHopName" style="width: 150px;"
			type="text" />
			商品码: <input id="incHopCode" style="width: 150px;"
			type="text" />
			拼音码: <input id="incHopAlias" style="width: 150px;"
			type="text" />
			对照状态:
			<select class="combobox" panelHeight="auto" style="width:100px" id="hopFlag">
				<option value="0">空</option>
				<option value="1">已对照</option>
				<option value="2">未对照</option>
			</select>
			医&nbsp;&nbsp;院:
			<input style="width: 105px;" class="combobox" type="text"  id="hop" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchHopInc" >查询</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="conIncByBarCode" >按商品码自动匹配</a>
		 </div>
	</div>	
    <div id="toolbar2" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			商品名称: <input id="incVenName" style="width: 100px;"
			type="text" />
			商品码: <input id="incVenCode" style="width: 100px;"
			type="text" />
			拼音码: <input id="incVenAlias" style="width: 100px;"
			type="text" />
			审批状态:
			<select class="combobox" panelHeight="auto" style="width:100px" id="auditFlag">
				<option value="0">空</option>
				<option value="1">未审批</option>
				<option value="2">审批通过</option>
				<option value="3">审批拒绝</option>
			</select>
			对照状态:
			<select class="combobox" panelHeight="auto" style="width:100px" id="venFlag">
				<option value="0">空</option>
				<option value="1">已对照</option>
				<option value="2">未对照</option>
			</select>
			</div>
			<div style="margin-bottom:5px;margin-top:5px">

			供应商:<input style="width: 200px;"
						class="combobox" type="text" 
						 id="ven" />
			<a href="#" class="linkbutton" iconCls="icon-search" id="searchVenInc" >查询</a>
			<a href="#" class="linkbutton" iconCls="icon-search" id="venIncQualify" >商品资质</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="importBTN" >导入对照关系</a>
			<a href="#" class="linkbutton" iconCls="icon-save" id="conByCodeBTN" >按代码自动对照</a>
		     <span style="color: red;font-size: 20px">注意(比如供应商单位盒(7),医院单位支,那分子就是7，分母是1)</span>
		 </div>
		
	</div>
  <div class="layout" data-options="fit:'true',border:true">
        <div data-options="region:'north',title:'供应商商品',iconCls:'icon-ok'" style="height:300px">
        	<table id="datagrid2" style="height: 250px"  class="datagrid"
					data-options="toolbar:'#toolbar2',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 onClickCell:onClickCell,
								 ">
								 
					<thead>
						<tr>
							<th data-options="field:'venincid',hidden:true">IncId ID</th>
							<th data-options="field:'venname',width:100,sortable:true">供应商</th>
							<th data-options="field:'veninccode',width:50,sortable:true">商品代码</th>
							<th data-options="field:'venincname',width:150,sortable:true">商品名称</th>
							<th data-options="field:'manf',width:80,sortable:true">产地</th>
							<th data-options="field:'spec',width:60,sortable:true">规格</th>
							<th data-options="field:'uom',width:50,sortable:true">单位</th>
							<th data-options="field:'venfac',width:40,sortable:true,editor : {
								type : 'numberbox',
                            	options : {
                                	required : true
                            	}
                        	}">分子</th>
                        	<th data-options="field:'hopfac',width:40,sortable:true,editor : {
								type : 'numberbox',
                            	options : {
                                	required : true
                            	}
                        	}">分母</th>
							<th data-options="field:'hopincuom',width:50,sortable:true">医院单位</th>
							<th data-options="field:'hopincid',hidden:true">IncId ID</th>
							<th data-options="field:'hopinccode',width:60,sortable:true,hidden:true">医院商品代码</th>
							<th data-options="field:'hopincname',width:100,sortable:true">医院商品名称</th>
							
							<th data-options="field:'facid',width:40,hidden:true">对照表rowID</th>
							<th data-options="field:'contranst',width:60,formatter:ConT">对照</th>
							<th data-options="field:'auditFlag',width:60,formatter:AuditT">资质</th>
						</tr>
					</thead>
				</table>
        
        </div>
        <div data-options="region:'center',title:'医院商品(双击查看已经对照药品)',iconCls:'icon-ok'" >
            <table id="datagrid" style="height: 250px"  class="datagrid"
					data-options="toolbar:'#toolbar',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
								 ">
								 
					<thead>
						<tr>
							<th data-options="field:'hopincid',hidden:true">IncId ID</th>
							<th data-options="field:'hopinccode',width:50,sortable:true">商品代码(医院)</th>
							<th data-options="field:'hopincname',width:100,sortable:true">商品名称(医院)</th>
							<th data-options="field:'manf',width:100,sortable:true">产地(医院)</th>
							<th data-options="field:'spec',width:70,sortable:true">规格(医院)</th>
							<th data-options="field:'uom',width:40,sortable:true">入库单位(医院)</th>
							<th data-options="field:'hopname',width:40,sortable:true">医院名称</th>
						</tr>
					</thead>
				</table>
        </div>
    </div>
    
    
    
    
    
    
    <!-- 导入对照关系 -->
    <div id="importDialog" class="dialog" title="导入对照关系"
		style="width: 600px; height: 400px; background-color: #F5FAFD;"
		data-options="
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
			<table  style="width: 100%;">
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
					<td class="textParent" style="text-align: left; width: 60%"><input
						style="width: 250px;"  type="file"
						id="import" ></input></td>
				</tr>
				<tr>
					<td class="textLabel" style="text-align: right; width: 40%">下载模版:</td>
					<td class="textParent" ><a href="../tmpl/impContrans.xls">下载</a></td>
				</tr>
			</table>
			<table>
	    		<tr id="impModel">
	    			<td class="time">模版 </td>
	    			<td class='drop'><div class='item'>医院药品代码</div></td>
	    			<td class='drop'><div class='item'>供应商药品代码</div></td>
	    			<td class='drop'><div class='item'>供应商名称</div></td>
	    			<td class='drop'><div class='item'>分子(供应商)</div></td>
	    			<td class='drop'><div class='item'>分母(医院)</div></td>
	    		</tr>
	    	</table>
	    	<div id="err">
	    	</div>
	</div>
	
	
	
	<div id="gg" class="dialog" title="请等待"  style="width:600px;height:400px;padding:10px;"
				data-options="
				modal:true,
				draggable:false,
				closable:false,
				closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:false">
				
        		<p1>正在处理上传数据，请等待</p1>
    </div>
    <style type="text/css">

    .item{
	    text-align:center;
	    border:1px solid #499B33;
	    background:#fafafa;
	    color:#444;
	    width:90px;
    }
    </style>	
</body>
</html>

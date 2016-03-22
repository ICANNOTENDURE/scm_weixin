<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<%@include file="/WEB-INF/jsp/common/scriptUploadify.jsp"%>
<script type="text/javascript">
$(function (){
	date=new Date();
	dateAdd(date,'D',-1);
	$('#stdate').datetimebox('setValue', date.format("yyyy-MM-dd")+" 00:00:00");
	$('#eddate').datetimebox('setValue',new Date().format("yyyy-MM-dd")+" 23:59:59");
	//完成订单
	$("#save").on('click', function() {
		var selected = $("#datagrid").datagrid('getSelections');

		if (selected.length == 0) {
			$CommonUI.alert("请选择！");
            return;
        }
		$.post(
				 $WEB_ROOT_PATH+'/ord/ordCtrl!cmpImpOrd.htm',
				 {
					 "dto.impId":selected[0].ordId,
				 },
				 function(data){
						if(data.opFlg=="1"){					 
							$CommonUI.alert("成功");
							$CommonUI.getDataGrid('#datagrid').datagrid('load');
						 }else{
							 $CommonUI.alert("失败,"+data.msg); 
						 }
		        },
				 'json'
		);
	});
	
	$("#search").on('click', function() {
		$CommonUI.getDataGrid('#datagrid').datagrid({  
		    url:$WEB_ROOT_PATH+'/ord/ordCtrl!list.htm',
		    queryParams: {
		    	"dto.stDate":$("#stdate").datetimebox('getValue'),
		   	    "dto.edDate":$("#eddate").datetimebox('getValue'),
			},
			onClickRow:function(rowIndex, rowData){
				$CommonUI.getDataGrid('#datagrid2').datagrid({  
				    url:$WEB_ROOT_PATH+'/ord/orderStateCtrl!listVenOrd.htm',
				    queryParams: {
				    	"dto.ordId":rowData.ordId,
					}
				});
			},onLoadSuccess: function (data) {
			 	$('#datagrid').datagrid('selectRow', 0);
			 	if($('#datagrid').datagrid('getRows').length>0){
			 		$("#datagrid2").datagrid({
			 			url:$WEB_ROOT_PATH+'/ord/orderStateCtrl!listVenOrd.htm',
						queryParams: {
							'dto.ordId': $('#datagrid').datagrid('getRows')[0]['ordId'],
							}
		 				}
				 	);
			 	}
			 	
		 	 },
		});
	});
	
	
	
	$("#orderUpload").uploadify({
        'swf': $WEB_ROOT_PATH + '/images/uploadify.swf',
        'uploader': $WEB_ROOT_PATH + '/ord/ordCtrl!upload.htm',
        //在浏览窗口底部的文件类型下拉菜单中显示的文本
        'buttonText':'Upload',
        'fileTypeDesc': '支持的格式：',
        'fileTypeExts': '*.xls;*.xlsx',
        'fileSizeLimit': '30MB',
        'width': '60',
        'height': '20',
        'debug' : false,
        'fileObjName':'dto.upload',
        'auto': true,
        'removeCompleted':true,
        'onUploadStart': function(file) {
        	$("#orderUpload").uploadify("settings", 'formData', {'dto.uploadFileName': file.name});
        },
        'onSelect': function(){  
	        	$("#gg").dialog("open");
	        	$("#err").html("");	
        }, 
        //上传成功
        'onUploadSuccess':function(file, data, response){
        	$("#gg").dialog("close");
        	var obj=eval('('+data+')');
        	if(obj.opFlg=="1"){
        		$("#importDialog").dialog('close');
        		$CommonUI.alert("导入成功");
        		$("#search").click();
        	}else{
        		$CommonUI.alert("失败");
        		$("#err").html(obj.msg);
        	};
        },
        //检测FLASH失败调用
        'onFallback': function() {
        	$CommonUI.alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
        },
        //返回一个错误，选择文件的时候触发
        'onSelectError': function(file, errorCode, errorMsg) {
            switch (errorCode) {
            case - 100 : $CommonUI.alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                break;
            case - 110 : $CommonUI.alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                break;
            case - 120 : $CommonUI.alert("文件 [" + file.name + "] 大小异常！");
                break;
            case - 130 : $CommonUI.alert("文件 [" + file.name + "] 类型不正确！");
                break;
            }
        }
    });	
	
	
	//导入订单
	$("#import").on('click', function() {
		$('#importDialog').dialog('open');
		$('#impModel').html("");
		$('#impModel').append("<td class='time'>模版 </td>");
		$.post(
			$WEB_ROOT_PATH+"/sys/sysImpModelCtrl!listImpModel.htm",
			{
				'dto.impModel.type':'ORDER'
			},
			function(data){
				$.each(data,function(i,dd){
						$('#impModel').append("<td class='drop'><div class='item'>"+dd.name+"</div></td>");
				});
			},
			"json"
		);
	});
	//新增订单
	$("#add").on('click', function() {
		
		$.post(
			$WEB_ROOT_PATH+"/ord/ordCtrl!saveOrdImp.htm",
			function(data){
				if(data.resultCode==1){
					$CommonUI.getDataGrid('#datagrid').datagrid({
						url:$WEB_ROOT_PATH+'/ord/ordCtrl!list.htm',
						queryParams: {
							"dto.impId": data.resultContent
						}
					});
				}else{
					$CommonUI.alert("失败" + data.resultContent );
				}
			},
			"json"
		);
	});
	//删除订单
	$("#remove").on('click', function() {
		if ($("#datagrid").datagrid('getSelections').length != 1) {
			$CommonUI.alert('请选一个修改');
			return;
		}
		var selected = $("#datagrid").datagrid('getSelected');
		$CommonUI.loadUIM('messager');
		$.messager.confirm('确认对话框', '确认要删除吗？', function(r){
			if (r){
				$.post(
					$WEB_ROOT_PATH+"/ord/ordCtrl!deleteOrd.htm",
					{
						'dto.impId':selected.ordId
					},
					function(data){
						if(data.resultCode==0){
							$CommonUI.getDataGrid('#datagrid').datagrid('reload');
						}else{
							$CommonUI.alert("失败" + data.resultContent );
						}
					},
					"json"
				);
			}
		});

	});
	//新增加一行
	$("#addRow").on('click', function() {
		var selected = $("#datagrid").datagrid('getSelections');

		if (selected.length == 0) {
			$CommonUI.alert("请选择！");
            return;
        }
		
		$CommonUI.getDataGrid('#datagrid2').datagrid('appendRow',{
			orderid:'',
			orderno: '',
			hopinccode: '',
			hopincname: '',
			hopqty: '',
			hopuom: '',
			manf: '',
			spec: '',
			state: '',
			vendor: '',
			statedesc: null
		});
		index=$CommonUI.getDataGrid('#datagrid2').datagrid('getRows').length-1;
		$('#datagrid2').datagrid('selectRow', index).datagrid('editCell', {index:index,field:'hopincname'});
		editIndex = index;
		var ed = $('#datagrid2').datagrid('getEditor', {index:index,field:'hopincname'});
		//alert(jQuery.toJSON(ed))
		//t=$(ed.target).val();
		//$(ed.target).val('').focus().val(t);
		/*
		window.setTimeout(function(){
			$(ed.target).focus();
			alert(2)
			}, 350);
		*/

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
	
	 $.extend($.fn.datagrid.defaults.editors, {
			combogrid: {
				init: function(container, options){
					var input = $('<input type="text" class="datagrid-editable-input">').appendTo(container); 
					input.combogrid(options);
					return input;
				},
				destroy: function(target){
					$(target).combogrid('destroy');
				},
				getValue: function(target){
					return $(target).combogrid('getText');
				},
				setValue: function(target, value){
					$(target).combogrid('setValue', value);
					
				},
				resize: function(target, width){
					$(target).combogrid('resize',width);
				}
			}
	});
})
function deleteR(value,row,index){
		if(parseInt(row.state)>1){
			return "";
		}else{
			return '<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:deleterow('+index+')" data-options="iconCls:"icon-save"><span class="l-btn-left"><span class="l-btn-text icon-cancel l-btn-icon-left">删除</span></span></a>';
		}
}
function initFlag(value,row,index){
	if(row.ordCmpFlag==1){
		return '确认完成';
	}else{
		return "";
	}
}
function deleterow(index){
	
	orderid=$('#datagrid2').datagrid('getRows')[index]['orderid'];
	if(orderid==undefined){
		$('#datagrid2').datagrid('deleteRow',index);
		return;
	}
	$CommonUI.loadUIM('messager');
	$.messager.confirm('确认对话框', '确认要删除吗？', function(r){
		if (r){
			
			$.post(
					 $WEB_ROOT_PATH+'/ord/ordCtrl!deleteImpOrd.htm',
					 {
						 "dto.orderItmId":orderid,
					 },
					 function(data){
						 $CommonUI.getDataGrid('#datagrid2').datagrid('load');
			        },
					 'json'
			);
		}
	});
	
	
	
	
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
	if($('#datagrid2').datagrid('getRows')[index]['statedesc']!=null){
		return;
	}
	if (endEditing()){
		$('#datagrid2').datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});
		editIndex = index;
	}
}

function onAfterEdit(rowIndex, rowData, changes){
	 var changes=$CommonUI.getDataGrid('#datagrid2').datagrid('getChanges');
	 if(changes.length==0){
		 return
	 }
	 var selected = $("#datagrid").datagrid('getSelections');
	 $.post(
			 $WEB_ROOT_PATH+'/ord/ordCtrl!saveImpOrd.htm',
			 {
				 "dto.impId":selected[0].ordId,
				 "dto.orderItmId":rowData.orderid,
	          	 "dto.qty":rowData.hopqty,
	          	 "dto.rp":rowData.rp
			 },
			 function(data){
				 if(data.opFlg=="1"){					 
					 $CommonUI.autoCloseRightBottomMessage("("+rowData.hopincname+")"+"修改成功","消息",2500,'slide');
					 $CommonUI.getDataGrid('#datagrid2').datagrid('acceptChanges');
				 }	 
	        },
			 'json'
		 );
}

function fillValue(rowIndex, rowData){

	var selected = $("#datagrid").datagrid('getSelections');
	 $.post(
		 $WEB_ROOT_PATH+'/ord/ordCtrl!saveImpOrd.htm',
		 {
			 "dto.impId":selected[0].ordId,
			 "dto.orderItmId":selected[0].orderid,
          	 "dto.qty":selected[0].qty,
          	 
          	 "dto.incId":rowData.hopincid,
         	 "dto.venIncId":rowData.venincid,
         	 "dto.rp":rowData.hoprp,
		 },
		 function(data){
			 if(data.opFlg=="1"){
				 $('#datagrid2').datagrid('updateRow', { 
					 	index: editIndex, 
						row: {
							hopinccode: rowData.hopinccode, 
							hopincname: rowData.hopincname,
							hopuom:rowData.uom,
					 		rp:rowData.hoprp,
					 		manf:rowData.manf,
					 		vendor:rowData.venname,
					 		hopincid:rowData.hopincid,
					 		venincid:rowData.venincid,
					 		orderid:data.msg
						}
				 });
				 //$CommonUI.autoCloseRightBottomMessage("("+rowData.hopincname+")"+"修改成功","消息",2500,'slide');
				 $CommonUI.getDataGrid('#datagrid2').datagrid('acceptChanges');
			 }
        },
		 'json'
	 );
}
</script>
</head>
<body>
	<div id="toolbar" class="toolbar">
			订单开始日期: <input class="datetimebox" style="width:150px" id="stdate">
			结束日期: <input class="datetimebox" style="width:150px" id="eddate">
			<a
				class="linkbutton" id="search"
				data-options="iconCls:'icon-search'">查询</a>
			<a class="linkbutton" id="import"
				data-options="iconCls:'icon-add',plain:true">导入订单</a>
			<a class="linkbutton" id="add"
				data-options="iconCls:'icon-add',plain:true">新增订单</a>
			<a class="linkbutton" id="remove"
				data-options="iconCls:'icon-remove',plain:true">删除订单</a>		
			<a class="linkbutton" id="save"
				data-options="iconCls:'icon-save',plain:true">确认提交</a>	

	</div>
	<div id="toolbar2" class="toolbar">
			<a class="linkbutton" id="addRow"
				data-options="iconCls:'icon-add',plain:true">增加一行</a>	
	</div>

	<div class="layout" data-options="fit:'true',border:true">
		<div data-options="region:'north',title:'订单(双击查看明细)',iconCls:'icon-ok'"
			style="height: 200px">
			<table id="datagrid"  class="datagrid"
				data-options="toolbar:'#toolbar',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
								 pagination:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 pageSize:3,
				    			 pageList:[3,6,9],
								 ">

				<thead>
					<tr>

						<th data-options="field:'ordId',hidden:true">流水号</th>
						<th data-options="field:'ordNo',width:100">上传流水</th>
						<th data-options="field:'ordDate',width:100">时间</th>
						<th data-options="field:'ordCmpFlag',width:100,formatter:initFlag">状态</th>
					</tr>
				</thead>
			</table>

		</div>
		<div
			data-options="region:'center'">
			<table id="datagrid2"  class="datagrid"
				data-options="toolbar:'#toolbar2',
					 			 fit:true,
								 fitColumns:true,
								 singleSelect:true,
				    			 method:'post',
				    			 rownumbers:true,
				    			 striped:true,
				    			 singleselect:true,
				    			 remoteSort:true,
				    			  onClickCell: onClickCell,
				    			  onAfterEdit:onAfterEdit,
				    			  pagination:true,
				    			  pageSize:10,
				    			  pageList:[10,20,100],
								 ">

				<thead>
					<tr>
						<th data-options="field:'hopincid',hidden:true">流水号</th>
						<th data-options="field:'venincid',hidden:true">流水号</th>
						<th data-options="field:'orderid',hidden:true">IncId ID</th>
						<th data-options="field:'orderno',width:40,sortable:true">订单号</th>
						<th data-options="field:'hopinccode',width:30,sortable:true">代码</th>
						<th data-options="field:'hopincname',width:70,editor:{
								type:'combogrid',
								options:{
									required : true,
								    id:'INC',
								    fitColumns:true,
								    fit: true,//自动大小  
									pagination : true,
									panelWidth:600,
									textField:'incname',
									mode:'remote',
									url:'<%=request.getContextPath()%>/ven/venIncCtrl!listVenContranst.htm',
									columns:[[
										{field:'hopincid',hidden:true},
										{field:'venincid',hidden:true},
										{field:'hopinccode',title:'代码',width:60},
										{field:'hopincname',title:'名称',width:140},
										{field:'hopincuom',title:'单位',width:90},
										{field:'hoprp',title:'价格',width:90},
										{field:'manf',title:'产地',width:113},
										{field:'venname',title:'供应商',width:100}
									]],
									onSelect:function(rowIndex, rowData) {
                       					 fillValue(rowIndex, rowData);
                    				}	   
								}
							},sortable:true">名称</th>
						<th data-options="field:'hopqty',width:20,editor : {
							type : 'numberbox',
                            options : {
                                required : true
                            }
                        },sortable:true
					   ">数量</th>
						<th data-options="field:'hopuom',width:20,sortable:true">单位</th>
						<th data-options="field:'rp',width:20,sortable:true,editor : {
							type : 'numberbox',
                            options : {
                                required : true
                            }
                        },sortable:true
					   ">进价</th>
						<th data-options="field:'manf',width:70,sortable:true">产地</th>
						<th data-options="field:'spec',width:30,sortable:true">规格</th>
						<th data-options="field:'vendor',width:70,sortable:true">供应商</th>
						<th data-options="field:'statedesc',width:20,sortable:true">状态</th>
						<th data-options="field:'state',width:20,formatter:deleteR">编辑</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>


	
	
	
	<div id="importDialog" class="dialog" title="导入订单"
		style="width: 1000px; height: 400px; background-color: #F5FAFD;"
		data-options="
				modal:true,
		        closed:true,
				collapsible:false,
				minimizable:false,
				maximizable:true">
		<table id="addFuncsTable" style="width: 100%;">
			<tr>
				<td class="textLabel" style="text-align: right; width: 40%">导入Excel文件:</td>
				<td class="textParent" style="text-align: left; width: 60%"><input
					style="width: 250px;" class="validatebox" type="file" name="upload"
					id="orderUpload"></input></td>
			</tr>
		</table>
		<table>
			<tr id="impModel">
				<td class="time">模版</td>
			</tr>
		</table>
		<div id="err"></div>
	</div>
	<style type="text/css">
.item {
	text-align: center;
	border: 1px solid #499B33;
	background: #fafafa;
	color: #444;
	width: 90px;
}
</style>


	<div id="gg" class="dialog" title="请等待"
		style="width: 1000px; height: 400px; padding: 10px;"
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
</body>
</html>

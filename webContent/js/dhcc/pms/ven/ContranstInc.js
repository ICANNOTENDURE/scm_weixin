// zxx 2014-04-19
$(function (){
	
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
				return $(target).combogrid('getValue');
			},
			setValue: function(target, value){
				$(target).combogrid('setValue', value);
				
			},
			resize: function(target, width){
				$(target).combogrid('resize',width);
			}
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
	 	 
	
	 $("#search").on('click', function() {
		 $("#datagrid").datagrid('load', {
			 "dto.venIncContranstDto.incName":$("#incName").val(),
			 "dto.venIncContranstDto.hopId":$("#hopId").combobox("getValue"),
			 "dto.venIncContranstDto.venId":$("#vendorId").combobox("getValue")
		 });
		
	});
	
	 $("#hopId").combobox({
		url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
		valueField:'hospitalId',							
		textField:'hospitalName'
	});
	 
	 $('#vendorId').combobox({
	    	url:$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=",
	    	panelHeight:"auto",
	        valueField:'vendorId',  
	        textField:'name',  
	        onChange:function (newValue, oldValue){
	            if(newValue !=null){  
	                var urlStr =$WEB_ROOT_PATH+"/ven/vendorCtrl!getVenCombox.htm?dto.vendor.name=" + encodeURIComponent(newValue);  
	                $("#vendorId").combobox("reload",urlStr);  
	            }  
	        },
	    	onSelect:function(rec){
	    		$('#vendorId').combobox('setText',rec.name);
	    	}
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

function fillValue(rowIndex, rowData){
	
	 
	 hopincid=$('#datagrid').datagrid('getRows')[editIndex]['hopincid'];
	 venincid=rowData.venincid;
	 $.post(
		 $WEB_ROOT_PATH+'/ven/venIncCtrl!saveContranst.htm',
		 {
			 "dto.venHopInc.hopIncId":hopincid,
           	 "dto.venHopInc.venIncId":venincid, 
		 },
		 function(data){
			 
			 if(data.dto.opFlg=="1"){
				 $('#datagrid').datagrid('updateRow', { 
					 	index: editIndex, 
						row: {
					 	    venincname: rowData.venincname, 
					 		venname: rowData.name,
					 		vensysid:rowData.venincvensysid,
						}
				 });
				 
				 $CommonUI.autoCloseRightBottomMessage("("+rowData.name+")"+rowData.venincname+"药品对照成功","消息",2500,'slide');
			 }
			 
			 
         },
		 'json'
	 );
}

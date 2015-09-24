// zxx 2014-04-19
$(function (){



	
	$CommonUI.getDataGrid('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/js/dhcc/pms/sys/excelModel.json',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    columns:[[ 
	        {field:'type',title:'type',width:100},  
	        {field:'name',title:'名称',width:100}  
	    ]],
	    onDblClickRow: function(rowIndex, rowData){

	        $("#editFrame")[0].src= $WEB_ROOT_PATH + '/sys/sysImpModelCtrl.htm?BLHMI=model&dto.impModel.type='+rowData.type;
	        $CommonUI.getDialog("#detailWin").dialog("center");
	        $CommonUI.getDialog("#detailWin").dialog("open");
	    }	
	});

});











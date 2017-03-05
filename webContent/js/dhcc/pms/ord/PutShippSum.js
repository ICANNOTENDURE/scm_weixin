// lp 2017-1-06
$(function (){
	date=new Date();
	dateAdd(date,'D',-1);
	$('#stdate').datebox('setValue',date.format("yyyy-MM-dd"));
	$('#eddate').datebox('setValue',new Date().format("yyyy-MM-dd"));

	$('#datagrid').datagrid({  
	    url:$WEB_ROOT_PATH+'/ord/putShippSumCtrl!list.htm?',
	    method:'post',
	    fit:true,
	    fitColumns:true,
	    loadMsg:'加载数据中.....',
	    toolbar:'#toolbar',
	    singleSelect:false,
	    pagination:true,
	    rownumbers:true,
		title:'入库发票汇总(单击发票号查看明细)',
		columns:[[
//				{
//					title : "序列号",
//					field: "rowId",
//					sortable : false,
//					hidden : false,
//				},
		        {field:'date',title:'日期',width:100,sortable:true},
				{field:'invno',title:'发票号',width:100,formatter:OpenOrdDetail},
				{field:'rpamt',title:'金额',width:100,sortable:true},
				{field:'venname',title:'供应商',width:150}	
		 ]]
		 ,
		queryParams: {
			"dto.stdate":$("#stdate").datebox('getValue'),
			"dto.eddate":$("#eddate").datebox('getValue'),
		},
		
	}); 

	$("#search").on('click', function() {
		 var json = $CommonUI.loopBlock('#toolbar');
		 $("#datagrid").datagrid('load', json
			//{
			 //"dto.stdate":$("#stdate").datebox('getValue'),
			 //"dto.eddate":$("#eddate").datebox('getValue'),
			 //"dto.venname":$("#vendor").combobox('getValue'),
			//}
	);

	});
	   //供应商下拉框数据
	   $('#vendor').combobox({
		    url:getContextPath()+"/ven/vendorCtrl!getVenCombox.htm",
	    	panelHeight:"auto",
	        valueField:'vendorId',  
	        textField:'name',
	        mode: 'remote',
	   });



});

function OpenOrdDetail(value, rowData, rowIndex){
	if(value==null){
		
	}else{
		return "<a onclick=\'openord(\""+value+"\")\' href='#' style='text-decoration:none;'><span style='color:blue;'>"+value+"</span></a>";
	}
}

function openord(value){
	$('#detail').dialog('open');
	$('#detailgrid').datagrid({  
	    url:'putShippSumCtrl!listDeliverItm.htm?dto.invno='+value,
	    method:'post',
	    fit:true,
	    loadMsg:'加载数据中.....',
	    pagination:true,
	    fitColumns:true,
	    rownumbers:true,
	    columns:[[ 
	            {field:'venincncode',title:'代码',width:100,sortable:true},  	
	  	        {field:'venincname',title:'名称',width:100},
	  	        {field:'deliverqty',title:'数量',width:100},
	  	        {field:'rp',title:'进价',width:100},
	  	        {field:'uom',title:'单位',width:100},
	  	        {field:'batno',title:'批号',width:100},
	  	        {field:'expdate',title:'效期',width:100},
	  	        {field:'orderqty',title:'订单数',width:100}, 
	  	        {field:'sendedqty',title:'已发货数量',width:100},
	  	        {field:'manf',title:'产地',width:100}
	  	]]
	})
} 

function getContextPath(){
	var strFullPath=window.document.location.href;
	var strPath=window.document.location.pathname;
	var pos=strFullPath.indexOf(strPath);
	var prePath=strFullPath.substring(0,pos);
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	var basePath = prePath;
	//if(canBeAccess(prePath + postPath)){
		basePath = prePath + postPath;
	//}
	return basePath;
}


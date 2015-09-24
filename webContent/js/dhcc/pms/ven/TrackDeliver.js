// zxx 2014-04-19
$(function (){
	date=new Date();
	dateAdd(date,'D',-1);
	$('#acpStDate').datetimebox('setValue',date.format("yyyy-MM-dd HH:mm:ss"));
	$('#acpEdDate').datetimebox('setValue',new Date().format("yyyy-MM-dd HH:mm:ss"));
	$('#delFlag').combobox({
		url:getContextPath()+'/ord/orderStateCtrl!getComboList.htm',
		valueField:'stateSeq',							
		textField:'stateName'	
	});
	$('#datagrid').datagrid({  
	    url:getContextPath()+'/ven/venDeliverCtrl!listDeliver.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    loadMsg:'加载数据中.....',
	    toolbar:'#toolbar',
	    singleSelect:true,
	    pagination:true,
	    //rownumbers:true,
	    pageSize:17,
	    remoteSort:true,
	    pageList:[17,34,51],
	    queryParams: {
	    	"dto.stDate":$("#delStDate").datebox('getValue'),
			"dto.edDate":$("#delEdDate").datebox('getValue'),
			"dto.state":$("#delFlag").combobox('getValue'),
			"dto.accpStDate":$("#acpStDate").datebox('getValue'),
			"dto.accpEdDate":$("#acpEdDate").datebox('getValue'),
		},
	    title:'发货单状态查询(双击行查看明细)',
	    onDblClickRow: function(rowIndex, rowData){
	    	$('#detail').dialog('open');
	    	$('#detailgrid').datagrid({  
	    	    url:getContextPath()+'/ven/venDeliverCtrl!listDeliverItm.htm?dto.venDeliver.deliverId='+rowData.deliverid,
	    	    method:'post',
	    	    fit:true,
	    	    loadMsg:'加载数据中.....',
	    	    pagination:true,
	    	    fitColumns:true,
	    	    rownumbers:true,
	    	    
	    	    columns:[[
	    	            {field:'venincncode',title:'标识',width:200,},  
	    	  	        {field:'venincname',title:'名称',width:200,},
	    	  	        {field:'deliverqty',title:'数量',width:100,},
	    	  	        {field:'batno',title:'批号',width:100,}, 
	    	  	        {field:'invno',title:'发票号',width:100,},  
	    	  	        {field:'expdate',title:'效期',width:100,},
	    	  	        {field:'orderqty',title:'订单数',width:100,},
	    	  	        {field:'sendedqty',title:'历史已发货数',width:100,},
	    	  	        {field:'uom',title:'单位',width:50,},
	    	  	        {field:'rp',title:'价格',width:50,},
	    	  	        {field:'manf',title:'产地',width:200,}
	    	  	]],
	    	});
	
		},
		 columns:[[  
		  	        {field:'deliverid',hidden:true},
		  	        {field:'serialno',title:'上传流水',width:100,sortable:true},
		  	        {field:'hisno',title:'HIS单号',width:100,sortable:true},
		  	        {field:'statedesc',title:'状态',width:70,sortable:true},
		  	        {field:'emflag',title:'加急',width:50,sortable:true},
		  	        {field:'purloc',title:'入库科室',width:150,sortable:true},  
		  	        {field:'recloc',title:'收货科室',width:150,sortable:true},
		  	        {field:'destination',title:'收货地址',width:150,sortable:true},
		  	        {field:'hopname',title:'医院',width:100,sortable:true},
		  	        {field:'deliverydate',title:'发货时间',width:120,sortable:true},
		  	        {field:'deliveraccpectdate',title:'接收时间',width:120,sortable:true,hidden:true}
		 ]],
		//onLoadSuccess: onLoadSuccess,
	    view: detailview,
	    detailFormatter:function(index,row){
	    	return '<div style="padding:2px"><table class="ddv"></table></div>';
	    },
	    onExpandRow: function(index,row){

	    	var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
	    	ddv.datagrid({
	    		 url:getContextPath()+'/ord/orderStateCtrl!listExeState.htm?dto.exeState.deliverId='+row.deliverid,
	    		 fitColumns:true,
	    		 singleSelect:true,
	    		 rownumbers:true,
	    		 loadMsg:'',
	    		 height:'auto',
	    		 //pagination:true,
	    		 title:'发货单发货明细',
	    		 columns:[[
	    		           {field:'exeuser',title:'执行人',width:100},
	    		           {field:'statedesc',title:'状态',width:100},
	    		           {field:'exedate',title:'执行时间',width:100},
	    		           {field:'remark',title:'备注',width:100}
	    		 ]],
	    		 onResize:function(){
	    			 $('#datagrid').datagrid('fixDetailRowHeight',index);
	    		 },
	    		 onLoadSuccess:function(){
	    			 setTimeout(function(){
	    				 $('#datagrid').datagrid('fixDetailRowHeight',index);
	    			 },0);
	    		 }
	    		 
	    	});
	    	$('#datagrid').datagrid('fixDetailRowHeight',index);
	    }
	    
	    
	}); 
	
	
	
	
	$("#search").on('click', function() {
		 $("#datagrid").datagrid('load', {
			 "dto.stDate":$("#delStDate").datebox('getValue'),
			 "dto.edDate":$("#delEdDate").datebox('getValue'),
			 "dto.accpStDate":$("#acpStDate").datebox('getValue'),
			 "dto.accpEdDate":$("#acpEdDate").datebox('getValue'),
			 "dto.state":$("#delFlag").combobox('getValue'),
			 "dto.hopId":$("#hopSearch").combobox('getValue'),
			 "dto.purLocId":$("#purlocSearch").combobox('getValue'),
			 "dto.emFlag":$("#emflag").attr('checked')
		 });
		
	});
	


	$('#purlocSearch').combobox({
			url:getContextPath()+'/hop/hopCtlocCtrl!findHopLocComboxVos.htm?dto.type=1',
			valueField:'id',							
			textField:'name'
	});
	
	$('#hopSearch').combobox({
		url:getContextPath()+'/hop/hospitalCtrl!getHospInfo.htm',
		valueField:'hospitalId',							
		textField:'hospitalName'
	});
	

});
function onLoadSuccess(data){
	 mergeCellsByField('datagrid','serialno');
}
function mergeCellsByField(tableID,colList){
   var ColArray = colList.split(",");
   var tTable = $('#'+tableID);
   var TableRowCnts=tTable.datagrid("getRows").length;
   var tmpA;
   var tmpB;
   var PerTxt = "";
   var PerVenId="";
   var CurTxt = "";
   var CurVendorId="";
   for (j=ColArray.length-1;j>=0 ;j-- )
   {
       //当循环至某新的列时，变量复位。
       PerTxt="";
       tmpA=1;
       tmpB=0;
       
       //从第一行（表头为第0行）开始循环，循环至行尾(溢出一位)
       for (i=0;i<=TableRowCnts ;i++ )
       {
           if (i==TableRowCnts)
           {
               CurTxt="";
               CurVendorId="";
           }
           else
           {
               CurTxt=tTable.datagrid("getRows")[i][ColArray[j]];
           }

           if (PerTxt==CurTxt)
           {
               tmpA+=1;
           }
           else
           {
               tmpB+=tmpA;
               tTable.datagrid('mergeCells',{
                   index:i-tmpA,
                   field:ColArray[j],
                   rowspan:tmpA,
                   colspan:null
               });
               tmpA=1;
           }
           PerTxt=CurTxt;
           PerVenId=CurVendorId;
       }
   }
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


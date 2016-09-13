// zxx 2014-04-19
$(function (){
	date=new Date();
	dateAdd(date,'D',-1);
	$('#stdate').datebox('setValue',date.format("yyyy-MM-dd"));
	$('#eddate').datebox('setValue',new Date().format("yyyy-MM-dd"));

	$('#datagrid').datagrid({  
	    url:getContextPath()+'/ord/orderStateCtrl!listOrdGrpNo.htm',
	    method:'post',
	    fit:true,
	    fitColumns:true,
	    loadMsg:'加载数据中.....',
	    toolbar:'#toolbar',
	    singleSelect:true,
	    pagination:true,
	    rownumbers:true,
	    queryParams: {
	    	"dto.stdate":$("#stdate").datebox('getValue'),
	   	    "dto.eddate":$("#eddate").datebox('getValue'),
		},
		title:'订单状态查询(双击行查看明细)',
	    onDblClickRow: function(rowIndex, rowData){
	    	$('#detail').dialog('open');
	    	$('#detailgrid').datagrid({  
	    	    url:'orderStateCtrl!listOrdList.htm?dto.orderNo='+rowData.orderno,
	    	    method:'post',
	    	    fit:true,
	    	    loadMsg:'加载数据中.....',
	    	    pagination:true,
	    	    fitColumns:true,
	    	    rownumbers:true,
	    	    columns:[[ 
	    	            {field:'comment',title:'评价',width:60,sortable:true,formatter:commentRow},  	
	    	  	        {field:'hopinccode',title:'代码',width:100},
	    	  	        {field:'hopincname',title:'名称',width:100},
	    	  	        {field:'spec',title:'规格',width:100},
	    	  	        {field:'hopqty',title:'数量',width:100},
	    	  	        {field:'hopuom',title:'单位',width:150},  
	    	  	        {field:'rp',title:'进价',width:150},
	    	  	        {field:'manf',title:'产地',width:200}
	    	  	]],
	    	    view: detailview,
	    	    detailFormatter:function(index,row){
	    	    	return '<div style="padding:2px"><table class="ddv"></table></div>';
	    	    },
	    	    onExpandRow: function(index,row){

	    	    	var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
	    	    	ddv.datagrid({
	    	    		 url:'orderStateCtrl!listExeState.htm?dto.exeState.ordId='+row.orderid,
	    	    		 fitColumns:true,
	    	    		 singleSelect:true,
	    	    		 rownumbers:true,
	    	    		 loadMsg:'',
	    	    		 height:'auto',
	    	    		 //pagination:true,
	    	    		 title:'采购单执行明细',
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
	
		},
		 columns:[[
		          
				{field:'orderno',title:'单号',width:100},
				{field:'date',title:'日期',width:100,sortable:true},
				{field:'emflag',title:'加急',width:50,sortable:true,formatter: function(value,row,index){
					return value==1?"加急":"普通";
				}},
				{field:'state',title:'状态',width:100,sortable:true},
				{field:'purloc',title:'入库科室',width:150,sortable:true},  
				{field:'recloc',title:'收货科室',width:150,sortable:true},
				{field:'venname',title:'供应商',width:150,sortable:true}
				
		 ]]
	    
	    
	}); 

	
	
	$("#search").on('click', function() {
		 $("#datagrid").datagrid('load', {
			 "dto.stdate":$("#stdate").datebox('getValue'),
			 "dto.eddate":$("#eddate").datebox('getValue'),
			 "dto.reqStDate":$("#reqStDate").datebox('getValue'),
			 "dto.reqEdDate":$("#reqEdDate").datebox('getValue'),
			 "dto.state":$("#state").combobox('getValue'),
			 "dto.vendor":$("#vendor").combobox('getValue'),
			 "dto.purloc":$("#purloc").combobox('getValue'),
			 "dto.recLoc":$("#recloc").combobox('getValue'),
			 "dto.emflag":$("#emflag").combobox('getValue')
		 });

	});
	
	


	   $('#purloc').combobox({
			url:getContextPath()+'/hop/hopCtlocCtrl!findHopLocComboxVos.htm?dto.type=1',
			valueField:'id',							
			textField:'name'
		});
	   $('#recloc').combobox({
			url:getContextPath()+'/hop/hopCtlocCtrl!findHopLocComboxVos.htm?dto.type=2',
			valueField:'id',							
			textField:'name'
		});
	   $('#state').combobox({
			url:getContextPath()+'/ord/orderStateCtrl!getComboList.htm',
			valueField:'stateSeq',							
			textField:'stateName'	
		});
	   
	   $('#vendor').combobox({
		    url:getContextPath()+"/ven/vendorCtrl!getVenCombox.htm",
	    	panelHeight:"auto",
	        valueField:'vendorId',  
	        textField:'name',
	        mode: 'remote',
	   });



});
function commentRow(value,row,index){
	return '<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:comment('+index+')" data-options="iconCls:"icon-save"><span class="l-btn-left"><span class="l-btn-text icon-save l-btn-icon-left">评价</span></span></a>';
}
function comment(index){
	orderid=$('#detailgrid').datagrid('getRows')[index]['orderid'];
	url=getContextPath() +'/comment/CommentCtrl!listMain.htm?dto.evalute.orderId='+orderid;
	//iframe层
	window.parent.layer.open({
	  type: 2,
	  title: '评价',
	  shadeClose: true,
	  shade: 0.8,
	  area: ['636px', '100%'],
	  content:''+url+'' //iframe的url
	}); 
	
	//$("#commentFrame")[0].src= getContextPath() + '/comment/CommentCtrl!listMain.htm?dto.evalute.orderId='+orderid;
    //$("#commentWin").dialog("setTitle", "评价");
    //$("#commentWin").dialog("center");
    //$("#commentWin").dialog("open");
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


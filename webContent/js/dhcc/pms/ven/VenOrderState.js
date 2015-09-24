// zxx 2014-04-19
$(function (){
	date=new Date();
	dateAdd(date,'D',-7);
	$('#stdate').datetimebox('setValue',date.format("yyyy-MM-dd HH:mm:ss"));
	$('#eddate').datetimebox('setValue',new Date().format("yyyy-MM-dd HH:mm:ss"));
	
	$('#datagrid').datagrid({  
	    url:'orderStateCtrl!list.htm',
	    iconCls:'icon-edit',//图标
	    method:'post',
	    fit:true,
	    loadMsg:'加载数据中.....',
	    toolbar:'#toolbar',
	    singleSelect:true,
	    pagination:true,
	    //rownumbers:true,
	    pageSize:17,
	    pageList:[17,34,51],
	    title:'确认订单(双击行查看明细)',
	    queryParams: {
			'dto.state': 1,
			"dto.stdate":$("#stdate").datebox('getValue'),
			"dto.eddate":$("#eddate").datebox('getValue'),
		},
	    onDblClickRow: function(rowIndex, rowData){
	    	$('#detail').dialog('open');
	    	$('#detailgrid').datagrid({  
	    	    url:'orderStateCtrl!listOrdItm.htm?dto.order.orderSerial='+rowData.serialno,
	    	    method:'post',
	    	    fit:true,
	    	    loadMsg:'加载数据中.....',
	    	    pagination:true,
	    	    plain:true,
	    	    fitColumns:true,
	    	    rownumbers:true,
	    	    columns:[[  
	    	  	        {field:'inccode',title:'代码',width:100},
	    	  	        {field:'incname',title:'名称',width:100},
	    	  	        {field:'qty',title:'数量',width:100},
	    	  	        {field:'uom',title:'单位',width:150},  
	    	  	        {field:'rp',title:'进价',width:150},
	    	  	        {field:'manf',title:'产地',width:200}
	    	  	]],
	    	});
	
		},
	    columns:[[
			{field:'serialno',title:'操作',width:100,formatter: function(value,row,index){
				str='<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain"  data-options="iconCls:"icon-save" href="downLoadOrderCtrl!downLoadOrder.htm?orderId='+row.serialno+'"><span class="l-btn-left"><span class="l-btn-text icon-save l-btn-icon-left">下载订单</span></span></a>';
				if (row.statedesc=="新建"){
					return str; //+'<a id="addBt" class="dhc-linkbutton l-btn l-btn-plain" onclick="javascript:accpOrder('+row.orderid+')" data-options="iconCls:"icon-save"><span class="l-btn-left"><span class="l-btn-text icon-add l-btn-icon-left">接收</span></span></a>';
					
				} else {
					return str;
				}
			}},
			
			{field:'hisno',title:'单号',width:100},
	        {field:'orderid',width:100,hidden:true},
	        {field:'statedesc',title:'状态',width:70,sortable:true},
	        {field:'emflag',title:'加急',width:50,sortable:true},
	        {field:'hopname',title:'医院',width:150,sortable:true}, 
	        {field:'purloc',title:'入库科室',width:150,sortable:true},  
	        {field:'recloc',title:'收货科室',width:150,sortable:true},
	        {field:'destination',title:'收货地址',width:150,sortable:true},
	        {field:'deliverydate',title:'要求送达日期',width:100,sortable:true},
	        
	        ]],
	    
//	    view: detailview,
	    detailFormatter:function(index,row){
	    	return '<div style="padding:2px"><table class="ddv"></table></div>';
	    },
	    onLoadSuccess: onLoadSuccess,
//	    onExpandRow: function(index,row){
//
//	    	var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
//	    	ddv.datagrid({
//	    		 url:'orderStateCtrl!listExeState.htm?dto.exeState.ordId='+row.orderid,
//	    		 fitColumns:true,
//	    		 singleSelect:true,
//	    		 rownumbers:true,
//	    		 loadMsg:'',
//	    		 height:'auto',
//	    		 //pagination:true,
//	    		 title:'采购单执行明细',
//	    		 columns:[[
//	    		           {field:'exedate',title:'执行时间',width:100},
//
//	    		           {field:'statedesc',title:'状态',width:100},
//	    		           {field:'exeuser',title:'执行人',width:100},
//	    		           {field:'tel',title:'电话',width:100},
//	    		           {field:'remark',title:'备注',width:100}
//	    		 ]],
//	    		 onResize:function(){
//	    			 $('#datagrid').datagrid('fixDetailRowHeight',index);
//	    		 },
//	    		 onLoadSuccess:function(){
//	    			 setTimeout(function(){
//	    				 $('#datagrid').datagrid('fixDetailRowHeight',index);
//	    			 },0);
//	    		 }
//	    		 
//	    	});
//	    	$('#datagrid').datagrid('fixDetailRowHeight',index);
//	    }
	    
	    
	}); 
	
	
	
	
	$("#search").on('click', function() {
		 $("#datagrid").datagrid('load', {
			 "dto.stdate":$("#stdate").datebox('getValue'),
			 "dto.eddate":$("#eddate").datebox('getValue'),
			 "dto.reqStDate":$("#reqStDate").datebox('getValue'),
			 "dto.reqEdDate":$("#reqEdDate").datebox('getValue'),
			 "dto.state":$("#state").combobox('getValue'),
			 "dto.vendor":$("#hop").combobox('getValue'),
			 "dto.purloc":$("#purloc").combobox('getValue'),
			 "dto.recLoc":$("#recloc").combobox('getValue'),
			 "dto.emflag":$("#emflag").attr('checked')
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
			url:'orderStateCtrl!getComboList.htm',
			valueField:'stateSeq',							
			textField:'stateName'	
		});
	   $('#state').combobox('setValue',1);
	   $('#hop').combobox({
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


function accpOrder(orderid){
	
	$.post(
			getContextPath()+'/ord/orderCtrl!exeOrder.htm',
			 {
				 "dto.order.orderId":orderid,
				 "dto.stateId":2,
			 },
			 function(data){
				 if(data.dto.opFlg=="1"){
					 $('#datagrid').datagrid('load');
					 $CommonUI.alert("确认成功");
				 }else{
					 $CommonUI.alert("确认失败");
				 }
	        },
			 'json'
	);
}



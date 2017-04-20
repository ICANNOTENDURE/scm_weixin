<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
.datagrid-cell {
    margin: 0;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
    padding: 0 4px;
    padding-top: 0px;
    padding-right: 4px;
    padding-bottom: 0px;
    padding-left: 4px;
    white-space: nowrap;
    word-wrap: normal;
    overflow: hidden;
    overflow-x: hidden;
    overflow-y: hidden;
    height: 18px;
    line-height: 18px;
    font-weight: normal;
    font-size: 15px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/qrcode/jquery.qrcode.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqprint/jquery.jqprint-0.3.js"></script>	
<script>
	
    $(function(){
    	$.ajaxSettings.async = false;

		date = new Date();
		dateAdd(date, 'D', -30);
		$('#ordStDate')
				.datetimebox('setValue', date.format("yyyy-MM-dd")+" 00:00:00");
		$('#ordEdDate').datetimebox('setValue',
				new Date().format("yyyy-MM-dd")+" 23:59:59");
		
		$('#state').combobox({
			url : $WEB_ROOT_PATH+'/ord/orderStateCtrl!getComboList.htm',
			valueField : 'stateSeq',
			textField : 'stateName'
		});
		$('#state').combobox('setValue', 3);
		$('#printFlag').combobox('setValue', 2);
		
    	$('#searchOrderTool').on('click',function(){

			$('#searchOrderTable').datagrid({
				url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliverNew.htm',
				queryParams: {
					'dto.stDate': $('#ordStDate').datetimebox('getValue'),
					'dto.edDate': $('#ordEdDate').datetimebox('getValue'),
					'dto.state':$('#state').combobox('getValue'),
					'dto.printFlag':$('#printFlag').combobox('getValue'),
				},
				onLoadSuccess: function (data) {
				 	$('#searchOrderTable').datagrid('selectRow', 0);
				 	$("#searchOrderTableItm").datagrid({
			 			url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliverItmNew.htm',
						queryParams: {
							'dto.orderno': $('#searchOrderTable').datagrid('getRows')[0]['hisno'],
							}
		 				}
				 	);
			 	 },
				onClickRow:function(rowIndex, rowData){
					$("#searchOrderTableItm").datagrid(
						{
						url:$WEB_ROOT_PATH+'/ven/venDeliverCtrl!listDeliverItmNew.htm',	
						queryParams: {
							'dto.orderno': rowData.hisno,
							}
		 				}
				 	);
				}
			});
			$('#searchOrder').dialog('open');			
		}	
		);
    	
             
    	
    	
    	$('#hopSearchOrder').combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName'	
		});
    	
    	//打印
    	$('#printBTN').on('click',function(){
    		//$('#qrcode').qrcode({width: 64,height: 64,text: toUtf8("中国热")});
    		//str="<img src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!encoderQrAndroid.htm?dto.content=dfghjkl'+"> </img>"
    		//$('#qrcode').html(str);
    		//alert($('#qrcode').html())
    		
    		var selected = $("#searchOrderTable").datagrid('getSelections');

    		if (selected.length == 0) {
    			$CommonUI.alert("请选择！");
                return;
            }

    		orderStr="";
            $.each(selected, function (index, item) {
            	if(orderStr==""){
            		orderStr=item.serialno;
            	}else{
            		orderStr=orderStr+","+item.serialno;
            	};
            });
            window.open($WEB_ROOT_PATH+"/ven/venDeliverCtrl!Print.htm?dto.ordIdStr="+orderStr);
    	});
    	//打印订单(按订单)
    	$('#printOrderBTN').on('click',function(){
    		var selected = $("#searchOrderTable").datagrid('getSelections');
    		if (selected.length == 0) {
    			
    			$CommonUI.alert("请选择！");
                return;
            }
    		orderStr="";
            $.each(selected, function (index, item) {
            //	console.log(typeof selected)
            	//console.log(selected instanceof Array)
            	//console.log(selected.length)
            	//console.log(selected[0])
            	
            	if(orderStr==""){
            		orderStr=item.serialno;
            		//console.log(item.serialno)
            	}else{
            		orderStr=orderStr+","+item.serialno;
            	};
            });
           // console.log($WEB_ROOT_PATH+"/ven/venDeliverCtrl!PrintOrder.htm?dto.ordIdStr="+orderStr)
            window.open($WEB_ROOT_PATH+"/ven/venDeliverCtrl!PrintOrder.htm?dto.ordIdStr="+orderStr);
    	});
    	//打印明细(按数量)
    	$('#printByQtyBTN').on('click',function(){
    		var selected = $("#searchOrderTable").datagrid('getSelections');
    		if (selected.length == 0) {
    			$CommonUI.alert("请选择！");
                return;
            }
    		orderStr="";orderSubStr="";
            $.each(selected, function (index, item) {
            	if(orderSubStr==""){
            		orderSubStr=item.deliveridstr;
            	}else{
            		orderSubStr=orderSubStr+","+item.deliveridstr;
            	};
            	
            	if(orderStr==""){
            		orderStr=item.serialno;
            	}else{
            		orderStr=orderStr+","+item.serialno;
            	};
            });
            
            prtCodeType=$('#prtCodeType').combobox('getValue');
            code128=prtCodeType=="1"?"":"Y";
            window.open($WEB_ROOT_PATH+"/ven/venDeliverCtrl!PrintByQty.htm?dto.ordIdStr="+orderStr+"&dto.ordSubIdStr="+orderSubStr+"&dto.code128="+code128);
    	});
     	//打印明细(按数量,勾选明细)
    	$('#printByQtySelectBTN').on('click',function(){
    		var selected = $("#searchOrderTableItm").datagrid('getSelections');
    		if (selected.length == 0) {
    			$CommonUI.alert("请选择！");
                return;
            }
    		orderStr="";
            $.each(selected, function (index, item) {
            	if(orderStr==""){
            		orderStr=item.deliveritmid;
            	}else{
            		orderStr=orderStr+","+item.deliveritmid;
            	};
            });
            window.open($WEB_ROOT_PATH+"/ven/venDeliverCtrl!PrintByQtySelect.htm?dto.ordIdStr="+orderStr);
    	});
    });
 
function enCode(value,row,index){
	return "<img id=qrCode"+row.deliverid+"  src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!qrAndroid.htm?dto.codeType=ByOrder&dto.content='+row.serialno+" style='height: 80;width: 80px'> </img>";
}
function enCodeItm(value,row,index){
	return "<img id=qrCodeItm"+row.deliveritmid+"  src="+$WEB_ROOT_PATH+'/sys/qrCodeCtrl!qrAndroid.htm?dto.codeType=ByInc&dto.content='+row.deliveritmid+" style='height: 50;width: 50px'> </img>";
}
</script>	
</head>
<body>
		<OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0 height=0></OBJECT>
		<div id="qrcode" ></div>
		<div class="layout" data-options="fit:true,border:true" >
			 <div data-options="region:'center',iconCls:'icon-ok',split:true,title:'打印条码'" >
			 	<table id="searchOrderTable" class="datagrid" data-options="toolbar:'#searchOrdtoolbar',
			 															   pagination:true,
			 															   fit:true,
			 															   loadMsg:'加载数据中.....',
			 															   fitColumns:true,
			 															   method:'post',
			 															   nowrap:true,
			 															   striped:true,
			 															   pageSize: 8,
    																	   pageList: [8, 16, 50],
			 															   ">
			 		<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'serialno',hidden:true"></th>
						<th data-options="field:'hisno',width:90">订单号</th>
						<th data-options="field:'deliveridstr',hidden:true">发货id串</th>
						<!-- 
						<th data-options="field:'qrcode',fixColumnSize:80,formatter:enCode,align:'center'">二维码</th>
						 -->
						<th data-options="field:'hopname',width:110">医院</th>
						<th data-options="field:'statedesc',width:90">状态</th>
						<th data-options="field:'emflag',width:20">加急</th>
						<th data-options="field:'purloc',width:90,hidden:true">入库科室</th>
						<th data-options="field:'recloc',width:90">收货科室</th>
						<th data-options="field:'destination',width:200">收货地址</th>
						<th data-options="field:'deliverydate',width:100">发货时间</th>
						<th data-options="field:'deliveraccpectdate',width:100,hidden:true">接收时间</th>
			 	    </tr>
			 	    </thead>
			 	
			 	</table>
			 </div>
			 
			 <div data-options="region:'south',iconCls:'icon-ok',collapsible:true" style="height: 267px">
			 	<table id="searchOrderTableItm" class="datagrid" data-options="title:'发货明细',
			 																   pagination:true,
			 																   nowrap:true,				
			 																   fit:true,
			 																   loadMsg:'加载数据中.....',
			 																   fitColumns:true,
			 																   method:'post',
			 																   pageSize: 10,
    																		   pageList: [10, 15, 20],
    																		   striped:true,
    																		   rownumbers:true,
    																		   " >
			 		<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'deliveritmid',hidden:true">代码</th>
						<!-- 
						<th data-options="field:'qrCodeItm',fixColumnSize:50,formatter:enCodeItm,align:'center'">二维码</th>
						 -->
						<th data-options="field:'venincncode',width:110">代码</th>
						<th data-options="field:'venincname',width:150">名称</th>
						<th data-options="field:'deliverqty',width:90">数量</th>
						<th data-options="field:'rp',width:90">进价</th>
						<th data-options="field:'uom',width:100">单位</th>
						<th data-options="field:'batno',width:90">批号</th>
						<th data-options="field:'expdate',width:90">效期</th>
						<th data-options="field:'orderqty',width:90">订单数</th>
						<th data-options="field:'sendedqty',width:90">已发货数量</th>
						<th data-options="field:'manf',width:200">产地</th>
			 	    </tr>
			 	    </thead>
			 	</table>
			 </div>
		</div>

	
	
	<!-- 弹出查询发货toolbar-->
	<div id="searchOrdtoolbar" style="height: auto">
		  <div  style="margin-bottom:5px;margin-top:5px">
			开始: <input class="datetimebox" style="width:150px" id="ordStDate">
			结束: <input class="datetimebox" style="width:150px" id="ordEdDate">
			<!-- 
			医院:
			<input class="combobox" panelHeight="auto" style="width:100px" id="hopSearchOrder"/>
			 -->
			订单状态: <input class="combobox" panelHeight="auto" style="width: 100px"
				id="state" />
			打印状态: <select class="combobox" panelHeight="auto" style="width:100px" id="printFlag">
				<option value="0">空</option>
				<option value="1">已打印</option>
				<option value="2">未打印</option>
			</select>	
		 	<a href="#" class="linkbutton" iconCls="icon-search" id="searchOrderTool">查询</a>
		 	<br>
			条码类型: <select class="combobox" panelHeight="auto" style="width:100px" id="prtCodeType">
				<option value="1">二维码</option>
				<option value="2">一维码</option>
			</select>
			<a href="#" class="linkbutton" iconCls="icon-print" id="printBTN" plain=true>打印随行单(按商品)</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printOrderBTN"  style="display:none"  plain=true>打印订单(按订单)</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printByQtyBTN"  plain=true>打印高值</a>
		 	<a href="#" class="linkbutton" iconCls="icon-print" id="printByQtySelectBTN"  style="display:none" plain=true>打印明细(按数量,勾选明细)</a>
		 		
		 </div>
	</div>

						
</body>
</html>

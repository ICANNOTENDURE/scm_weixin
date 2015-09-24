<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"> 
function qq(value,name){
	incname=null;
	incalias=null;
	if(name=="venname"){
		incname=value;
	}
	if(name=="venalias"){
		incalias=value;
	}
	$("#datagrid").datagrid({
		 	url:$WEB_ROOT_PATH+'/hop/hopVendorCtrl!listVendorDetail.htm',
	    	queryParams: {
	    		'dto.hopVendor.hopName': incname,
				 'dto.hopVendor.hopAlias':incalias ,
			}
	 	});
	}
function onLoadSuccess(data){
	 mergeCellsByField('datagrid','code,name,address,type');
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
                CurVendorId=tTable.datagrid("getRows")[i]['hopvenid'];
            }

            if ((PerTxt==CurTxt)&&(CurVendorId==PerVenId))
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

function showHistory(rowIndex, rowData){
	window.location.href=$WEB_ROOT_PATH+'/hop/hopVendorCtrl!HistoryDetail.htm?venodrId='+rowData.vendorid;
}
</script> 
</head>
<body>
	<div id="toolbar" class="toolbar"> 
			<div  style="margin-bottom:2px;margin-top:2px;float: center">
				<input class="searchbox"  style="width:500px;height:30px" data-options="searcher:qq,prompt:'请输入关键字..........',menu:'#mm'" ></input>	
		 	</div>
			<div id="mm" style="width:120px"> 
				<div data-options="name:'venname',iconCls:'icon-ok'">名称</div> 
				<div data-options="name:'venalias'">别名</div> 
		 	</div> 
	</div>


	<table id="datagrid"  title="供应商明细" class="datagrid"
		data-options="toolbar:'#toolbar',
					  remoteSort:true,						
			 															   pagination:true,
			 															   title:'日志查询',
			 															   fit:true,
			 															   loadMsg:'加载数据中.....',
			 															   fitColumns:true,
			 															   method:'post',
			 															   striped:true,
			 															   pageSize: 18,
    																	   pageList: [18, 36, 72],
    																	   onLoadSuccess: onLoadSuccess,
    																	   singleSelect:true,
    																	   onDblClickRow:showHistory,	
		 ">
		 <thead>
            <tr>
            	<th data-options="field:'hopvenid',width:50,align:'center',hidden:true" rowspan="2">代码</th>
                
                <th data-options="field:'code',width:50,align:'center',sortable:true" rowspan="2">代码</th>
                <th data-options="field:'name',width:150,align:'center',sortable:true" rowspan="2">名称</th>
                <th data-options="field:'address',width:150,align:'center',hidden:true" rowspan="2">地址</th>
                <th colspan="3">供应商资质信息</th>
            </tr>
            <tr>
                <th data-options="field:'type',width:80,align:'center'">资质名称</th>
                <th data-options="field:'expdate',width:80,align:'center'">资质效期</th>
                <th data-options="field:'path',width:100,
                formatter:function(value,row,index){if (row.path!=null) return '<img width=150 src=<%=request.getContextPath()%>/uploads/'+row.path+' >'}">资质图片</th>
            </tr>
        </thead>
	</table>

</body>
</html>

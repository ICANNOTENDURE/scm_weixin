<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/ord/ListInc.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/ord/shoppingCart.css">
<!--  
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome-ie7.min.css">
	-->
</head>
<style type="text/css">
.c-label {
	display: inline-block;
	width: 200px;
	font-weight: bold;
}
.shoppingQty{
	position: relative;
	float:left;
	margin-top: 42px;
	width: 99px;
	margin-right:10px;
}
.shoppingBtn {
	display: block;
	color: #FFF;
	position: relative;
	text-indent: 0px;
	text-align: center;
	font: 14px/28px arial;
	width: 98px;
	height: 28px;
	border-radius: 2px;
	margin-right: 0px;
	overflow: hidden;
	cursor: pointer;
	box-shadow: 0px 1px 3px rgba(50, 50, 50, 0.15);
	float: left;
	margin-top: 37px;
	color: #FFF;
	border: 1px solid #fd7320;
	background: #fd7320;
	font-family:simsun;
}
</style>
<script type="text/javascript"> 
function qq(value,name){
	incname=null;
	incalias=null;
	if(name=="incname"){
		incname=value;
	}
	if(name=="incalias"){
		incalias=value;
	}
	$('#datagrid').datagrid( 
		'load', {    
		    'dto.venIncContranstDto.flag': 1,
		    'dto.venIncContranstDto.incName':incname,
		    'dto.venInc.venIncAlias': incalias,
		}
	);
} 
</script> 
<body>
	<div id="toolbar" class="toolbar">
	     <div  style="margin-bottom:5px;margin-top:5px">
			<input class="searchbox"  style="width:500px;height:30px" data-options="searcher:qq,prompt:'请输入关键字..........',menu:'#mm'" ></input>	
		 </div>
		 <div id="mm" style="width:120px"> 
				<div data-options="name:'incname',iconCls:'icon-ok'">名称</div> 
				<div data-options="name:'incalias'">别名</div> 
		 </div> 
		<div id="plug_24_mytable_page">
			<div class="table_box">
				<div class="shopping_titlebar" dataid="order_1">
					<form class="shopform" method="post" name="shopform">
						<div class="shoping_bar">
							<div class="shopname">
								<b>我的购物车</b><u>×</u>
							</div>
						</div>
						<div class="shop_cnt">
							<div class="table_title">
								<table border="0px" cellpadding="0px" cellspacing="1px"
									bordercolor="#fff" style="border-bottom: #e1e1e1 1px solid">
									<tr height="27px" valign="middle" align="center" bgcolor="#f8f8f8">
										<td width="94px" align="left" style="text-indent: 5px">商品</td>
										<td width="99px">数量</td>
										<td width="52px">小计</td>
										<td width="60px">操作</td>
									</tr>
								</table>
							</div>
							<div class="shoping_list">
								<table border="0px" cellpadding="0px" cellspacing="1px" bordercolor="#fff" id="table_list">
									
								</table>
							</div>
							<div class="pay_stat">
								<span class="bigfont"><b>合计金额:</b><i>0</i><em>元</em></span>
								<span><a href="#" onclick="goToShopp();">立即结算</a></span>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--table-box 结尾-->

		</div>

	</div>


	<table id="datagrid" 
		data-options="toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true">
	</table>



	<div id="selectWin" class="dialog" title="条件查询"
		data-options="modal:true,width:350,height:150,closed:true,buttons:'#searchBtnDiv'"
		style="vertical-align: middle;">
		<table id="saveOrUpdateTable" style="width: 100%;">
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">状态代码:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					style="width: 250px;" class="validatebox" type="text"
					name="dto.state.stateCode"></input></td>
			</tr>
			<tr>
				<td class="textLabel" style="text-align: right; width: 20%">状态名称:</td>
				<td class="textParent" style="text-align: left; width: 30%"><input
					style="width: 250px;" class="validatebox" type="text"
					name="dto.state.stateName"></input></td>
			</tr>
		</table>
		<div id="searchBtnDiv" align="center">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td style="text-align: center;"><a id="selectBt"
						class="linkbutton" data-options="iconCls:'icon-save'">提交</a> <a
						id="cancelBtn" class="linkbutton"
						data-options="iconCls:'icon-cancel'"
						onclick="javascript:cancelClick()">取消</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/easyui/themes/metro-blue/easyui.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.json-2.4.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body style="background: #F5F5F5">
	<h2>1Excel 导入模版自定义</h2>
    <div class="demo-info" style="margin-bottom:10px">
    <div class="demo-tip icon-tip">&nbsp;</div>
    <div>1.1用鼠标单击拖拽来交换顺序</div>
    </div>
     
    <div style="width:650px;">
    <div class="right">
        <input type="hidden" value="${dto.impModel.type}" id="type"> 
    <table>
    <tr>
    <td class="blank"></td>

    <s:iterator value="dto.impModelList" status="all"  id="impModelList">
    	<td class="title">${impModelList.seq}</td>
    </s:iterator>
    </tr>
    <tr id="impModel">
    <td class="time">字段名</td>
    <s:iterator value="dto.impModelList" status="all"  id="impModelList">
  
    	<td class="drop"><div class="item" seq="${impModelList.name}">${impModelList.name}</div></td>
    </s:iterator>
    </tr>

    </table>
   
 
		<table cellpadding="0" cellspacing="0"  style="width: 950px">
			<tr>
				<td style="text-align: center;"><a id="submitBtn"
					href="javascript:void(0)" class="linkbutton" >保存</a> </td>
			</tr>
		</table>
		 </div>
	</div>
    <style type="text/css">
    .right{
    float:left;
    width:650px;
    
    }
    .right table{
    background:#E0ECFF;
    width:100%;
    }
    .right td{
    background:#fafafa;
    color:#444;
    text-align:center;
    padding:5px;
    }
    .right td{
    background:#E0ECFF;
    }
    .right td.drop{
    background:#fafafa;
    width:9px;
    }
    .right td.over{
    background:#FBEC88;
    }
    .item{
    text-align:center;
    border:1px solid #499B33;
    background:#fafafa;
    color:#444;
    width:90px;
    }
    .assigned{
    border:1px solid #BC2A4D;
    }
    .trash{
    background-color:red;
    }
    </style>
    <script>
    $(function(){
		$('.right .item').draggable({
			revert:true,
			proxy:'clone'
		});
		$('.right td.drop').droppable({
			onDragEnter:function(){
				$(this).addClass('over');
			},
			onDragLeave:function(){
				$(this).removeClass('over');
			},
			onDrop:function(e,source){
				 $(this).removeClass('over');
				 $(this).append(source);
				
			}
		});
		$("#submitBtn").show();
		$("#submitBtn").on('click', function() {
			$("#submitBtn").hide();
			var impModelStr = [];
			i=0;
			$("#impModel td .item").each(function(){		
					jsonObj = new Object();
	                jsonObj.type = $("#type").val();
	                jsonObj.name = $(this).attr("seq");
	                jsonObj.seq = i;
	                impModelStr.push(jsonObj);
					i=i+1;		
			});
			$.post(
					'<%=request.getContextPath()%>/sys/sysImpModelCtrl!saveModel.htm',	
					{
						"dto.imModelString":	jQuery.toJSON(impModelStr),
						"dto.impModel.type":     $("#type").val()
					},
					function(data){
						 if(data.dto.opFlg=="1"){
							 $.messager.alert('消息','保存成功！');
			             }else{
			            	 $.messager.alert('消息','保存失败!');
			             }
					},
					"json"
			);
		});
    });
    </script>


</body>
</html>

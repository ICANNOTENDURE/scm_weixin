//***根据用户取收货科室
$(function(){
	var locId=""; //后台取默认登录的科室
	var url=$WEB_ROOT_PATH+'/nur/nurseCtrl!';
	//var setDefault=url+"setDefault.htm?dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId=";
	//var saveDest=url+"saveDest.htm?dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId=";
	//var deleteDest=url+"deleteDest.htm?dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId=";
	$.post($WEB_ROOT_PATH+'/nur/nurseCtrl!findLocDesctionComboList.htm',
	{'dto.orderDto.loc' : locId},
	function(data){
			for(var i=0;i<data.length;i++){
				var html="<tr><td><input type='text' value='"+data[i].destination+"' id='aaa"+i+"'></td>";
	                html=html+"<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'>";
	            var buttonSet="";
	            if(data[i].isDefault=="N"){
	            	buttonSet="<button type='button' class='am-btn am-btn-default' id='setDefault'><a href='javascript:setDefault("+data[i].hopCtlocDestinationId+")'>设为默认</a></button>";
	            }else{
	            	buttonSet="<button type='button' class='am-btn am-btn-default' id='setDefault' disabled='disabled'><a href='javascript:setDefault("+data[i].hopCtlocDestinationId+")'>默认地址</a></button>";
	            }
	            var buttonSave="<button type='button' class='am-btn am-btn-default am-btn-xs am-hide-sm-only' id='saveDest'><a href='javascript:saveDest("+data[i].hopCtlocDestinationId+","+i+")'>保存</a></button>";
	            var buttonDel="<button type='button' class='am-btn am-btn-default am-btn-xs am-text-danger' id='deleteDest'><a href='javascript:deleteDest("+data[i].hopCtlocDestinationId+")'>删除</a></button>";
	            var buttonHidden="<input type='text' id='destid' style='display:none' value="+data[i].hopCtlocDestinationId+"' />"; 
	                html=html+buttonSet+buttonSave+buttonDel+buttonHidden;
	                html=html+"</div></div></td></tr>";
	                $("#myDestination").find("tbody").append(html);
			}	
		},"json"		
	);
	
	$("#addNewDest").click(function(){
		if($("#newDest").val()==""){
			alert("请填写收货地址!");
			return;
		}
		var html="<tr><td><input type='text' value='' id='newDest'></td>";
        html=html+"<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'>";
        var buttonSave="<button type='button' class='am-btn' id='newDestSave1'><a href='javascript:newDestSave()'>保存</a></button>";
        html=html+buttonSave+"</div></div></td></tr>";
        $("#myDestination").find("tbody").append(html);
	});	
});


	
//新加收货地址
function newDestSave(){
	if($("#newDest").val()==""){
		alert("请填写收货地址!");
		return;
	}
	$.post($WEB_ROOT_PATH+'/nur/nurseCtrl!saveDest.htm',
	{'dto.hopCtlocDestinationDto.hopCtlocDestination.destination':$("#newDest").val()},
	function(data){
		if(data.opFlg==1){
			var locId="";
			window.location.href=$WEB_ROOT_PATH+'/nur/nurseCtrl!nurDestination.htm?dto.orderDto.loc='+locId;
		}
	},"json"
	);
}
//删除收货地址
function deleteDest(id){
	var locId="";
	$.post($WEB_ROOT_PATH+'/nur/nurseCtrl!deleteDest.htm',
		{'dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId':id},
		function(data){
			if(data.opFlg=="1"){
				window.location.href=$WEB_ROOT_PATH+'/nur/nurseCtrl!nurDestination.htm?dto.orderDto.loc='+locId;
			}
		},"json"
	);
}

//保存收货地址
function saveDest(id,i){
	var desc=$("#aaa"+i).val();
	var locId="";
	$.post($WEB_ROOT_PATH+'/nur/nurseCtrl!saveDest.htm',
			{
				'dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId':id,
				'dto.hopCtlocDestinationDto.hopCtlocDestination.destination':desc,
			},
			function(data){
				if(data.opFlg==1){
					window.location.href=$WEB_ROOT_PATH+'/nur/nurseCtrl!nurDestination.htm?dto.orderDto.loc='+locId;
				}
			},"json"
	);
}

//设置默认收货地址
function setDefault(id){
	var locId="";
	$.post($WEB_ROOT_PATH+'/nur/nurseCtrl!setDefault.htm',
			{
				'dto.hopCtlocDestinationDto.hopCtlocDestination.hopCtlocDestinationId':id,
			},
			function(data){
				if(data.opFlg==1){
					window.location.href=$WEB_ROOT_PATH+'/nur/nurseCtrl!nurDestination.htm?dto.orderDto.loc='+locId;
				}
			},"json"
	);
}













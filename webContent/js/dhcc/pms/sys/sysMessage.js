$(function () {
	        //session.getAttribute("username");
	
			//初始化表格
			initTable();
	
			//绑定方法
    		initMethod();
    	
    		//初始化combobox
    		initCombo();
       
    		//初始化时间box
    		initDate();
    		
    		//初始化4个按钮功能
    		initbutton();
    		
    		getCurrentDate1();
    		
    });


function initbutton(){
	 //移到右边
	     $('#add').click(function() {
	    //获取选中的选项，删除并追加给对方
	        $('#select1 option:selected').appendTo('#select2');
	        //保存选中元素
	        //alert("保存一条数据！");
	    });
	    //移到左边
   $('#remove').click(function() {
	       $('#select2 option:selected').appendTo('#select1');
	       //alert("删除一条数据!");
	   });
	    //全部移到右边
	    $('#add_all').click(function() {
	        //获取全部的选项,删除并追加给对方
	        $('#select1 option').appendTo('#select2');
	     });
	    //全部移到左边
	    $('#remove_all').click(function() {
	        $('#select2 option').appendTo('#select1');
	        
	    });
	   //双击选项
	    $('#select1').dblclick(function(){ //绑定双击事件
	        //获取全部的选项,删除并追加给对方
	        $("option:selected",this).appendTo('#select2'); //追加给对方
	     });
	    //双击选项
	    $('#select2').dblclick(function(){
	        $("option:selected",this).appendTo('#select1');
     });
	
}

	function initCombo(){
		
		$CommonUI.getComboBox("#test1").combobox({
    			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
    			valueField:'hospitalId',							
    			textField:'hospitalName'
    			})
            $CommonUI.getComboBox("#hopPar").combobox({
        			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
        			valueField:'hospitalId',							
        			textField:'hospitalName',
        			onSelect:function(rec){
        				$.ajax({
        					url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm?dto.hopCtloc.hospid='+rec.hospitalId,
        					valueField:'hopCtlocId',							
        					data:'name',
        		            type:"post",
        		            dataType:'text',
        		            success:function(msg){
        		                var jsons=eval("("+msg+")");
        		                $("#select1").empty();
        		                //alert(jsons[0].hospitalName+"==="+jsons.length);
        		                for ( var int2 = 0; int2 < jsons.length; int2++) {
        		                    if(jsons[int2]!=null&&jsons[int2]!=""&&jsons[int2]!=" "){
        		                    	$("#select1").append("<option value="+jsons[int2].hopCtlocId+">"+jsons[int2].name+"</option>");
        		                    }
        		                }
        		                
        		            }
        				});
        				
        			}
        	});
			}
	
    function initMethod(){
    	$("input[name='Position']").bind("click",freshComobo);
    	$("input[name='platform']").bind("click",freshDatagrid);
    	
    	
    	//新增或更新失败的回调函数
    	function err(xhr,textStatus,errorThrown){
    		$CommonUI.alert("faile");	
    	}
    	function succ(data){
    		var Id=$('#detail input[name="dto.sysMessage.sysMessageId"]').val();	
    		if(Id){
    			//$CommonUI.alert("修改成功");
    		}else{
    			$CommonUI.alert("增加成功");
    		}
    		 $("#datagrid").datagrid('reload');
    		 //$("#detailWin").dialog('close');
    	}
    	function succc(data){
    		//alert(data);
    		
    		var messageId=data["dto.sysMessageId"];
    		var Id=$('#detail input[name="dto.sysMessage.sysMessageId"]').val();	
    		if(Id){
    			$CommonUI.alert("修改成功");
    		}else{
    			$CommonUI.alert("增加成功");
    		}
    		 $("#datagrid").datagrid('reload');
    		 var recType = $('#detailWin input[name="platform"]:checked ').val();
    		 $('#select2 option').each(function(){
     			
     			//alert("11")
     			postReq($WEB_ROOT_PATH+'/sys/sysMessageToCtrl!save.htm?dto.sysMessageTo.toType='+recType+'&dto.sysMessageTo.toMessageId='+messageId+'&dto.sysMessageTo.toDepartId='+$(this).val(),"#detail",{skipHidden:false});
     		})
    		 //$("#detailWin").dialog('close');
    	}
    	// 新增和修改
    	$("#submitBtn").on('click', function() {
    		var sendType = $('#detailWin input[name="Position"]:checked ').val();
    		
    		
    		var messageCreatedate =getCurrentDate();
    		//1、获取两个checkbox选中情况，微信1，电脑2，俩个3
    		//2.dto参数书写
    		 var a=""
    	    		if($("input[name='recType']:checked").length=="2"){
    	    			a="1";
    	    		}
    	    		if($("input[name='recType']:checked").length=="1"){
    	    			$("input[name='recType']:checked").each(function(){
    	    				if($(this).val()=="3"){
    	    					a="3"
    	    				}
    	    				if($(this).val()=="2"){
    	    					a="2"
    	    				}
    	    			});
    	    		}
    		
    		
    		//$CommonUI.getDateBox("#sendDate").datebox("setValue",getCurrentDate1());
    		$("#sendDate").val(getCurrentDate1());
    		//alert($("#sendDate").val());
    		
    		
    		postReq($WEB_ROOT_PATH+'/sys/sysMessageCtrl!save.htm?dto.sysMessage.messageSendType='+sendType+'&dto.sysMessage.messageType='+a,"#detailWin",succc,err,{skipHidden:false});
    		
    		
    		
    	});

    	
    }
  //初始化时间控件
    function initDate(){
    	//alert();
    	$CommonUI.getDateBox("#starDate").datebox({});
    	$CommonUI.getDateBox("#starDate").datebox("setValue",new Date().format("yyyy-MM-dd"));
    	$CommonUI.getDateTimeBox("#endDate").timespinner({});
    	$CommonUI.getDateBox("#endDate").timespinner("setValue",getCurrentTime());
    	
    	$CommonUI.getDateBox("#createDate").datebox({});
    	$CommonUI.getDateBox("#createDate").datebox("setValue",getCurrentDate());
    	$CommonUI.getDateBox("#sendDateTo").datebox({});
    	$CommonUI.getDateBox("#createDateTo").datebox({});
    }
    
    function  initTable(){
    	var texteditor = {
                type: 'text',//设置编辑格式
                options: {
                    required: true //设置编辑规则属性
                }
            }   // 编辑格

            columns = [[
                {
                    field: 'name',
                    title: '姓名',
                    width: 200,
                    align: 'center',
                    editor: texteditor,
                    sortable: true
                }
            ]];

    	$CommonUI.getDataGrid('#table1').datagrid({
                title: 'old joe',
                iconCls: 'icon-search',
                fit: true,
                pagination: true,
                pageSize:5,
                //pageList:[5,10],
                singleSelect: true,
                //rownumbers:true,
                columns: columns,
                data: [
                   
                ]
            })
           
            $('#table2').datagrid({
                title: 'old joe',
                iconCls: 'icon-search',
                fit: true,
                pagination: true,
                pageSize:5,
                //pageList:[5,10],
                singleSelect: true,
                //rownumbers:true,
                columns: columns,
                data: [
                   
                ]
            })
            
           
    }
  
    function freshComobo(){
    
    	if($(this).val()=="H"){
    	
    		$CommonUI.getComboBox("#test1").combobox({
    			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
    			valueField:'hospitalId',							
    			textField:'hospitalName'
    			})
    	}
    	if($(this).val()=="V"){
    	
    		$CommonUI.getComboBox("#test1").combobox({
    			url:getContextPath()+"/ven/vendorCtrl!getVenCombox.htm",
    		    	//panelHeight:"auto",
    		        valueField:'vendorId',  
    		        textField:'name',
    		       // mode: 'remote',
    			//url:$WEB_ROOT_PATH+'/manf/hopManfCtrl!getManfInfo.htm',
    			//valueField:'hopManfId',							
    			//textField:'manfName'
    			})
    	}
    	
    }
    function freshDatagrid(){
    	if($(this).val()=="H"){
    		var searchable=$("#select1");
        	searchable.empty();
        	$CommonUI.getComboBox("#hopPar").combobox({
			url:$WEB_ROOT_PATH+'/hop/hospitalCtrl!getHospInfo.htm',
			valueField:'hospitalId',							
			textField:'hospitalName',
			onSelect:function(rec){
				$.ajax({
					url:$WEB_ROOT_PATH+'/hop/hopCtlocCtrl!getCtlocList.htm?dto.hopCtloc.hospid='+rec.hospitalId,
					valueField:'hopCtlocId',							
					data:'name',
		            type:"post",
		            dataType:'text',
		            success:function(msg){
		                var jsons=eval("("+msg+")");
		                $("#select1").empty();
		                //alert(jsons[0].hospitalName+"==="+jsons.length);
		                for ( var int2 = 0; int2 < jsons.length; int2++) {
		                    if(jsons[int2]!=null&&jsons[int2]!=""&&jsons[int2]!=" "){
		                    	searchable.append("<option value="+jsons[int2].hopCtlocId+">"+jsons[int2].name+"</option>");
		                    }
		                }
		                
		            }
				});
				
			}
	});
    	}	
    
    	if($(this).val()=="V"){
        	var searchable=$("#select1");
        	searchable.empty();
        	$CommonUI.getComboBox("#hopPar").combobox('clear');
        	//$CommonUI.getComboBox("#hopPar").empty();
        	$.ajax({
        		url:getContextPath()+"/ven/vendorCtrl!getVenCombox.htm",
    	    	//panelHeight:"auto",
    	        valueField:'vendorId',  
    	        data:'name',
    	        type:"post",
                dataType:'text',
        		
                
                success:function(msg){
                    var jsons=eval("("+msg+")");
                    //alert(jsons+"==="+jsons.length);
                    for ( var int2 = 0; int2 < jsons.length; int2++) {
                        if(jsons[int2]!=null&&jsons[int2]!=""&&jsons[int2]!=" "){
                        	searchable.append("<option value="+jsons[int2].vendorId+">"+jsons[int2].name+"</option>");
                        }
                    }
                    
                }
            });
        	}
    	if($(this).val()=="S"){
        	var searchable=$("#select1");
        	searchable.empty();
        	$("#hopPar").combobox('clear');
    	}
    	
    }
   
    function getCurrentTime() {
	      
    	var dtCur = new Date();
	      var hCur = dtCur.getHours();
	      var mCur = dtCur.getMinutes();
	      var sCur = dtCur.getSeconds();
	      var timeCur =  (hCur < 10 ? "0" + hCur : hCur)
	        + ":" + (mCur < 10 ? "0" + mCur : mCur) + ":" + (sCur < 10 ? "0" + sCur : sCur);
	      return timeCur;
	    }
  //得到当前日期和时间
	function getCurrentDate() {
	      var dtCur = new Date();
	      var yearCur = dtCur.getFullYear();
	      var monCur = dtCur.getMonth() + 1;
	      var dayCur = dtCur.getDate();
	      var hCur = dtCur.getHours();
	      var mCur = dtCur.getMinutes();
	      var sCur = dtCur.getSeconds();
	      var timeCur = yearCur + "-" + (monCur < 10 ? "0" + monCur : monCur) + "-"
	        + (dayCur < 10 ? "0" + dayCur : dayCur) + " " + (hCur < 10 ? "0" + hCur : hCur)
	        + ":" + (mCur < 10 ? "0" + mCur : mCur) + ":" + (sCur < 10 ? "0" + sCur : sCur);
	      return timeCur;
	    }
	function getCurrentDate1() {
		//var v = $('#dd').datebox('getValue');
		//var v = $('#ss').timespinner('getValue');
		var curTime=$("#starDate").datebox('getValue')+" "+$('#endDate').timespinner('getValue')+":00";
		//alert($('#endDate').timespinner('getValue'));
		return curTime;
	}
	

//保存评价记录
$(function (){
	$('.tips-list').find("li").on("click",function(){
		if($(this).hasClass("select")){
			$(this).removeClass("select");
		}else{
			$(this).addClass("select");
		}
		if($(this).hasClass("list-last")){
			$(this).addClass("list-last-input");
			$(this).find(".fore1").addClass("hide");
			$(this).find(".fore2").removeClass("hide");
			$(this).find("span").css("display","block");
		}
	});
	
	eleResult=$("#eleResult").val();
	for(var i=1;i<5;i++){
		var kk="";
		if(i==1){
			kk=$("#eleResult").val();	
		}
		if(i==2){
			kk=$("#eleDescription").val();	
		}
		if(i==3){
			kk=$("#eleService").val();	
		}
		if(i==4){
			kk=$("#eleSpeed").val();	
		}
		var options	= {
				defaultTips:false,	
				max	: 5,
				title_format	: function(value) {
					var title = '';
					switch (value) {
						case 1 : 
							title	= '很不满意';
							break;
						case 2 : 
							title	= '不满意';
							break;
						case 3 : 
							title	= '一般';
							break;
						case 4 : 
							title	= '满意';
							break;
						case 5 : 
							title	= '非常满意';
							break;
						default :
							title = value;
							break;
					}
					return title;
				},
			value:kk		
		};
		$('#rate-comm-'+i).rater(options);
	}

	$("#commint").on('click',function(){
		 var orderId=$("#orderId").val(); 
		 var content=$("#content").val();
		 var StarNum=$("#StarNum1").val();
		 var description=$("#StarNum2").val();
		 var service=$("#StarNum3").val();
		 var speed=$("#StarNum4").val();
		 var tag=[];
		 $('.tips-list').find("li").each(function(i){
				if($(this).hasClass("select")){
					tag.push($(this).attr("data-id"));
				}
		 });
		 var lastTag=$(".itxt").val();
		 eveId=$("#eveId").val();
		 $.post(
				 getContextPath()+'/comment/CommentCtrl!saveComment.htm',
				 { 
					"dto.evalute.eleContent": content ,
					"dto.evalute.eleResult": StarNum,
					"dto.evalute.eleDescription": description,
					"dto.evalute.eleService": service,
					"dto.evalute.eleSpeed": speed,
					"dto.evalute.orderId": orderId,
					"dto.tagIdStr": tag.toString(),
					"dto.lastTag": lastTag,
					"dto.evalute.evaluteId": eveId
				 },
				 function(data){
					 if(data.opFlg=="1"){
						 alert('操作成功');
						 //return;
						 var obj=window.parent.document.getElementById("searchBtn");
						 if(obj){
							 setTimeout(obj.click(),2000);
						 }
					 }else{
						 alert('操作失败');
					 }
	             }, 
	              "json"
	     );
	});
	
});

function getContextPath(){
	var strFullPath=window.document.location.href;
	var strPath=window.document.location.pathname;
	var pos=strFullPath.indexOf(strPath);
	var prePath=strFullPath.substring(0,pos);
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	var basePath = prePath;
	basePath = prePath + postPath;
	return basePath;
}
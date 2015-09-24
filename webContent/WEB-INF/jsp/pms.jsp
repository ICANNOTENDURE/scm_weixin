<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华电子商务平台</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome-ie7.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script>
<link href="<%=request.getContextPath()%>/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>  
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	border:0px;
}

body {
	width: 100%;
	margin: 0 auto;
	font-size: 14px;
}

ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}



.fatherMenuOver {
	background: none repeat scroll 0% 0% #E1E1E1;
    color: #da3610;
}


.cs-north {
	height: 45px;
	border:0px;
	background-color: #191818;
	
}

.cs-west {
	width: 260px;
	border:0px;
}

#topPanel {
	background: #1472CF; /**#00859d;*/
	color: white;
	width: 100%;
	height: 50px;
	border:0px;
}


#leftPanel {
	width: 260px;
	height: 730px;
	float: left;
}

#leftPanel div#userInfo {
	background: #E1E1E1;
	width: 260px;
	height: 70px;
	border-bottom: 5px solid #CB4927;
	font-size: 11px;
}

#leftPanel div#fatherMenu {
	width: 50px;
	height: 725px;
	float: left;
	background: #1472CF; /**#00859d;*/
}
#leftPanel div#fatherMenu ul li  {
	width: 50px;
	height: 50px;
	cursor: pointer;
}
#leftPanel div#fatherMenu ul li a {
	width: 50px;
	height: 50px;
	display: block;
	font-size: 24px;
	color: #ebf6fc;
	line-height: 48px;
	text-align: center;
	text-decoration: none;
}



#leftPanel div#childrenMenu {
	background: #E1E1E1;
	width: 210px;
	height: 725px;
	float: right;
}

#leftPanel div#childrenMenu div#functionInfo {
	width:200px;
	height:50px;
	font-weight: normal;
	font-size: 16px;
	font-family: 'Dosis',sans-serif;
	padding: 0px 15px;
	line-height: 50px;
	margin: 0px;
	border-bottom: 1px solid #D1D1D1;
	text-transform: uppercase;
	box-shadow: 0px -1px 0px rgba(255, 255, 255, 0.6) inset;
}

#leftPanel div#childrenMenu ul li {
	width: 82px;
	height: 82px;
	float: left;
	margin: 10px;
	cursor: pointer;
}

#leftPanel div#childrenMenu ul li img {
	margin: 5px 15px 5px 15px;
}

#leftPanel div#childrenMenu ul li div {
	text-align: center;
	font-size: 14px;
	color: white;
}

#leftPanel div#childrenMenu li a i {
    font-size: 30px !important;
    display: block !important;
    text-align: center;
    padding: 10px 0px !important;
    width: auto !important;
    color: rgb(255, 255, 255) !important;
}


#leftPanel div#childrenMenu ul li a {
    display: block;
    font-size: 24px;
    color: #EBF6FC;
    line-height: 48px;
    text-align: center;
    text-decoration: none;
}

.admin-info {
    padding: 10px;
    border-bottom: 5px solid #DA3610;
    background: none repeat scroll 0% 0% #E1E1E1;
}
.admin-thumb {
    width: 50px;
    height: 50px;
    background: none repeat scroll 0% 0% #F9F9F9;
    float: left;
    white-space: normal;
    display: inline-block;
    line-height: 50px;
    text-align: center;
    font-size: 36px;
    border: 2px solid #CCC;
    color: #999;
}
.leftbar {
    height: 100%;
    background: none repeat scroll 0% 0% #E1E1E1;
    width: 260px;
    position: absolute;
}
.admin-meta {
    display: inline-block;
}
.admin-meta ul {
    margin: 0px 10px;
}
.admin-meta ul li {
    list-style: none outside none;
    line-height: normal;
    margin-bottom: 3px;
}
.admin-meta ul li a {
    text-decoration: none;
    padding-right: 5px;
    color: #666;
}
</style>


<script type="text/javascript">
$(function(){
	$("#ul_proc").append("<li style='width: 185px; border-right: 1px solid white;'><a><img border='0' src='/pms/images/logo.png'/></a></li>")
	$.ajaxSettings.async = false;
    $.getJSON("authenTicket/authenTicketCtrl!GetMainMeun.htm", function (json) {
        $.each(json, function (i) {
        		fatherId="father"+json[i].funcId;
        		$("#fatherMenuUL").append("<li id='"+fatherId+"' title='"+ json[i].funcName +"'><a class="+json[i].imgUrl+"></a></li>");    
            	
        		childId=fatherId+"Sub";
        		$("#childrenMenu").append("<ul id='"+childId+"' style='display: none;'>");
                $.each(json[i].children, function (j) {
                    onclickFunc="window.frames['mainIframe']."+json[i].children[j].url;
                    $("#"+childId).append("<li style='background: "+json[i].children[j].backColor+";' onclick="+onclickFunc+"; id="+json[i].children[j].secutiryUrl+"><a><i class="+json[i].children[j].imgUrl+"></i></a><div>"+json[i].children[j].funcName+"</div></li>")
                    
            	});
            	$("#childrenMenu").append("</ul>");
            
        });
 
    });

	
	
	//左侧菜单鼠标移动效果
	$("#fatherMenu ul li").hover(
      function(){
    	$("#fatherMenu ul li a").css("line-height","48px");
  		$("#fatherMenu ul li a").css("color","#ebf6fc");
  		//$("#fatherMenu ul li a").css("background","#00859d");
  		
  		$("#fatherMenu ul li a").css("background","#1472CF");
  		$("#fatherMenu ul li a").css("font-size","24px");
  		$("#childrenMenu div#functionInfo").text("");
  		$("#childrenMenu ul").hide();  
  		$(this).find("a").css("color","red");
  		$(this).find("a").css("background","#E1E1E1");
  		$(this).find("a").css("font-size","30px");
  		
	    var functionName = $(this).attr("title");
	    $("#childrenMenu div#functionInfo").text(functionName);
	    var childrenMenuId = $(this).attr("id")+"Sub";
	    $("#"+childrenMenuId).show(); 
	  }
	 
	);
	
	//左侧菜单鼠标单击样式
	$("#fatherMenu ul li ").click(function(){
		$("#mainPanel").stop(true, true);
		$("#mainPanel iframe").attr("src","");
	    var childrenMenuId =$(this).attr("id")+"Sub";
	    $("#"+childrenMenuId).show();
	    var src = $("#"+$(this).attr("id")+" a").attr("src");
	    $("#mainPanel").fadeOut(1);
	    $("#mainPanel iframe").attr("src",src);
	    $("#mainPanel").fadeIn(6000);
	});
	
	//左侧菜单鼠标单击样式
	$("#childrenMenu ul li").click(function(){
		$("#mainPanel").stop(true, true);
		$("#mainPanel iframe").attr("src","");
		
	
	    var src = $(this).attr("id");
	    $("#mainPanel").fadeOut(1);
	    $("#mainPanel iframe").attr("src",src);
	    $("#mainPanel").fadeIn(6000);
	});
	
	
	
	$("#childrenMenu ul:first").show();
	
	
	//修改个人信息
	$("#editinfo").click(function(){
		$("#mainPanel iframe").attr("src","./normalAccount/normalAccountCtrl!editInfo.htm");
	});
	//修改个人信息
	$("#editpassword").click(function(){
		$("#mainPanel iframe").attr("src","./normalAccount/normalAccountCtrl!editPassword.htm");
	});
	//退出登录 
	$("#logout").click(function(){
		$.post(
				'authenTicket/authenTicketCtrl!logout.htm',
				function(data){
					window.location.href="./";
				}
		);
	});
	$("#UIengine").click(function(){
		window.location.href="index!loginMainPageUIengine.htm";
	});
});


$(document).ready(function () {
	$.post(
			'authenTicket/authenTicketCtrl!getLoginInfo.htm',
			function(data){
				$(".admin-username").html(data);

				$('.cs-west').attr('title',data);
			}
	);
	$("#hid").on('click',function(){
		//$("#leftPanel").css('width',478);
	});
	$("#mainPanel iframe").attr("src","./chart/chartCtrl!index.htm");


});

</script>
</head>
<body class="layout">

	<div region="north" border="false" class="cs-north"
		style="overflow: hidden;">
		<div id="topPanel">

			
			<div id="hid"></div>
		</div>
	</div>

	<div region="west" border="true" split="false" class="cs-west"
		style="overflow: hidden;" title="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDHCC SOFT">
		<div id="leftPanel" >
	  
			<div class="admin-info">
				<!--  
				<div class="admin-thumb">
					<i class="icon-user"></i>
				</div>
				-->
				<div class="admin-meta">
					<ul>
						<li class="admin-username">请登录,亲</li>
						<li ><a href="#" id="editinfo">修改个人资料	</a></li> 
						<li> <a href="#" id="editpassword"><i class="icon-file-alt"></i> 修改密码</a></li>
						<li><a href="#" id="logout"><i class="icon-lock"></i> 退出登录</a></li>
						<li><a href="#" id="UIengine"><i class="icon-lock"></i> UIengine</a></li>
					</ul>
				</div>
		   </div>

			<div id="fatherMenu">
				<ul id="fatherMenuUL">
				
				</ul>
			</div>

			<div id="childrenMenu">
				<div id="functionInfo"></div>
			</div>

		</div>
	</div>

	<div id="mainPanel" region="center"  class="cs-center"
		style="overflow: hidden;border: 0px">
		<iframe name="mainIframe" frameborder="0" src=""
			style="width: 100%; height: 100%;"></iframe>
	</div>

</body>
</html>
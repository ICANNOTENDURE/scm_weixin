//定义人员类型
var userTypes=['工作人员','医院用户','供应商用户','护士']; 

function setTab(i, j) {
	var bulletin_titles = document.getElementById("bulletin_title_" + i)
			.getElementsByTagName("li");
	var bulletin_contents = document
			.getElementById("bulletin_content_" + i).getElementsByTagName(
					"ul");
	for (var k = 0; k < bulletin_titles.length; k++) {
		bulletin_titles[k].className = k == j ? "hover" : "";
		bulletin_contents[k].style.display = k == j ? "block" : "none";
	}
}
function LanguageSelect_onChanged() {
	document.getElementById("languageForm").submit();
}
function SendAuthen(){
	// 用户输入的账户名
    var userName=document.getElementById('mp_userName').value;
	// 用户输入的密码
    var password=document.getElementById('mp_password').value;
	// 用户登录的方式
    var loginType="accountAlias";
	// 用户类型（从业人员为"Pra",公众账户为"Normal"）
	var userType="Normal";
	// 系统类型，业务系统在管理平台登记的系统类型名称
    var systemType="PMS";
	// 系统版本，业务系统当前使用的版本
    var version="1.0";
    
    // 返回结果为Authen对象，state为描述信息,state为状态信息（0:认证失败；1:认证成功；2:票据过期）
    // url为当前用户有权限访问的当前系统的url地址，可根据url组织显示菜单    
    var authen=Login.Authen.getTicket(userName,password,loginType,userType,systemType,version);
    //alert(authen.msg+authen.state);
    if (authen.state!="1"){
    	alert(authen.msg);
    }else{
    	if(authen.userState=="1"){
	    	//护士
	    	if(authen.userType=='3'){
	    		location.assign("nur/nurseCtrl!nurseManageMain.htm");
	    	}else if(authen.userType=='2'){
	    		//供应商
	    		location.assign("chart/chartCtrl!index.htm");
	    	}else{
	    		location.assign("index!loginMainPageUIengine.htm");
	    	}
    	}else if(authen.userState=="2"){
    		alert("用户已经停用!");
    	}else if(authen.userState=="3"){
    		alert("用户待审核!");
    	}
    }
}
//**供应商注册页面****//
function vendorRegist(){
	window.location.href=$WEB_ROOT_PATH+"/nur/nurseCtrl!vendorRegist.htm";
}
//***供应商查看审核结果****//
function auditResult(){
	window.location.href=$WEB_ROOT_PATH+"/nur/nurseCtrl!queryAudit.htm";
}
//****忘记密码***//
function forgetPassword(){
	window.location.href=$WEB_ROOT_PATH+"/ven/vendorCtrl!forgetPassword.htm";
}



var Login = Login || (function (Math, undefined) {

    var L = {};
    /**
     * Authen namespace.
     */
	var Authen=L.Authen={
		getTicket:function(userName,password,loginType,userType,systemType,version){
			// 1、获取身份认证信息
			$.ajax({
				type : "post",
				url : "authenTicket/authenTicketCtrl!getTicket.htm",
				async : false,
				dataType:'json',
				data :{
					'loginDto.loginVo.userType': userType,
					'loginDto.loginVo.loginType': loginType,
					'loginDto.loginVo.userName': userName,
					'loginDto.loginVo.systemType': systemType,
					'loginDto.loginVo.version':version
				},
				success : function(data){
					var idTicket=data.idTicket;
					var serviceTicket=data.serviceTicket;
					var authenMsg=data.authenMsg;

					if ((idTicket!="")&&(authenMsg!="")){
						try{
							var decryptAuthenMsg=Security.enc.AES.cbcDecrypt(authenMsg,password);
							var authenJson=JSON.parse(decryptAuthenMsg);
							var sessionKey=authenJson.sessionKey;
							var timestamp=authenJson.timestamp;
							// 有无服务票据
							
							if(serviceTicket!=""){
								var cAuthenMsgEn=Security.enc.AES.cbcEncrypt(timestamp,sessionKey);
								$.ajax({
									type : "post",
									url : "authenTicket/authenTicketCtrl!authenUser.htm",
									async : false,
									dataType:'json',
									data :{
										'loginDto.loginVo.userName': userName,
										'loginDto.loginVo.authenMsg': cAuthenMsgEn,
										'loginDto.loginVo.serviceTicket': serviceTicket
									},
									success : function(result){
										var sAuthenMsgEn=result.authenMsg;
										if(sAuthenMsgEn!=""){
											var sAuthenMsg=Security.enc.AES.cbcDecrypt(sAuthenMsgEn,sessionKey);
											var sAuthenJson=JSON.parse(sAuthenMsg);
											Authen.state=sAuthenJson.state;
											//增加用户类型
											Authen.userType=sAuthenJson.userType;
											//增加用户当前状态
											Authen.userState=sAuthenJson.userState;
											if(Authen.state=="1"){
												Authen.msg="验证成功";
											}else if(Authen.state=="2"){
												Authen.msg="票据过期";
											}else if(Authen.state=="3"){
												Authen.msg="验证失败";
											}
										}else{
											Authen.msg="认证服务器失败";
										}
									}
								});
							}else{
								Authen.msg="请从要访问的应用系统登录";
							}
						}catch (e){
							//alert(e.message)
							Authen.msg="账户名/密码错误";
						}
					}else{
						Authen.msg="账户不存在";
					}
				}
			});
			return L.Authen;
		},
		logout:function(){
			$.ajax({
				type : "post",
				url : "authenTicket/authenTicketCtrl!logout.htm",
				async : false
			});
		}
	};
	var state=Authen.state="0";
    var msg=Authen.msg="连接服务器失败";
    
	return L;
}(Math));
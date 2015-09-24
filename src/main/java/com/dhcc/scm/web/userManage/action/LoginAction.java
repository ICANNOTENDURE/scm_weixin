package com.dhcc.scm.web.userManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.login.LoginDto;

/**
 * <p>标题: LoginAction.java</p>
 * <p>业务描述:Kerberos登录服务Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月29日
 * @version V1.0 
 */
@Namespace(value="/login")
@Scope("prototype")
@Action(value="loginCtrl", results={
		@Result(name="getTicket" ,location="/login.jsp"),
		@Result(name="loginMainPageEffect" ,location="/WEB-INF/jsp/pmsEffect.jsp"),
		@Result(name="notGetTicket" ,location="/login.jsp")
		})
@Blh("loginBlh")
@JsonResult4Pojo("getTicket:loginDto.loginVo")
public class LoginAction extends BaseAction{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID :
	*/
	private static final long serialVersionUID = 1L;
	
	// 用户数据类
	private LoginDto loginDto = new LoginDto();

	/**  
	 * @return loginDto 
	 */
	public LoginDto getLoginDto() {
		return loginDto;
	}

	/**  
	 * @param loginDto loginDto 
	 */
	public void setLoginDto(LoginDto loginDto) {
		this.loginDto = loginDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return loginDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(loginDto);
	}
	
	/**
	 * 直接跳转
	 */
	@Override
	public String directlyJump(){
		//不走后台程序直接返回jsp
		if("notGetTicket".equals(super.getBusinessFlow())){
			logger.info("\n---------------------directlyJump------------------\n");
			return "notGetTicket";
		}
		if("loginMainPageEffect".equals(super.getBusinessFlow())){
			return "loginMainPageEffect";
		}
		return null; //返回null时不会跳转
	}
}

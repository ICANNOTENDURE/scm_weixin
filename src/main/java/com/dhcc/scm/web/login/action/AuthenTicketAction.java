package com.dhcc.scm.web.login.action;

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
import com.dhcc.scm.dto.userManage.FuncDto;

/**
 * <p>标题: AuthenTicketAction.java</p>
 * <p>业务描述:验证服务票据Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月12日
 * @version V1.0 
 */
@Namespace(value="/authenTicket")
@Scope("prototype")
@Action(value="authenTicketCtrl", results={
		@Result(name="getTicket" ,location="/WEB-INF/jsp/login.jsp"),
		@Result(name="authenUser" ,location="/WEB-INF/jsp/login.jsp"),
		@Result(name="logout" ,location="/WEB-INF/jsp/login.jsp"),
		@Result(name="notAuthenTicket" ,location="/WEB-INF/jsp/login.jsp")
		})
@Blh("authenTicketBlh")
@JsonResult4Pojo("getTicket,authenUser:loginDto.loginVo")
public class AuthenTicketAction extends BaseAction{

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
		if("notAuthenTicket".equals(super.getBusinessFlow())){
			return "notAuthenTicket";
		}
		return null; //返回null时不会跳转
	}

}

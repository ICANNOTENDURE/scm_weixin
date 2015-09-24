package com.dhcc.scm.web.login.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;

/**
 * <p>标题: AuthenTicketAction.java</p>
 * <p>业务描述:验证服务票据Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月12日
 * @version V1.0 
 */
@Namespace(value="/")
@Scope("prototype")
@Action(value="login",results={
		@Result(name="loginRest" ,location="/WEB-INF/jsp/login.jsp")
		})
public class LoginInitAction extends BaseAction{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID :
	*/
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(null);
	}
	
	/**
	 * 直接跳转
	 */
	@Override
	public String directlyJump(){
		return "loginRest"; 
	}
	
	@Override
	public BaseDto getBaseDto() {
		return null;
	}

}

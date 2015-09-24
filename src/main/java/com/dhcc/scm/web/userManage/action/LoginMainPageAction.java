package com.dhcc.scm.web.userManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;

/**
 * 
* 标题: LoginMainPage.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年11月8日
* @version V1.0
 */
@Namespace(value="/")
@Scope("prototype")
@Action(value="index",results={
		@Result(name="loginMainPageResult" ,location="/WEB-INF/jsp/pms.jsp"),
		@Result(name="loginMainPageUIengine" ,location="/WEB-INF/jsp/UIengine.jsp")
		})
public class LoginMainPageAction extends BaseAction{

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
		if("loginMainPageUIengine".equals(super.getBusinessFlow())){
			return "loginMainPageUIengine";
		}
		
		return "loginMainPageResult"; 
	}
	
	@Override
	public BaseDto getBaseDto() {
		return null;
	}

}

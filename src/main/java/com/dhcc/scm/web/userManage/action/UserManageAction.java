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
 * 标题: sysMonStatistic.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月17日
 * @version V1.0 
 */
@Namespace(value="/userManage")
@Scope("prototype")
@Action(value="userManageCtrl",results={
		@Result(name="userManageMain",location="/WEB-INF/jsp/userManage/userManageMain.jsp"),
		@Result(name="flowStatistic",location="/WEB-INF/jsp/platformManage/flowStatistic.jsp")
})
public class UserManageAction extends BaseAction{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;

	@Override
	public BaseDto getBaseDto() {
		return null;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		
	}
	
	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow() 能得调用的方法，也就是URL中!后的方法名
	 */
	@Override
	public String directlyJump() {
		if ("userManageMain".equals(super.getBusinessFlow())) {
			return "userManageMain";
		}
		if ("flowStatistic".equals(super.getBusinessFlow())) {
			return "flowStatistic";
		}
		return null; // 返回null时不会跳转
	}

}

package com.dhcc.scm.web.userManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;


@Namespace(value="/")
@Scope("prototype")
@Action(value="nurseCtrl",results={
		@Result(name="nurseManageMain",location="/WEB-INF/jsp/nur/nurseMain.jsp"),
})
public class NurseManageAction extends BaseAction{

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
		if ("nurseManageMain".equals(super.getBusinessFlow())) {
			return "nurseManageMain";
		}
		return null; // 返回null时不会跳转
	}

}

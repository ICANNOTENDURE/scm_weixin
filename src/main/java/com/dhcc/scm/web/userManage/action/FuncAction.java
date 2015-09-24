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
import com.dhcc.scm.dto.userManage.FuncDto;

/**
 * 标题: FuncAction.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年8月29日
 * @version V1.0 
 */
@Namespace(value="/func")
@Scope("prototype")
@Action(value="funcCtrl",results={
		@Result(name="funcMain",location="/WEB-INF/jsp/userManage/func.jsp"),
		@Result(name="deleteFunc",location="/WEB-INF/jsp/userManage/func.jsp")
})
@Blh("funcBlh")
@JsonResult4Pojo("funcList,getFuncListBySystemType,getFuncsByAccount:funcDto.funcs;saveOrUpdateFunc,configOnly:funcDto;getSystemVersion:funcDto.systemVersions")
public class FuncAction extends BaseAction{
	
	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private FuncDto funcDto = new FuncDto();
	
	/**  
	 * @return funcDto 
	 */
	public FuncDto getFuncDto() {
		return funcDto;
	}

	/**  
	 * @param funcDto funcDto 
	 */
	public void setFuncDto(FuncDto funcDto) {
		this.funcDto = funcDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return funcDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(funcDto);
	}
	
	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow()能得调用的方法，也就是URL中!后的方法名
	 */
	@Override
	public String directlyJump() {
		if ("funcMain".equals(super.getBusinessFlow())) {
			return "funcMain";
		}
		return null;
	}

}

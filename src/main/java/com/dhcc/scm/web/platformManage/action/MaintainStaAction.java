package com.dhcc.scm.web.platformManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.platformManage.MaintainStaDto;

/**
 * <p>标题: MaintainStaAction.java</p>
 * <p>业务描述: 统一运维及安全管理平台</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年11月9日
 * @version V1.0 
 */
@Namespace(value="/maintainSta")
@Scope("prototype")
@Action(value="maintainStaCtrl", results={
	@Result(name="maintainStaMain", location="/WEB-INF/jsp/platformManage/maintainSta.jsp"),
	@Result(name="list", location="/WEB-INF/jsp/platformManage/maintain.jsp")
})
@Blh("maintainStaBlh")
public class MaintainStaAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private MaintainStaDto dto = new MaintainStaDto();

	/**
	 * 直接跳转
	 */
	@Override
	public String directlyJump(){
		//不走后台程序直接返回jsp
		if("maintainStaMain".equals(super.getBusinessFlow())){
			return "maintainStaMain";
		}
		return null; //返回null时不会跳转
	}
	
	@Override
	public BaseDto getBaseDto() {
		return dto;
	}

	/**
	 * 将页面请求过来的数据放到用户数据类中进行数据转换
	 */
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}
	
	public MaintainStaDto getDto() {
		return dto;
	}

	public void setDto(MaintainStaDto dto) {
		this.dto = dto;
	}
	
}

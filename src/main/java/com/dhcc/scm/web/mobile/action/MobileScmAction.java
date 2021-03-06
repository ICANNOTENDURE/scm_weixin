/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.mobile.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.mobile.MobileScmDto;

/**
 * 
 * @ClassName: MobileScmAction
 * @Description: TODO(pda调用scm(供应链平台)接口)
 * @author zhouxin
 * @date 2015年10月17日 下午5:03:32
 * 
 */
@Namespace(value = "/mobile")
@Scope("prototype")
@Action(value = "mobileScmCtrl")
@Blh("mobileScmBlh")
public class MobileScmAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private MobileScmDto dto = new MobileScmDto();

	@Override
	public String directlyJump() {
		return null;
	}

	
	@Override
	public BaseDto getBaseDto() {

		return dto;
	}

	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}

	public MobileScmDto getDto() {
		return dto;
	}

	public void setDto(MobileScmDto dto) {
		this.dto = dto;
	}

}

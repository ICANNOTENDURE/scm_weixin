/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.sys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.scm.blh.sys.SysMessageBlh;
import com.dhcc.scm.dto.sys.SysMessageDto;


@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "sysMessageCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/sys/SysMessage.jsp"),
		//@Result(name = "list", location = "/WEB-INF/jsp/sys/SysMessage.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/sys/SysMessage.jsp")})
@Blh("sysMessageBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.sysMessage"),
              @JResult(BlhMethod="listId",ognlExpress="dto"),
              @JResult(BlhMethod="save",ognlExpress="dto.sysMessageId")})
public class SysMessageAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private SysMessageDto dto = new SysMessageDto();
	
	private SysMessageBlh blh;
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		
		
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
	
	public SysMessageDto getDto() {
		return dto ;
	}
	
	public void setDto(SysMessageDto dto) {
		this.dto = dto;
	}

	/**
	 * @return the blh
	 */
	public SysMessageBlh getBlh() {
		return blh;
	}

	/**
	 * @param blh the blh to set
	 */
	public void setBlh(SysMessageBlh blh) {
		this.blh = blh;
	}

}

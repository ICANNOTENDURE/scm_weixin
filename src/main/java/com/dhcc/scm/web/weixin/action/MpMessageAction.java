/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.weixin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.annotation.MpOAuthRequired;
import com.dhcc.framework.annotation.MpOAuthRequireds;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.weixin.MpUserDto;

@Namespace(value = "/weixin")
@Scope("prototype")
@Action(value = "mpMessageCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/weixin/MpUser.jsp"),
		@Result(name = "mpListOrderDetail", location = "/WEB-INF/jsp/weixin/mpListOrderDetail.jsp"),
		@Result(name = "mpToDoTask", location = "/WEB-INF/jsp/weixin/mpToDoTask.jsp"),
		@Result(name = "mpSearchOrder", location = "/WEB-INF/jsp/weixin/mpSearchOrder.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/weixin/MpUser.jsp")})
@Blh("mpMessageBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.mpUser")})
@MpOAuthRequireds({@MpOAuthRequired(BlhMethod="mpToDoTask"),@MpOAuthRequired(BlhMethod="accpectOrder"),@MpOAuthRequired(BlhMethod="mpSearchOrder")})

public class MpMessageAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private MpUserDto dto = new MpUserDto();
	
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
	
	public MpUserDto getDto() {
		return dto ;
	}
	
	public void setDto(MpUserDto dto) {
		this.dto = dto;
	}

}

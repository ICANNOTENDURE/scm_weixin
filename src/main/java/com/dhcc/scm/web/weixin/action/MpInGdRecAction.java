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
import com.dhcc.framework.annotation.MpOAuthRequired;
import com.dhcc.framework.annotation.MpOAuthRequireds;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;

@Namespace(value = "/weixin")
@Scope("prototype")
@Action(value = "mpInGdRecCtrl", results = {
		@Result(name = "mpListInGdRecDetail", location = "/WEB-INF/jsp/weixin/mpListInGdRecDetail.jsp"),
		@Result(name = "mpListInGdRec", location = "/WEB-INF/jsp/weixin/mpListInGdRec.jsp"),
		@Result(name = "mpSearchIngdRec", location = "/WEB-INF/jsp/weixin/mpSearchInGdRec.jsp"),
		@Result(name = "noPermission", location = "/WEB-INF/jsp/weixin/noPermission.jsp"),
		@Result(name = "mpSubscribe", location = "/WEB-INF/jsp/weixin/mpSubscribe.jsp"),
		@Result(name = "mpInGdRec", location = "/WEB-INF/jsp/weixin/mpInGdRec.jsp")})
@Blh("mpInGdRecBlh")
@MpOAuthRequireds({@MpOAuthRequired(BlhMethod="mpInGdRec"),@MpOAuthRequired(BlhMethod="mpSearchIngdRec"),@MpOAuthRequired(BlhMethod="mpListInGdRec")})
public class MpInGdRecAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private MpInGdRecDto dto = new MpInGdRecDto();
	
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
	
	public MpInGdRecDto getDto() {
		return dto ;
	}
	
	public void setDto(MpInGdRecDto dto) {
		this.dto = dto;
	}

}

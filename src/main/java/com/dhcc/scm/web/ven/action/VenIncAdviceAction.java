/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ven.action;

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
import com.dhcc.scm.dto.ven.VenIncAdviceDto;


@Namespace(value = "/ven")
@Scope("prototype")
@Action(value = "venIncAdviceCtrl", results = {
		@Result(name = "vendReplayList", location = "/WEB-INF/jsp/venPortal/vendReplayList.jsp"),
		@Result(name = "nurReplayList", location = "/WEB-INF/jsp/nur/nurReplayList.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/ven/VenIncAdvice.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ven/VenIncAdvice.jsp")})
@Blh("venIncAdviceBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.venIncAdvice")})
public class VenIncAdviceAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private VenIncAdviceDto dto = new VenIncAdviceDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		if("vendReplayList".equals(super.getBusinessFlow())){
			return "vendReplayList";
		}
		if("nurReplayList".equals(super.getBusinessFlow())){
			return "nurReplayList";
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
	
	public VenIncAdviceDto getDto() {
		return dto ;
	}
	
	public void setDto(VenIncAdviceDto dto) {
		this.dto = dto;
	}

}

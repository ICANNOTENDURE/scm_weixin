/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hop.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.hop.HopIncLocDto;
import com.dhcc.scm.service.hop.HopIncLocService;


@Namespace(value = "/hop")
@Scope("prototype")
@Action(value = "hopIncLocCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/hop/HopIncLoc.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/hop/HopIncLoc.jsp")})
@Blh("hopIncLocBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hopIncLoc")})
public class HopIncLocAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private HopIncLocService hopIncLocService;
	
	private HopIncLocDto dto = new HopIncLocDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			hopIncLocService.list(dto);
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
	
	public HopIncLocDto getDto() {
		return dto ;
	}
	
	public void setDto(HopIncLocDto dto) {
		this.dto = dto;
	}

}

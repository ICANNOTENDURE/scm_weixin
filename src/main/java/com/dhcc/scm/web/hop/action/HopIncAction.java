/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hop.action;

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
import com.dhcc.scm.dto.hop.HopIncDto;


@Namespace(value = "/hop")
@Scope("prototype")
@Action(value = "hopIncCtrl", results = {
		@Result(name = "auditHopInc" ,location="/WEB-INF/jsp/hop/auditHopInc.jsp"),
		@Result(name = "listMain" ,location="/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "listInfo", location = "/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "getIncInfo", location = "/WEB-INF/jsp/hop/hopInc.jsp"),
		@Result(name = "getSubCatInfo", location = "/WEB-INF/jsp/hop/hopInc.jsp")
		})
@Blh("hopIncBlh")

@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hopInc")})
public class HopIncAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private HopIncDto dto = new HopIncDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		if("auditHopInc".equals(super.getBusinessFlow())){
			return "auditHopInc";
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
	
	public HopIncDto getDto() {
		return dto ;
	}
	
	public void setDto(HopIncDto dto) {
		this.dto = dto;
	}

}

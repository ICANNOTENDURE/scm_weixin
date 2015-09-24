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
import com.dhcc.scm.dto.hop.HopCtlocDto;


@Namespace(value = "/hop")
@Scope("prototype")
@Action(value = "hopCtlocCtrl", results = {
		@Result(name = "listMain", location = "/WEB-INF/jsp/hop/hopCtloc.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/hop/hopCtloc.jsp"),
		@Result(name = "listInfo", location = "/WEB-INF/jsp/hop/hopCtloc.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/hop/hopCtloc.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/hop/hopCtloc.jsp"),
		@Result(name = "getCtlocList", location = "/WEB-INF/jsp/hop/hopCtloc.jsp")
		})
@Blh("hopCtlocBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hopCtloc"),
			  @JResult(BlhMethod="findHopId",ognlExpress="dto"),
			  @JResult(BlhMethod="setDefaut",ognlExpress="dto")})
public class HopCtlocAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private HopCtlocDto dto = new HopCtlocDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if ("listMain".equals(super.getBusinessFlow())) {
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
	
	public HopCtlocDto getDto() {
		return dto ;
	}
	
	public void setDto(HopCtlocDto dto) {
		this.dto = dto;
	}

}

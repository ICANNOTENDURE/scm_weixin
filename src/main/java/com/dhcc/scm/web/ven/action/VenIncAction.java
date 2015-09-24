/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ven.action;

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
import com.dhcc.scm.dto.ven.VenIncDto;


@Namespace(value = "/ven")
@Scope("prototype")
@Action(value = "venIncCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/ven/VenInc.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ven/VenInc.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/ven/VenInc.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/ven/VenInc.jsp"),
		@Result(name = "getIncInfo", location = "/WEB-INF/jsp/ven/VenInc.jsp")		
		})
@Blh("venIncBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.venInc"),
			  @JResult(BlhMethod="saveContranst",ognlExpress="dto"),
			  @JResult(BlhMethod="saveContranstInc",ognlExpress="dto"),
			  @JResult(BlhMethod="updateContranstInc",ognlExpress="dto")
			 })
public class VenIncAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private VenIncDto dto = new VenIncDto();
	
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
	
	public VenIncDto getDto() {
		return dto ;
	}
	
	public void setDto(VenIncDto dto) {
		this.dto = dto;
	}

}

/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hv.action;

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
import com.dhcc.scm.dto.hv.HvLabelDto;


@Namespace(value = "/hv")
@Scope("prototype")
@Action(value = "hvLabelCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/hv/HvLabel.jsp"),
		@Result(name = "print", location = "/WEB-INF/jsp/hv/PrintHV.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/hv/HvLabel.jsp")})
@Blh("hvLabelBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hvLabel")})
public class HvLabelAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private HvLabelDto dto = new HvLabelDto();
	
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
	
	public HvLabelDto getDto() {
		return dto ;
	}
	
	public void setDto(HvLabelDto dto) {
		this.dto = dto;
	}

}

/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.cat.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.cat.CatPropertyDto;


@Namespace(value = "/cat")
@Scope("prototype")
@Action(value = "catPropertyCtrl", results = {
		@Result(name = "listMain", location = "/WEB-INF/jsp/cat/CatProperty.jsp")})
@Blh("catPropertyBlh")
public class CatPropertyAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private CatPropertyDto dto = new CatPropertyDto();
	
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
	
	public CatPropertyDto getDto() {
		return dto ;
	}
	
	public void setDto(CatPropertyDto dto) {
		this.dto = dto;
	}

}

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
import com.dhcc.scm.dto.cat.CatGroupPropertyDto;


@Namespace(value = "/cat")
@Scope("prototype")
@Action(value = "catGroupPropertyCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/cat/CatGroupProperty.jsp")})
@Blh("catGroupPropertyBlh")
public class CatGroupPropertyAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private CatGroupPropertyDto dto = new CatGroupPropertyDto();
	
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
	
	public CatGroupPropertyDto getDto() {
		return dto ;
	}
	
	public void setDto(CatGroupPropertyDto dto) {
		this.dto = dto;
	}

}

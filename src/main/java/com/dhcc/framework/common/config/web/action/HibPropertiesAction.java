package com.dhcc.framework.common.config.web.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.common.config.dto.PropertiesDto;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;

/**
 * @author daichao
 *
 */
@Namespace(value="/setup")
@Scope("prototype")
@Action(value="hibPropertiesCtrl",results={
		@Result(name="list" ,location="/WEB-INF/jsp/config/config.jsp")
})
@Blh("propertiesBlh")
@JsonResult("findById:dto.confItem")
public class HibPropertiesAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	PropertiesDto dto=new PropertiesDto();
	
	@Override
	public BaseDto getBaseDto() {
		
		//dto.setActionName("hibPropertiesCtrl");
		return dto;
	}

	@Override
	protected void prepareRequest(BusinessRequest businessRequest) throws BaseException {
		
		//dto.setActionName("hibPropertiesCtrl");
		businessRequest.setDto(dto);
	}
	
	@Override
	public String directlyJump() {
		
		if ("".equals(super.getBusinessFlow())) {
			dto.setActionName("hibPropertiesCtrl");
			return "list";
		}
		return null;
	}

	public PropertiesDto getDto() {
		return dto;
	}

	public void setDto(PropertiesDto dto) {
		this.dto = dto;
	}



	
}

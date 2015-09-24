package com.dhcc.framework.common.config.web.action;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.AlwaysJsonChk;
import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
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
@Action(value="propertiesCtrl",results={
		@Result(name="list" ,location="/WEB-INF/jsp/config/config.jsp"),
		@Result(name="config" ,location="/WEB-INF/jsp/config/config.jsp")
})
@Blh("propertiesBlh")
@AlwaysJsonChk
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.confItem",onlyAjax=false),
	@JResult(BlhMethod="invokeMethod",ognlExpress="dto.pageModel")})

public class PropertiesAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	PropertiesDto dto=new PropertiesDto();

	@Override
	public BaseDto getBaseDto() {
		
		//dto.setActionName("propertiesCtrl");
		return dto;
	}

	@Override
	protected void prepareRequest(BusinessRequest businessRequest) throws BaseException {
		
		//dto.setActionName("propertiesCtrl");
		businessRequest.setDto(dto);
	}
	
	@Override
	public String directlyJump() {
		
		//dto.setActionName("propertiesCtrl");
		if (super.getBusinessFlow()==null) {
			return "list";
		}else if("config".equals(super.getBusinessFlow())){
			return "config";
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

package com.dhcc.framework.common.log.logconfig.web.logconfig.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.common.log.logconfig.dto.logconfig.LogConfigDto;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;

@Namespace(value = "/logConfig")
@Scope("prototype")
@Action(value = "logConfigCtrl", results = {
		@Result(name="main" ,location="/WEB-INF/jsp/log/logconfig.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/log/logconfig.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/log/logconfig.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/log/logconfig.jsp")})

@Blh("logConfigBlh")
public class LogConfigAction extends BaseAction {	

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	private LogConfigDto dto = new LogConfigDto();
	
	@Override
	public String directlyJump() {
		if ("main".equals(super.getBusinessFlow())) {
			return "main";
		}
		return null;
	}
	
	public  String getDefaultBusinessFlow(){
		if(super.getBusinessFlow()==null){
			return "list" ;
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
	
	public LogConfigDto getDto() {
		return dto ;
	}
	
	public void setDto(LogConfigDto dto) {
		this.dto = dto;
	}

}


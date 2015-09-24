/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.sys.action;

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
import com.dhcc.scm.dto.sys.SendMailDto;


@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "sendMailCtrl", results = {
		@Result(name = "listMain", location = "/WEB-INF/jsp/sys/SendMail.jsp")})
@Blh("sendMailBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.impModel")})
public class SendMailAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;

	
	private SendMailDto dto = new SendMailDto();
	
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

	/**
	 * @return the dto
	 */
	public SendMailDto getDto() {
		return dto;
	}

	/**
	 * @param dto the dto to set
	 */
	public void setDto(SendMailDto dto) {
		this.dto = dto;
	}
	
	

}

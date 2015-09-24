/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.sys.action;

import javax.annotation.Resource;

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
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.service.sys.SysImpModelService;


@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "sysImpModelCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/sys/ImpModel.jsp"),
		@Result(name = "model", location = "/WEB-INF/jsp/sys/Model.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/sys/ImpModel.jsp")})
@Blh("sysImpModelBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.impModel"),
			 @JResult(BlhMethod="saveModel",ognlExpress="dto")	
			})
public class SysImpModelAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private SysImpModelService sysImpModelService;
	
	private SysImpModelDto dto = new SysImpModelDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		if("model".equals(super.getBusinessFlow())){
			dto.setImpModelList(null);
			dto.setImpModelList(sysImpModelService.getModelList(dto));
			return "model";
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
	
	public SysImpModelDto getDto() {
		return dto ;
	}
	
	public void setDto(SysImpModelDto dto) {
		this.dto = dto;
	}

}

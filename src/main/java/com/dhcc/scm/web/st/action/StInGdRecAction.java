/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.st.action;

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
import com.dhcc.scm.dto.st.StInGdRecDto;


@Namespace(value = "/st")
@Scope("prototype")
@Action(value = "stInGdRecCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/st/StInGdRec.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/st/StInGdRec.jsp")})
@Blh("stInGdRecBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.stInGdRec")})
public class StInGdRecAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private StInGdRecDto dto = new StInGdRecDto();
	
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
	
	public StInGdRecDto getDto() {
		return dto ;
	}
	
	public void setDto(StInGdRecDto dto) {
		this.dto = dto;
	}

}

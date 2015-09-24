/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.manf.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.scm.dto.manf.HopManfDto;


@Namespace(value = "/manf")
@Scope("prototype")
@Action(value = "hopManfCtrl", results = {
		@Result(name = "listMain", location = "/WEB-INF/jsp/manf/manf.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/manf/manf.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/manf/manf.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/manf/manf.jsp"),
		@Result(name = "getManfInfo", location = "/WEB-INF/jsp/hop/drugInfo.jsp")
		})
@Blh("hopManfBlh")
@JsonResult("findById:dto.hopManf")
public class HopManfAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private HopManfDto dto = new HopManfDto();
	
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
	
	public HopManfDto getDto() {
		return dto ;
	}
	
	public void setDto(HopManfDto dto) {
		this.dto = dto;
	}

}

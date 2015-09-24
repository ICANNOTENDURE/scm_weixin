/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.cat.action;

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
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.dto.cat.SubCatGroupDto;


@Namespace(value = "/cat")
@Scope("prototype")
@Action(value = "subCatGroupCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "listSubInfo", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "getSubCatInfo", location = "/WEB-INF/jsp/hop/hopInc.jsp")
})
@Blh("subCatGroupBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.subCatGroup")})
public class SubCatGroupAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private SubCatGroupDto dto = new SubCatGroupDto();
	
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
	
	public SubCatGroupDto getDto() {
		return dto ;
	}
	
	public void setDto(SubCatGroupDto dto) {
		this.dto = dto;
	}

}

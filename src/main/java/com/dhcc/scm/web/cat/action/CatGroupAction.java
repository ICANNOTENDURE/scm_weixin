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


@Namespace(value = "/cat")
@Scope("prototype")
@Action(value = "catGroupCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "group", location = "/WEB-INF/jsp/cat/Group.jsp"),
		@Result(name = "groupProperty", location = "/WEB-INF/jsp/cat/GroupProperty.jsp"),
		@Result(name = "save", location = "/WEB-INF/jsp/cat/CatGroup.jsp"),
		@Result(name = "delete", location = "/WEB-INF/jsp/cat/CatGroup.jsp")
})
@Blh("catGroupBlh")
@JsonResults(
		{@JResult(BlhMethod="findById",ognlExpress="dto.catGroup"),
		@JResult(BlhMethod="findHopId",ognlExpress="dto")})
public class CatGroupAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private CatGroupDto dto = new CatGroupDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		//大类祖维护
		if("group".equals(super.getBusinessFlow())){
			return "group";
		}
		//商品属性维护
		if("groupProperty".equals(super.getBusinessFlow())){
			return "groupProperty";
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
	
	public CatGroupDto getDto() {
		return dto ;
	}
	
	public void setDto(CatGroupDto dto) {
		this.dto = dto;
	}

}

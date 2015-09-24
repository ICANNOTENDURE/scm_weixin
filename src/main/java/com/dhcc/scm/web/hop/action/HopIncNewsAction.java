/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hop.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopIncNewsDto;


@Namespace(value = "/hop")
@Scope("prototype")
@Action(value = "hopIncNewsCtrl", results = {
		@Result(name = "hopIncNewsDetail", location = "/WEB-INF/jsp/hop/HopIncNewsDetail.jsp"),
		@Result(name = "listNewsMain", location = "/WEB-INF/jsp/hop/HopIncNewsList.jsp"),
		@Result(name = "operateResult", location = "/WEB-INF/jsp/common/operateResult.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/hop/HopIncNews.jsp")})
@Blh("hopIncNewsBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hopIncNews")})
public class HopIncNewsAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CommonService commonService;
	
	private HopIncNewsDto dto = new HopIncNewsDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		if("listNewsMain".equals(super.getBusinessFlow())){
			String userType=WebContextHolder.getContext().getUserInfo().getUserType().toString();
			dto.setUserType(userType);
			return "listNewsMain";
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
	
	public HopIncNewsDto getDto() {
		return dto ;
	}
	
	public void setDto(HopIncNewsDto dto) {
		this.dto = dto;
	}

}

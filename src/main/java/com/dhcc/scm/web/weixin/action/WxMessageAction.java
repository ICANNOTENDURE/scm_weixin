/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.weixin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.annotation.OAuthRequired;
import com.dhcc.framework.annotation.OAuthRequireds;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.weixin.WxMessageDto;


@Namespace(value = "/weixin")
@Scope("prototype")
@Action(value = "wxMessageCtrl", results = {
		@Result(name = "searchOrder", location = "/WEB-INF/jsp/weixin/SearchOrder.jsp"),
		@Result(name = "listToDoTask", location = "/WEB-INF/jsp/weixin/ToDoTask.jsp"),
		@Result(name = "authorizationUrl", location = "/WEB-INF/jsp/weixin/authorizationUrl.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/weixin/WxMessage.jsp"),
		@Result(name = "listWxMessage", location = "/WEB-INF/jsp/weixin/listWxMessage.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/weixin/WxMessage.jsp")})
@Blh("wxMessageBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.wxMessage")})
@OAuthRequireds({@OAuthRequired(BlhMethod="searchOrder"),@OAuthRequired(BlhMethod="listToDoTask")})
public class WxMessageAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private WxMessageDto dto = new WxMessageDto();
	
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
	
	public WxMessageDto getDto() {
		return dto ;
	}
	
	public void setDto(WxMessageDto dto) {
		this.dto = dto;
	}

}

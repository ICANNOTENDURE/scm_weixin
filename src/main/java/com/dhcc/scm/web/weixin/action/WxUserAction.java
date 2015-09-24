/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.weixin.action;

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
import com.dhcc.scm.dto.weixin.WxUserDto;


@Namespace(value = "/weixin")
@Scope("prototype")
@Action(value = "wxUserCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/weixin/WxUser.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/weixin/WxUser.jsp")})
@Blh("wxUserBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.wxUser")})
public class WxUserAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private WxUserDto dto = new WxUserDto();
	
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
	
	public WxUserDto getDto() {
		return dto ;
	}
	
	public void setDto(WxUserDto dto) {
		this.dto = dto;
	}

}

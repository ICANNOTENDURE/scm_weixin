/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.comment.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.MpOAuthRequired;
import com.dhcc.framework.annotation.MpOAuthRequireds;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.comment.CommentDto;
import com.dhcc.scm.service.hop.HopVendorService;


@Namespace(value = "/comment")
@Scope("prototype")
@Action(value = "CommentCtrl", results = {
		@Result(name = "venEval", location = "/WEB-INF/jsp/comments/venEval.jsp"),
		@Result(name = "venIncEval", location = "/WEB-INF/jsp/comments/venIncEval.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/comments/comment.jsp")})
@Blh("commentBlh")
@MpOAuthRequireds({@MpOAuthRequired(BlhMethod="saveMpEle")})
public class CommentAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;

	@Resource
	private CommonService commonService;
	
	@Resource
	private HopVendorService hopVendorService;
	
	private CommentDto dto = new CommentDto();
	
	@Override
	public String directlyJump() {
		//直接返回jsp

		if("venEval".equals(super.getBusinessFlow())){
			return "venEval";
		}
		if("venIncEval".equals(super.getBusinessFlow())){
			dto.setComboxVos(hopVendorService.getHopVenComboxVos(dto.getComgridparam()));
			return "venIncEval";
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
	public CommentDto getDto() {
		return dto;
	}

	/**
	 * @param dto the dto to set
	 */
	public void setDto(CommentDto dto) {
		this.dto = dto;
	}

	public CommonService getCommonService() {
		return commonService;
	}

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}
	
	

}

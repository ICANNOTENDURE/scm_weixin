/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.mobile.action;

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
import com.dhcc.scm.dto.mobile.MobileScmDto;

/**
 * 
 * @ClassName: MobileScmAction
 * @Description: TODO(pda调用scm(供应链平台)接口)
 * @author zhouxin
 * @date 2015年10月17日 下午5:03:32
 * 
 */
@Namespace(value = "/mobile")
@Scope("prototype")
@Action(value = "mobileScmCtrl", results = {
		@Result(name = "hopIncNewsDetail", location = "/WEB-INF/jsp/hop/HopIncNewsDetail.jsp"),
		@Result(name = "listNewsMain", location = "/WEB-INF/jsp/hop/HopIncNewsList.jsp"),
		@Result(name = "operateResult", location = "/WEB-INF/jsp/common/operateResult.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/hop/HopIncNews.jsp")})
@Blh("mobileScmBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.wxDepart")})
public class MobileScmAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private MobileScmDto dto = new MobileScmDto();

	@Override
	public String directlyJump() {
		if(super.getBusinessFlow().equals("hopIncNewsDetail")){
			return "hopIncNewsDetail";
			
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

	public MobileScmDto getDto() {
		return dto;
	}

	public void setDto(MobileScmDto dto) {
		this.dto = dto;
	}

}

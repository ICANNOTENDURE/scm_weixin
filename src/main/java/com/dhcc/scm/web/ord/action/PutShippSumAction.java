/**
 * 
 */
package com.dhcc.scm.web.ord.action;

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
import com.dhcc.scm.dto.ord.PutShippSumDto;

/**
 * @author Administrator
 *
 */
@Namespace(value = "/ord")
@Scope("prototype")
@Action(value = "putShippSumCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/ord/PutShippSum.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ord/PutShippSum.jsp")})
@Blh("putShippSumBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.putShippSum")})
public class PutShippSumAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private PutShippSumDto dto =new PutShippSumDto();
	
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
		// TODO Auto-generated method stub
		return dto;
	}

	/* (non-Javadoc)
	 * @see com.dhcc.framework.web.BaseAction#prepareRequest(com.dhcc.framework.transmission.event.BusinessRequest)
	 */
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		// TODO Auto-generated method stub
		reqEvent.setDto(dto);
	}
	
	public PutShippSumDto getDto() {
		return dto;
	}

	public void setDto(PutShippSumDto dto) {
		this.dto = dto;
	}
	
	

}

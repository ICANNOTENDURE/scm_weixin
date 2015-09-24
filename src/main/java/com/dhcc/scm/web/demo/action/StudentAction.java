/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.demo.action;

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
import com.dhcc.scm.dto.demo.StudentDto;


@Namespace(value = "/demo")
@Scope("prototype")
@Action(value = "studentCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/demo/Student.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/demo/Student.jsp")})
@Blh("studentBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.student")})
public class StudentAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private StudentDto dto = new StudentDto();
	
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
	
	public StudentDto getDto() {
		return dto ;
	}
	
	public void setDto(StudentDto dto) {
		this.dto = dto;
	}

}

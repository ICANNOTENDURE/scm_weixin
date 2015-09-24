package com.dhcc.scm.web.sys.action;

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
import com.dhcc.scm.dto.sys.TaskConfigDto;

@Namespace(value = "/sys")
@Scope("prototype")
@Action(value = "TaskConfigCtrl", results = {@Result(name = "listMain", location = "/WEB-INF/jsp/sys/TaskConfig.jsp")})
@Blh("taskConfigBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.taskConfig")})
public class TaskConfigAction extends BaseAction {

	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private TaskConfigDto dto = new TaskConfigDto();
	
	@Override
	public String directlyJump() {
		// TODO Auto-generated method stub
		if ("listMain".equals(super.getBusinessFlow())) {
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
	
	public TaskConfigDto getDto() {
		return dto ;
	}
	
	public void setDto(TaskConfigDto dto) {
		this.dto = dto;
	}

}

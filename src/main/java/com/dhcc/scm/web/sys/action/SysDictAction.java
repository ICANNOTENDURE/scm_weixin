package com.dhcc.scm.web.sys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.sys.SysDictDto;

/**
 * <p>标题: SysDictAction.java</p>
 * <p>业务描述:SysDictAction</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author daic
 * @date 2013年12月3日
 * @version V1.0 
 */
@Namespace(value="/sys")
@Scope("prototype")
@Action(value="sysDictCtrl",results={
		@Result(name="listMain" ,location="/WEB-INF/jsp/sys/dic.jsp"),
		@Result(name="list" ,location="/WEB-INF/jsp/sys/dic.jsp"),
		@Result(name="save" ,location="/WEB-INF/jsp/sys/dic.jsp"),
		@Result(name="delete" ,location="/WEB-INF/jsp/sys/dic.jsp"),
//		@Result(name="delete" ,location="/WEB-INF/jsp/demo/demo.jsp"),
//		@Result(name="index" ,location="/index.jsp")
})
@Blh("sysDictBlh")
@JsonResult("findById:dto.sysDict")
public class SysDictAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	//SysDictDto用于数据的传递
	private SysDictDto dto=new SysDictDto();
	@Override
	public BaseDto getBaseDto() {
		return dto;
	}

	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		return null;
	}
	
	/**
	 * 将页面请求过来的数据放到用户数据类中进行数据转换
	 */
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}

	public SysDictDto getDto() {
		return dto;
	}

	public void setDto(SysDictDto dto) {
		this.dto = dto;
	}

}

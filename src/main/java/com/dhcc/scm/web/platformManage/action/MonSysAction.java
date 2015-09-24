package com.dhcc.scm.web.platformManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.platformManage.MonSysDto;

/**
 * <p>标题: AppLogAction.java</p>
 * <p>业务描述:应用日志Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月5日
 * @version V1.0 
 */
@Namespace(value="/monitor")
@Scope("prototype")
@Action(value="monSysCtrl", results={
		@Result(name="list" ,location="/WEB-INF/jsp/platformManage/sysMonStatistic.jsp")
		})
@Blh("monSysBlh")
@JsonResult4Pojo("list:dto.monSys") //不带类型名，页面查询使用
public class MonSysAction extends BaseAction{

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID :
	*/
	private static final long serialVersionUID = 1L;
	
	private MonSysDto dto = new MonSysDto();
	
	/**
	 * 直接跳转
	 */
	@Override
	public String directlyJump(){
		return null;
	}
	
	@Override
	public BaseDto getBaseDto() {
		return dto;
	}

	/**
	 * 将页面请求过来的数据放到用户数据类中进行数据转换
	 */
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}
	
	public MonSysDto getDto() {
		return dto;
	}

	public void setDto(MonSysDto dto) {
		this.dto = dto;
	}
	
}

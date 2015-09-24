package com.dhcc.scm.web.platformManage.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.platformManage.SysMonitoringDto;

/**
 * 标题: SysMonitoringAction.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年11月27日
 * @version V1.0 
 */
@Namespace(value="/monitor")
@Scope("prototype")
@Action(value="sysMonitoringCtrl",results={
		@Result(name="getSystemInfo",location="/WEB-INF/jsp/platformManage/sysMonStatistic.jsp")
})
@Blh("sysMonitoringBlh")
public class SysMonitoringAction extends BaseAction{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	SysMonitoringDto sysMonitoringDto = new SysMonitoringDto();
	
	/**  
	 * @return sysMonitoringDto 
	 */
	public SysMonitoringDto getSysMonitoringDto() {
		return sysMonitoringDto;
	}

	/**  
	 * @param sysMonitoringDto sysMonitoringDto 
	 */
	public void setSysMonitoringDto(SysMonitoringDto sysMonitoringDto) {
		this.sysMonitoringDto = sysMonitoringDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return sysMonitoringDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(sysMonitoringDto);
	}
	
	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow() 能得调用的方法，也就是URL中!后的方法名
	 */
	@Override
	public String directlyJump() {
		return null; // 返回null时不会跳转
	}
	
	

}

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
import com.dhcc.scm.dto.platformManage.GatewayDto;

/**
 * <p>标题: GatewayAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  应用系统安装配置管理Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月5日
 * @version V1.0 
 */
@Namespace(value="/appSystemConfig")
@Scope("prototype")
@Action(value="appSystemConfigCtrl", results={
	@Result(name="appSystemConfigMain", location="/WEB-INF/jsp/platformManage/appSystemConfig.jsp"),
	@Result(name="gatewayList", location="/WEB-INF/jsp/platformManage/appSystemConfig.jsp"),
	@Result(name="saveOrUpdate", location="/WEB-INF/jsp/platformManage/appSystemConfig.jsp"),
	@Result(name="delGateway", location="/WEB-INF/jsp/platformManage/appSystemConfig.jsp")
})
@Blh("gatewayBlh")
//@JsonResult("gatewayList:gatewayDto.gatewayVo")
public class AppSystemConfigAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private GatewayDto gatewayDto = new GatewayDto();
	

	/**  
	 * @return gatewayDto 
	 */
	public GatewayDto getGatewayDto() {
		return gatewayDto;
	}

	/**  
	 * @param gatewayDto gatewayDto 
	 */
	public void setGatewayDto(GatewayDto gatewayDto) {
		this.gatewayDto = gatewayDto;
	}

	/* (非 Javadoc)   
	* <p>Title: directlyJump</p>   
	* <p>Description: </p>   
	* @return   
	* @see com.dhcc.framework.web.BaseAction#directlyJump()   
	*/
	@Override
	public String directlyJump() {
		// TODO Auto-generated method stub
		if ("appSystemConfigMain".equals(super.getBusinessFlow())) {
			return "appSystemConfigMain";
		}
		return null;
	}

	/* (非 Javadoc)   
	* <p>Title: getBaseDto</p>   
	* <p>Description: </p>   
	* @return   
	* @see com.dhcc.framework.web.BaseAction#getBaseDto()   
	*/
	@Override
	public BaseDto getBaseDto() {
		// TODO Auto-generated method stub
		return gatewayDto;
	}

	/* (非 Javadoc)   
	* <p>Title: prepareRequest</p>   
	* <p>Description: </p>   
	* @param arg0
	* @throws BaseException   
	* @see com.dhcc.framework.web.BaseAction#prepareRequest(com.dhcc.framework.transmission.event.BusinessRequest)   
	*/
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		// TODO Auto-generated method stub
		reqEvent.setDto(gatewayDto);
	}
	
}

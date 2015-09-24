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
import com.dhcc.scm.dto.platformManage.RsPriorityDto;

/**
 * <p>标题: RsConfigAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  数据接收服务器配置管理Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年10月8日
 * @version V1.0 
 */
@Namespace(value="/receiveServerConfig")
@Scope("prototype")
@Action(value="receiveServerConfigCtrl", results={
	@Result(name="receiveServerConfigMain", location="/WEB-INF/jsp/platformManage/rsConfig.jsp"),
	@Result(name="findRsPriorityList", location="/WEB-INF/jsp/platformManage/rsConfig.jsp")
})
@Blh("rsPriorityBlh")
public class ReceiveServerConfigAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private RsPriorityDto rsPriorityDto = new RsPriorityDto();

	/**  
	 * @return rsPriorityDto 
	 */
	public RsPriorityDto getRsPriorityDto() {
		return rsPriorityDto;
	}

	/**  
	 * @param rsPriorityDto rsPriorityDto 
	 */
	public void setRsPriorityDto(RsPriorityDto rsPriorityDto) {
		this.rsPriorityDto = rsPriorityDto;
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
		if ("receiveServerConfigMain".equals(super.getBusinessFlow())) {
			return "receiveServerConfigMain";
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
		return rsPriorityDto;
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
		reqEvent.setDto(rsPriorityDto);
	}
	
}

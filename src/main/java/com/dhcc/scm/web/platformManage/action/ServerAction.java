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
import com.dhcc.scm.dto.platformManage.ServerDto;

/**
 * <p>标题: ServerAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器管理Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月22日
 * @version V1.0 
 */
@Namespace(value="/server")
@Scope("prototype")
@Action(value="serverCtrl", results={
	@Result(name="serverMain", location="/WEB-INF/jsp/platformManage/server.jsp"),
	@Result(name="serverTopoMode",  location="/WEB-INF/jsp/platformManage/serverTopoMode.jsp"),
	@Result(name="serverGraphMode", location="/WEB-INF/jsp/platformManage/serverGraphMode.jsp"),
	@Result(name="serverListMode", location="/WEB-INF/jsp/platformManage/serverListMode.jsp"),
	@Result(name="serverRegister", location="/WEB-INF/jsp/platformManage/server.jsp"),
	@Result(name="delServer", location="/WEB-INF/jsp/platformManage/serverListMode.jsp")
})
@Blh("serverBlh")
@JsonResult4Pojo("getServerGraph:serverDto.serverVos;getSystemVersion:serverDto.systemVersions")
public class ServerAction  extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private ServerDto serverDto = new ServerDto();

	/**  
	 * @return serverDto 
	 */
	public ServerDto getServerDto() {
		return serverDto;
	}

	/**  
	 * @param serverDto serverDto 
	 */
	public void setServerDto(ServerDto serverDto) {
		this.serverDto = serverDto;
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
		if ("serverMain".equals(super.getBusinessFlow())) {
			return "serverMain";
		} else if ("serverTopoMode".equals(super.getBusinessFlow())) {
			return "serverTopoMode";
		} else if ("serverGraphMode".equals(super.getBusinessFlow())) {
			return "serverGraphMode";
		} else if ("serverListMode".equals(super.getBusinessFlow())) {
			return "serverListMode";
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
		return serverDto;
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
		reqEvent.setDto(serverDto);
	}
	
}

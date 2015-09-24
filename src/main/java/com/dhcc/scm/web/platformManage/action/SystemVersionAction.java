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
import com.dhcc.scm.dto.platformManage.SystemVersionDto;

/**
 * <p>标题: SystemVersionAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本管理Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Namespace(value="/systemVersion")
@Scope("prototype")
@Action(value="systemVersionCtrl", results={
		@Result(name="systemVersionMain", location="/WEB-INF/jsp/platformManage/systemVersion.jsp"),
		@Result(name="saveOrUpdate", location="/WEB-INF/jsp/platformManage/systemVersion.jsp"),
		@Result(name="getSystemVersionCatalog", location="/WEB-INF/jsp/platformManage/systemVersion.jsp")
})
@Blh("systemVersionBlh")
@JsonResult4Pojo("getSystemVersionCatalog:systemVersionDto.systemVersions;saveOrUpdate:systemVersionDto")
public class SystemVersionAction extends BaseAction {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private SystemVersionDto systemVersionDto = new SystemVersionDto();

	/**  
	 * @return systemVersionDto 
	 */
	public SystemVersionDto getSystemVersionDto() {
		return systemVersionDto;
	}

	/**  
	 * @param systemVersionDto systemVersionDto 
	 */
	public void setSystemVersionDto(SystemVersionDto systemVersionDto) {
		this.systemVersionDto = systemVersionDto;
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
		if ("systemVersionMain".equals(super.getBusinessFlow())) {
			return "systemVersionMain";
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
		return systemVersionDto;
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
		reqEvent.setDto(systemVersionDto);
	}
	

}

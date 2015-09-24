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
import com.dhcc.scm.dto.platformManage.MaintainDto;

/**
 * <p>标题: MaintainAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月18日
 * @version V1.0 
 */
@Namespace(value="/maintain")
@Scope("prototype")
@Action(value="maintainCtrl", results={
	@Result(name="maintainMain", location="/WEB-INF/jsp/platformManage/maintain.jsp"),
	@Result(name="saveOrUpdate", location="/WEB-INF/jsp/platformManage/maintain.jsp"),
	@Result(name="delMaintain", location="/WEB-INF/jsp/platformManage/maintain.jsp")
})
@Blh("maintainBlh")
@JsonResult4Pojo("list:maintainDto.maintain")
public class MaintainAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private MaintainDto maintainDto = new MaintainDto();

	/**  
	 * @return maintainDto 
	 */
	public MaintainDto getMaintainDto() {
		return maintainDto;
	}

	/**  
	 * @param maintainDto maintainDto 
	 */
	public void setMaintainDto(MaintainDto maintainDto) {
		this.maintainDto = maintainDto;
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
		if ("maintainMain".equals(super.getBusinessFlow())) {
			return "maintainMain";
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
		return maintainDto;
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
		reqEvent.setDto(maintainDto);
	}
	
}

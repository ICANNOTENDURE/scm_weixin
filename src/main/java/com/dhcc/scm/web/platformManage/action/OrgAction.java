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
import com.dhcc.scm.dto.platformManage.OrgDto;

/**
 * <p>标题: OrgAction.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构管理Action</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月18日
 * @version V1.0 
 */
@Namespace(value="/org")
@Scope("prototype")
@Action(value="orgCtrl", results={
	@Result(name="orgMain", location="/WEB-INF/jsp/platformManage/org.jsp"),
	@Result(name="orgList", location="/WEB-INF/jsp/platformManage/org.jsp"),
	@Result(name="saveOrUpdate", location="/WEB-INF/jsp/platformManage/org.jsp"),
	@Result(name="delOrg", location="/WEB-INF/jsp/platformManage/org.jsp"),
})
@Blh("orgBlh")
public class OrgAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private OrgDto orgDto = new OrgDto();

	/**  
	 * @return orgDto 
	 */
	public OrgDto getOrgDto() {
		return orgDto;
	}

	/**  
	 * @param orgDto orgDto 
	 */
	public void setOrgDto(OrgDto orgDto) {
		this.orgDto = orgDto;
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
		if ("orgMain".equals(super.getBusinessFlow())) {
			return "orgMain";
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
		return orgDto;
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
		reqEvent.setDto(orgDto);
	}
	
}

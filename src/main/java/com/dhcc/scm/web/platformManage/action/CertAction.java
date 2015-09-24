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
import com.dhcc.scm.dto.platformManage.CertDto;

/**
 * 
* 标题: CertAction.java
* 业务描述：安全运维管理平台
* 公司:东华软件股份公司
* 版权:dhcc2013
* @author 聂文来
* @date 2013年10月21日
* @version V1.0
 */
@Namespace(value="/cert")
@Scope("prototype")
@Action(value="certCtrl", results={
		@Result(name="certMain", location="/WEB-INF/jsp/platformManage/cert.jsp"),
		@Result(name="certList", location="/WEB-INF/jsp/platformManage/cert.jsp"),
		@Result(name="saveOrUpdate", location="/WEB-INF/jsp/platformManage/cert.jsp"),
		@Result(name="delCert", location="/WEB-INF/jsp/platformManage/cert.jsp"),
		@Result(name="deleteCertKey", location="/WEB-INF/jsp/platformManage/cert.jsp")
})
@Blh("certBlh")
public class CertAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private CertDto certDto = new CertDto();

	/**  
	 * @return certDto 
	 */
	public CertDto getCertDto() {
		return certDto;
	}

	/**  
	 * @param certDto certDto 
	 */
	public void setCertDto(CertDto certDto) {
		this.certDto = certDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return certDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(certDto);
	}

	@Override
	public String directlyJump() {
		if ("certMain".equals(super.getBusinessFlow())) {
			return "certMain";
		}
		return null;
	}	
	
}

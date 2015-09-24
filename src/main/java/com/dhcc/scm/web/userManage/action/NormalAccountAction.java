package com.dhcc.scm.web.userManage.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.service.ven.VendorService;

/**
 * 标题: NormalAccountAction.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */
@Namespace(value="/normalAccount")
@Scope("prototype")
@Action(value="normalAccountCtrl",results={
		@Result(name="normalAccountMain",location="/WEB-INF/jsp/userManage/normalAccount.jsp"),
		@Result(name="editInfo",location="/WEB-INF/jsp/userManage/editAccount.jsp"),
		@Result(name="editInfoVen",location="/WEB-INF/jsp/userManage/editVen.jsp"),
		@Result(name="normalAccountList",location="/WEB-INF/jsp/userManage/normalAccount.jsp"),
		@Result(name="deleteNormalAccount",location="/WEB-INF/jsp/userManage/normalAccount.jsp"),
		@Result(name="editPassword",location="/WEB-INF/jsp/userManage/password.jsp")
})
@JsonResult4Pojo("saveInfo:normalAccountDto;getUserInfo:normalAccountDto;getNormalAccountRole:normalAccountDto.roles;saveOrUpdateNormalAccount,saveNormalAccountRole:normalAccountDto;getNormalAccountFunc:normalAccountDto.funcs;updatePassword:normalAccountDto")
public class NormalAccountAction extends BaseAction{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	
	@Resource
	private CommonService commonService;
	@Resource
	private VendorService vendorService;
	
	private NormalAccountDto normalAccountDto = new NormalAccountDto();
	
	private VendorDto dto=new VendorDto();
	
	
	
	/**
	 * @return the dto
	 */
	public VendorDto getDto() {
		return dto;
	}

	/**
	 * @param dto the dto to set
	 */
	public void setDto(VendorDto dto) {
		this.dto = dto;
	}

	/**  
	 * @return normalAccountDto 
	 */
	public NormalAccountDto getNormalAccountDto() {
		return normalAccountDto;
	}

	/**  
	 * @param normalAccountDto normalAccountDto 
	 */
	public void setNormalAccountDto(NormalAccountDto normalAccountDto) {
		this.normalAccountDto = normalAccountDto;
	}

	@Override
	public BaseDto getBaseDto() {
		return normalAccountDto;
	}

	@Override
	protected void prepareRequest(BusinessRequest arg0) throws BaseException {
		arg0.setDto(normalAccountDto);
	}
	
	/**
	 * 有时候不走后台，只要页面跳成时，复写这个父类方法， super.getBusinessFlow() 能得调用的方法，也就是URL中!后的方法名
	 */
	@Override
	public String directlyJump() {
		if ("normalAccountMain".equals(super.getBusinessFlow())) {
			return "normalAccountMain";
		}
		if ("editInfo".equals(super.getBusinessFlow())) {
			Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
			if(type.toString().equals("1")){
				return "editInfo";
			}
			if(type.toString().equals("2")){
				return "editInfoVen";
			}
			
		}
		if ("editPassword".equals(super.getBusinessFlow())) {
			return "editPassword";
		}
		return null;
	}
	
	

}

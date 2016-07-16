/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ven.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.service.ven.VendorService;

@Namespace(value = "/ven")
@Scope("prototype")
@Action(value = "vendorCtrl", results = {
		@Result(name = "vendorHvInvNo", location = "/WEB-INF/jsp/venPortal/vendorHvInvNo.jsp"),
		@Result(name = "vendorImpInv", location = "/WEB-INF/jsp/venPortal/vendorImpInv.jsp"),
		@Result(name = "vendReplayAdvice", location = "/WEB-INF/jsp/venPortal/vendReplayAdvice.jsp"),
		@Result(name = "editinfo", location = "/WEB-INF/jsp/venPortal/editinfo.jsp"),
		@Result(name = "vendorReciveOrd", location = "/WEB-INF/jsp/venPortal/VendorReciveOrd.jsp"),
		@Result(name = "vendorSendOrd", location = "/WEB-INF/jsp/venPortal/VendorSendOrd.jsp"),
		@Result(name = "vendorPrintOrd", location = "/WEB-INF/jsp/venPortal/vendorPrintOrd.jsp"),
		@Result(name = "vendorInc", location = "/WEB-INF/jsp/venPortal/vendorInc.jsp"),
		@Result(name = "list", location = "/WEB-INF/jsp/ven/Vendor.jsp"),
		@Result(name = "add", location = "/WEB-INF/jsp/ven/add.jsp"),
		@Result(name = "update", location = "/WEB-INF/jsp/ven/update.jsp"),
		@Result(name = "upload", location = "/WEB-INF/jsp/ven/22.jsp"),
		@Result(name = "contranstInc", location = "/WEB-INF/jsp/ven/ContranstInc2.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ven/Vendor.jsp") })
@Blh("vendorBlh")
@JsonResults({@JResult(BlhMethod="save",ognlExpress="dto")})
public class VendorAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CommonService commonService;
	
	
	@Resource
	private VendorService vendorService;
	
	private VendorDto dto = new VendorDto();

	@Override
	public String directlyJump() {
		if("add".equals(super.getBusinessFlow())){
			dto.setVenQualifTypeList(commonService.getAll(VenQualifType.class,"seq",true));
			return "add";
		}
		if("update".equals(super.getBusinessFlow())){
			dto.setVendor(commonService.get(Vendor.class, dto.getVendor().getVendorId()));
			dto.setVenQualifTypeVOList(vendorService.queryQualifyType(dto));
			return "update";
		}
		if("contranstInc".equals(super.getBusinessFlow())){
			return "contranstInc";
		}
		if("ContranstVendor".equals(super.getBusinessFlow())){
			return "ContranstVendor";
		}
		if("editinfo".equals(super.getBusinessFlow())){
			return "editinfo";
		}
		if("vendorReciveOrd".equals(super.getBusinessFlow())){
			return "vendorReciveOrd";
		}
		if("vendorSendOrd".equals(super.getBusinessFlow())){
			return "vendorSendOrd";
		}
		if("vendorInc".equals(super.getBusinessFlow())){
			return "vendorInc";
		}
		if("vendReplayAdvice".equals(super.getBusinessFlow())){
			return "vendReplayAdvice";
		}
		//打印发货单
		if("vendorPrintOrd".equals(super.getBusinessFlow())){
			return "vendorPrintOrd";
		}
		//导入发票
		if("vendorImpInv".equals(super.getBusinessFlow())){
			return "vendorImpInv";
		}
		//高值录入发票
		if("vendorHvInvNo".equals(super.getBusinessFlow())){
			return "vendorHvInvNo";
		}
		return null;
	}

	@Override
	public BaseDto getBaseDto() {

		return dto;
	}

	@Override
	protected void prepareRequest(BusinessRequest reqEvent)
			throws BaseException {
		
		reqEvent.setDto(dto);
	}

	public VendorDto getDto() {
		return dto;
	}

	public void setDto(VendorDto dto) {
		this.dto = dto;
	}



}

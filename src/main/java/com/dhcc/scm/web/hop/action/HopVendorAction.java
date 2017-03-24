/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.hop.action;

import java.util.List;

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
import com.dhcc.scm.dto.hop.HopVendorDto;
import com.dhcc.scm.entity.hop.HopVendorLog;
import com.dhcc.scm.entity.ven.Vendor;


@Namespace(value = "/hop")
@Scope("prototype")
@Action(value = "hopVendorCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/hop/HopVendor.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/hop/HopVendor.jsp"),
		@Result(name = "listDetail", location = "/WEB-INF/jsp/hop/HopVendorDetail.jsp"),
		@Result(name = "HistoryDetail", location = "/WEB-INF/jsp/hop/HistoryDetail.jsp"),
		@Result(name = "HopAuditVendor", location = "/WEB-INF/jsp/hop/HopAuditVendor.jsp"),
		@Result(name = "ContranstVendor", location = "/WEB-INF/jsp/hop/ContranstVendor.jsp"),
		@Result(name = "HopContranstVendor", location = "/WEB-INF/jsp/hop/HopContranstVendor.jsp")})	
@Blh("hopVendorBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.hopVendor"),
			  @JResult(BlhMethod="contranstVendor",ognlExpress="dto"),
			  @JResult(BlhMethod="hopAuditFLag",ognlExpress="dto"),
			  @JResult(BlhMethod="autoContrast",ognlExpress="dto"),
			  @JResult(BlhMethod="auditFLag",ognlExpress="dto")})
public class HopVendorAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private HopVendorDto dto = new HopVendorDto();
	
	@Resource
	private CommonService commonService;
	
	private Long venodrId;
	
	private Vendor vendor;

	private List<HopVendorLog> hopVendorLogs;
	
	/**
	 * @return the hopVendorLogs
	 */
	public List<HopVendorLog> getHopVendorLogs() {
		return hopVendorLogs;
	}

	/**
	 * @param hopVendorLogs the hopVendorLogs to set
	 */
	public void setHopVendorLogs(List<HopVendorLog> hopVendorLogs) {
		this.hopVendorLogs = hopVendorLogs;
	}
	
	/**
	 * @return the venodrId
	 */
	public Long getVenodrId() {
		return venodrId;
	}

	/**
	 * @param venodrId the venodrId to set
	 */
	public void setVenodrId(Long venodrId) {
		this.venodrId = venodrId;
	}
	
	
	
	
	/**
	 * @return the vendor
	 */
	public Vendor getVendor() {
		return vendor;
	}

	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		//直接返回jsp
		if("listDetail".equals(super.getBusinessFlow())){
			return "listDetail";
		}
		//直接返回jsp
		if("ContranstVendor".equals(super.getBusinessFlow())){
			return "ContranstVendor";
		}
		//直接返回jsp hxy
		if("HopAuditVendor".equals(super.getBusinessFlow())){
			return "HopAuditVendor";
		}
		//直接返回jsp 
		if("HopContranstVendor".equals(super.getBusinessFlow())){
			return "HopContranstVendor";
		}
		//直接返回jsp
		if("HistoryDetail".equals(super.getBusinessFlow())){
			vendor=commonService.get(Vendor.class, venodrId);
			hopVendorLogs=commonService.findByProperty(HopVendorLog.class, "vendorId", venodrId);
			return "HistoryDetail";
		}
		return null;
	}
	
	@Override
	public BaseDto getBaseDto() {

		return dto;
	}
	
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {

		reqEvent.setDto(dto);
	}
	
	public HopVendorDto getDto() {
		return dto ;
	}
	
	public void setDto(HopVendorDto dto) {
		this.dto = dto;
	}

}

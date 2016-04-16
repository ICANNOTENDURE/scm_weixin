/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;

import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ven.ShowVenIncVo;
import com.dhcc.scm.entity.vo.ven.VenIncVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.vo.ws.VenIncWeb;

public class VenIncDto extends BaseDto {
	
	private static final long serialVersionUID = 1L;
	private VenInc venInc;
	
	private VenIncContranstDto venIncContranstDto;
	
	//供应商药品列表
	private List<VenIncVo> venIncVos;
	
	private List<ShowVenIncVo> showVenIncVos;
	
	
	private VenHopInc venHopInc;
	
	
	private String comgridparam;
	
	private List<VenInc> venIncs;
	
	
	private File upload;
	
	private  OperateResult operateResult;
	
	
	private VenIncWeb venIncWeb;
	
	private List<String> propertys;
	
	// 封装上传文件名的属性  
	private String uploadFileName;

	
	private String auditFlag;
	
	private String idStr;
	
	private String auditContent;
	
	
	
	public String getAuditFlag() {
		return auditFlag;
	}


	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
	}


	public String getIdStr() {
		return idStr;
	}


	public void setIdStr(String idStr) {
		this.idStr = idStr;
	}


	public String getAuditContent() {
		return auditContent;
	}


	public void setAuditContent(String auditContent) {
		this.auditContent = auditContent;
	}


	/**
	 * @return the uploadFileName
	 */
	public String getUploadFileName() {
		return uploadFileName;
	}


	/**
	 * @param uploadFileName the uploadFileName to set
	 */
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public List<String> getPropertys() {
		return propertys;
	}


	public void setPropertys(List<String> propertys) {
		this.propertys = propertys;
	}


	/**
	 * @return the venIncWeb
	 */
	public VenIncWeb getVenIncWeb() {
		return venIncWeb;
	}


	/**
	 * @param venIncWeb the venIncWeb to set
	 */
	public void setVenIncWeb(VenIncWeb venIncWeb) {
		this.venIncWeb = venIncWeb;
	}


	/**
	 * @return the operateResult
	 */
	public OperateResult getOperateResult() {
		return operateResult;
	}


	/**
	 * @param operateResult the operateResult to set
	 */
	public void setOperateResult(OperateResult operateResult) {
		this.operateResult = operateResult;
	}


	/**
	 * @return the upload
	 */
	public File getUpload() {
		return upload;
	}


	/**
	 * @param upload the upload to set
	 */
	public void setUpload(File upload) {
		this.upload = upload;
	}


	/**
	 * @return the venIncs
	 */
	public List<VenInc> getVenIncs() {
		return venIncs;
	}


	/**
	 * @param venIncs the venIncs to set
	 */
	public void setVenIncs(List<VenInc> venIncs) {
		this.venIncs = venIncs;
	}


	/**
	 * @return the comgridparam
	 */
	public String getComgridparam() {
		return comgridparam;
	}


	/**
	 * @param comgridparam the comgridparam to set
	 */
	public void setComgridparam(String comgridparam) {
		this.comgridparam = comgridparam;
	}


	/**
	 * @return the venHopInc
	 */
	public VenHopInc getVenHopInc() {
		return venHopInc;
	}


	/**
	 * @param venHopInc the venHopInc to set
	 */
	public void setVenHopInc(VenHopInc venHopInc) {
		this.venHopInc = venHopInc;
	}


	/**
	 * @return the venIncContranstDto
	 */
	public VenIncContranstDto getVenIncContranstDto() {
		return venIncContranstDto;
	}


	/**
	 * @param venIncContranstDto the venIncContranstDto to set
	 */
	public void setVenIncContranstDto(VenIncContranstDto venIncContranstDto) {
		this.venIncContranstDto = venIncContranstDto;
	}


	public VenInc getVenInc() {
		return venInc;
	}

	
	public void setVenInc(VenInc venInc) {
		this.venInc = venInc;
	}


	/**
	 * @return the venIncVos
	 */
	public List<VenIncVo> getVenIncVos() {
		return venIncVos;
	}

	/**
	 * @param venIncVos the venIncVos to set
	 */
	public void setVenIncVos(List<VenIncVo> venIncVos) {
		this.venIncVos = venIncVos;
	}


	/**
	 * @return the showVenIncVos
	 */
	public List<ShowVenIncVo> getShowVenIncVos() {
		return showVenIncVos;
	}


	/**
	 * @param showVenIncVos the showVenIncVos to set
	 */
	public void setShowVenIncVos(List<ShowVenIncVo> showVenIncVos) {
		this.showVenIncVos = showVenIncVos;
	}
	
}

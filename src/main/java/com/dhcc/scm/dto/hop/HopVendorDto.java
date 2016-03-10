/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.HopVendor;

public class HopVendorDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HopVendor hopVendor;
	
	/**
	 * 医院供应商是否以对照
	 */
	private String flag;
	
	private String exportFlag;
	
	private List<HopVendor> hopVendors;
//    //add hxy
//	String hopVens=hopVendors.toString();
//	



	/**
	 * 医院供应商是否审核
	 */
	private String auditFlag;
	
	private File upload;
	
	private String comgridparam;
	
	private String uploadFileName;
	
	
	
	
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


	public String getAuditFlag() {
		return auditFlag;
	}

	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
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
	 * @return the exportFlag
	 */
	public String getExportFlag() {
		return exportFlag;
	}


	/**
	 * @param exportFlag the exportFlag to set
	 */
	public void setExportFlag(String exportFlag) {
		this.exportFlag = exportFlag;
	}


	/**
	 * @return the hopVendors
	 */
	public List<HopVendor> getHopVendors() {
		return hopVendors;
	}


	/**
	 * @param hopVendors the hopVendors to set
	 */
	public void setHopVendors(List<HopVendor> hopVendors) {
		this.hopVendors = hopVendors;
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
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}


	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}


	public HopVendor getHopVendor() {
		return hopVendor;
	}

	
	public void setHopVendor(HopVendor hopVendor) {
		this.hopVendor = hopVendor;
	}


	
}

/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;



import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ven.VenQualifPic;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

public class VendorDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Vendor vendor;
	
	private List<Vendor> vendorList;
	
	private List<VenQualifType> venQualifTypeList;
	
	
	private List<VenQualifTypeVO> venQualifTypeVOList;
	

	private VenQualifTypeVO venQualifTypeVO;
		
	
	private String venQualificationList;
	
	private String venQualifPicId;
	
	private File upload;  
	// 封装上传文件类型的属性  
	private String contentType;  
	// 封装上传文件名的属性  
	private String uploadFileName;  
	// 封装上传文件名的属性  
	private String storgeFileName; 
		
	private String message = "错误";
	
	private boolean success = false;
	
	
	private String comgridparam;
	
	private VenQualifPic venQualifPic;
	
	/**
	 * 订单状态
	 */
	private Long state;
	
	/**
	 * 供应商审核状态
	 */
	private String auditFlag;
	
	private String inputStr;
	
	
	
	public String getInputStr() {
		return inputStr;
	}


	public void setInputStr(String inputStr) {
		this.inputStr = inputStr;
	}


	public String getAuditFlag() {
		return auditFlag;
	}


	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
	}


	public Long getState() {
		return state;
	}


	public void setState(Long state) {
		this.state = state;
	}


	public VenQualifPic getVenQualifPic() {
		return venQualifPic;
	}


	public void setVenQualifPic(VenQualifPic venQualifPic) {
		this.venQualifPic = venQualifPic;
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
	 * @return the venQualifPicId
	 */
	public String getVenQualifPicId() {
		return venQualifPicId;
	}


	/**
	 * @param venQualifPicId the venQualifPicId to set
	 */
	public void setVenQualifPicId(String venQualifPicId) {
		this.venQualifPicId = venQualifPicId;
	}


	/**
	 * @return the storgeFileName
	 */
	public String getStorgeFileName() {
		return storgeFileName;
	}


	/**
	 * @param storgeFileName the storgeFileName to set
	 */
	public void setStorgeFileName(String storgeFileName) {
		this.storgeFileName = storgeFileName;
	}





	/**
	 * @return the venQualificationList
	 */
	public String getVenQualificationList() {
		return venQualificationList;
	}


	/**
	 * @param venQualificationList the venQualificationList to set
	 */
	public void setVenQualificationList(String venQualificationList) {
		this.venQualificationList = venQualificationList;
	}


	/**
	 * @return the venQualifTypeVO
	 */
	public VenQualifTypeVO getVenQualifTypeVO() {
		return venQualifTypeVO;
	}


	/**
	 * @param venQualifTypeVO the venQualifTypeVO to set
	 */
	public void setVenQualifTypeVO(VenQualifTypeVO venQualifTypeVO) {
		this.venQualifTypeVO = venQualifTypeVO;
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
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}


	/**
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
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


	/**
	 * @return the venQualifTypeVOList
	 */
	public List<VenQualifTypeVO> getVenQualifTypeVOList() {
		return venQualifTypeVOList;
	}


	/**
	 * @param venQualifTypeVOList the venQualifTypeVOList to set
	 */
	public void setVenQualifTypeVOList(List<VenQualifTypeVO> venQualifTypeVOList) {
		this.venQualifTypeVOList = venQualifTypeVOList;
	}





	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}


	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * @return the success
	 */
	public boolean isSuccess() {
		return success;
	}


	/**
	 * @param success the success to set
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}


	
	
	/**
	 * @return the venQualifTypeList
	 */
	public List<VenQualifType> getVenQualifTypeList() {
		return venQualifTypeList;
	}


	/**
	 * @param venQualifTypeList the venQualifTypeList to set
	 */
	public void setVenQualifTypeList(List<VenQualifType> venQualifTypeList) {
		this.venQualifTypeList = venQualifTypeList;
	}


	public Vendor getVendor() {
		return vendor;
	}

	
	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}


	/**
	 * @return the vendorLIst
	 */
	public List<Vendor> getVendorList() {
		return vendorList;
	}


	/**
	 * @param vendorLIst the vendorLIst to set
	 */
	public void setVendorList(List<Vendor> vendorList) {
		this.vendorList = vendorList;
	}
	
	
	
}

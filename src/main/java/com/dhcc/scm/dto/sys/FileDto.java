/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.sys;

import java.io.File;

import com.dhcc.framework.transmission.dto.BaseDto;

public class FileDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;
	// 封装上传文件类型的属性  
	private String contentType;  
	// 封装上传文件名的属性  
	private String uploadFileName;  
	// 封装上传文件名的属性  
	private String storgeFileName;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getStorgeFileName() {
		return storgeFileName;
	}
	public void setStorgeFileName(String storgeFileName) {
		this.storgeFileName = storgeFileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	
	
}

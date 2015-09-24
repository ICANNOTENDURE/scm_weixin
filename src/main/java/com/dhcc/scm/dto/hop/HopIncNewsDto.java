/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.io.File;

import com.dhcc.scm.entity.hop.HopIncNews;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HopIncNewsDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HopIncNews hopIncNews;
	
	private String backUrl;
	
	private String listUrl;
	
	private String userType;
	
	private File upload;
	
	/*
	 * 上传文件名称
	 */
	private String uploadFileName;
	 
	/*
	 * 上传文件类型
	 */
	private String uploadContentType;
	
	
	
	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getBackUrl() {
		return backUrl;
	}


	public void setBackUrl(String backUrl) {
		this.backUrl = backUrl;
	}


	public String getListUrl() {
		return listUrl;
	}


	public void setListUrl(String listUrl) {
		this.listUrl = listUrl;
	}


	public HopIncNews getHopIncNews() {
		return hopIncNews;
	}

	
	public void setHopIncNews(HopIncNews hopIncNews) {
		this.hopIncNews = hopIncNews;
	}
	
}

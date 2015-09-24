/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.io.File;
import java.util.List;

import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopIncPic;
import com.dhcc.scm.entity.vo.hop.HopIncPicVo;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HopIncPicDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private HopIncPic hopIncPic;
	private List<HopInc> hopIncs;
	private List<HopIncPicVo> hopIncPicVos;
	private File upload;
	// 封装上传文件类型的属性  
	private String contentType;  
	// 封装上传文件名的属性  
	private String uploadFileName;  
	// 封装上传文件名的属性  
	private String storgeFileName;	
	
	public String getContentType() {
		return contentType;
	}


	public void setContentType(String contentType) {
		this.contentType = contentType;
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


	//指向药品表
	private Long hopIncDr;
	
	
	public List<HopInc> getHopIncs() {
		return hopIncs;
	}


	public void setHopIncs(List<HopInc> hopIncs) {
		this.hopIncs = hopIncs;
	}


	public Long getHopIncDr() {
		return hopIncDr;
	}


	public void setHopIncDr(Long hopIncDr) {
		this.hopIncDr = hopIncDr;
	}


	public HopIncPic getHopIncPic() {
		return hopIncPic;
	}

	
	public void setHopIncPic(HopIncPic hopIncPic) {
		this.hopIncPic = hopIncPic;
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
	 * @return the hopIncPicVos
	 */
	public List<HopIncPicVo> getHopIncPicVos() {
		return hopIncPicVos;
	}


	/**
	 * @param hopIncPicVos the hopIncPicVos to set
	 */
	public void setHopIncPicVos(List<HopIncPicVo> hopIncPicVos) {
		this.hopIncPicVos = hopIncPicVos;
	}
	
}

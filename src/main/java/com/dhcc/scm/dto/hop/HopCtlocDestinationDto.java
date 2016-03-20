/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.vo.hop.HopDestinationVo;

public class HopCtlocDestinationDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	private HopCtlocDestination hopCtlocDestination;

	private Long hopCtlocDr;
	
	private String defautFlag;
	
	private File upload;
	
	//显示收货信息
	private List<HopDestinationVo> hopDestinationVos;
	
	private String uploadFileName;
	
	
	
	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public Long getHopCtlocDr() {
		return hopCtlocDr;
	}


	public void setHopCtlocDr(Long hopCtlocDr) {
		this.hopCtlocDr = hopCtlocDr;
	}
	
	

	/**
	 * @return the defautFlag
	 */
	public String getDefautFlag() {
		return defautFlag;
	}


	/**
	 * @param defautFlag the defautFlag to set
	 */
	public void setDefautFlag(String defautFlag) {
		this.defautFlag = defautFlag;
	}


	public HopCtlocDestination getHopCtlocDestination() {
		return hopCtlocDestination;
	}

	
	public void setHopCtlocDestination(HopCtlocDestination hopCtlocDestination) {
		this.hopCtlocDestination = hopCtlocDestination;
	}


	/**
	 * @return the hopDestinationVos
	 */
	public List<HopDestinationVo> getHopDestinationVos() {
		return hopDestinationVos;
	}


	/**
	 * @param hopDestinationVos the hopDestinationVos to set
	 */
	public void setHopDestinationVos(List<HopDestinationVo> hopDestinationVos) {
		this.hopDestinationVos = hopDestinationVos;
	}
	
}

/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hop;

import java.io.File;
import java.util.List;

import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.vo.hop.HopIncVo;
import com.dhcc.scm.entity.vo.hop.ShowHopIncVo;
import com.dhcc.framework.transmission.dto.BaseDto;

public class HopIncDto extends BaseDto {
	
	private static final long serialVersionUID = 1L;
	private HopInc hopInc;
	//指向厂商
	private Long manfDr;
	//指向医院
	private Long hospitalDr;
	//显示图片列表信息
	private List<HopIncVo> hopIncVos;
	
	private List<ShowHopIncVo> showHopIncVos;
	
	
	private String comgridparam;
	
	
	private File upload;
	
	private List<HopInc> hopIncs;
	
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


	/**
	 * @return the hopIncs
	 */
	public List<HopInc> getHopIncs() {
		return hopIncs;
	}


	/**
	 * @param hopIncs the hopIncs to set
	 */
	public void setHopIncs(List<HopInc> hopIncs) {
		this.hopIncs = hopIncs;
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


	public Long getManfDr() {
		return manfDr;
	}


	public void setManfDr(Long manfDr) {
		this.manfDr = manfDr;
	}


	public Long getHospitalDr() {
		return hospitalDr;
	}


	public void setHospitalDr(Long hospitalDr) {
		this.hospitalDr = hospitalDr;
	}


	public HopInc getHopInc() {
		return hopInc;
	}

	
	public void setHopInc(HopInc hopInc) {
		this.hopInc = hopInc;
	}


	/**
	 * @return the hopIncVos
	 */
	public List<HopIncVo> getHopIncVos() {
		return hopIncVos;
	}


	/**
	 * @param hopIncVos the hopIncVos to set
	 */
	public void setHopIncVos(List<HopIncVo> hopIncVos) {
		this.hopIncVos = hopIncVos;
	}


	/**
	 * @return the showHopIncVos
	 */
	public List<ShowHopIncVo> getShowHopIncVos() {
		return showHopIncVos;
	}


	/**
	 * @param showHopIncVos the showHopIncVos to set
	 */
	public void setShowHopIncVos(List<ShowHopIncVo> showHopIncVos) {
		this.showHopIncVos = showHopIncVos;
	}
	
}

/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;

import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ven.VenIncqQualif;
import com.dhcc.scm.entity.ven.VenIncqQualifPic;

public class VenIncQualifyPicDto extends BaseDto {

	private static final long serialVersionUID = 1L;
	
	private Long venIncId;

	private File upload;
	
	private Long qualifyTypeId;
	
	// 封装上传文件名的属性  
	private String uploadFileName;
	
	
	private VenIncqQualifPic incqQualifPic;
	
	private List<VenIncqQualif> incqQualifs;
	
	private String incQualifStr;
	
	
	
	

	public String getIncQualifStr() {
		return incQualifStr;
	}

	public void setIncQualifStr(String incQualifStr) {
		this.incQualifStr = incQualifStr;
	}

	public List<VenIncqQualif> getIncqQualifs() {
		return incqQualifs;
	}

	public void setIncqQualifs(List<VenIncqQualif> incqQualifs) {
		this.incqQualifs = incqQualifs;
	}

	public VenIncqQualifPic getIncqQualifPic() {
		return incqQualifPic;
	}

	public void setIncqQualifPic(VenIncqQualifPic incqQualifPic) {
		this.incqQualifPic = incqQualifPic;
	}

	public Long getQualifyTypeId() {
		return qualifyTypeId;
	}

	public void setQualifyTypeId(Long qualifyTypeId) {
		this.qualifyTypeId = qualifyTypeId;
	}

	public Long getVenIncId() {
		return venIncId;
	}

	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}

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
	
	
	
	
	
}

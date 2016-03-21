package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="t_ven_inc_qualif_pic")
public class VenIncqQualifPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pic_id", unique=true, nullable=false)
	private Long picId;
	
	@Column(name="pic_path")
	private String picPath;

	@Column(name="pic_parrefid")
	private Long picParrefId;
	
	@Column(name="pic_filename")
	private String fileName;

	public Long getPicId() {
		return picId;
	}

	public void setPicId(Long picId) {
		this.picId = picId;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public Long getPicParrefId() {
		return picParrefId;
	}

	public void setPicParrefId(Long picParrefId) {
		this.picParrefId = picParrefId;
	}
	
	
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public VenIncqQualifPic(String picPath, Long picParrefId, String fileName) {
		super();
		this.picPath = picPath;
		this.picParrefId = picParrefId;
		this.fileName = fileName;
	}

	public VenIncqQualifPic() {
	}

	
	
	
	
}
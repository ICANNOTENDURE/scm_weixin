package com.dhcc.scm.entity.st;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="t_st_ingdrecpic")
public class StInGdRecPic implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ingdrecpic_id", unique=true, nullable=false)
	private Long ingdrecpicId;
	
	@Column(name="ingdrecpic_parrefid")
	private Long ingdrecpicParrefId;
	
	@Column(name="ingdrecpic_path")
	private String ingdrecpicPath;

	public Long getIngdrecpicId() {
		return ingdrecpicId;
	}

	public void setIngdrecpicId(Long ingdrecpicId) {
		this.ingdrecpicId = ingdrecpicId;
	}

	public Long getIngdrecpicParrefId() {
		return ingdrecpicParrefId;
	}

	public void setIngdrecpicParrefId(Long ingdrecpicParrefId) {
		this.ingdrecpicParrefId = ingdrecpicParrefId;
	}

	public String getIngdrecpicPath() {
		return ingdrecpicPath;
	}

	public void setIngdrecpicPath(String ingdrecpicPath) {
		this.ingdrecpicPath = ingdrecpicPath;
	}
	
	
}
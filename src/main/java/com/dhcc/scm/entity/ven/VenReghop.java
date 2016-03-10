package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_VEN_REGHOP")
public class VenReghop implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="REGHOP_HOPID")
	private Long reghophopid;
	@Column(name="REGHOP_VENID")
	private Long  venid;
	@Column(name="REGHOP_ADUIT_FLAG")
	private String aduitflag;
	@Column(name="REGHOP_ADUIT_REM")
	private String auditremark;
	
	public Long getReghophopid() {
		return reghophopid;
	}
	public void setReghophopid(Long reghophopid) {
		this.reghophopid = reghophopid;
	}
	public Long getVenid() {
		return venid;
	}
	public void setVenid(Long venid) {
		this.venid = venid;
	}
	public String getAduitflag() {
		return aduitflag;
	}
	public void setAduitflag(String aduitflag) {
		this.aduitflag = aduitflag;
	}
	public String getAuditremark() {
		return auditremark;
	}
	public void setAuditremark(String auditremark) {
		this.auditremark = auditremark;
	}
	public void setReghophopid(String string) {
		// TODO Auto-generated method stub
		
	}
}

package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the T_HOP_INC_PIC database table.
 * 
 */
@Entity
@Table(name="T_HOP_INC_PIC")
@NamedQuery(name="HopIncPic.findAll", query="SELECT h FROM HopIncPic h")
public class HopIncPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_INC_PIC")})
	@GeneratedValue(generator="idGenerator")	
	@Column(name="INC_PIC_ID", unique=true, nullable=false, precision=22)
	private Long hopIncPicId;

	@Column(name="INC_PIC_INCID", length=255)
	private Long incPicIncid;
	
	@Column(name="INC_PIC_PATH", length=255)
	private String incPicPath;

	@Column(name="INC_PIC_SEQ", precision=22)
	private Long incPicSeq;


	public HopIncPic() {
	}
	
	public Long getHopIncPicId() {
		return this.hopIncPicId;
	}

	public void setHopIncPicId(Long hopIncPicId) {
		this.hopIncPicId = hopIncPicId;
	}
		

	public Long getIncPicIncid() {
		return incPicIncid;
	}

	public void setIncPicIncid(Long incPicIncid) {
		this.incPicIncid = incPicIncid;
	}

	public String getIncPicPath() {
		return this.incPicPath;
	}

	public void setIncPicPath(String incPicPath) {
		this.incPicPath = incPicPath;
	}

	public Long getIncPicSeq() {
		return this.incPicSeq;
	}

	public void setIncPicSeq(Long incPicSeq) {
		this.incPicSeq = incPicSeq;
	}



}
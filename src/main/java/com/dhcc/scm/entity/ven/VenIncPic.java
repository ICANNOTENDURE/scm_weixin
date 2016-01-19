package com.dhcc.scm.entity.ven;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the T_VEN_INC_PIC database table.
 * 
 */
@Entity
@Table(name="T_VEN_INC_PIC")
@NamedQuery(name="VenIncPic.findAll", query="SELECT v FROM VenIncPic v")
public class VenIncPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_VEN_INC_PIC")})
	//@GeneratedValue(generator="idGenerator")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VEN_INC_PIC_ID", unique=true, nullable=false, precision=22)
	private Long venIncPicId;
	
	@Column(name="VEN_INC_PIC_VENINCID")
	private Long venIncPicVenincid;
	
	@Column(name="VEN_INC_PIC_PATH", length=255)
	private String venIncPicPath;

	@Column(name="VEN_INC_PIC_SEQ")
	private Long venIncPicSeq;



	public VenIncPic() {
	}

	public Long getVenIncPicId() {
		return this.venIncPicId;
	}

	public void setVenIncPicId(Long venIncPicId) {
		this.venIncPicId = venIncPicId;
	}
	
	
	public Long getVenIncPicVenincid() {
		return venIncPicVenincid;
	}

	public void setVenIncPicVenincid(Long venIncPicVenincid) {
		this.venIncPicVenincid = venIncPicVenincid;
	}

	public String getVenIncPicPath() {
		return this.venIncPicPath;
	}

	public void setVenIncPicPath(String venIncPicPath) {
		this.venIncPicPath = venIncPicPath;
	}

	public Long getVenIncPicSeq() {
		return this.venIncPicSeq;
	}

	public void setVenIncPicSeq(Long venIncPicSeq) {
		this.venIncPicSeq = venIncPicSeq;
	}


}
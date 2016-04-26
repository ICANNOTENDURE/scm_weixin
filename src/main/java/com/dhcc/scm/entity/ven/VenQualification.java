package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


/**
 * The persistent class for the T_VEN_QUALIFICATION database table.
 * 
 */
@Entity
@Table(name="T_VEN_QUALIFICATION")
public class VenQualification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_VEN_QUALIFICATION_ID_GENERATOR", sequenceName="SEQUENCE_VEN_QUALIFICATION")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_VEN_QUALIFICATION_ID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="QUALIFICATION_ID")
	private Long venQualificationId;

	@Temporal(TemporalType.DATE)
	@Column(name="EXPDATE")
	private Date expdate;

	@Temporal(TemporalType.DATE)
	@Column(name="REGDATE")
	private Date regdate;
	
	@Column(name="VENDOR_ID")
	private Long vendorid;
	

	@Column(name="QUALIFY_TYPE_ID")
	private Long venQualifTypeId;
	
	@Column(name="QUALIFY_DESCRIPTION")
	private String description;
	
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	@Transient
	private List<VenQualifPic> venQualifPicList;
	
	
	
	
	@ManyToOne
    @JoinColumn(name="QUALIFY_TYPE_ID",
                insertable=false, updatable=false,
                nullable=false)
    private VenQualifType venQualifType;
	
	
	@OneToMany(fetch=FetchType.EAGER)  
	@JoinColumn(name = "QUALIFY_ID")
	private List<VenQualifPic> venQualifPics;
	
	
	
	
	public List<VenQualifPic> getVenQualifPics() {
		return venQualifPics;
	}

	public void setVenQualifPics(List<VenQualifPic> venQualifPics) {
		this.venQualifPics = venQualifPics;
	}

	/**
	 * @return the venQualifType
	 */
	public VenQualifType getVenQualifType() {
		return venQualifType;
	}

	/**
	 * @param venQualifType the venQualifType to set
	 */
	public void setVenQualifType(VenQualifType venQualifType) {
		this.venQualifType = venQualifType;
	}

	/**
	 * @return the venQualifPicList
	 */
	public List<VenQualifPic> getVenQualifPicList() {
		return venQualifPicList;
	}

	/**
	 * @param venQualifPicList the venQualifPicList to set
	 */
	public void setVenQualifPicList(List<VenQualifPic> venQualifPicList) {
		this.venQualifPicList = venQualifPicList;
	}

	
	
	/**
	 * @return the qualifyTypeid
	 */
	public Long getVenQualifTypeId() {
		return venQualifTypeId;
	}

	/**
	 * @param qualifyTypeid the qualifyTypeid to set
	 */
	public void setVenQualifTypeId(Long venQualifTypeId) {
		this.venQualifTypeId = venQualifTypeId;
	}

	public VenQualification() {
	}

	public Long getVenQualificationId() {
		return this.venQualificationId;
	}

	public void setVenQualificationId(Long venQualificationId) {
		this.venQualificationId = venQualificationId;
	}

	public Date getExpdate() {
		return this.expdate;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public Date getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Long getVendorid() {
		return this.vendorid;
	}

	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
	}

}
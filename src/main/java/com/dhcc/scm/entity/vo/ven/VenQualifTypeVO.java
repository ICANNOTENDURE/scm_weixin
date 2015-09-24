package com.dhcc.scm.entity.vo.ven;

import java.util.Date;
import java.util.List;

import com.dhcc.scm.entity.ven.VenQualifPic;



public class VenQualifTypeVO implements java.io.Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long qualif;

	private Date expdate;

	private Long type;
	
	private String name;
	
	private List<VenQualifPic> venQualifPics;
	
	private String fieldtype;
	
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


	/**
	 * @return the fieldtype
	 */
	public String getFieldtype() {
		return fieldtype;
	}


	/**
	 * @param fieldtype the fieldtype to set
	 */
	public void setFieldtype(String fieldtype) {
		this.fieldtype = fieldtype;
	}


	/**
	 * @return the venQualifPics
	 */
	public List<VenQualifPic> getVenQualifPics() {
		return venQualifPics;
	}


	/**
	 * @param venQualifPics the venQualifPics to set
	 */
	public void setVenQualifPics(List<VenQualifPic> venQualifPics) {
		this.venQualifPics = venQualifPics;
	}


	/**
	 * @return the venQualificationId
	 */
	public Long getQualif() {
		return qualif;
	}


	/**
	 * @param venQualificationId the venQualificationId to set
	 */
	public void setQualif(Long qualif) {
		this.qualif = qualif;
	}


	/**
	 * @return the expdate
	 */
	public Date getExpdate() {
		return expdate;
	}


	/**
	 * @param expdate the expdate to set
	 */
	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}


	/**
	 * @return the qualifyTypeid
	 */
	public Long getType() {
		return type;
	}


	/**
	 * @param qualifyTypeid the qualifyTypeid to set
	 */
	public void setType(Long type) {
		this.type = type;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	

}

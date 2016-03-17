package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="t_ven_inc_qualif")
public class VenIncqQualif implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="qualif_id", unique=true, nullable=false)
	private Long qualifyId;
	
	@Temporal(TemporalType.DATE)
	@Column(name="qualif_date")
	private Date qualifDate;

	@Column(name="qualif_description")
	private String qualifDescription;

	@Column(name="qualif_typeid")
	private Long qualifyTypeId;

	@Column(name="qualif_incid")
	private  Long qualifyIncId;
	
	@OneToMany(cascade=CascadeType.ALL)  
	@JoinColumn(name="picParrefId") //对应儿子类的哪个字段  
	private Set<VenIncqQualifPic> incqQualifPics;
	
	
	
	

	public Set<VenIncqQualifPic> getIncqQualifPics() {
		return incqQualifPics;
	}

	public void setIncqQualifPics(Set<VenIncqQualifPic> incqQualifPics) {
		this.incqQualifPics = incqQualifPics;
	}

	public Long getQualifyId() {
		return qualifyId;
	}

	public void setQualifyId(Long qualifyId) {
		this.qualifyId = qualifyId;
	}



	public String getQualifDescription() {
		return qualifDescription;
	}

	public void setQualifDescription(String qualifDescription) {
		this.qualifDescription = qualifDescription;
	}

	public Long getQualifyTypeId() {
		return qualifyTypeId;
	}

	public void setQualifyTypeId(Long qualifyTypeId) {
		this.qualifyTypeId = qualifyTypeId;
	}

	public Long getQualifyIncId() {
		return qualifyIncId;
	}

	public void setQualifyIncId(Long qualifyIncId) {
		this.qualifyIncId = qualifyIncId;
	}

	public Date getQualifDate() {
		return qualifDate;
	}

	public void setQualifDate(Date qualifDate) {
		this.qualifDate = qualifDate;
	}

	
	
	
}
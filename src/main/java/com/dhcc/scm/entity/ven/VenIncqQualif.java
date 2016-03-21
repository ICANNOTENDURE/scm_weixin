package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
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

import com.dhcc.scm.entity.sys.SysQualifType;



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
	


	@Column(name="qualif_incid")
	private  Long qualifyIncId;
	
	
	//资质图片集合
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)  
	@JoinColumn(name="pic_parrefid") //对应儿子类的哪个字段  
	private Set<VenIncqQualifPic> incqQualifPics;
	
	
	
	@ManyToOne
	@JoinColumn(name="qualif_typeid") //注意,在这里指定外键名后,不要在 写 private int one_id; 和它的get / set 方法了.这个改由hibernate维护.写上是要报错的.
	private SysQualifType sysQualifType;
	
	

	public SysQualifType getSysQualifType() {
		return sysQualifType;
	}

	public void setSysQualifType(SysQualifType sysQualifType) {
		this.sysQualifType = sysQualifType;
	}

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
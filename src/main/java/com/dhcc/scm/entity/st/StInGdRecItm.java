package com.dhcc.scm.entity.st;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="t_st_ingdrecitm")
public class StInGdRecItm implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ingdrecitm_id", unique=true, nullable=false)
	private Long ingdrecitmId;
	
	@Column(name="ingdrecitm_parrefid")
	private Long ingdrecitmParrefId;
	
	@Column(name="ingdrecitm_incid")
	private Long ingdrecitmIncId;
	
	@Column(name="ingdrecitm_rp")
	private Float ingdrecitmRp;
	
	@Column(name="ingdrecitm_qty")
	private Long ingdrecitmQty;
	
	@Column(name="ingdrecitm_manfid")
	private Long ingdrecitmManfId;
	
	@Column(name="ingdrecitm_batno")
	private String ingdrecitmBatNo;
	
	@Column(name="ingdrecitm_expdate")
	private Long ingdrecitmVenId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ingdrecitm_expdate")
	private Date ingdrecitmExpDate;
	
	@Column(name="ingdrecitm_invno")
	private String ingdrecitmInvNo;
	
	@Column(name="ingdrecitm_uom")
	private String ingdrecitmUom;
	
	@Column(name="ingdrecitm_ordsubid")
	private String ingdrecitmOrdsubId;

	public Long getIngdrecitmId() {
		return ingdrecitmId;
	}

	public void setIngdrecitmId(Long ingdrecitmId) {
		this.ingdrecitmId = ingdrecitmId;
	}

	public Long getIngdrecitmParrefId() {
		return ingdrecitmParrefId;
	}

	public void setIngdrecitmParrefId(Long ingdrecitmParrefId) {
		this.ingdrecitmParrefId = ingdrecitmParrefId;
	}

	public Long getIngdrecitmIncId() {
		return ingdrecitmIncId;
	}

	public void setIngdrecitmIncId(Long ingdrecitmIncId) {
		this.ingdrecitmIncId = ingdrecitmIncId;
	}

	public Float getIngdrecitmRp() {
		return ingdrecitmRp;
	}

	public void setIngdrecitmRp(Float ingdrecitmRp) {
		this.ingdrecitmRp = ingdrecitmRp;
	}

	public Long getIngdrecitmQty() {
		return ingdrecitmQty;
	}

	public void setIngdrecitmQty(Long ingdrecitmQty) {
		this.ingdrecitmQty = ingdrecitmQty;
	}

	public Long getIngdrecitmManfId() {
		return ingdrecitmManfId;
	}

	public void setIngdrecitmManfId(Long ingdrecitmManfId) {
		this.ingdrecitmManfId = ingdrecitmManfId;
	}

	public String getIngdrecitmBatNo() {
		return ingdrecitmBatNo;
	}

	public void setIngdrecitmBatNo(String ingdrecitmBatNo) {
		this.ingdrecitmBatNo = ingdrecitmBatNo;
	}

	public Long getIngdrecitmVenId() {
		return ingdrecitmVenId;
	}

	public void setIngdrecitmVenId(Long ingdrecitmVenId) {
		this.ingdrecitmVenId = ingdrecitmVenId;
	}

	public Date getIngdrecitmExpDate() {
		return ingdrecitmExpDate;
	}

	public void setIngdrecitmExpDate(Date ingdrecitmExpDate) {
		this.ingdrecitmExpDate = ingdrecitmExpDate;
	}

	public String getIngdrecitmInvNo() {
		return ingdrecitmInvNo;
	}

	public void setIngdrecitmInvNo(String ingdrecitmInvNo) {
		this.ingdrecitmInvNo = ingdrecitmInvNo;
	}

	public String getIngdrecitmUom() {
		return ingdrecitmUom;
	}

	public void setIngdrecitmUom(String ingdrecitmUom) {
		this.ingdrecitmUom = ingdrecitmUom;
	}

	public String getIngdrecitmOrdsubId() {
		return ingdrecitmOrdsubId;
	}

	public void setIngdrecitmOrdsubId(String ingdrecitmOrdsubId) {
		this.ingdrecitmOrdsubId = ingdrecitmOrdsubId;
	}
	
	
}
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
	private Float ingdrecitmQty;
	
	@Column(name="ingdrecitm_manfid")
	private Long ingdrecitmManfId;
	
	@Column(name="ingdrecitm_batno")
	private String ingdrecitmBatNo;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ingdrecitm_expdate")
	private Date ingdrecitmExpDate;
	
	@Column(name="ingdrecitm_invno")
	private String ingdrecitmInvNo;
	
	@Column(name="ingdrecitm_uom")
	private String ingdrecitmUom;
	
	@Column(name="ingdrecitm_ordsubid")
	private String ingdrecitmOrdsubId;
	
	
	@Column(name="ingdrecitm_incbarcode")
	private String ingdrecitmIncBarCode;
	
	@Column(name="ingdrecitm_wsflag")
	private String ingdrecitmWsflag;
	
	@Column(name="ingdrecitm_incname")
	private String ingdrecitmIncName;
	
	@Column(name="ingdrecitm_hisno")
	private String ingdrecitmHisNo;
	
	@Column(name="ingdrecitm_vendorcode")
	private String ingdrecitmVendorCode;
	
	@Column(name="ingdrecitm_purloccode")
	private String ingdrecitmPurLocCode;
	
	@Column(name="ingdrecitm_recloccode")
	private String ingdrecitmRecLocCode;
	
	
	
	
	
	public String getIngdrecitmHisNo() {
		return ingdrecitmHisNo;
	}

	public void setIngdrecitmHisNo(String ingdrecitmHisNo) {
		this.ingdrecitmHisNo = ingdrecitmHisNo;
	}

	public String getIngdrecitmVendorCode() {
		return ingdrecitmVendorCode;
	}

	public void setIngdrecitmVendorCode(String ingdrecitmVendorCode) {
		this.ingdrecitmVendorCode = ingdrecitmVendorCode;
	}

	public String getIngdrecitmPurLocCode() {
		return ingdrecitmPurLocCode;
	}

	public void setIngdrecitmPurLocCode(String ingdrecitmPurLocCode) {
		this.ingdrecitmPurLocCode = ingdrecitmPurLocCode;
	}

	public String getIngdrecitmRecLocCode() {
		return ingdrecitmRecLocCode;
	}

	public void setIngdrecitmRecLocCode(String ingdrecitmRecLocCode) {
		this.ingdrecitmRecLocCode = ingdrecitmRecLocCode;
	}

	public String getIngdrecitmIncName() {
		return ingdrecitmIncName;
	}

	public void setIngdrecitmIncName(String ingdrecitmIncName) {
		this.ingdrecitmIncName = ingdrecitmIncName;
	}

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

	public Float getIngdrecitmQty() {
		return ingdrecitmQty;
	}

	public void setIngdrecitmQty(Float ingdrecitmQty) {
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

	public String getIngdrecitmIncBarCode() {
		return ingdrecitmIncBarCode;
	}

	public void setIngdrecitmIncBarCode(String ingdrecitmIncBarCode) {
		this.ingdrecitmIncBarCode = ingdrecitmIncBarCode;
	}

	public String getIngdrecitmWsflag() {
		return ingdrecitmWsflag;
	}

	public void setIngdrecitmWsflag(String ingdrecitmWsflag) {
		this.ingdrecitmWsflag = ingdrecitmWsflag;
	}
	
	
}
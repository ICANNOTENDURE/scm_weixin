package com.dhcc.scm.entity.ord;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * The persistent class for the T_ORD_SHOPPING database table.
 * 
 */
@Entity
@Table(name="T_ORD_SHOPPING")
public class OrdShopping implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_ORD_SHOPPING_SHOPID_GENERATOR", sequenceName="SEQUENCE_ORD_SHOPPING")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_ORD_SHOPPING_SHOPID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SHOP_ID")
	private Long shopId;

	@Column(name="SHOP_HOP_INCID")
	private Long shopIncid;

	@Column(name="SHOP_QTY")
	private Long shopQty=0l;

	@Column(name="SHOP_UOM")
	private String shopUom;

	@Column(name="SHOP_USERID")
	private Long shopUserid;
	
	@Column(name="SHOP_CHECKFLAG")
	private Long shopCheckFlag;
	
	@Column(name="SHOP_VEN_INCID")
	private Long shopVenIncid;
	
	@Column(name="SHOP_RP")
	private Float shopRp=0f;
	
	@Column(name="SHOP_NAME")
	private String shopIncName;
	
	@Column(name="SHOP_VENDORID")
	private Long shopVendorId;
	
	@Transient
	private Float sumAmt;;
	
	@Transient
	private String picpath;;
	/**
	 * @param shopId
	 * @param shopIncid
	 * @param shopQty
	 * @param shopUom
	 * @param shopUserid
	 * @param shopCheckFlag
	 */
	public OrdShopping(Long shopId, Long shopIncid, Long shopQty,
			String shopUom, Long shopUserid, Long shopCheckFlag,Long shopVenIncid,Float shopRp) {
		super();
		this.shopId = shopId;
		this.shopIncid = shopIncid;
		this.shopQty = shopQty;
		this.shopUom = shopUom;
		this.shopUserid = shopUserid;
		this.shopCheckFlag = shopCheckFlag;
		this.shopVenIncid=shopVenIncid;
		this.shopRp=shopRp;
	}
	
	
	
	
	public Long getShopVendorId() {
		return shopVendorId;
	}




	public void setShopVendorId(Long shopVendorId) {
		this.shopVendorId = shopVendorId;
	}




	public String getPicpath() {
		return picpath;
	}




	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}




	public String getShopIncName() {
		return shopIncName;
	}




	public void setShopIncName(String shopIncName) {
		this.shopIncName = shopIncName;
	}




	public Float getShopRp() {
		return shopRp;
	}




	public void setShopRp(Float shopRp) {
		this.shopRp = shopRp;
	}




	public Long getShopVenIncid() {
		return shopVenIncid;
	}



	public void setShopVenIncid(Long shopVenIncid) {
		this.shopVenIncid = shopVenIncid;
	}



	/**
	 * @return the shopCheckFlag
	 */
	public Long getShopCheckFlag() {
		return shopCheckFlag;
	}

	/**
	 * @param shopCheckFlag the shopCheckFlag to set
	 */
	public void setShopCheckFlag(Long shopCheckFlag) {
		this.shopCheckFlag = shopCheckFlag;
	}

	public OrdShopping() {
	}

	public Long getShopId() {
		return this.shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public Long getShopIncid() {
		return this.shopIncid;
	}

	public void setShopIncid(Long shopIncid) {
		this.shopIncid = shopIncid;
	}

	public Long getShopQty() {
		return this.shopQty;
	}

	public void setShopQty(Long shopQty) {
		this.shopQty = shopQty;
	}

	public String getShopUom() {
		return this.shopUom;
	}

	public void setShopUom(String shopUom) {
		this.shopUom = shopUom;
	}

	public Long getShopUserid() {
		return this.shopUserid;
	}

	public void setShopUserid(Long shopUserid) {
		this.shopUserid = shopUserid;
	}




	public Float getSumAmt() {
		if(this.shopQty==null){
			this.shopQty=0l;
		}
		if(this.shopRp==null){
			this.shopRp=0f;
		}
		return this.shopQty.floatValue()*this.shopRp.floatValue();
	}




	public void setSumAmt(Float sumAmt) {
		this.sumAmt = sumAmt;
	}
	

}
package com.dhcc.scm.entity.ven;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


/**
 * The persistent class for the T_VEN_INC database table.
 * 
 */
@Entity
@Table(name="T_VEN_INC")
public class VenInc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_VEN_INC")})
	@GeneratedValue(generator="idGenerator")	
	@Column(name="VEN_INC_ROWID", unique=true, nullable=false)
	private Long venIncId;

	@Column(name="VEN_INC_BUOMCODE")
	private String venIncBuomcode;

	@Column(name="VEN_INC_BUOMNAME")
	private String venIncBuomname;

	@Column(name="VEN_INC_CODE")
	private String venIncCode;

	@Column(name="VEN_INC_FAC")
	private  Float venIncFac;
	
	@Column(name="VEN_INC_PRICE")
	private Float venIncPrice;
	
	@Column(name="VEN_INC_NAME")
	private String venIncName;

	@Column(name="VEN_INC_UOMCODE")
	private String venIncUomcode;

	@Column(name="VEN_INC_UOMNAME")
	private String venIncUomname;
	
	@Column(name="VEN_INC_MANFID")
	private Long venIncManfid;
	
	@Column(name="VEN_INC_VENID")
	private Long venIncVenid;

	@Column(name="VEN_INC_VENSYSID")
	private String venIncVensysid;
	
	@Column(name="VEN_INC_SPEC")
	private String venIncSpec;
	
	@Column(name="VEN_INC_CATID")
	private Long venIncCatId;
	
	@Column(name="VEN_INC_ALIAS")
	private String venIncAlias;
	
	@Column(name="VEN_INC_Sp")
	private Float venIncSp;
	
	/*
	 * 供应商库存
	 */
	@Column(name="VEN_INC_QTY")
	private Float venIncQty;
	
	/*
	 * 占用数
	 */
	@Column(name="VEN_INC_RESQTY")
	private Float venIncResQty;
	
	/*
	 * 可卖数量
	 */
	@Column(name="VEN_INC_AVAILQTY")
	private Float venIncAvailQty;
	
	/*
	 * 评论人数
	 */
	@Column(name="VEN_INC_COMMENT_NUM")
	private Long venIncCommentNum;
	
	/*
	 * 卖出数量
	 */
	@Column(name="VEN_INC_ORDER_QTY")
	private Float venIncOrderQty;
	
	/*
	 * 商品上架日期
	 */
	@Temporal(TemporalType.DATE)
	@Column(name="VEN_INC_ADDDATE")
	private Date venIncAddDate;
	
	@Transient
	private Long groupId;
	
	@Transient
	private Long catGroupId;
	
	public VenInc() {
	}

	public VenInc(Long venIncId,  String venIncCode, String venIncName,
			 String venIncUomname, String venIncBuomname, Long venIncManfid,
			Long venIncVenid, String venIncVensysid) {
		super();
		this.venIncId = venIncId;		
		this.venIncCode = venIncCode;
		this.venIncName = venIncName;
		this.venIncUomname = venIncUomname;
		this.venIncBuomname = venIncBuomname;
		this.venIncManfid = venIncManfid;
		this.venIncVenid = venIncVenid;
		this.venIncVensysid = venIncVensysid;
	}
	
	
	
	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Long getCatGroupId() {
		return catGroupId;
	}

	public void setCatGroupId(Long catGroupId) {
		this.catGroupId = catGroupId;
	}

	public Date getVenIncAddDate() {
		return venIncAddDate;
	}

	public void setVenIncAddDate(Date venIncAddDate) {
		this.venIncAddDate = venIncAddDate;
	}

	public Float getVenIncOrderQty() {
		return venIncOrderQty;
	}

	public void setVenIncOrderQty(Float venIncOrderQty) {
		this.venIncOrderQty = venIncOrderQty;
	}

	public Long getVenIncCommentNum() {
		return venIncCommentNum;
	}

	public void setVenIncCommentNum(Long venIncCommentNum) {
		this.venIncCommentNum = venIncCommentNum;
	}

	public Float getVenIncAvailQty() {
		return venIncAvailQty;
	}

	public void setVenIncAvailQty(Float venIncAvailQty) {
		this.venIncAvailQty = venIncAvailQty;
	}

	public Long getVenIncId() {
		return venIncId;
	}


	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}
	
	

	public Float getVenIncQty() {
		return venIncQty;
	}

	public void setVenIncQty(Float venIncQty) {
		this.venIncQty = venIncQty;
	}

	public Float getVenIncResQty() {
		return venIncResQty;
	}

	public void setVenIncResQty(Float venIncResQty) {
		this.venIncResQty = venIncResQty;
	}

	public String getVenIncBuomcode() {
		return this.venIncBuomcode;
	}

	public void setVenIncBuomcode(String venIncBuomcode) {
		this.venIncBuomcode = venIncBuomcode;
	}

	public String getVenIncBuomname() {
		return this.venIncBuomname;
	}

	public void setVenIncBuomname(String venIncBuomname) {
		this.venIncBuomname = venIncBuomname;
	}

	public String getVenIncCode() {
		return this.venIncCode;
	}

	public void setVenIncCode(String venIncCode) {
		this.venIncCode = venIncCode;
	}



	/**
	 * @return the venIncName
	 */
	public String getVenIncName() {
		return venIncName;
	}

	/**
	 * @param venIncName the venIncName to set
	 */
	public void setVenIncName(String venIncName) {
		this.venIncName = venIncName;
	}

	/**
	 * @return the venIncUomcode
	 */
	public String getVenIncUomcode() {
		return venIncUomcode;
	}

	/**
	 * @param venIncUomcode the venIncUomcode to set
	 */
	public void setVenIncUomcode(String venIncUomcode) {
		this.venIncUomcode = venIncUomcode;
	}

	/**
	 * @return the venIncUomname
	 */
	public String getVenIncUomname() {
		return venIncUomname;
	}

	/**
	 * @param venIncUomname the venIncUomname to set
	 */
	public void setVenIncUomname(String venIncUomname) {
		this.venIncUomname = venIncUomname;
	}

	/**
	 * @return the venIncManfid
	 */
	public Long getVenIncManfid() {
		return venIncManfid;
	}

	/**
	 * @param venIncManfid the venIncManfid to set
	 */
	public void setVenIncManfid(Long venIncManfid) {
		this.venIncManfid = venIncManfid;
	}

	/**
	 * @return the venIncVenid
	 */
	public Long getVenIncVenid() {
		return venIncVenid;
	}

	/**
	 * @param venIncVenid the venIncVenid to set
	 */
	public void setVenIncVenid(Long venIncVenid) {
		this.venIncVenid = venIncVenid;
	}

	/**
	 * @return the venIncVensysid
	 */
	public String getVenIncVensysid() {
		return venIncVensysid;
	}

	/**
	 * @param venIncVensysid the venIncVensysid to set
	 */
	public void setVenIncVensysid(String venIncVensysid) {
		this.venIncVensysid = venIncVensysid;
	}

	/**
	 * @return the venIncSpec
	 */
	public String getVenIncSpec() {
		return venIncSpec;
	}

	/**
	 * @param venIncSpec the venIncSpec to set
	 */
	public void setVenIncSpec(String venIncSpec) {
		this.venIncSpec = venIncSpec;
	}



	/**
	 * @return the venIncAlias
	 */
	public String getVenIncAlias() {
		return venIncAlias;
	}

	/**
	 * @param venIncAlias the venIncAlias to set
	 */
	public void setVenIncAlias(String venIncAlias) {
		this.venIncAlias = venIncAlias;
	}

	/**
	 * @return the venIncFac
	 */
	public Float getVenIncFac() {
		return venIncFac;
	}

	/**
	 * @param venIncFac the venIncFac to set
	 */
	public void setVenIncFac(Float venIncFac) {
		this.venIncFac = venIncFac;
	}

	/**
	 * @return the venIncPrice
	 */
	public Float getVenIncPrice() {
		return venIncPrice;
	}

	/**
	 * @param venIncPrice the venIncPrice to set
	 */
	public void setVenIncPrice(Float venIncPrice) {
		this.venIncPrice = venIncPrice;
	}

	/**
	 * @return the venIncSp
	 */
	public Float getVenIncSp() {
		return venIncSp;
	}

	/**
	 * @param venIncSp the venIncSp to set
	 */
	public void setVenIncSp(Float venIncSp) {
		this.venIncSp = venIncSp;
	}

	public Long getVenIncCatId() {
		return venIncCatId;
	}

	public void setVenIncCatId(Long venIncCatId) {
		this.venIncCatId = venIncCatId;
	}

	
	
	

	
}
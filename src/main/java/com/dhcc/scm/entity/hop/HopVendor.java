package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_SYS_HOSPITAL database table.
 * 
 */
@Entity
@Table(name="T_HOP_VENDOR")
public class HopVendor implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_VENDOR")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")
	
	@Column(name="H_VENID", unique=true, nullable=false)
	private Long hopVendorId;

	@Column(name="H_CODE")
	private String hopCode;

	@Column(name="H_NAME")
	private String hopName;

	@Column(name="H_PARENTID")
	private Long hopParentId;

	@Column(name="H_FAX")
	private String hopFax;
	
	@Column(name="H_ADDRESS")
	private String hopAddress;
	
	@Column(name="H_TEL")
	private String hopTel;
	
	@Column(name="H_ACCOUNT")
	private String hopAccount;
	
	@Column(name="H_CONTACT")
	private String hopContact;
	
	@Column(name="H_VENDORID")
	private Long hopVenId;

	@Column(name="H_ALIAS")
	private String hopAlias;

	@Column(name="H_HOPID")
	private Long hopHopId;
	
	@Column(name="H_TYPE")
	private String hopType;
	
	@Column(name="H_EMAIL")
	private String hopEmail;
	
	
	@Column(name="H_SEND")
	private String hopSend;
	
	//工商执照注册号/统一社会信用代码
	@Column(name="H_BusinessRegNo")
	private String hBusinessRegNo;
	
	/**
	 * 医院审核供应商资质标志，Y通过，其他未通过
	 */
	@Column(name="H_AUDITFLAG")
	private String hopAuditFlag;


	/**
	 * 是否同步供应商标志，Y同步，其他未同步
	 */
	@Transient
	private String synFlag;

	
	
	/**
	 * @return the synFlag
	 */
	public String getSynFlag() {
		return synFlag;
	}

	/**
	 * @param synFlag the synFlag to set
	 */
	public void setSynFlag(String synFlag) {
		this.synFlag = synFlag;
	}

	public String getHopAuditFlag() {
		return hopAuditFlag;
	}

	public void setHopAuditFlag(String hopAuditFlag) {
		this.hopAuditFlag = hopAuditFlag;
	}

	public String getHopSend() {
		return hopSend;
	}

	/**
	 * @param hopSend the hopSend to set
	 */
	public void setHopSend(String hopSend) {
		this.hopSend = hopSend;
	}

	/**
	 * @return the hopEmail
	 */
	public String getHopEmail() {
		return hopEmail;
	}

	/**
	 * @param hopEmail the hopEmail to set
	 */
	public void setHopEmail(String hopEmail) {
		this.hopEmail = hopEmail;
	}

	/**
	 * @return the hopType
	 */
	public String getHopType() {
		return hopType;
	}

	/**
	 * @param hopType the hopType to set
	 */
	public void setHopType(String hopType) {
		this.hopType = hopType;
	}

	/**
	 * @return the hopVendorId
	 */
	public Long getHopVendorId() {
		return hopVendorId;
	}

	/**
	 * @param hopVendorId the hopVendorId to set
	 */
	public void setHopVendorId(Long hopVendorId) {
		this.hopVendorId = hopVendorId;
	}

	/**
	 * @return the hopCode
	 */
	public String getHopCode() {
		return hopCode;
	}

	/**
	 * @param hopCode the hopCode to set
	 */
	public void setHopCode(String hopCode) {
		this.hopCode = hopCode;
	}

	/**
	 * @return the hopName
	 */
	public String getHopName() {
		return hopName;
	}

	/**
	 * @param hopName the hopName to set
	 */
	public void setHopName(String hopName) {
		this.hopName = hopName;
	}

	/**
	 * @return the hopParentId
	 */
	public Long getHopParentId() {
		return hopParentId;
	}

	/**
	 * @param hopParentId the hopParentId to set
	 */
	public void setHopParentId(Long hopParentId) {
		this.hopParentId = hopParentId;
	}

	/**
	 * @return the hopFax
	 */
	public String getHopFax() {
		return hopFax;
	}

	/**
	 * @param hopFax the hopFax to set
	 */
	public void setHopFax(String hopFax) {
		this.hopFax = hopFax;
	}

	/**
	 * @return the hopAddress
	 */
	public String getHopAddress() {
		return hopAddress;
	}

	/**
	 * @param hopAddress the hopAddress to set
	 */
	public void setHopAddress(String hopAddress) {
		this.hopAddress = hopAddress;
	}

	/**
	 * @return the hopTel
	 */
	public String getHopTel() {
		return hopTel;
	}

	/**
	 * @param hopTel the hopTel to set
	 */
	public void setHopTel(String hopTel) {
		this.hopTel = hopTel;
	}

	/**
	 * @return the hopAccount
	 */
	public String getHopAccount() {
		return hopAccount;
	}

	/**
	 * @param hopAccount the hopAccount to set
	 */
	public void setHopAccount(String hopAccount) {
		this.hopAccount = hopAccount;
	}

	/**
	 * @return the hopContact
	 */
	public String getHopContact() {
		return hopContact;
	}

	/**
	 * @param hopContact the hopContact to set
	 */
	public void setHopContact(String hopContact) {
		this.hopContact = hopContact;
	}

	/**
	 * @return the hopVenId
	 */
	public Long getHopVenId() {
		return hopVenId;
	}

	/**
	 * @param hopVenId the hopVenId to set
	 */
	public void setHopVenId(Long hopVenId) {
		this.hopVenId = hopVenId;
	}

	/**
	 * @return the hopAlias
	 */
	public String getHopAlias() {
		return hopAlias;
	}

	/**
	 * @param hopAlias the hopAlias to set
	 */
	public void setHopAlias(String hopAlias) {
		this.hopAlias = hopAlias;
	}

	/**
	 * @return the hopHopId
	 */
	public Long getHopHopId() {
		return hopHopId;
	}

	/**
	 * @param hopHopId the hopHopId to set
	 */
	public void setHopHopId(Long hopHopId) {
		this.hopHopId = hopHopId;
	}

	public String gethBusinessRegNo() {
		return hBusinessRegNo;
	}

	public void sethBusinessRegNo(String hBusinessRegNo) {
		this.hBusinessRegNo = hBusinessRegNo;
	}
	
	
	
	

}
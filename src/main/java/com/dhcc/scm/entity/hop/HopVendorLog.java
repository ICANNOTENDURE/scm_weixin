package com.dhcc.scm.entity.hop;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="T_VEN_VENDOR_LOG")
public class HopVendorLog implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="ID", unique=true, nullable=false)
	private String id;

	@Column(name="VENDORID")
	private Long vendorId;

	@Column(name="OPERATEID")
	private String operateId;

	@Column(name="OPERATEDATE")
	private Date operateDate;

	@Column(name="OPERATETYPE")
	private String operateType;
	
	@Column(name="OPERATEIP")
	private String operateIp;
	
	@Column(name="OPCONTENT")
	private String opContent;
	
	@Column(name="OPUSERNAME")
	private String opUserName;
	
	@Column(name="OPTITLE")
	private String optitle;
	
	@Transient
	private String operateTime;
	
	@Transient
	private String operateYMD;
	
	/**
	 * @return the operateYMD
	 */
	public String getOperateYMD() {
		java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(operateDate);
	}

	/**
	 * @param operateYMD the operateYMD to set
	 */
	public void setOperateYMD(String operateYMD) {
		this.operateYMD = operateYMD;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the vendorId
	 */
	public Long getVendorId() {
		return vendorId;
	}

	/**
	 * @param vendorId the vendorId to set
	 */
	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}

	/**
	 * @return the operateId
	 */
	public String getOperateId() {
		return operateId;
	}

	/**
	 * @param operateId the operateId to set
	 */
	public void setOperateId(String operateId) {
		this.operateId = operateId;
	}

	/**
	 * @return the operateDate
	 */
	public Date getOperateDate() {
		return operateDate;
	}

	/**
	 * @param operateDate the operateDate to set
	 */
	public void setOperateDate(Date operateDate) {
		this.operateDate = operateDate;
	}

	/**
	 * @return the operateType
	 */
	public String getOperateType() {
		return operateType;
	}

	/**
	 * @param operateType the operateType to set
	 */
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	/**
	 * @return the operateIp
	 */
	public String getOperateIp() {
		return operateIp;
	}

	/**
	 * @param operateIp the operateIp to set
	 */
	public void setOperateIp(String operateIp) {
		this.operateIp = operateIp;
	}

	/**
	 * @return the opContent
	 */
	public String getOpContent() {
		return opContent;
	}

	/**
	 * @param opContent the opContent to set
	 */
	public void setOpContent(String opContent) {
		this.opContent = opContent;
	}

	/**
	 * @return the opUserName
	 */
	public String getOpUserName() {
		return opUserName;
	}

	/**
	 * @param opUserName the opUserName to set
	 */
	public void setOpUserName(String opUserName) {
		this.opUserName = opUserName;
	}

	/**
	 * @return the operateTime
	 */
	public String getOperateTime() {
		java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("HH:mm");
		return sdf.format(operateDate);
	}

	/**
	 * @param operateTime the operateTime to set
	 */
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}

	/**
	 * @return the optitle
	 */
	public String getOptitle() {
		return optitle;
	}

	/**
	 * @param optitle the optitle to set
	 */
	public void setOptitle(String optitle) {
		this.optitle = optitle;
	}
	
	
	
	
	

}
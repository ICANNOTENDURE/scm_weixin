package com.dhcc.scm.entity.ord;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_ORD_LABEL database table.
 * 
 */
@Entity
@Table(name="T_ORD_LABEL")
public class OrdLabel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="LABEL_ID", unique=true, nullable=false)
	private String labelId;
	
	@Column(name="LABEL_PARENT_ID")
	private String labelParentId;
	
	//T:扫码入库
	//D:发货
	@Column(name="LABEL_STATUS")
	private String labelStatus;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="label_ingdrec_date")
	private Date labelIngdrecDate;
	
	public String getLabelId() {
		return labelId;
	}

	public void setLabelId(String labelId) {
		this.labelId = labelId;
	}

	public String getLabelParentId() {
		return labelParentId;
	}

	public void setLabelParentId(String labelParentId) {
		this.labelParentId = labelParentId;
	}

	public String getLabelStatus() {
		return labelStatus;
	}

	public void setLabelStatus(String labelStatus) {
		this.labelStatus = labelStatus;
	}

	public OrdLabel(String labelParentId, String labelStatus) {
		super();
		this.labelParentId = labelParentId;
		this.labelStatus = labelStatus;
	}

	public OrdLabel() {
		super();
	}

	public Date getLabelIngdrecDate() {
		return labelIngdrecDate;
	}

	public void setLabelIngdrecDate(Date labelIngdrecDate) {
		this.labelIngdrecDate = labelIngdrecDate;
	}
	
	

}

package com.dhcc.scm.entity.ord;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="t_ord_orderdetailpic")
public class OrderDetailPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	@Column(name="ORDPIC_ID", unique=true, nullable=false)
	private String ordPicId;
	
	@Column(name="ordpic_orderno")
	private String ordPicOrderNo;
	
	@Column(name="ordpic_path")
	private String ordPicPath;

	public String getOrdPicId() {
		return ordPicId;
	}

	public void setOrdPicId(String ordPicId) {
		this.ordPicId = ordPicId;
	}

	public String getOrdPicOrderNo() {
		return ordPicOrderNo;
	}

	public void setOrdPicOrderNo(String ordPicOrderNo) {
		this.ordPicOrderNo = ordPicOrderNo;
	}

	public String getOrdPicPath() {
		return ordPicPath;
	}

	public void setOrdPicPath(String ordPicPath) {
		this.ordPicPath = ordPicPath;
	}
	
	

	
}

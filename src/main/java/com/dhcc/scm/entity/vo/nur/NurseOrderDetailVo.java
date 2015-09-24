package com.dhcc.scm.entity.vo.nur;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlTransient;


@XmlTransient
public class NurseOrderDetailVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	private Long incid;
	
	private String incname;

	private Float rp;
	
	private String picpath;
	
	private String venname;
	
	private String incuom;
	
	private Long venincid;
	
	private Long state;
	
	private String orderNo;
	
	private Float qty;
	
	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Long getState() {
		return state;
	}

	public void setState(Long state) {
		this.state = state;
	}

	public Long getIncid() {
		return incid;
	}

	public void setIncid(Long incid) {
		this.incid = incid;
	}

	public String getIncname() {
		return incname;
	}

	public void setIncname(String incname) {
		this.incname = incname;
	}

	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}

	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}

	public String getVenname() {
		return venname;
	}

	public void setVenname(String venname) {
		this.venname = venname;
	}

	public String getIncuom() {
		return incuom;
	}

	public void setIncuom(String incuom) {
		this.incuom = incuom;
	}

	public Long getVenincid() {
		return venincid;
	}

	public void setVenincid(Long venincid) {
		this.venincid = venincid;
	}

}

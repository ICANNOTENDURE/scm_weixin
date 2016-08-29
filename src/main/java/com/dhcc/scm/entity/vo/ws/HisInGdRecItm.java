
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.Date;

public class HisInGdRecItm implements Serializable{

	private static final long serialVersionUID = 1L;
	
	
	private Long ingdrecId;
	
	private String incBarCode;
	
	private Float qty;
	
	private Float rp;
	
	private Date expdate;
	
	private String invNo;
	
	private String batNo;
	
	private String hisNo;
	
	private String vendorCode;
	
	private String purLocCode;
	
	private String recLocCode;
	
	private Date arriveDate;
	
	private String orderno;
	
	private String orderDetailSubId;
	
	private Date invDate;
	
	
	
	public Date getInvDate() {
		return invDate;
	}

	public void setInvDate(Date invDate) {
		this.invDate = invDate;
	}

	public String getOrderDetailSubId() {
		return orderDetailSubId;
	}

	public void setOrderDetailSubId(String orderDetailSubId) {
		this.orderDetailSubId = orderDetailSubId;
	}

	public Date getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public String getPurLocCode() {
		return purLocCode;
	}

	public void setPurLocCode(String purLocCode) {
		this.purLocCode = purLocCode;
	}

	public String getRecLocCode() {
		return recLocCode;
	}

	public void setRecLocCode(String recLocCode) {
		this.recLocCode = recLocCode;
	}

	public String getHisNo() {
		return hisNo;
	}

	public void setHisNo(String hisNo) {
		this.hisNo = hisNo;
	}

	public Long getIngdrecId() {
		return ingdrecId;
	}

	public void setIngdrecId(Long ingdrecId) {
		this.ingdrecId = ingdrecId;
	}

	public String getIncBarCode() {
		return incBarCode;
	}

	public void setIncBarCode(String incBarCode) {
		this.incBarCode = incBarCode;
	}

	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}

	public Date getExpdate() {
		return expdate;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public String getInvNo() {
		return invNo;
	}

	public void setInvNo(String invNo) {
		this.invNo = invNo;
	}

	public String getBatNo() {
		return batNo;
	}

	public void setBatNo(String batNo) {
		this.batNo = batNo;
	}
	
	
	
}

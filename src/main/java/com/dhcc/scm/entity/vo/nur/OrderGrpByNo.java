package com.dhcc.scm.entity.vo.nur;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlTransient;

import com.dhcc.scm.entity.ord.OrderDetail;


@XmlTransient
public class OrderGrpByNo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private  List<OrderDetail> orderDetails;
	
	private String orderno;
	
	private String vendorName;
	
	private Date orderTime;
	
	private String purloc;
	
	private String recloc;
	
	private String venname;
	
	private Date date;
	
	private String emflag;
	
	private String state;
	
	
	
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEmflag() {
		return emflag;
	}

	public void setEmflag(String emflag) {
		this.emflag = emflag;
	}

	public String getVenname() {
		return venname;
	}

	public void setVenname(String venname) {
		this.venname = venname;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPurloc() {
		return purloc;
	}

	public void setPurloc(String purloc) {
		this.purloc = purloc;
	}

	public String getRecloc() {
		return recloc;
	}

	public void setRecloc(String recloc) {
		this.recloc = recloc;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	
	
}
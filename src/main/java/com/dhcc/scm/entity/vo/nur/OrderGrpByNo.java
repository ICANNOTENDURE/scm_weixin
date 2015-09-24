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
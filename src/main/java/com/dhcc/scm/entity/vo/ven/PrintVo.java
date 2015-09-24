package com.dhcc.scm.entity.vo.ven;

import java.util.Date;
import java.util.List;



public class PrintVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String recloc;
	
	private String destination;

	private String hisno;

	private String hopname;
	
	private Date orderDate;
	
	private Float amt;
	
	
	
	private List<DeliverItmVo> deliverItmVos;
	
	
	
	
	public Float getAmt() {
		return amt;
	}

	public void setAmt(Float amt) {
		this.amt = amt;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getRecloc() {
		return recloc;
	}

	public void setRecloc(String recloc) {
		this.recloc = recloc;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getHisno() {
		return hisno;
	}

	public void setHisno(String hisno) {
		this.hisno = hisno;
	}

	public String getHopname() {
		return hopname;
	}

	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	public List<DeliverItmVo> getDeliverItmVos() {
		return deliverItmVos;
	}

	public void setDeliverItmVos(List<DeliverItmVo> deliverItmVos) {
		this.deliverItmVos = deliverItmVos;
	}
		
}

package com.dhcc.scm.entity.vo.ven;

import java.util.Date;
import java.util.List;



public class PrintVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String recloc;
	
	private String purloc;
	
	private String destination;

	private String hisno;

	private String hopname;
	
	private Date orderDate;
	
	private Date qualifdate;
	
	private Float amt;

	private Long ordrid;
	
	private String orderno;
	
	private String qualifprocer;
	
	private String qualifdpurno;
	
    private String venname;
	
	

	/**
	 * @return the venname
	 */
	public String getVenname() {
		return venname;
	}

	/**
	 * @param venname the venname to set
	 */
	public void setVenname(String venname) {
		this.venname = venname;
	}

	/**
	 * @return the qualifprocer
	 */
	public String getQualifprocer() {
		return qualifprocer;
	}

	/**
	 * @param qualifprocer the qualifprocer to set
	 */
	public void setQualifprocer(String qualifprocer) {
		this.qualifprocer = qualifprocer;
	}

	/**
	 * @return the qualifdpurno
	 */
	public String getQualifdpurno() {
		return qualifdpurno;
	}

	/**
	 * @param qualifdpurno the qualifdpurno to set
	 */
	public void setQualifdpurno(String qualifdpurno) {
		this.qualifdpurno = qualifdpurno;
	}

	private List<DeliverItmVo> deliverItmVos;
	
	/**
	 * @return the qualifdate
	 */
	public Date getQualifdate() {
		return qualifdate;
	}

	/**
	 * @param qualifdate the qualifdate to set
	 */
	public void setQualifdate(Date qualifdate) {
		this.qualifdate = qualifdate;
	}
	
	/**
	 * @return the purloc
	 */
	public String getPurloc() {
		return purloc;
	}

	/**
	 * @param purloc the purloc to set
	 */
	public void setPurloc(String purloc) {
		this.purloc = purloc;
	}

	
	public Long getOrdrid() {
		return ordrid;
	}

	public void setOrdrid(Long ordrid) {
		this.ordrid = ordrid;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

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

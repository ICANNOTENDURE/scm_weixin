package com.dhcc.scm.entity.vo.ord;

import java.util.Date;





public class PlanItmVO implements java.io.Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String incname;
	
	private Long planid;
	
	private Float planqty;

	private String venname;
	
	private String manfname;
	
	private String venincid;
	
	private Float price;
	
	private Date plandate;
	
	private Long ctloc;
	
	private Long hopincid;
	
	
	


	public Long getHopincid() {
		return hopincid;
	}

	public void setHopincid(Long hopincid) {
		this.hopincid = hopincid;
	}

	public Date getPlandate() {
		return plandate;
	}

	public void setPlandate(Date plandate) {
		this.plandate = plandate;
	}

	public Long getCtloc() {
		return ctloc;
	}

	public void setCtloc(Long ctloc) {
		this.ctloc = ctloc;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getIncname() {
		return incname;
	}

	public void setIncname(String incname) {
		this.incname = incname;
	}

	public Long getPlanid() {
		return planid;
	}

	public void setPlanid(Long planid) {
		this.planid = planid;
	}

	public Float getPlanqty() {
		return planqty;
	}

	public void setPlanqty(Float planqty) {
		this.planqty = planqty;
	}

	public String getVenname() {
		return venname;
	}

	public void setVenname(String venname) {
		this.venname = venname;
	}

	public String getManfname() {
		return manfname;
	}

	public void setManfname(String manfname) {
		this.manfname = manfname;
	}

	public String getVenincid() {
		return venincid;
	}

	public void setVenincid(String venincid) {
		this.venincid = venincid;
	}
	
	
}

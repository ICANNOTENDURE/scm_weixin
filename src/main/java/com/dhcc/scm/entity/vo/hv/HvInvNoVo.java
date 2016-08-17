package com.dhcc.scm.entity.vo.hv;

import java.util.Date;



public class HvInvNoVo {

	private String flag;

	private Long id;
	
	private String invno;
	
	private Date invnodate;
	
	private String label;
	
	private Date orddate;
	
	private Long qty;
	
	private String hosp;
	
	private String venincname;
	
	private String spec;
	
	private Float rp;
	
	
	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getInvno() {
		return invno;
	}

	public void setInvno(String invno) {
		this.invno = invno;
	}

	public Date getInvnodate() {
		return invnodate;
	}

	public void setInvnodate(Date invnodate) {
		this.invnodate = invnodate;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Date getOrddate() {
		return orddate;
	}

	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}

	public Long getQty() {
		return qty;
	}

	public void setQty(Long qty) {
		this.qty = qty;
	}

	public String getHosp() {
		return hosp;
	}

	public void setHosp(String hosp) {
		this.hosp = hosp;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	};
	


		
}

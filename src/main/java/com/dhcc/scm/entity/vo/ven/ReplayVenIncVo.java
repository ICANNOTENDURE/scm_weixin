/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

import java.util.List;

import com.dhcc.scm.entity.ven.VenIncAdvice;


public class ReplayVenIncVo {
	
	private int qty;
	
	private Long inc;
	
	private String incname;
	
	private String uom;
	
	private Float price;
	
	private String spec;
	
	private List<VenIncAdvice> venIncAdvices;
	
	private String vendorname;
	
	
	
	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public List<VenIncAdvice> getVenIncAdvices() {
		return venIncAdvices;
	}

	public void setVenIncAdvices(List<VenIncAdvice> venIncAdvices) {
		this.venIncAdvices = venIncAdvices;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public Long getInc() {
		return inc;
	}

	public void setInc(Long inc) {
		this.inc = inc;
	}

	public String getIncname() {
		return incname;
	}

	public void setIncname(String incname) {
		this.incname = incname;
	}
	
	
	
}

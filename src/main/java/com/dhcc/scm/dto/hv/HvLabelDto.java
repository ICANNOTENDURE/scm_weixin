/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.hv;

import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hv.HvLabel;

public class HvLabelDto extends BaseDto {



	/**
	 * 
	 */
	private static final long serialVersionUID = 6024133413038097628L;

	private HvLabel hvLabel;
	
	private String parStr;
	
	private Date ordStart;
	
	private Date ordEnd;
	
	private String flag;
	
	private String invno;
	
	private String incname;
	
	
	private Long venIncIdPrn;
	
	private String venCodePrn;
	
	private String venIncCodePrn;
	
	private Date venExpPrn;
	
	private int venCountPrn;
	
	private int venReaptPrn;
	
	
	private List<String> barCodes;
	
	
	
	public List<String> getBarCodes() {
		return barCodes;
	}


	public void setBarCodes(List<String> barCodes) {
		this.barCodes = barCodes;
	}


	public Long getVenIncIdPrn() {
		return venIncIdPrn;
	}


	public void setVenIncIdPrn(Long venIncIdPrn) {
		this.venIncIdPrn = venIncIdPrn;
	}


	public String getVenCodePrn() {
		return venCodePrn;
	}


	public void setVenCodePrn(String venCodePrn) {
		this.venCodePrn = venCodePrn;
	}


	public String getVenIncCodePrn() {
		return venIncCodePrn;
	}


	public void setVenIncCodePrn(String venIncCodePrn) {
		this.venIncCodePrn = venIncCodePrn;
	}


	public Date getVenExpPrn() {
		return venExpPrn;
	}


	public void setVenExpPrn(Date venExpPrn) {
		this.venExpPrn = venExpPrn;
	}


	public int getVenCountPrn() {
		return venCountPrn;
	}


	public void setVenCountPrn(int venCountPrn) {
		this.venCountPrn = venCountPrn;
	}


	public int getVenReaptPrn() {
		return venReaptPrn;
	}


	public void setVenReaptPrn(int venReaptPrn) {
		this.venReaptPrn = venReaptPrn;
	}


	public String getInvno() {
		return invno;
	}


	public void setInvno(String invno) {
		this.invno = invno;
	}


	public String getIncname() {
		return incname;
	}


	public void setIncname(String incname) {
		this.incname = incname;
	}


	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	public Date getOrdStart() {
		return ordStart;
	}


	public void setOrdStart(Date ordStart) {
		this.ordStart = ordStart;
	}


	public Date getOrdEnd() {
		return ordEnd;
	}


	public void setOrdEnd(Date ordEnd) {
		this.ordEnd = ordEnd;
	}


	public String getParStr() {
		return parStr;
	}


	public void setParStr(String parStr) {
		this.parStr = parStr;
	}


	public HvLabel getHvLabel() {
		return hvLabel;
	}

	
	public void setHvLabel(HvLabel hvLabel) {
		this.hvLabel = hvLabel;
	}
	
}

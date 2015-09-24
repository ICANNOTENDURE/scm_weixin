package com.dhcc.scm.entity.vo.nur;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlTransient;


@XmlTransient
public class NurseIncDetailVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	private Long incid;
	
	private Long venincid;
	
	private String inccode;
	
	private String incname;

	private Float rp;

	
	private String manf;
	
	private String spec;
	
	private String venname;
	
	private String incuom;
	
	
	
	public Long getVenincid() {
		return venincid;
	}

	public void setVenincid(Long venincid) {
		this.venincid = venincid;
	}

	public Long getIncid() {
		return incid;
	}

	public void setIncid(Long incid) {
		this.incid = incid;
	}

	public String getInccode() {
		return inccode;
	}

	public void setInccode(String inccode) {
		this.inccode = inccode;
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


	public String getManf() {
		return manf;
	}

	public void setManf(String manf) {
		this.manf = manf;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
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
	
	
	
	
	
	
}

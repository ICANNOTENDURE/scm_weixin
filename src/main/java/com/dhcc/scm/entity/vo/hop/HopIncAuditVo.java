package com.dhcc.scm.entity.vo.hop;

import java.util.List;

import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;



public class HopIncAuditVo {
	
	private Long hopincid;
	
	private String hopincname;
	
	private Long venincid;
	
	private String venincname;
	
	private String venname;
	
	private String manf;
	
	private String uom;
	
	private String spec;
	
	private Float venrp;
	
	private Float hoprp;
	
	private String hopincuom;
	
	private String venincuom;
	
	private String facid;
	
	private Float venfac;
	
	private Float hopfac;
	
	private String auditflag;

	private List<VenQualifTypeVO> qualifTypeVOs;
	
	private List<VenIncPic> incPics;
	
	
	
	
	public List<VenIncPic> getIncPics() {
		return incPics;
	}

	public void setIncPics(List<VenIncPic> incPics) {
		this.incPics = incPics;
	}

	public List<VenQualifTypeVO> getQualifTypeVOs() {
		return qualifTypeVOs;
	}

	public void setQualifTypeVOs(List<VenQualifTypeVO> qualifTypeVOs) {
		this.qualifTypeVOs = qualifTypeVOs;
	}

	public Long getHopincid() {
		return hopincid;
	}
	
	public void setHopincid(Long hopincid) {
		this.hopincid = hopincid;
	}

	public String getHopincname() {
		return hopincname;
	}

	public void setHopincname(String hopincname) {
		this.hopincname = hopincname;
	}

	public Long getVenincid() {
		return venincid;
	}

	public void setVenincid(Long venincid) {
		this.venincid = venincid;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public String getVenname() {
		return venname;
	}

	public void setVenname(String venname) {
		this.venname = venname;
	}

	public String getManf() {
		return manf;
	}

	public void setManf(String manf) {
		this.manf = manf;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Float getVenrp() {
		return venrp;
	}

	public void setVenrp(Float venrp) {
		this.venrp = venrp;
	}

	public Float getHoprp() {
		return hoprp;
	}

	public void setHoprp(Float hoprp) {
		this.hoprp = hoprp;
	}

	public String getHopincuom() {
		return hopincuom;
	}

	public void setHopincuom(String hopincuom) {
		this.hopincuom = hopincuom;
	}

	public String getVenincuom() {
		return venincuom;
	}

	public void setVenincuom(String venincuom) {
		this.venincuom = venincuom;
	}

	public String getFacid() {
		return facid;
	}

	public void setFacid(String facid) {
		this.facid = facid;
	}

	public Float getVenfac() {
		return venfac;
	}

	public void setVenfac(Float venfac) {
		this.venfac = venfac;
	}

	public Float getHopfac() {
		return hopfac;
	}

	public void setHopfac(Float hopfac) {
		this.hopfac = hopfac;
	}

	public String getAuditflag() {
		return auditflag;
	}

	public void setAuditflag(String auditflag) {
		this.auditflag = auditflag;
	}
	

	

	
		
}

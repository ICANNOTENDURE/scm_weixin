package com.dhcc.scm.entity.vo.nur;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlTransient;


@XmlTransient
public class NurseIncVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	private Long incid;
	
	private String inccode;
	
	private String incname;

	private Float rp;
	
	private String picpath;
	
	private String manf;
	
	private String spec;
	
	private String venname;
	
	private String incuom;
	
	private Long venincid;
	
	private Long inccatid;
	
	private Long veninccommentnum;
	
	private Float qty;
	
	private Integer commentnum=0;
	
	private Integer orderqty=0;
	
	private Long manfid;


	public Long getManfid() {
		return manfid;
	}

	public void setManfid(Long manfid) {
		this.manfid = manfid;
	}

	public Integer getOrderqty() {
		return orderqty;
	}

	public void setOrderqty(Integer orderqty) {
		this.orderqty = orderqty;
	}

	public Integer getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(Integer commentnum) {
		this.commentnum = commentnum;
	}

	public Float getQty() {
		return qty;
	}

	public void setQty(Float qty) {
		this.qty = qty;
	}

	public Long getVeninccommentnum() {
		return veninccommentnum;
	}

	public void setVeninccommentnum(Long veninccommentnum) {
		this.veninccommentnum = veninccommentnum;
	}

	/**
	 * @return the inccatid
	 */
	public Long getInccatid() {
		return inccatid;
	}

	/**
	 * @param inccatid the inccatid to set
	 */
	public void setInccatid(Long inccatid) {
		this.inccatid = inccatid;
	}

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

	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
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

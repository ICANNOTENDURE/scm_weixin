package com.dhcc.scm.entity.vo.ord;

import java.util.Date;

import org.apache.commons.lang.StringUtils;



public class DevPropertyGridVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String statedesc;
	
	private Long stateid;
	
	private String orderid;
	
	private String recloc;
	
	private String ordersubid;
	
	private Date orderdate;

	private String orderno;
	
	private String hopname;
	
	private String venincname;
	
	private String veninccode;
	
	private Float ordqty;
	
	private Float devqty;
	
	private String uom;
	
	private String batno;
	
	private String invno;
	
	private Date expdate;
	
	private Date operatedate;
	
	private String operatuser;
	
	private Float rp;

	private Date arrivedate;
	
	private Date invdate;
	
	private String spec;
	
	private String form;
	
	private String purloc;
	
	
	


	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getPurloc() {
		return purloc;
	}

	public void setPurloc(String purloc) {
		this.purloc = purloc;
	}

	public Date getInvdate() {
		return invdate;
	}

	public void setInvdate(Date invdate) {
		this.invdate = invdate;
	}

	public Date getArrivedate() {
		return arrivedate;
	}

	public void setArrivedate(Date arrivedate) {
		this.arrivedate = arrivedate;
	}

	public Long getStateid() {
		return stateid;
	}

	public void setStateid(Long stateid) {
		this.stateid = stateid;
	}

	public Float getRp() {
		return rp;
	}

	public void setRp(Float rp) {
		this.rp = rp;
	}

	public String getOrdersubid() {
		return ordersubid;
	}

	public void setOrdersubid(String ordersubid) {
		this.ordersubid = ordersubid;
	}

	public String getOperatuser() {
		return operatuser;
	}

	public void setOperatuser(String operatuser) {
		this.operatuser = operatuser;
	}

	public Date getOperatedate() {
		return operatedate;
	}

	public void setOperatedate(Date operatedate) {
		this.operatedate = operatedate;
	}

	public String getStatedesc() {
		return statedesc;
	}

	public void setStatedesc(String statedesc) {
		this.statedesc = statedesc;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getRecloc() {
		return recloc;
	}

	public void setRecloc(String recloc) {
		this.recloc = recloc;
	}


	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getHopname() {
		return hopname;
	}

	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public String getVeninccode() {
		return veninccode;
	}

	public void setVeninccode(String veninccode) {
		this.veninccode = veninccode;
	}

	public Float getOrdqty() {
		return ordqty;
	}

	public void setOrdqty(Float ordqty) {
		this.ordqty = ordqty;
	}

	public Float getDevqty() {
		if(stateid.toString().equals("2")&&(StringUtils.isEmpty(ordersubid))){
			devqty=ordqty;
		}
		return devqty;
	}

	public void setDevqty(Float devqty) {
		this.devqty = devqty;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getBatno() {
		return batno;
	}

	public void setBatno(String batno) {
		this.batno = batno;
	}

	public String getInvno() {
		return invno;
	}

	public void setInvno(String invno) {
		this.invno = invno;
	}

	public Date getExpdate() {
		return expdate;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public String getGroup() {
		return this.orderno;
	}

		
}

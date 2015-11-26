package com.dhcc.scm.entity.vo.ven;





public class PrintByQtyVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String deliveritmid;
	
	private String venincname;

	private int seq;
	
	private String orderno;
	
	
	
	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getDeliveritmid() {
		return deliveritmid;
	}

	public void setDeliveritmid(String deliveritmid) {
		this.deliveritmid = deliveritmid;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	
}

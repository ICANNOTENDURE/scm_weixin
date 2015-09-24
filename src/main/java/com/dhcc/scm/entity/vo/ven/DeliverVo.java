package com.dhcc.scm.entity.vo.ven;

import java.sql.Timestamp;



public class DeliverVo implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String statedesc;
	
	private String recloc;
	
	private String purloc;
	
	private String destination;

	private String hisno;
	//
	private String remark;
	//
	private String hopname;
	//发货单ID
	private Long deliverid;
	//接收订单时间
	private Timestamp deliveraccpectdate;
	//发货时间
	private Timestamp deliverdate;
	//接收订人
	private String deliveraccpectuser;
	//发货人
	private String deliveruser;
	
	private String serialno;
	
	
	
	/**
	 * @return the serialno
	 */
	public String getSerialno() {
		return serialno;
	}

	/**
	 * @param serialno the serialno to set
	 */
	public void setSerialno(String serialno) {
		this.serialno = serialno;
	}

	/**
	 * @return the deliveraccpectuser
	 */
	public String getDeliveraccpectuser() {
		return deliveraccpectuser;
	}

	/**
	 * @param deliveraccpectuser the deliveraccpectuser to set
	 */
	public void setDeliveraccpectuser(String deliveraccpectuser) {
		this.deliveraccpectuser = deliveraccpectuser;
	}

	/**
	 * @return the deliveruser
	 */
	public String getDeliveruser() {
		return deliveruser;
	}

	/**
	 * @param deliveruser the deliveruser to set
	 */
	public void setDeliveruser(String deliveruser) {
		this.deliveruser = deliveruser;
	}

	/**
	 * @return the deliverdate
	 */
	public Timestamp getDeliverdate() {
		return deliverdate;
	}

	/**
	 * @param deliverdate the deliverdate to set
	 */
	public void setDeliverdate(Timestamp deliverdate) {
		this.deliverdate = deliverdate;
	}

	/**
	 * @return the deliveraccpectdate
	 */
	public Timestamp getDeliveraccpectdate() {
		return deliveraccpectdate;
	}

	/**
	 * @param deliveraccpectdate the deliveraccpectdate to set
	 */
	public void setDeliveraccpectdate(Timestamp deliveraccpectdate) {
		this.deliveraccpectdate = deliveraccpectdate;
	}

	/**
	 * @return the deliverid
	 */
	public Long getDeliverid() {
		return deliverid;
	}

	/**
	 * @param deliverid the deliverid to set
	 */
	public void setDeliverid(Long deliverid) {
		this.deliverid = deliverid;
	}

	/**
	 * @return the hopname
	 */
	public String getHopname() {
		return hopname;
	}

	/**
	 * @param hopname the hopname to set
	 */
	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	

	/**
	 * @return the hisno
	 */
	public String getHisno() {
		return hisno;
	}

	/**
	 * @param hisno the hisno to set
	 */
	public void setHisno(String hisno) {
		this.hisno = hisno;
	}



	
	

	/**
	 * @return the statedesc
	 */
	public String getStatedesc() {
		return statedesc;
	}

	/**
	 * @param statedesc the statedesc to set
	 */
	public void setStatedesc(String statedesc) {
		this.statedesc = statedesc;
	}


	/**
	 * @return the recloc
	 */
	public String getRecloc() {
		return recloc;
	}

	/**
	 * @param recloc the recloc to set
	 */
	public void setRecloc(String recloc) {
		this.recloc = recloc;
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

	/**
	 * @return the destination
	 */
	public String getDestination() {
		return destination;
	}

	/**
	 * @param destination the destination to set
	 */
	public void setDestination(String destination) {
		this.destination = destination;
	}

		
}

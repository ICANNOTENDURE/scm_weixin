package com.dhcc.scm.entity.ord;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


/**
 * The persistent class for the T_ORD_ORDERITM database table.
 * 
 */
@Entity
@Table(name="T_ORD_ORDERDETAIL")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@SequenceGenerator(name="T_ORD_DETAIL_DETAILID_GENERATOR", sequenceName="SEQUENCE_ORD_DETAIL")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="T_ORD_DETAIL_DETAILID_GENERATOR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ORDER_ID")
	private Long orderId;
	
	@Column(name="ORDER_HOP_ID")
	private Long orderHopId;

	@Column(name="ORDER_NO")
	private String orderNo;

	@Column(name="ORDER_VEN_ID")
	private Long orderVenId;
	
	@Column(name="ORDER_HOP_INC_ID")
	private Long orderHopIncId;
	
	@Column(name="ORDER_VEN_INC_ID")
	private Long orderVenIncId;
	
	@Column(name="ORDER_HOP_UOM")
	private String orderHopUom;
	
	@Column(name="ORDER_VEN_UOM")
	private String orderVenuom;
	
	@Column(name="ORDER_HOP_QTY")
	private Float orderHopQty;
	
	@Column(name="ORDER_VEN_QTY")
	private Float orderVenQty;
	
	
	@Column(name="ORDER_REC_QTY")
	private Float orderRecQty;
	
	@Column(name="ORDER_RP")
	private Float orderRp;
	
	@Column(name="ORDER_RECLOC")
	private Long orderRecLoc;
	
	@Column(name="ORDER_RECDESTINATION")
	private Long orderRecDestination;
	
	
	@Column(name="ORDER_USER_ID")
	private Long orderUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ORDER_ODATE")
	private Date orderDate;
	
	@Column(name="ORDER_STATE")
	private Long orderState;
	
	@Column(name="ORDER_HISNO")
	private String orderHisNo;
	
	@Column(name="ORDER_EMFLAG")
	private String orderEmFlag;
	
	@Column(name="ORDER_IMP_ID")
	private String orderImpId;
	
	/*入库做帐科室*/
	@Column(name="ORDER_PUR_LOC")
	private Long orderPurLoc;
	
	/*供应商webservice收到信息标志*/
	@Column(name="ORDER_SENDFLAG")
	private String orderSendFlag;
	/**
	 * 供应商到医院转换系数
	 */
	@Column(name="ORDER_FAC")
	private Float orderFac;
	
	@Transient
	private String incName;
	
	@Transient
	private String picPath;
	
	@Transient
	private float amt;
	
	@Transient
	private float devQty;
	
	@Transient
	private String stateDesc;
	
	@Transient
	private String spec;
	
	
	


	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Long getOrderPurLoc() {
		return orderPurLoc;
	}

	public void setOrderPurLoc(Long orderPurLoc) {
		this.orderPurLoc = orderPurLoc;
	}

	public String getOrderSendFlag() {
		return orderSendFlag;
	}

	public void setOrderSendFlag(String orderSendFlag) {
		this.orderSendFlag = orderSendFlag;
	}

	public String getStateDesc() {
		return stateDesc;
	}

	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}

	public String getOrderImpId() {
		return orderImpId;
	}

	public void setOrderImpId(String orderImpId) {
		this.orderImpId = orderImpId;
	}

	public float getDevQty() {
		return devQty;
	}

	public void setDevQty(float devQty) {
		this.devQty = devQty;
	}

	public float getAmt() {
		return amt=orderRp.floatValue()*orderHopQty.floatValue();
	}

	public void setAmt(float amt) {
		this.amt=amt ;
	}

	public String getIncName() {
		return incName;
	}

	public void setIncName(String incName) {
		this.incName = incName;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public Long getOrderState() {
		return orderState;
	}

	public void setOrderState(Long orderState) {
		this.orderState = orderState;
	}

	public Float getOrderFac() {
		return orderFac;
	}

	public void setOrderFac(Float orderFac) {
		this.orderFac = orderFac;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getOrderHopId() {
		return orderHopId;
	}

	public void setOrderHopId(Long orderHopId) {
		this.orderHopId = orderHopId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Long getOrderVenId() {
		return orderVenId;
	}

	public void setOrderVenId(Long orderVenId) {
		this.orderVenId = orderVenId;
	}

	public Long getOrderHopIncId() {
		return orderHopIncId;
	}

	public void setOrderHopIncId(Long orderHopIncId) {
		this.orderHopIncId = orderHopIncId;
	}

	public Long getOrderVenIncId() {
		return orderVenIncId;
	}

	public void setOrderVenIncId(Long orderVenIncId) {
		this.orderVenIncId = orderVenIncId;
	}

	public String getOrderHopUom() {
		return orderHopUom;
	}

	public void setOrderHopUom(String orderHopUom) {
		this.orderHopUom = orderHopUom;
	}

	public String getOrderVenuom() {
		return orderVenuom;
	}

	public void setOrderVenuom(String orderVenuom) {
		this.orderVenuom = orderVenuom;
	}

	public Float getOrderHopQty() {
		return orderHopQty;
	}

	public void setOrderHopQty(Float orderHopQty) {
		this.orderHopQty = orderHopQty;
	}

	public Float getOrderVenQty() {
		return orderVenQty;
	}

	public void setOrderVenQty(Float orderVenQty) {
		this.orderVenQty = orderVenQty;
	}

	public Float getOrderRecQty() {
		return orderRecQty;
	}

	public void setOrderRecQty(Float orderRecQty) {
		this.orderRecQty = orderRecQty;
	}

	public Float getOrderRp() {
		return orderRp;
	}

	public void setOrderRp(Float orderRp) {
		this.orderRp = orderRp;
	}

	public Long getOrderRecLoc() {
		return orderRecLoc;
	}

	public void setOrderRecLoc(Long orderRecLoc) {
		this.orderRecLoc = orderRecLoc;
	}

	public Long getOrderRecDestination() {
		return orderRecDestination;
	}

	public void setOrderRecDestination(Long orderRecDestination) {
		this.orderRecDestination = orderRecDestination;
	}

	public Long getOrderUserId() {
		return orderUserId;
	}

	public void setOrderUserId(Long orderUserId) {
		this.orderUserId = orderUserId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderHisNo() {
		return orderHisNo;
	}

	public void setOrderHisNo(String orderHisNo) {
		this.orderHisNo = orderHisNo;
	}

	public String getOrderEmFlag() {
		return orderEmFlag;
	}

	public void setOrderEmFlag(String orderEmFlag) {
		this.orderEmFlag = orderEmFlag;
	}
	
	
	
}

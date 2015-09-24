package com.dhcc.scm.entity.hop;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * 
* @ClassName: Evalute 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author zhouxin
* @date 2015年2月3日 下午4:08:44 
*
 */
@Entity
@Table(name="T_HOP_EVALUTE")
public class Evalute implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_EVALUTE")})
	@GeneratedValue(generator="idGenerator")	
	@Column(name="ELE_ID", unique=true, nullable=false, precision=22)
	private Long evaluteId;

	@Column(name="ELE_HOSPID")
	private Long hospId;

	@Column(name="ELE_ORDERID")
	private Long orderId;

	@Column(name="ELE_DATE")
	private Date eleDate;
	
	@Column(name="ELE_USERID")
	private Long eleUserId;
	
	@Column(name="ELE_RESULT")
	private String eleResult;
	
	@Column(name="ELE_CONTENT")
	private String eleContent;
	
	@Column(name="ELE_VENDORID")
	private Long eleVendorId;
	
	@Column(name="ELE_VENINCID")
	private Long eleVenIncId;
	
	/*物流*/
	@Column(name="ELE_SPEED")
	private String eleSpeed;
	
	/*服务*/
	@Column(name="ELE_SERVICE")
	private String eleService;
	
	/*商品描述*/
	@Column(name="ELE_DESCRIPTION")
	private String eleDescription;
	
	@Transient
	private String userName;
	
	public Evalute() {
	}
	
	
	
	
	
	public String getEleSpeed() {
		return eleSpeed;
	}





	public void setEleSpeed(String eleSpeed) {
		this.eleSpeed = eleSpeed;
	}





	public String getEleService() {
		return eleService;
	}





	public void setEleService(String eleService) {
		this.eleService = eleService;
	}





	public String getEleDescription() {
		return eleDescription;
	}





	public void setEleDescription(String eleDescription) {
		this.eleDescription = eleDescription;
	}





	public String getUserName() {
		return userName;
	}





	public void setUserName(String userName) {
		this.userName = userName;
	}





	public Long getEleVenIncId() {
		return eleVenIncId;
	}





	public void setEleVenIncId(Long eleVenIncId) {
		this.eleVenIncId = eleVenIncId;
	}





	public Long getEvaluteId() {
		return evaluteId;
	}

	public void setEvaluteId(Long evaluteId) {
		this.evaluteId = evaluteId;
	}

	public Long getHospId() {
		return hospId;
	}

	public void setHospId(Long hospId) {
		this.hospId = hospId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Date getEleDate() {
		return eleDate;
	}

	public void setEleDate(Date eleDate) {
		this.eleDate = eleDate;
	}

	public Long getEleUserId() {
		return eleUserId;
	}

	public void setEleUserId(Long eleUserId) {
		this.eleUserId = eleUserId;
	}

	public String getEleResult() {
		return eleResult;
	}

	public void setEleResult(String eleResult) {
		this.eleResult = eleResult;
	}

	public String getEleContent() {
		return eleContent;
	}

	public void setEleContent(String eleContent) {
		this.eleContent = eleContent;
	}

	public Long getEleVendorId() {
		return eleVendorId;
	}

	public void setEleVendorId(Long eleVendorId) {
		this.eleVendorId = eleVendorId;
	}



}
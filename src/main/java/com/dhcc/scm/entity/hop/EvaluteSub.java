package com.dhcc.scm.entity.hop;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
* @ClassName: Evalute 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author zhouxin
* @date 2015年2月3日 下午4:08:44 
*
 */
@Entity
@Table(name="T_HOP_ELESUB")
public class EvaluteSub implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	//@GenericGenerator(name="idGenerator",strategy="sequence", parameters={@Parameter(name="sequence",value="SEQUENCE_HOP_ELESUB")})
	@GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="ELE_SUB_ID", unique=true, nullable=false)
	private Long eleSubId;

	@Column(name="ELE_PROPERTY_ID")
	private Long elePropertyId;

	@Column(name="ELE_ORD_ID")
	private Long eleOrdId;

	public Long getEleSubId() {
		return eleSubId;
	}

	public void setEleSubId(Long eleSubId) {
		this.eleSubId = eleSubId;
	}

	public Long getElePropertyId() {
		return elePropertyId;
	}

	public void setElePropertyId(Long elePropertyId) {
		this.elePropertyId = elePropertyId;
	}

	public Long getEleOrdId() {
		return eleOrdId;
	}

	public void setEleOrdId(Long eleOrdId) {
		this.eleOrdId = eleOrdId;
	}


	



}
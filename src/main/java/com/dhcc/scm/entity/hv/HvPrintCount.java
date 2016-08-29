package com.dhcc.scm.entity.hv;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_hv_printcount")
public class HvPrintCount implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GenericGenerator(name="idGenerator",strategy="identity")
	@GeneratedValue(generator="idGenerator")	
	@Column(name="printcount_id", unique=true, nullable=false, precision=22)
	private Long printCountId;
	
	@Temporal(TemporalType.DATE)
	@Column(name="printcount_date")
	private Date printCountDate;
	
	@Column(name="printcount_seq")
	private Integer printCountSeq;
	
	@Column(name="printcount_venincid")
	private Long printCountVenIncId;

	public Long getPrintCountId() {
		return printCountId;
	}

	public void setPrintCountId(Long printCountId) {
		this.printCountId = printCountId;
	}

	public Date getPrintCountDate() {
		return printCountDate;
	}

	public void setPrintCountDate(Date printCountDate) {
		this.printCountDate = printCountDate;
	}

	public Integer getPrintCountSeq() {
		return printCountSeq;
	}

	public void setPrintCountSeq(Integer printCountSeq) {
		this.printCountSeq = printCountSeq;
	}

	public Long getPrintCountVenIncId() {
		return printCountVenIncId;
	}

	public void setPrintCountVenIncId(Long printCountVenIncId) {
		this.printCountVenIncId = printCountVenIncId;
	}
	
	
	
}

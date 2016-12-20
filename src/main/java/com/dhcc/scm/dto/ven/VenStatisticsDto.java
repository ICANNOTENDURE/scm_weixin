/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ven;

import java.util.Date;



import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ord.OrderDetailSub;
public class VenStatisticsDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6024133413038097628L;

	private OrderDetailSub orderDetailSub;
	
	private String venincname;
	
	private Float ordsubqty;
	
	private Float ordersubrp;
	
	private Float ordsubhisqty;
	
	private Float ordsubhisrp;
	
	private Float ordsubrpamt;
	
	private String hosp;

	private Date ordStart;
	
	private Date ordEnd;
	
	public OrderDetailSub getOrderDetailSub() {
		return orderDetailSub;
	}

	public void setOrderDetailSub(OrderDetailSub orderDetailSub) {
		this.orderDetailSub = orderDetailSub;
	}

	public String getVenincname() {
		return venincname;
	}

	public void setVenincname(String venincname) {
		this.venincname = venincname;
	}

	public Float getOrdsubqty() {
		return ordsubqty;
	}

	public void setOrdsubqty(Float ordsubqty) {
		this.ordsubqty = ordsubqty;
	}

	public Float getOrdersubrp() {
		return ordersubrp;
	}

	public void setOrdersubrp(Float ordersubrp) {
		this.ordersubrp = ordersubrp;
	}

	public Float getOrdsubhisqty() {
		return ordsubhisqty;
	}

	public void setOrdsubhisqty(Float ordsubhisqty) {
		this.ordsubhisqty = ordsubhisqty;
	}

	public Float getOrdsubhisrp() {
		return ordsubhisrp;
	}

	public void setOrdsubhisrp(Float ordsubhisrp) {
		this.ordsubhisrp = ordsubhisrp;
	}

	public Float getOrdsubrpamt() {
		return ordsubrpamt;
	}

	public void setOrdsubrpamt(Float ordsubrpamt) {
		this.ordsubrpamt = ordsubrpamt;
	}

	public String getHosp() {
		return hosp;
	}

	public void setHosp(String hosp) {
		this.hosp = hosp;
	}

	public Date getOrdStart() {
		return ordStart;
	}

	public void setOrdStart(Date ordStart) {
		this.ordStart = ordStart;
	}

	public Date getOrdEnd() {
		return ordEnd;
	}

	public void setOrdEnd(Date ordEnd) {
		this.ordEnd = ordEnd;
	}

	
}

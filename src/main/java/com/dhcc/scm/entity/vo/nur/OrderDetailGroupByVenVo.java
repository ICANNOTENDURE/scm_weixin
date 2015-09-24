package com.dhcc.scm.entity.vo.nur;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlTransient;

import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;


@XmlTransient
public class OrderDetailGroupByVenVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private  List<OrderDetail> orderDetails;
	
	private List<OrdShopping> ordShoppings;

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public List<OrdShopping> getOrdShoppings() {
		return ordShoppings;
	}

	public void setOrdShoppings(List<OrdShopping> ordShoppings) {
		this.ordShoppings = ordShoppings;
	}
	
	
	
}
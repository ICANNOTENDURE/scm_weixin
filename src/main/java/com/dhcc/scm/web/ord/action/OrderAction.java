/**
 * 通过模板生成Action 
 * template by zxx
 */
package com.dhcc.scm.web.ord.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.scm.dto.ord.OrderDto;
import com.dhcc.scm.service.ord.OrderService;


@Namespace(value = "/ord")
@Scope("prototype")
@Action(value = "orderCtrl", results = {
		@Result(name = "list", location = "/WEB-INF/jsp/ord/Order.jsp"),
		@Result(name = "listInc", location = "/WEB-INF/jsp/ord/ListInc.jsp"),
		@Result(name = "shoppingCart", location = "/WEB-INF/jsp/ord/ShoppingCart.jsp"),
		@Result(name = "getOrdInfo", location = "/WEB-INF/jsp/ord/GetOrdInfo.jsp"),
		@Result(name = "listMain", location = "/WEB-INF/jsp/ord/Order.jsp")})

@Blh("orderBlh")
@JsonResults({@JResult(BlhMethod="findById",ognlExpress="dto.order"),
			  @JResult(BlhMethod="saveShopCart",ognlExpress="dto"),
			  @JResult(BlhMethod="deleteShopCart",ognlExpress="dto"),
			  @JResult(BlhMethod="saveOrdInfo",ognlExpress="dto"),
			  @JResult(BlhMethod="save",ognlExpress="dto"),
			  @JResult(BlhMethod="saveMain",ognlExpress="dto"),
			  @JResult(BlhMethod="delete",ognlExpress="dto"),
			  @JResult(BlhMethod="saveOrditm",ognlExpress="dto"),
			  @JResult(BlhMethod="complete",ognlExpress="dto"),
			  @JResult(BlhMethod="deleteOrditm",ognlExpress="dto"),
			  @JResult(BlhMethod="cancleComplete",ognlExpress="dto"),
			  @JResult(BlhMethod="exeOrder",ognlExpress="dto"),
			  @JResult(BlhMethod="listShopCart",ognlExpress="dto")})
public class OrderAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private OrderService orderService;
	
	private OrderDto dto = new OrderDto();
	
	
	@Override
	public String directlyJump() {
		//直接返回jsp
		if("listMain".equals(super.getBusinessFlow())){
			return "listMain";
		}
		if("listInc".equals(super.getBusinessFlow())){
			return "listInc";
		}
		if("shoppingCart".equals(super.getBusinessFlow())){
			dto.setShopCartPicVoList(orderService.listShopCartPic(dto));
			return "shoppingCart";
		}
		if("getOrdInfo".equals(super.getBusinessFlow())){
			return "getOrdInfo";
		}
		return null;
	}
	
	@Override
	public BaseDto getBaseDto() {

		return dto;
	}
	
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}
	
	public OrderDto getDto() {
		return dto ;
	}
	
	public void setDto(OrderDto dto) {
		this.dto = dto;
	}


	
	
}

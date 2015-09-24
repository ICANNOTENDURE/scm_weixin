/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ord;

import java.io.File;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.vo.ord.ShopCartPicVo;
import com.dhcc.scm.entity.vo.ord.ShopCartVo;

public class OrderDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Order order;

	private OrdShopping ordShopping;
	
	private List<ShopCartVo> shopCartVoList;
	
	private List<ShopCartPicVo> shopCartPicVoList;
	
	private String ordShop;
	
	private Long loc;
	
	private File upload;
	
	
	private List<OrderItm> orderItms;
	
	
	private OrderItm orderItm;
	
	
	private Long stateId;
	
	private  String uploadFileName;
	
	
	
	
	/**
	 * @return the uploadFileName
	 */
	public String getUploadFileName() {
		return uploadFileName;
	}


	/**
	 * @param uploadFileName the uploadFileName to set
	 */
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	/**
	 * @return the stateId
	 */
	public Long getStateId() {
		return stateId;
	}


	/**
	 * @param stateId the stateId to set
	 */
	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}


	/**
	 * @return the orderItm
	 */
	public OrderItm getOrderItm() {
		return orderItm;
	}


	/**
	 * @param orderItm the orderItm to set
	 */
	public void setOrderItm(OrderItm orderItm) {
		this.orderItm = orderItm;
	}


	/**
	 * @return the orderItms
	 */
	public List<OrderItm> getOrderItms() {
		return orderItms;
	}


	/**
	 * @param orderItms the orderItms to set
	 */
	public void setOrderItms(List<OrderItm> orderItms) {
		this.orderItms = orderItms;
	}


	/**
	 * @return the upload
	 */
	public File getUpload() {
		return upload;
	}


	/**
	 * @param upload the upload to set
	 */
	public void setUpload(File upload) {
		this.upload = upload;
	}


	/**
	 * @return the loc
	 */
	public Long getLoc() {
		return loc;
	}


	/**
	 * @param loc the loc to set
	 */
	public void setLoc(Long loc) {
		this.loc = loc;
	}


	/**
	 * @return the ordShop
	 */
	public String getOrdShop() {
		return ordShop;
	}


	/**
	 * @param ordShop the ordShop to set
	 */
	public void setOrdShop(String ordShop) {
		this.ordShop = ordShop;
	}


	/**
	 * 
	 */
	public OrderDto() {
		super();
	}


	/**
	 * @param shopCartVoList
	 */
	public OrderDto(List<ShopCartVo> shopCartVoList) {
		super();
		this.shopCartVoList = shopCartVoList;
	}
	
	
	
	




	/**
	 * @return the shopCartPicVoList
	 */
	public List<ShopCartPicVo> getShopCartPicVoList() {
		return shopCartPicVoList;
	}


	/**
	 * @param shopCartPicVoList the shopCartPicVoList to set
	 */
	public void setShopCartPicVoList(List<ShopCartPicVo> shopCartPicVoList) {
		this.shopCartPicVoList = shopCartPicVoList;
	}


	/**
	 * @return the shopCartVoList
	 */
	public List<ShopCartVo> getShopCartVoList() {
		return shopCartVoList;
	}


	/**
	 * @param shopCartVoList the shopCartVoList to set
	 */
	public void setShopCartVoList(List<ShopCartVo> shopCartVoList) {
		this.shopCartVoList = shopCartVoList;
	}


	/**
	 * @return the ordShopping
	 */
	public OrdShopping getOrdShopping() {
		return ordShopping;
	}


	/**
	 * @param ordShopping the ordShopping to set
	 */
	public void setOrdShopping(OrdShopping ordShopping) {
		this.ordShopping = ordShopping;
	}


	public Order getOrder() {
		return order;
	}

	
	public void setOrder(Order order) {
		this.order = order;
	}
	
}

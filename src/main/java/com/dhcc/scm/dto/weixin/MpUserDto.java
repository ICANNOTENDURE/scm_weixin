/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import java.util.Date;
import java.util.List;

import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailPic;
import com.dhcc.scm.entity.vo.weixin.OrderInfo;
import com.dhcc.scm.entity.weixin.MpUser;
import com.dhcc.framework.transmission.dto.BaseDto;

public class MpUserDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7740804080322441235L;

	private MpUser mpUser;

	private String username;
	
	private String passwd;
	
	private String depart;
	
	private Date startDate;
	
	private Date endDate;
	
	private OrderDetail orderDetail;
	
	private String title;
	
	private Long accpectFlag;
	
	private List<OrderDetail> orderDetails;
	
	private List<OrderInfo> orderInfos;
	
	private Long state;
	
	private Long venid;
	
	private String orderno;
	
	private String imgIdStr;
	
	private List<OrderDetailPic> orderDetailPics;
	
	
	
	public List<OrderDetailPic> getOrderDetailPics() {
		return orderDetailPics;
	}


	public void setOrderDetailPics(List<OrderDetailPic> orderDetailPics) {
		this.orderDetailPics = orderDetailPics;
	}


	public String getOrderno() {
		return orderno;
	}


	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}


	public String getImgIdStr() {
		return imgIdStr;
	}


	public void setImgIdStr(String imgIdStr) {
		this.imgIdStr = imgIdStr;
	}


	public Long getState() {
		return state;
	}


	public void setState(Long state) {
		this.state = state;
	}


	public Long getVenid() {
		return venid;
	}


	public void setVenid(Long venid) {
		this.venid = venid;
	}


	public List<OrderInfo> getOrderInfos() {
		return orderInfos;
	}


	public void setOrderInfos(List<OrderInfo> orderInfos) {
		this.orderInfos = orderInfos;
	}


	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}


	public OrderDetail getOrderDetail() {
		return orderDetail;
	}


	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Long getAccpectFlag() {
		return accpectFlag;
	}


	public void setAccpectFlag(Long accpectFlag) {
		this.accpectFlag = accpectFlag;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getDepart() {
		return depart;
	}


	public void setDepart(String depart) {
		this.depart = depart;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public MpUser getMpUser() {
		return mpUser;
	}

	
	public void setMpUser(MpUser mpUser) {
		this.mpUser = mpUser;
	}
	
}

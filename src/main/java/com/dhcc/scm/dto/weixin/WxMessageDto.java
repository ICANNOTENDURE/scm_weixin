/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.weixin;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.vo.weixin.OrderInfo;
import com.dhcc.scm.entity.weixin.WxMessage;

public class WxMessageDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private WxMessage wxMessage;

	private File upload;
	
	private String uploadFileName;
	
	/**
	 * 上传类型
	 * 1:标题图
	 * 2:文章图
	 */
	private String type;
	
	
	private OrderDetail orderDetail;
	
	private List<OrderDetail> orderDetails;
	
	private String authUrl;
	
	private List<OrderInfo> orderInfos;
	
	/**
	 * 头菜单的标题
	 */
	private String title;
	
	private String backUrl;
	
	private Date start;
	
	private Date end;
	
	private Long state;
	
	private Long venid;
	
	private Long accpectFlag;
	
	private Long locid;
	
	
	
	public Long getLocid() {
		return locid;
	}


	public void setLocid(Long locid) {
		this.locid = locid;
	}


	public Long getAccpectFlag() {
		return accpectFlag;
	}


	public void setAccpectFlag(Long accpectFlag) {
		this.accpectFlag = accpectFlag;
	}


	public Long getVenid() {
		return venid;
	}


	public void setVenid(Long venid) {
		this.venid = venid;
	}


	public Date getStart() {
		return start;
	}


	public void setStart(Date start) {
		this.start = start;
	}


	public Date getEnd() {
		return end;
	}


	public void setEnd(Date end) {
		this.end = end;
	}


	public Long getState() {
		return state;
	}


	public void setState(Long state) {
		this.state = state;
	}


	public String getBackUrl() {
		return backUrl;
	}


	public void setBackUrl(String backUrl) {
		this.backUrl = backUrl;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public List<OrderInfo> getOrderInfos() {
		return orderInfos;
	}


	public void setOrderInfos(List<OrderInfo> orderInfos) {
		this.orderInfos = orderInfos;
	}


	public String getAuthUrl() {
		return authUrl;
	}


	public void setAuthUrl(String authUrl) {
		this.authUrl = authUrl;
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


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public WxMessage getWxMessage() {
		return wxMessage;
	}

	
	public void setWxMessage(WxMessage wxMessage) {
		this.wxMessage = wxMessage;
	}
	
}

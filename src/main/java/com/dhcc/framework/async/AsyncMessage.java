package com.dhcc.framework.async;

import com.dhcc.framework.transmission.event.BusinessRequest;

/**
 * 异步调用消息包装器
 * @author liuyg
 *
 */
public class AsyncMessage {

	/**
	 * 要调用的BLH的bean id
	 */
	private String blhId;
	
	
	/*
	 * 要调用的以BusinessRequest为仅用参数的blh方法名
	 */
	private String BusiMethodName;
	
	
	/**
	 * BusinessRequest 请求参数
	 */
	private BusinessRequest request;
	
	/**
	 * 回调URL
	 */
	private String callBackUrl;
	

	/**
	 * 得到要调用的BLH的bean id
	 */
	public String getBlhId() {
		return blhId;
	}
	public void setBlhId(String blhId) {
		this.blhId = blhId;
	}
	/*
	 * 要调用的以BusinessRequest为仅用参数的blh方法名
	 */
	public String getBusiMethodName() {
		return BusiMethodName;
	}
	public void setBusiMethodName(String busiMethodName) {
		BusiMethodName = busiMethodName;
	}
	
	/*
	 * 得到要调用的以BusinessRequest为仅用参数的blh方法名
	 */
	public BusinessRequest getRequest() {
		return request;
	}
	public void setRequest(BusinessRequest request) {
		this.request = request;
	}
	/**
	 * 得到要回调的URL
	 * @return
	 */
	public String getCallBackUrl() {
		return callBackUrl;
	}
	public void setCallBackUrl(String callBackUrl) {
		this.callBackUrl = callBackUrl;
	}
	
}

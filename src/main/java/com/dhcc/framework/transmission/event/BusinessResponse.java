package com.dhcc.framework.transmission.event;

import java.util.Map;

public class BusinessResponse extends ResponseEvent {

	private static final long serialVersionUID = -6575992199235079854L;



	public BusinessResponse(String userId) {
		super(userId);
	}

	public BusinessResponse() {
		super(null);
	}

	/**
	 * 下面这几个保留起来，暂时不用
	 */
	private String viewName = null;

	private String message = null;

	private boolean errorFlag = false;

	public void setErrFlag(boolean errFlag) {
		this.errorFlag = errFlag;
	}

	public boolean isErrFlag() {
		return errorFlag;
	}

	public String getMsg() {
		return message;
	}


	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}



	public void setMsg(String msg) {
		this.message = msg;
	}

	@SuppressWarnings("rawtypes")
	public Map getDisplayData() {
		return super.displayData;
	}




}
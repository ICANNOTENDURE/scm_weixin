package com.dhcc.framework.transmission.event;

import java.util.UUID;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.dto.BaseDto;



public abstract class RequestEvent implements IEvent {

	private static final long serialVersionUID = 7030958985368873734L;

	/**
	 * 用户ID 
	 */
	protected String userID;

	protected String dealMethod;

	private BaseDto dto; 

	protected String tradeAccount;
	

	public RequestEvent() {
	}

	public RequestEvent(String userID) {
		
		this.userID = userID;
	}

	public String getDealMethod() {
		return dealMethod;
	}

	public void setDealMethod(String dealMethod) {
		this.dealMethod = dealMethod;
	}



	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public BaseDto getDto() {
		return dto;
	}

	public void setDto(BaseDto dto) {
		this.dto = dto;
		if(dto.getTradeAccount()==null){
			this.setTradeAccount(PropertiesBean.getInstance().getProperty("conf.system.shortName")+":"+UUID.randomUUID().toString());
		}else{
			this.setTradeAccount(dto.getTradeAccount());
		}
		
	}

	public String getTradeAccount() {
		return tradeAccount;
	}

	public void setTradeAccount(String tradeAccount) {
		this.tradeAccount = tradeAccount;
	}

}

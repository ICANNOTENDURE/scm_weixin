package com.dhcc.framework.transmission.event;





public class BusinessRequest extends RequestEvent {

	private static final long serialVersionUID = 5377104665733269670L;
	
	
	private String webContext ;
	
	public BusinessRequest(String userID) {
		super(userID);
		
	}
	
	public BusinessRequest() {
		super();
	}

	public String getWebContext() {
		return webContext;
	}
	public void setWebContext(String webContext) {
		this.webContext = webContext;
	}
}

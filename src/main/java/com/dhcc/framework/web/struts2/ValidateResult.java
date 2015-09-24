package com.dhcc.framework.web.struts2;

public class ValidateResult {

	
	//通过为true
	private  Boolean  result ;
	
	//出错信息
	private String msg ;
	
	//跳转view 
	private String viewName;
	


	public ValidateResult(){
		
	}
	
	public ValidateResult(Boolean  result){
		this.result = result ;
	}
	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	
}

/**
 * 
 */
package com.dhcc.framework.async;

 /**
 * @author liuyg
 *    
 */
public class AsyncJobResult {

	private String resultJson;
	private String callBackUrl;
	private String msg  ;
	
	
	public String getResultJson() {
		return resultJson;
	}
	public void setResultJson(String resultJson) {
		this.resultJson = resultJson;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCallBackUrl() {
		return callBackUrl;
	}
	public void setCallBackUrl(String callBackUrl) {
		this.callBackUrl = callBackUrl;
	}
	
}

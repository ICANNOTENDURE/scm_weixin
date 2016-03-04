/**  
 * @Title: OperateResult.java
 * @Package com.dhcc.pms.entity.vo.ws
 * @Description: TODO(用一句话描述该文件做什么)
 * @author zhouxin  
 * @date 2014 2014年7月9日 上午9:22:21
 * @version V1.0  
 */
package com.dhcc.scm.entity.vo.weixin;

public class WxJsapiSign {
	
	private int resultCode=1;
	
	private String errMsg;
	
	private String noncestr;

	private long timestamp;

	private String signature;

	private String appId;
	
	
	
	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getNoncestr() {
		return noncestr;
	}

	public void setNoncestr(String noncestr) {
		this.noncestr = noncestr;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

}

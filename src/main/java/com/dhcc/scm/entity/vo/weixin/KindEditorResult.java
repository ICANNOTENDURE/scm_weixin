/**  
* @Title: OperateResult.java
* @Package com.dhcc.pms.entity.vo.ws
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月9日 上午9:22:21
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.weixin;

/**
 * @author Administrator
 *
 */
public class KindEditorResult {
	
	private int error=1;
	private String message="faile";
	private String url;
	public int getError() {
		return error;
	}
	public void setError(int error) {
		this.error = error;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	

}

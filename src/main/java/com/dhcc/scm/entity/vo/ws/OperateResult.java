/**  
* @Title: OperateResult.java
* @Package com.dhcc.pms.entity.vo.ws
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月9日 上午9:22:21
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.ws;

/**
 * @author Administrator
 *
 */
public class OperateResult {
	
	private String ResultCode="-1";
	private String ResultContent="faile";
	private String resultValue;
	
	
	public String getResultValue() {
		return resultValue;
	}
	public void setResultValue(String resultValue) {
		this.resultValue = resultValue;
	}
	/**
	 * @return the resultCode
	 */
	public String getResultCode() {
		return ResultCode;
	}
	/**
	 * @param resultCode the resultCode to set
	 */
	public void setResultCode(String resultCode) {
		ResultCode = resultCode;
	}
	/**
	 * @return the resultContent
	 */
	public String getResultContent() {
		return ResultContent;
	}
	/**
	 * @param resultContent the resultContent to set
	 */
	public void setResultContent(String resultContent) {
		ResultContent = resultContent;
	}
	

}

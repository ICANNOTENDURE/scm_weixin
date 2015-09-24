/**  
* @Title: OperateResult.java
* @Package com.dhcc.pms.entity.vo.ws
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月9日 上午9:22:21
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

/**
 * @author Administrator
 *
 */
public class HisInvInfoWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String ResultCode;
	
	private String ResultContent;
	
	
	private List<HisInvInfoItmWeb> hisInvInfoItmWebs;


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


	/**
	 * @return the hisInvInfoItmWebs
	 */
	public List<HisInvInfoItmWeb> getHisInvInfoItmWebs() {
		return hisInvInfoItmWebs;
	}


	/**
	 * @param hisInvInfoItmWebs the hisInvInfoItmWebs to set
	 */
	public void setHisInvInfoItmWebs(List<HisInvInfoItmWeb> hisInvInfoItmWebs) {
		this.hisInvInfoItmWebs = hisInvInfoItmWebs;
	}
	
	
	
	

}

/**  
* @Title: OperateResult.java
* @Package com.dhcc.pms.entity.vo.ws
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月9日 上午9:22:21
* @version V1.0  
*/
package com.dhcc.scm.entity.vo.weixin;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class OrderInfo {
	
	private String orderno;
	
	private String hopname;
	
	private Date orddate;
	
	private String emflag;
	
	private String recdesction;
	
	private String state;
	
	
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getHopname() {
		return hopname;
	}

	public void setHopname(String hopname) {
		this.hopname = hopname;
	}

	

	public Date getOrddate() {
		return orddate;
	}

	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}

	public String getEmflag() {
		return emflag;
	}

	public void setEmflag(String emflag) {
		this.emflag = emflag;
	}

	public String getRecdesction() {
		return recdesction;
	}

	public void setRecdesction(String recdesction) {
		this.recdesction = recdesction;
	}
	
	

}

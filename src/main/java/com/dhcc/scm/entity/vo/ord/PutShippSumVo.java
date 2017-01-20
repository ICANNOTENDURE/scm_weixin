/**
 * 
 */
package com.dhcc.scm.entity.vo.ord;

import java.sql.Date;

/**
 * @author Administrator
 *
 */
public class PutShippSumVo implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	//供应商描述
	private String venname;
	//发票号
	private String invno;
	//商品金额
	private Float rpamt;
	//日期
	private	Date date;
	
	public String getVenname() {
		return venname;
	}
	public void setVenname(String venname) {
		this.venname = venname;
	}
	public String getInvno() {
		return invno;
	}
	public void setInvno(String invno) {
		this.invno = invno;
	}
	public Float getRpamt() {
		return rpamt;
	}
	public void setRpamt(Float rpamt) {
		this.rpamt = rpamt;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}

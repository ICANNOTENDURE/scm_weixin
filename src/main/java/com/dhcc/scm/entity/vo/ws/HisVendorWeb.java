
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;


public class HisVendorWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<HisVendorItmWeb> hisVendorItmWebs;
	
	private String userName;
	
	private String passWord;


	

	

	public List<HisVendorItmWeb> getHisVendorItmWebs() {
		return hisVendorItmWebs;
	}

	public void setHisVendorItmWebs(List<HisVendorItmWeb> hisVendorItmWebs) {
		this.hisVendorItmWebs = hisVendorItmWebs;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	
	
	
	
}

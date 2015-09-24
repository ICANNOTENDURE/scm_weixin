
package com.dhcc.scm.entity.vo.ws;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public class VenIncWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<VenIncItmWeb> incItmWebs;
	
	private String userName;
	
	private String passWord;

	

	/**
	 * @return the incItmWebs
	 */
	public List<VenIncItmWeb> getIncItmWebs() {
		return incItmWebs;
	}

	/**
	 * @param incItmWebs the incItmWebs to set
	 */
	public void setIncItmWebs(List<VenIncItmWeb> incItmWebs) {
		this.incItmWebs = incItmWebs;
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

package com.dhcc.scm.entity.vo.ws;

import java.util.List;




public class HisOrderWeb implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private List<HisOrderWebItm> hisOrderWebItms;
	
	private String userName;
	
	private String passWord;
	
	

	

	public List<HisOrderWebItm> getHisOrderWebItms() {
		return hisOrderWebItms;
	}

	public void setHisOrderWebItms(List<HisOrderWebItm> hisOrderWebItms) {
		this.hisOrderWebItms = hisOrderWebItms;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	
}


package com.dhcc.scm.entity.vo.ws.pda;

import java.io.Serializable;

/**
 * 
* @ClassName: LoginInfo 
* @Description: TODO(webservice 返回登录信息) 
* @author zhouxin
* @date 2015年7月27日 上午11:01:40 
*
 */
public class LoginInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String resultCode;
	
	private String resultContent;
	
	private String userName;   
	
	private String userId;    
	
	private String userType;   
	
	private String pass;
	
	private String userLoc;    
	
	private String userLocId;

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getUserLoc() {
		return userLoc;
	}

	public void setUserLoc(String userLoc) {
		this.userLoc = userLoc;
	}

	public String getUserLocId() {
		return userLocId;
	}

	public void setUserLocId(String userLocId) {
		this.userLocId = userLocId;
	}  
	
	
	
	
}

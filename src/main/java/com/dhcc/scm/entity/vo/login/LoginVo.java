package com.dhcc.scm.entity.vo.login;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlTransient;

/**
 * <p>标题: LoginVo.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月23日
 * @version V1.0 
 */
@XmlTransient
public class LoginVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 用户类型（从业人员[Pra]、普通用户[Normal]）
	private String userType="";
	// 登录方式，用户名，用户别名，邮箱，身份证号等唯一标识
	private String loginType="";
	// 对应登录方式的值
	private String userName="";
	// 1 需要登录的系统的唯一标识，访问指定服务器系统时使用
	private String gatewayId="";
	// 2.1 需要登录的系统的系统类型，访问分布式系统不指定服务器时使用，gatewayId为空时有效
	private String systemType="";
	// 2.2 需要登录的系统的系统版本
	private String version="";
	
	// 返回的用户唯一标识
	private String accountId="";
	// 返回的身份认证信息
	private String authenMsg="";
	// 返回的身份票据信息
	private String idTicket="";
	// 返回的服务票据信息
	private String serviceTicket="";
	//是否菜单根节点
	private String isRoot="";
	/**  
	 * @return userType 
	 */
	public String getUserType() {
		return userType;
	}
	/**  
	 * @param userType userType 
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**  
	 * @return loginType 
	 */
	public String getLoginType() {
		return loginType;
	}
	/**  
	 * @param loginType loginType 
	 */
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	/**  
	 * @return userName 
	 */
	public String getUserName() {
		return userName;
	}
	/**  
	 * @param userName userName 
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**  
	 * @return gatewayId 
	 */
	public String getGatewayId() {
		return gatewayId;
	}
	/**  
	 * @param gatewayId gatewayId 
	 */
	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}
	/**  
	 * @return systemType 
	 */
	public String getSystemType() {
		return systemType;
	}
	/**  
	 * @param systemType systemType 
	 */
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}
	/**  
	 * @return version 
	 */
	public String getVersion() {
		return version;
	}
	/**  
	 * @param version version 
	 */
	public void setVersion(String version) {
		this.version = version;
	}
	/**  
	 * @return accountId 
	 */
	public String getAccountId() {
		return accountId;
	}
	/**  
	 * @param accountId accountId 
	 */
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	/**  
	 * @return authenMsg 
	 */
	public String getAuthenMsg() {
		return authenMsg;
	}
	/**  
	 * @param authenMsg authenMsg 
	 */
	public void setAuthenMsg(String authenMsg) {
		this.authenMsg = authenMsg;
	}
	/**  
	 * @return idTicket 
	 */
	public String getIdTicket() {
		return idTicket;
	}
	/**  
	 * @param idTicket idTicket 
	 */
	public void setIdTicket(String idTicket) {
		this.idTicket = idTicket;
	}
	/**  
	 * @return serviceTicket 
	 */
	public String getServiceTicket() {
		return serviceTicket;
	}
	/**  
	 * @param serviceTicket serviceTicket 
	 */
	public void setServiceTicket(String serviceTicket) {
		this.serviceTicket = serviceTicket;
	}
	public String getIsRoot() {
		return isRoot;
	}
	public void setIsRoot(String isRoot) {
		this.isRoot = isRoot;
	}
	
}

package com.dhcc.framework.web.context;

import java.util.Set;

public class VisitUser  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000000L;
	private String id;
	private Integer isAdmin;
	private String name;
	private String loginName;
	private Set<String> privilege;
	private String orgCode;
	private String idTicket;
	private String sessionKey;
	private Long userType;
	private Long locId;
	private Long hopId;
	private Long vendorIdLong;
	
	
	
	/**
	 * @return the locId
	 */
	public Long getLocId() {
		return locId;
	}

	/**
	 * @param locId the locId to set
	 */
	public void setLocId(Long locId) {
		this.locId = locId;
	}

	/**
	 * @return the hopId
	 */
	public Long getHopId() {
		return hopId;
	}

	/**
	 * @param hopId the hopId to set
	 */
	public void setHopId(Long hopId) {
		this.hopId = hopId;
	}

	/**
	 * @return the vendorIdLong
	 */
	public Long getVendorIdLong() {
		return vendorIdLong;
	}

	/**
	 * @param vendorIdLong the vendorIdLong to set
	 */
	public void setVendorIdLong(Long vendorIdLong) {
		this.vendorIdLong = vendorIdLong;
	}

	public Set<String> getPrivilege() {
		return privilege;
	}
	
	public String getId2() {
		StringBuilder sbd = new StringBuilder();
		for(int i=id.length()-1;i>=0;i--){
			sbd.append(id.charAt(i));
	 }  
		return sbd.toString();
	}
	public void setPrivilege(Set<String> privilege) {
		this.privilege = privilege;
	}

	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUniqueName(){
		StringBuffer sb = new StringBuffer();
		sb.append(loginName);
		sb.append("(").append(name).append(")");
		return sb.toString();
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getIdTicket() {
		return idTicket;
	}

	public void setIdTicket(String idTicket) {
		this.idTicket = idTicket;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public Long getUserType() {
		return userType;
	}

	public void setUserType(Long userType) {
		this.userType = userType;
	}



}

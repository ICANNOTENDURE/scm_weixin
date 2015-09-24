package com.dhcc.scm.dto.userManage;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalAccountRole;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

/**
 * 标题: NormalAccountDto.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */
public class NormalAccountDto extends BaseDto{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private NormalAccount normalAccount;
	
	private String hopName;
	private String vendorName;
	private String locName;
	private Long destinationId;
	/*收获地址*/
	private String destinations;
	
	/**
	 * @return the destinations
	 */
	public String getDestinations() {
		return destinations;
	}

	/**
	 * @param destinations the destinations to set
	 */
	public void setDestinations(String destinations) {
		this.destinations = destinations;
	}

	private Vendor vendor;
	private List<VenQualifTypeVO> venQualifTypeVOList;
	
	
	
	/**
	 * @return the vendor
	 */
	public Vendor getVendor() {
		return vendor;
	}

	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	/**
	 * @return the venQualifTypeVOList
	 */
	public List<VenQualifTypeVO> getVenQualifTypeVOList() {
		return venQualifTypeVOList;
	}

	/**
	 * @param venQualifTypeVOList the venQualifTypeVOList to set
	 */
	public void setVenQualifTypeVOList(List<VenQualifTypeVO> venQualifTypeVOList) {
		this.venQualifTypeVOList = venQualifTypeVOList;
	}

	/**
	 * @return the vendorName
	 */
	public String getVendorName() {
		return vendorName;
	}

	/**
	 * @param vendorName the vendorName to set
	 */
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	/**
	 * @return the hopName
	 */
	public String getHopName() {
		return hopName;
	}

	/**
	 * @param hopName the hopName to set
	 */
	public void setHopName(String hopName) {
		this.hopName = hopName;
	}

	/**
	 * @return the locName
	 */
	public String getLocName() {
		return locName;
	}

	/**
	 * @param locName the locName to set
	 */
	public void setLocName(String locName) {
		this.locName = locName;
	}

	/**
	 * @return the destinationId
	 */
	public Long getDestinationId() {
		return destinationId;
	}

	/**
	 * @param destinationId the destinationId to set
	 */
	public void setDestinationId(Long destinationId) {
		this.destinationId = destinationId;
	}

	/**  
	 * @return normalAccount 
	 */
	public NormalAccount getNormalAccount() {
		return normalAccount;
	}

	/**  
	 * @param normalAccount normalAccount 
	 */
	public void setNormalAccount(NormalAccount normalAccount) {
		this.normalAccount = normalAccount;
	}
	
	private String columnName = "";
	private String columnValue = "";
	private String systemType;
	
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
	 * @return columnName 
	 */
	public String getColumnName() {
		return columnName;
	}

	/**  
	 * @param columnName columnName 
	 */
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	/**  
	 * @return columnValue 
	 */
	public String getColumnValue() {
		return columnValue;
	}

	/**  
	 * @param columnValue columnValue 
	 */
	public void setColumnValue(String columnValue) {
		this.columnValue = columnValue;
	}
	
	private boolean success = false;
	private String message = "";

	/**  
	 * @return success 
	 */
	public boolean isSuccess() {
		return success;
	}

	/**  
	 * @param success success 
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}

	/**  
	 * @return message 
	 */
	public String getMessage() {
		return message;
	}

	/**  
	 * @param message message 
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	//分配角色使用的属性
	private String accountId;
	private String roleId;
	private List<Role> roles;
	private List<NormalAccountRole> normalAccountRoles;
	
	/**  
	 * @return normalAccountRoles 
	 */
	public List<NormalAccountRole> getNormalAccountRoles() {
		return normalAccountRoles;
	}

	/**  
	 * @param normalAccountRoles normalAccountRoles 
	 */
	public void setNormalAccountRoles(List<NormalAccountRole> normalAccountRoles) {
		this.normalAccountRoles = normalAccountRoles;
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
	 * @return roleId 
	 */
	public String getRoleId() {
		return roleId;
	}

	/**  
	 * @param roleId roleId 
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**  
	 * @return roles 
	 */
	public List<Role> getRoles() {
		return roles;
	}

	/**  
	 * @param roles roles 
	 */
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	private List<Func> funcs;

	/**  
	 * @return funcs 
	 */
	public List<Func> getFuncs() {
		return funcs;
	}

	/**  
	 * @param funcs funcs 
	 */
	public void setFuncs(List<Func> funcs) {
		this.funcs = funcs;
	}
	
	/**
	 * 新密码
	 */
	private String newPassword;

	/**  
	 * @return newPassword 
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**  
	 * @param newPassword newPassword 
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	//账户名唯一性使用
	private String accountAliasOld;
	private List<NormalAccount> normalAccounts;
	/**  
	 * @return accountAliasOld 
	 */
	public String getAccountAliasOld() {
		return accountAliasOld;
	}

	/**  
	 * @param accountAliasOld accountAliasOld 
	 */
	public void setAccountAliasOld(String accountAliasOld) {
		this.accountAliasOld = accountAliasOld;
	}

	/**  
	 * @return normalAccounts 
	 */
	public List<NormalAccount> getNormalAccounts() {
		return normalAccounts;
	}

	/**  
	 * @param normalAccounts normalAccounts 
	 */
	public void setNormalAccounts(List<NormalAccount> normalAccounts) {
		this.normalAccounts = normalAccounts;
	}
	
	
    
	
}

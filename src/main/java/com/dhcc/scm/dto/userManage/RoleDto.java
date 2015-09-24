package com.dhcc.scm.dto.userManage;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.entity.userManage.RoleFunc;
import com.dhcc.scm.entity.userManage.RoleLoc;
import com.dhcc.scm.entity.userManage.RoleVendor;
import com.dhcc.scm.entity.vo.tree.TreeVO;


public class RoleDto extends BaseDto{
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Role role;
	
	private String systemType;
	private String columnName = "";
	private String columnValue = "";
	
    
    private List<Func> funcs;
    private List<RoleFunc> roleFuncs;
    private Long roleId;
    private String parentId;
    
    private String funcIds;
    
    private String message;
    private boolean success;
    
    private List<RoleVendor> roleVendors;
    
    private List<RoleLoc> RoleLocs;
    
    private List<HopVendor> hopVendors;
    
    private List<HopCtloc> hopCtlocs;
    
    private List<TreeVO> treeVOs;
    
    private String locs;
    
    private String vens;
    
    
    
	/**
	 * @return the locs
	 */
	public String getLocs() {
		return locs;
	}

	/**
	 * @param locs the locs to set
	 */
	public void setLocs(String locs) {
		this.locs = locs;
	}

	/**
	 * @return the vens
	 */
	public String getVens() {
		return vens;
	}

	/**
	 * @param vens the vens to set
	 */
	public void setVens(String vens) {
		this.vens = vens;
	}

	/**
	 * @return the treeVOs
	 */
	public List<TreeVO> getTreeVOs() {
		return treeVOs;
	}

	/**
	 * @param treeVOs the treeVOs to set
	 */
	public void setTreeVOs(List<TreeVO> treeVOs) {
		this.treeVOs = treeVOs;
	}

	/**
	 * @return the hopVendors
	 */
	public List<HopVendor> getHopVendors() {
		return hopVendors;
	}

	/**
	 * @param hopVendors the hopVendors to set
	 */
	public void setHopVendors(List<HopVendor> hopVendors) {
		this.hopVendors = hopVendors;
	}

	/**
	 * @return the hopCtlocs
	 */
	public List<HopCtloc> getHopCtlocs() {
		return hopCtlocs;
	}

	/**
	 * @param hopCtlocs the hopCtlocs to set
	 */
	public void setHopCtlocs(List<HopCtloc> hopCtlocs) {
		this.hopCtlocs = hopCtlocs;
	}

	/**
	 * @return the roleLocs
	 */
	public List<RoleLoc> getRoleLocs() {
		return RoleLocs;
	}

	/**
	 * @param roleLocs the roleLocs to set
	 */
	public void setRoleLocs(List<RoleLoc> roleLocs) {
		RoleLocs = roleLocs;
	}

	/**
	 * @return the roleVendors
	 */
	public List<RoleVendor> getRoleVendors() {
		return roleVendors;
	}

	/**
	 * @param roleVendors the roleVendors to set
	 */
	public void setRoleVendors(List<RoleVendor> roleVendors) {
		this.roleVendors = roleVendors;
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
	 * @return funcIds 
	 */
	public String getFuncIds() {
		return funcIds;
	}

	/**  
	 * @param funcIds funcIds 
	 */
	public void setFuncIds(String funcIds) {
		this.funcIds = funcIds;
	}

	/**  
	 * @return roleId 
	 */
	public Long getRoleId() {
		return roleId;
	}

	/**  
	 * @param roleId roleId 
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/**  
	 * @return parentId 
	 */
	public String getParentId() {
		return parentId;
	}

	/**  
	 * @param parentId parentId 
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

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

	/**  
	 * @return role 
	 */
	public Role getRole() {
		return role;
	}

	/**  
	 * @param role role 
	 */
	public void setRole(Role role) {
		this.role = role;
	}
	/**  
	 * @return roleFuncs 
	 */
	public List<RoleFunc> getRoleFuncs() {
		return roleFuncs;
	}

	/**  
	 * @param roleFuncs roleFuncs 
	 */
	public void setRoleFuncs(List<RoleFunc> roleFuncs) {
		this.roleFuncs = roleFuncs;
	}
	
	//系统类型
	private List<SystemVersion> systemVersions;

	/**  
	 * @return systemVersions 
	 */
	public List<SystemVersion> getSystemVersions() {
		return systemVersions;
	}
	/**  
	 * @param systemVersions systemVersions 
	 */
	public void setSystemVersions(List<SystemVersion> systemVersions) {
		this.systemVersions = systemVersions;
	}
	
	
}

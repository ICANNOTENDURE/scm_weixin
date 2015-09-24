package com.dhcc.scm.dto.userManage;

import java.util.List;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.userManage.Func;

/**
 * 标题: FuncDto.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年8月29日
 * @version V1.0 
 */
public class FuncDto extends BaseDto{

	/**  
	* 字段:     序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private Func func;
	
	private List<Func> funcs;
	
	private String parentId;
	private String systemType;
	
	private String message = "";
	private boolean success = false;
	
	
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
	public boolean getSuccess() {
		return success;
	}
	/**  
	 * @param success success 
	 */
	public void setSuccess(boolean success) {
		this.success = success;
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
	 * @return func 
	 */
	public Func getFunc() {
		return func;
	}
	/**  
	 * @param func func 
	 */
	public void setFunc(Func func) {
		this.func = func;
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
	
	private String columnName;
	private String columnValue;


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
	
	//账户id
	public String accountId; 
	//用户类型，1为从业人员账户，2为普通用户账户
	public String userType;
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
	
	//修改权限编号使用
	private String menuSeqOld = "";
	
	/**  
	 * @return menuSeqOld 
	 */
	public String getMenuSeqOld() {
		return menuSeqOld;
	}
	/**  
	 * @param menuSeqOld menuSeqOld 
	 */
	public void setMenuSeqOld(String menuSeqOld) {
		this.menuSeqOld = menuSeqOld;
	}
	
	
	
	
	
	

}

package com.dhcc.scm.dto.platformManage;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;

/**
 * <p>标题: SystemVersionDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  安装包管理数据传输对象</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@XmlRootElement
public class SystemVersionDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private SystemVersion systemVersion;
	
	/**  
	* 字段:      字段名称
	* @Fields systemVersions : 安装包目录列表树数据
	*/
	private List<SystemVersion> systemVersions;
	
	private String parentId;
	private String systemName;
	//private String serverFilePath;

	/**  
	 * @return systemVersion 
	 */
	public SystemVersion getSystemVersion() {
		return systemVersion;
	}

	/**  
	 * @param systemVersion systemVersion 
	 */
	public void setSystemVersion(SystemVersion systemVersion) {
		this.systemVersion = systemVersion;
	}

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
	 * @return systemName 
	 */
	public String getSystemName() {
		return systemName;
	}

	/**  
	 * @param systemName systemName 
	 */
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	
	private String columnName = "";
	private String columnValue = "";

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
	
//	/**  
//	 * @return serverFilePath 
//	 */
//	public String getServerFilePath() {
//		return serverFilePath;
//	}
//
//	/**  
//	 * @param serverFilePath serverFilePath 
//	 */
//	public void setServerFilePath(String serverFilePath) {
//		this.serverFilePath = serverFilePath;
//	}
	
}

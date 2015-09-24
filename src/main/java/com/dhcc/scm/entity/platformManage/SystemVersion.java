package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * <p>标题: SystemVersion.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本库实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@Entity
@Table(name="T_SYSTEM_VERSION")
public class SystemVersion implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="VERSION_ID", unique=true, nullable=false, length=32)
	private String versionId;
	
	@Column(name="PARENT_ID", length=32)
	private String parentId;

	@Column(name="DESCRIPTION", length=4000)
	private String description;

	@Column(name="FILE_PATH", length=512)
	private String filePath;

	@Column(name="SYSTEM_TYPE", length=64)
	private String systemType;
	
	@Column(name="SYSTEM_NAME", length=64)
	private String systemName;
	
	@Column(name="CONTEXT_ROOT", length=64)
	private String contextRoot;

	@Column(name="USE_STATE", length=16)
	private String useState;

	@Column(name="VERSION", length=64)
	private String version;
	
	// 子节点
	@Transient
	private List<SystemVersion> children = new ArrayList<SystemVersion>();

	public SystemVersion() {
		
	}
	
	public SystemVersion(String versionId, String parentId, String description,
		String filePath, String systemType, String systemName, String contextRoot,
		String useStste, String version) {
		this.versionId = versionId;
		this.parentId = parentId;
		this.description = description;
		this.filePath = filePath;
		this.systemType = systemType;
		this.systemName = systemName;
		this.contextRoot = contextRoot;
		this.useState = useStste;
		this.version = version;
	}
	
	public SystemVersion(String versionId, String parentId) {
		this.versionId = versionId;
		this.parentId = parentId;
	}

	/**  
	 * @return versionId 
	 */
	public String getVersionId() {
		return versionId;
	}

	/**  
	 * @param versionId versionId 
	 */
	public void setVersionId(String versionId) {
		this.versionId = versionId;
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
	 * @return description 
	 */
	public String getDescription() {
		return description;
	}

	/**  
	 * @param description description 
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**  
	 * @return filePath 
	 */
	public String getFilePath() {
		return filePath;
	}

	/**  
	 * @param filePath filePath 
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	/**  
	 * @return contextRoot 
	 */
	public String getContextRoot() {
		return contextRoot;
	}

	/**  
	 * @param contextRoot contextRoot 
	 */
	public void setContextRoot(String contextRoot) {
		this.contextRoot = contextRoot;
	}

	/**  
	 * @return useState 
	 */
	public String getUseState() {
		return useState;
	}

	/**  
	 * @param useState useState 
	 */
	public void setUseState(String useState) {
		this.useState = useState;
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
	 * @return children 
	 */
	public List<SystemVersion> getChildren() {
		return children;
	}

	/**  
	 * @param children children 
	 */
	public void setChildren(List<SystemVersion> children) {
		this.children = children;
	}

}

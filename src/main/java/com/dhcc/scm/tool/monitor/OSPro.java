package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: OSPro.java</p>
 * <p>业务描述: 当前操作系统信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class OSPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// 操作系统内核类型如： 386、486、586等x86
	private String arch;
	
	// CPU信息单元
	private String cpuEndian;
	
	// 数据模型
	private String dataModel;
	
	// 系统描述
	private String description;
	
	// 机器名称
	private String machine;
	
	// 操作系统类型
	private String name;
	
	// 修补程序级别
	private String patchLevel;
	
	// 操作系统的卖主
	private String vendor;
	
	// 卖主名称
	private String vendorCodeName;
	
	// 操作系统名称
	private String vendorName;
	
	// 操作系统卖主类型
	private String vendorVersion;
	
	// 操作系统的版本号
	private String version;
	
	// 描述信息
	private String info;

	/**  
	 * @return arch 
	 */
	public String getArch() {
		return arch;
	}

	/**  
	 * @param arch arch 
	 */
	public void setArch(String arch) {
		this.arch = arch;
	}

	/**  
	 * @return cpuEndian 
	 */
	public String getCpuEndian() {
		return cpuEndian;
	}

	/**  
	 * @param cpuEndian cpuEndian 
	 */
	public void setCpuEndian(String cpuEndian) {
		this.cpuEndian = cpuEndian;
	}

	/**  
	 * @return dataModel 
	 */
	public String getDataModel() {
		return dataModel;
	}

	/**  
	 * @param dataModel dataModel 
	 */
	public void setDataModel(String dataModel) {
		this.dataModel = dataModel;
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
	 * @return machine 
	 */
	public String getMachine() {
		return machine;
	}

	/**  
	 * @param machine machine 
	 */
	public void setMachine(String machine) {
		this.machine = machine;
	}

	/**  
	 * @return name 
	 */
	public String getName() {
		return name;
	}

	/**  
	 * @param name name 
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**  
	 * @return patchLevel 
	 */
	public String getPatchLevel() {
		return patchLevel;
	}

	/**  
	 * @param patchLevel patchLevel 
	 */
	public void setPatchLevel(String patchLevel) {
		this.patchLevel = patchLevel;
	}

	/**  
	 * @return vendor 
	 */
	public String getVendor() {
		return vendor;
	}

	/**  
	 * @param vendor vendor 
	 */
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	/**  
	 * @return vendorCodeName 
	 */
	public String getVendorCodeName() {
		return vendorCodeName;
	}

	/**  
	 * @param vendorCodeName vendorCodeName 
	 */
	public void setVendorCodeName(String vendorCodeName) {
		this.vendorCodeName = vendorCodeName;
	}

	/**  
	 * @return vendorName 
	 */
	public String getVendorName() {
		return vendorName;
	}

	/**  
	 * @param vendorName vendorName 
	 */
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	/**  
	 * @return vendorVersion 
	 */
	public String getVendorVersion() {
		return vendorVersion;
	}

	/**  
	 * @param vendorVersion vendorVersion 
	 */
	public void setVendorVersion(String vendorVersion) {
		this.vendorVersion = vendorVersion;
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
	 * @return info 
	 */
	public String getInfo() {
		return info;
	}

	/**  
	 * @param info info 
	 */
	public void setInfo(String info) {
		this.info = info;
	}
	
}

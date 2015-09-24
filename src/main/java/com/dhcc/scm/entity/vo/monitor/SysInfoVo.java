package com.dhcc.scm.entity.vo.monitor;

import java.io.Serializable;

import com.dhcc.scm.tool.monitor.CpuInfoPro;
import com.dhcc.scm.tool.monitor.CpuPercPro;
import com.dhcc.scm.tool.monitor.FileSystemPro;
import com.dhcc.scm.tool.monitor.MemoryPro;
import com.dhcc.scm.tool.monitor.NetInterfacePro;
import com.dhcc.scm.tool.monitor.OSPro;
import com.dhcc.scm.tool.monitor.WhoPro;

/**
 * 
* <p>标题: SysInfoVo.java</p>
* <p>业务描述: 统一运维及安全管理平台</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月7日
* @version V1.0
 */
public class SysInfoVo implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// CPU的数量
	private int cpuNum;
	
	// CPU的总量（单位：HZ）及CPU的相关信息
	private CpuInfoPro[] cpuInfoPros;
	
	// CPU的用户使用量、系统使用剩余量、总的剩余量、总的使用占用量等（单位：100%）
	private CpuPercPro[] cpuPercPros;
	
	// 内存资源信息
	private MemoryPro memoryPro;
	
	// 操作系统名称
	private String platformName;
	
	// 当前操作系统信息
	private OSPro osPro;
	
	// 当前系统进程表中的用户信息
	private WhoPro[] whoPros;
	
	// 硬盘已有的分区及其详细信息
	private FileSystemPro[] fileSystemPros;
	
	// 机器的正式域名
	private String fqdn;
	
	// 当前机器的IP地址
	private String defaultIpAddress;
	
	// 网络接口配置信息
	private NetInterfacePro[] netInterfacePros;

	/**  
	 * @return cpuNum 
	 */
	public int getCpuNum() {
		return cpuNum;
	}

	/**  
	 * @param cpuNum cpuNum 
	 */
	public void setCpuNum(int cpuNum) {
		this.cpuNum = cpuNum;
	}

	/**  
	 * @return cpuInfoPros 
	 */
	public CpuInfoPro[] getCpuInfoPros() {
		return cpuInfoPros;
	}

	/**  
	 * @param cpuInfoPros cpuInfoPros 
	 */
	public void setCpuInfoPros(CpuInfoPro[] cpuInfoPros) {
		this.cpuInfoPros = cpuInfoPros;
	}

	/**  
	 * @return cpuPercPros 
	 */
	public CpuPercPro[] getCpuPercPros() {
		return cpuPercPros;
	}

	/**  
	 * @param cpuPercPros cpuPercPros 
	 */
	public void setCpuPercPros(CpuPercPro[] cpuPercPros) {
		this.cpuPercPros = cpuPercPros;
	}

	/**  
	 * @return memoryPro 
	 */
	public MemoryPro getMemoryPro() {
		return memoryPro;
	}

	/**  
	 * @param memoryPro memoryPro 
	 */
	public void setMemoryPro(MemoryPro memoryPro) {
		this.memoryPro = memoryPro;
	}

	/**  
	 * @return platformName 
	 */
	public String getPlatformName() {
		return platformName;
	}

	/**  
	 * @param platformName platformName 
	 */
	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	/**  
	 * @return osPro 
	 */
	public OSPro getOsPro() {
		return osPro;
	}

	/**  
	 * @param osPro osPro 
	 */
	public void setOsPro(OSPro osPro) {
		this.osPro = osPro;
	}

	/**  
	 * @return whoPros 
	 */
	public WhoPro[] getWhoPros() {
		return whoPros;
	}

	/**  
	 * @param whoPros whoPros 
	 */
	public void setWhoPros(WhoPro[] whoPros) {
		this.whoPros = whoPros;
	}

	/**  
	 * @return fileSystemPros 
	 */
	public FileSystemPro[] getFileSystemPros() {
		return fileSystemPros;
	}

	/**  
	 * @param fileSystemPros fileSystemPros 
	 */
	public void setFileSystemPros(FileSystemPro[] fileSystemPros) {
		this.fileSystemPros = fileSystemPros;
	}

	/**  
	 * @return fqdn 
	 */
	public String getFqdn() {
		return fqdn;
	}

	/**  
	 * @param fqdn fqdn 
	 */
	public void setFqdn(String fqdn) {
		this.fqdn = fqdn;
	}

	/**  
	 * @return defaultIpAddress 
	 */
	public String getDefaultIpAddress() {
		return defaultIpAddress;
	}

	/**  
	 * @param defaultIpAddress defaultIpAddress 
	 */
	public void setDefaultIpAddress(String defaultIpAddress) {
		this.defaultIpAddress = defaultIpAddress;
	}

	/**  
	 * @return netInterfacePros 
	 */
	public NetInterfacePro[] getNetInterfacePros() {
		return netInterfacePros;
	}

	/**  
	 * @param netInterfacePros netInterfacePros 
	 */
	public void setNetInterfacePros(NetInterfacePro[] netInterfacePros) {
		this.netInterfacePros = netInterfacePros;
	}

}

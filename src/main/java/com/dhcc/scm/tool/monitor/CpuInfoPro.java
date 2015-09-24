package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: CpuInfoPro.java</p>
 * <p>业务描述: CPU的总量（单位：HZ）及CPU的相关信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class CpuInfoPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;

	// 总套接字数量
	private int totalSockets;
	
	// CPU的总量MHz
	private int mhz;
	
	// 获得CPU的类别，如：Celeron
	private String model;
	
	// 总核心数量
	private int totalCores;
	
	// 获得CPU的卖主，如：Intel
	private String vendor;
	
	// 每个套接字的核心数量
	private int coresPerSocket;
	
	// 缓冲存储器数量
	private long cacheSize;
	
	// 描述信息
	private String info;
	
	/**  
	 * @return totalSockets 
	 */
	public int getTotalSockets() {
		return totalSockets;
	}
	/**  
	 * @param totalSockets totalSockets 
	 */
	public void setTotalSockets(int totalSockets) {
		this.totalSockets = totalSockets;
	}
	/**  
	 * @return mhz 
	 */
	public int getMhz() {
		return mhz;
	}
	/**  
	 * @param mhz mhz 
	 */
	public void setMhz(int mhz) {
		this.mhz = mhz;
	}
	/**  
	 * @return model 
	 */
	public String getModel() {
		return model;
	}
	/**  
	 * @param model model 
	 */
	public void setModel(String model) {
		this.model = model;
	}
	/**  
	 * @return totalCores 
	 */
	public int getTotalCores() {
		return totalCores;
	}
	/**  
	 * @param totalCores totalCores 
	 */
	public void setTotalCores(int totalCores) {
		this.totalCores = totalCores;
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
	 * @return coresPerSocket 
	 */
	public int getCoresPerSocket() {
		return coresPerSocket;
	}
	/**  
	 * @param coresPerSocket coresPerSocket 
	 */
	public void setCoresPerSocket(int coresPerSocket) {
		this.coresPerSocket = coresPerSocket;
	}
	/**  
	 * @return cacheSize 
	 */
	public long getCacheSize() {
		return cacheSize;
	}
	/**  
	 * @param cacheSize cacheSize 
	 */
	public void setCacheSize(long cacheSize) {
		this.cacheSize = cacheSize;
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

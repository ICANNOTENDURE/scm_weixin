package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: MemoryPro.java</p>
 * <p>业务描述: 内存资源信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class MemoryPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// a)物理内存信息
	// 内存总量
	private long memTotal;
	
	// 当前内存使用量
	private long memUsed;
	
	// 当前内存剩余量
	private long memFree;
	
	// 内存描述信息
	private String memInfo;
	
	//  b)系统页面文件交换区信息
	// 交换区总量
	private long swapTotal;
	
	// 当前交换区使用量
	private long swapUsed;
	
	// 当前交换区剩余量
	private long swapFree;
	
	// 交换区描述信息
	private String swapInfo;

	/**  
	 * @return memTotal 
	 */
	public long getMemTotal() {
		return memTotal;
	}

	/**  
	 * @param memTotal memTotal 
	 */
	public void setMemTotal(long memTotal) {
		this.memTotal = memTotal;
	}

	/**  
	 * @return memUsed 
	 */
	public long getMemUsed() {
		return memUsed;
	}

	/**  
	 * @param memUsed memUsed 
	 */
	public void setMemUsed(long memUsed) {
		this.memUsed = memUsed;
	}

	/**  
	 * @return memFree 
	 */
	public long getMemFree() {
		return memFree;
	}

	/**  
	 * @param memFree memFree 
	 */
	public void setMemFree(long memFree) {
		this.memFree = memFree;
	}

	/**  
	 * @return memInfo 
	 */
	public String getMemInfo() {
		return memInfo;
	}

	/**  
	 * @param memInfo memInfo 
	 */
	public void setMemInfo(String memInfo) {
		this.memInfo = memInfo;
	}

	/**  
	 * @return swapTotal 
	 */
	public long getSwapTotal() {
		return swapTotal;
	}

	/**  
	 * @param swapTotal swapTotal 
	 */
	public void setSwapTotal(long swapTotal) {
		this.swapTotal = swapTotal;
	}

	/**  
	 * @return swapUsed 
	 */
	public long getSwapUsed() {
		return swapUsed;
	}

	/**  
	 * @param swapUsed swapUsed 
	 */
	public void setSwapUsed(long swapUsed) {
		this.swapUsed = swapUsed;
	}

	/**  
	 * @return swapFree 
	 */
	public long getSwapFree() {
		return swapFree;
	}

	/**  
	 * @param swapFree swapFree 
	 */
	public void setSwapFree(long swapFree) {
		this.swapFree = swapFree;
	}

	/**  
	 * @return swapInfo 
	 */
	public String getSwapInfo() {
		return swapInfo;
	}

	/**  
	 * @param swapInfo swapInfo 
	 */
	public void setSwapInfo(String swapInfo) {
		this.swapInfo = swapInfo;
	}
	
}

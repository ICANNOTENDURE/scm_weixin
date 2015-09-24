package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: CpuPercPro.java</p>
 * <p>业务描述: CPU的用户使用量、系统使用剩余量、总的剩余量、总的使用占用量等（单位：100%）</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class CpuPercPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// 用户使用率
	private double user;
	
	// 系统使用率
	private double sys;
	
	// 当前等待率
	private double wait;
	
	// 排程优先序
	private double nice;
	
	// 当前空闲率
	private double idle;
	
	// 总的使用率
	private double total;
	
	// 描述信息
	private String info;

	/**  
	 * @return user 
	 */
	public double getUser() {
		return user;
	}

	/**  
	 * @param user user 
	 */
	public void setUser(double user) {
		this.user = user;
	}

	/**  
	 * @return sys 
	 */
	public double getSys() {
		return sys;
	}

	/**  
	 * @param sys sys 
	 */
	public void setSys(double sys) {
		this.sys = sys;
	}

	/**  
	 * @return wait 
	 */
	public double getWait() {
		return wait;
	}

	/**  
	 * @param wait wait 
	 */
	public void setWait(double wait) {
		this.wait = wait;
	}

	/**  
	 * @return nice 
	 */
	public double getNice() {
		return nice;
	}

	/**  
	 * @param nice nice 
	 */
	public void setNice(double nice) {
		this.nice = nice;
	}

	/**  
	 * @return idle 
	 */
	public double getIdle() {
		return idle;
	}

	/**  
	 * @param idle idle 
	 */
	public void setIdle(double idle) {
		this.idle = idle;
	}

	/**  
	 * @return total 
	 */
	public double getTotal() {
		return total;
	}

	/**  
	 * @param total total 
	 */
	public void setTotal(double total) {
		this.total = total;
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

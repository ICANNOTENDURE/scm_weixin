package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: WhoPro.java</p>
 * <p>业务描述: 当前系统进程表中的用户信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class WhoPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// 设备
	private String device;
	
	// 主机
	private String host;
	
	// 时间
	private long time;
	
	// 当前系统进程表中的用户名
	private String user;
	
	// 描述信息
	private String info;

	/**  
	 * @return device 
	 */
	public String getDevice() {
		return device;
	}

	/**  
	 * @param device device 
	 */
	public void setDevice(String device) {
		this.device = device;
	}

	/**  
	 * @return host 
	 */
	public String getHost() {
		return host;
	}

	/**  
	 * @param host host 
	 */
	public void setHost(String host) {
		this.host = host;
	}

	/**  
	 * @return time 
	 */
	public long getTime() {
		return time;
	}

	/**  
	 * @param time time 
	 */
	public void setTime(long time) {
		this.time = time;
	}

	/**  
	 * @return user 
	 */
	public String getUser() {
		return user;
	}

	/**  
	 * @param user user 
	 */
	public void setUser(String user) {
		this.user = user;
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

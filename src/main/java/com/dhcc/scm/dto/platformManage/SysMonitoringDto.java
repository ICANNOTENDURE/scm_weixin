package com.dhcc.scm.dto.platformManage;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.vo.monitor.SysInfoVo;

/**
 * 标题: SysMonitoringDto.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年11月27日
 * @version V1.0 
 */
public class SysMonitoringDto extends BaseDto{

	/**  
	* 字段:      序列化id
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	//系统的基本信息
	private SysInfoVo sysInfoVo;
	//硬盘大小
	private long hardDiskTotal;
	//内存大小
	private long ramTotal;
	//接口名
	private String name;
	//IP
	private String address;
	//子网掩码
	private String netmask;
	
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
	 * @return address 
	 */
	public String getAddress() {
		return address;
	}

	/**  
	 * @param address address 
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**  
	 * @return netmask 
	 */
	public String getNetmask() {
		return netmask;
	}

	/**  
	 * @param netmask netmask 
	 */
	public void setNetmask(String netmask) {
		this.netmask = netmask;
	}

	/**  
	 * @return hardDiskTotal 
	 */
	public long getHardDiskTotal() {
		return hardDiskTotal;
	}

	/**  
	 * @param hardDiskTotal hardDiskTotal 
	 */
	public void setHardDiskTotal(long hardDiskTotal) {
		this.hardDiskTotal = hardDiskTotal;
	}

	/**  
	 * @return ramTotal 
	 */
	public long getRamTotal() {
		return ramTotal;
	}

	/**  
	 * @param ramTotal ramTotal 
	 */
	public void setRamTotal(long ramTotal) {
		this.ramTotal = ramTotal;
	}

	/**  
	 * @return sysInfoVo 
	 */
	public SysInfoVo getSysInfoVo() {
		return sysInfoVo;
	}

	/**  
	 * @param sysInfoVo sysInfoVo 
	 */
	public void setSysInfoVo(SysInfoVo sysInfoVo) {
		this.sysInfoVo = sysInfoVo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

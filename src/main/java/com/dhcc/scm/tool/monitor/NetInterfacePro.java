package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: NetInterfacePro.java</p>
 * <p>业务描述: 网络接口配置信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class NetInterfacePro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// a)网络接口配置信息 NetInterfaceConfig
	// 网络设备名
	private String name;
	
	// IP地址
	private String address;
	
	// 网关广播地址
	private String broadcast;
	
	// 子网掩码
	private String netmask;
	
	// 网卡MAC地址
	private String hwaddr;
	
	// 网卡描述信息
	private String description;
	
	// 网卡类型
	private String type;
	
	// 目的地
	private String destination;
	
	// 路由标识
	private long flags;
	
	// 到达目的地的最佳路径的长度
	private long metric;
	
	// 最大传输单元
	private long mtu;
	
	// 网络接口配置信息
	private String configInfo;
	
	// b)网络接口状态信息 NetInterfaceStat
	// 接收的总包裹数
	private long rxPackets;
	
	// 发送的总包裹数
	private long txPackets;
	
	// 接收到的总字节数
	private long rxBytes;
	
	// 发送的总字节数
	private long txBytes;
	
	// 接收到的错误包数
	private long rxErrors;
	
	// 发送数据包时的错误数
	private long txErrors;
	
	// 接收时丢弃的包数
	private long rxDropped;
	
	// 发送时丢弃的包数
	private long txDropped;
	
	// 网络接口配置信息
	private String statInfo;

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
	 * @return broadcast 
	 */
	public String getBroadcast() {
		return broadcast;
	}

	/**  
	 * @param broadcast broadcast 
	 */
	public void setBroadcast(String broadcast) {
		this.broadcast = broadcast;
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
	 * @return hwaddr 
	 */
	public String getHwaddr() {
		return hwaddr;
	}

	/**  
	 * @param hwaddr hwaddr 
	 */
	public void setHwaddr(String hwaddr) {
		this.hwaddr = hwaddr;
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
	 * @return type 
	 */
	public String getType() {
		return type;
	}

	/**  
	 * @param type type 
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**  
	 * @return destination 
	 */
	public String getDestination() {
		return destination;
	}

	/**  
	 * @param destination destination 
	 */
	public void setDestination(String destination) {
		this.destination = destination;
	}

	/**  
	 * @return flags 
	 */
	public long getFlags() {
		return flags;
	}

	/**  
	 * @param flags flags 
	 */
	public void setFlags(long flags) {
		this.flags = flags;
	}

	/**  
	 * @return metric 
	 */
	public long getMetric() {
		return metric;
	}

	/**  
	 * @param metric metric 
	 */
	public void setMetric(long metric) {
		this.metric = metric;
	}

	/**  
	 * @return mtu 
	 */
	public long getMtu() {
		return mtu;
	}

	/**  
	 * @param mtu mtu 
	 */
	public void setMtu(long mtu) {
		this.mtu = mtu;
	}

	/**  
	 * @return configInfo 
	 */
	public String getConfigInfo() {
		return configInfo;
	}

	/**  
	 * @param configInfo configInfo 
	 */
	public void setConfigInfo(String configInfo) {
		this.configInfo = configInfo;
	}

	/**  
	 * @return rxPackets 
	 */
	public long getRxPackets() {
		return rxPackets;
	}

	/**  
	 * @param rxPackets rxPackets 
	 */
	public void setRxPackets(long rxPackets) {
		this.rxPackets = rxPackets;
	}

	/**  
	 * @return txPackets 
	 */
	public long getTxPackets() {
		return txPackets;
	}

	/**  
	 * @param txPackets txPackets 
	 */
	public void setTxPackets(long txPackets) {
		this.txPackets = txPackets;
	}

	/**  
	 * @return rxBytes 
	 */
	public long getRxBytes() {
		return rxBytes;
	}

	/**  
	 * @param rxBytes rxBytes 
	 */
	public void setRxBytes(long rxBytes) {
		this.rxBytes = rxBytes;
	}

	/**  
	 * @return txBytes 
	 */
	public long getTxBytes() {
		return txBytes;
	}

	/**  
	 * @param txBytes txBytes 
	 */
	public void setTxBytes(long txBytes) {
		this.txBytes = txBytes;
	}

	/**  
	 * @return rxErrors 
	 */
	public long getRxErrors() {
		return rxErrors;
	}

	/**  
	 * @param rxErrors rxErrors 
	 */
	public void setRxErrors(long rxErrors) {
		this.rxErrors = rxErrors;
	}

	/**  
	 * @return txErrors 
	 */
	public long getTxErrors() {
		return txErrors;
	}

	/**  
	 * @param txErrors txErrors 
	 */
	public void setTxErrors(long txErrors) {
		this.txErrors = txErrors;
	}

	/**  
	 * @return rxDropped 
	 */
	public long getRxDropped() {
		return rxDropped;
	}

	/**  
	 * @param rxDropped rxDropped 
	 */
	public void setRxDropped(long rxDropped) {
		this.rxDropped = rxDropped;
	}

	/**  
	 * @return txDropped 
	 */
	public long getTxDropped() {
		return txDropped;
	}

	/**  
	 * @param txDropped txDropped 
	 */
	public void setTxDropped(long txDropped) {
		this.txDropped = txDropped;
	}

	/**  
	 * @return statInfo 
	 */
	public String getStatInfo() {
		return statInfo;
	}

	/**  
	 * @param statInfo statInfo 
	 */
	public void setStatInfo(String statInfo) {
		this.statInfo = statInfo;
	}
	
}

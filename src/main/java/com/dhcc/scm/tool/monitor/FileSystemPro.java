package com.dhcc.scm.tool.monitor;

import java.io.Serializable;

/**
 * <p>标题: FileSystemPro.java</p>
 * <p>业务描述: 硬盘已有的分区及其详细信息</p>
 * <p>公司: 东华软件股份公司</p>
 * <p>版权: dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class FileSystemPro implements Serializable {
	
	/**  
	* 字段:	字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	// 分区的盘符名称
	private String devName;
	
	// 分区的盘符名称
	private String dirName;
	
	// 盘符标志
	private long flags;
	
	// 文件系统类型，比如 FAT32、NTFS
	private String sysTypeName;
	
	// 文件系统类型名，比如本地硬盘、光驱、网络文件系统等
	private String typeName;
	
	// 文件系统类型
	private int type;
	
	// 描述信息
	private String fsInfo;
	
	// 文件系统总大小 KB
	private long total;
	
	// 文件系统剩余大小
	private long free;
	
	// 文件系统可用大小
	private long avail;
	
	// 文件系统已经使用量
	private long used;
	
	// 文件系统资源的利用率
	private double usePercent;
	
	// 文件系统读取速度
	private long diskReads;
	
	// 文件系统写入速度
	private long diskWrites;
	
	// 描述信息
	private String usageInfo;

	/**  
	 * @return devName 
	 */
	public String getDevName() {
		return devName;
	}

	/**  
	 * @param devName devName 
	 */
	public void setDevName(String devName) {
		this.devName = devName;
	}

	/**  
	 * @return dirName 
	 */
	public String getDirName() {
		return dirName;
	}

	/**  
	 * @param dirName dirName 
	 */
	public void setDirName(String dirName) {
		this.dirName = dirName;
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
	 * @return sysTypeName 
	 */
	public String getSysTypeName() {
		return sysTypeName;
	}

	/**  
	 * @param sysTypeName sysTypeName 
	 */
	public void setSysTypeName(String sysTypeName) {
		this.sysTypeName = sysTypeName;
	}

	/**  
	 * @return typeName 
	 */
	public String getTypeName() {
		return typeName;
	}

	/**  
	 * @param typeName typeName 
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**  
	 * @return type 
	 */
	public int getType() {
		return type;
	}

	/**  
	 * @param type type 
	 */
	public void setType(int type) {
		this.type = type;
	}

	/**  
	 * @return fsInfo 
	 */
	public String getFsInfo() {
		return fsInfo;
	}

	/**  
	 * @param fsInfo fsInfo 
	 */
	public void setFsInfo(String fsInfo) {
		this.fsInfo = fsInfo;
	}

	/**  
	 * @return total 
	 */
	public long getTotal() {
		return total;
	}

	/**  
	 * @param total total 
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	/**  
	 * @return free 
	 */
	public long getFree() {
		return free;
	}

	/**  
	 * @param free free 
	 */
	public void setFree(long free) {
		this.free = free;
	}

	/**  
	 * @return avail 
	 */
	public long getAvail() {
		return avail;
	}

	/**  
	 * @param avail avail 
	 */
	public void setAvail(long avail) {
		this.avail = avail;
	}

	/**  
	 * @return used 
	 */
	public long getUsed() {
		return used;
	}

	/**  
	 * @param used used 
	 */
	public void setUsed(long used) {
		this.used = used;
	}

	/**  
	 * @return usePercent 
	 */
	public double getUsePercent() {
		return usePercent;
	}

	/**  
	 * @param usePercent usePercent 
	 */
	public void setUsePercent(double usePercent) {
		this.usePercent = usePercent;
	}

	/**  
	 * @return diskReads 
	 */
	public long getDiskReads() {
		return diskReads;
	}

	/**  
	 * @param diskReads diskReads 
	 */
	public void setDiskReads(long diskReads) {
		this.diskReads = diskReads;
	}

	/**  
	 * @return diskWrites 
	 */
	public long getDiskWrites() {
		return diskWrites;
	}

	/**  
	 * @param diskWrites diskWrites 
	 */
	public void setDiskWrites(long diskWrites) {
		this.diskWrites = diskWrites;
	}

	/**  
	 * @return usageInfo 
	 */
	public String getUsageInfo() {
		return usageInfo;
	}

	/**  
	 * @param usageInfo usageInfo 
	 */
	public void setUsageInfo(String usageInfo) {
		this.usageInfo = usageInfo;
	}
	
}

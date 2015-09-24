package com.dhcc.scm.tool.monitor;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.FileSystem;
import org.hyperic.sigar.FileSystemUsage;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.NetFlags;
import org.hyperic.sigar.NetInterfaceConfig;
import org.hyperic.sigar.NetInterfaceStat;
import org.hyperic.sigar.OperatingSystem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.hyperic.sigar.SigarNotImplementedException;
import org.hyperic.sigar.Swap;

import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.plug.config.PmsConfig;

/**
 * <p>标题: SysInfo.java</p>
 * <p>业务描述:监控系统资源信息</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class SysInfo {
	
	// 加载dll文件，返回成功加载的dll文件。
	public static String addLibrary() {
		String path=PmsConfig.class.getResource("/").getPath().replaceAll("%20", " ");
		String filePath=path.replace("WEB-INF/classes/", "dll/hyperic-sigar-1.6.4/lib");
		if (filePath.equals(path)) {
			File fileTemp=new File("");
			StringBuilder fileTempPath=new StringBuilder(64);
			try {
				fileTempPath.append(fileTemp.getCanonicalPath());
				fileTempPath.append("\\webContent\\dll\\hyperic-sigar-1.6.4\\lib");
			} catch (Exception e) {
				throw new DataBaseException(e.getMessage(), e);
			}
			filePath=fileTempPath.toString();
		}
		String libs = System.getProperty("java.library.path");
    	String str=";"+libs+";";
    	if (!str.contains(";"+filePath+";")){
    		libs += File.pathSeparator + filePath;
    	}
		System.setProperty("java.library.path", libs);
		return libs;
    }

	// 添加dll目录，传入参数，例：String libPath="D:\\JAR\\SysInfo\\";返回javapath
	public static String addLibrary(String libPath) {
		if (libPath == null) {
			return addLibrary();
        }
		//修改环境变量"java.library.path"的方式加载dll文件
		String libs = System.getProperty("java.library.path");
    	String str=";"+libs+";";
    	if (!str.contains(";"+libPath+";")){
    		libs += File.pathSeparator + libPath;
    	}
		System.setProperty("java.library.path", libs);
		return libs;
    }
	
	// 移除dll目录，传入参数，例: str="\\SysInfo\\";返回javapath
	public static String removeLibrary(String str) {
		String libs = System.getProperty("java.library.path");
		if (str.equals("")) {
            return libs;
        }
		String path="";
		if (libs.contains(str)){
			String[] array=libs.split(File.pathSeparator);
	        for (String s : array) {
	        	if (!s.contains(str)){
	        		if (path.equals("")){
	        			path += File.pathSeparator + s;
	        		}else{
	        			path += s;
	        		}
	        	}
	        }
	        System.setProperty("java.library.path", path);
		}else{
			path=libs;
		}
        return path;
    }
	// 1.CPU资源信息
	// a)CPU数量（单位：个）
	public static int GetCpuCount() {
		Sigar sigar = new Sigar();
		try {
			return sigar.getCpuInfoList().length;
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	// b)CPU的总量（单位：HZ）及CPU的相关信息
	public static CpuInfoPro[] GetCpuTotal() {
		Sigar sigar = new Sigar();
		CpuInfo[] infos;
		CpuInfoPro[] cpuInfoPros=null;
		try {
			infos = sigar.getCpuInfoList();
			cpuInfoPros=new CpuInfoPro[infos.length];
			for (int i = 0; i < infos.length; i++) {// 不管是单块CPU还是多CPU都适用
				CpuInfo info = infos[i];
				CpuInfoPro cpuInfoPro= new CpuInfoPro();
				cpuInfoPro.setInfo(info.toMap().toString());
				cpuInfoPro.setTotalSockets(info.getTotalSockets());
				cpuInfoPro.setMhz(info.getMhz());// CPU的总量MHz
				cpuInfoPro.setModel(info.getModel());// 获得CPU的类别，如：Celeron
				cpuInfoPro.setTotalCores(info.getTotalCores());
				cpuInfoPro.setVendor(info.getVendor());// 获得CPU的卖主，如：Intel
				cpuInfoPro.setCoresPerSocket(info.getCoresPerSocket());
				cpuInfoPro.setCacheSize(info.getCacheSize());// 缓冲存储器数量
				cpuInfoPros[i]=cpuInfoPro;
			}
		} catch (SigarException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return cpuInfoPros;
	}
	// c)CPU的用户使用量、系统使用剩余量、总的剩余量、总的使用占用量等（单位：100%）
	public static CpuPercPro[] GetCpuPerc() {
		Sigar sigar = new Sigar();
		CpuPerc cpuList[] = null;
		CpuPercPro[] cpuPercPros=null;
		try {
			cpuList = sigar.getCpuPercList();
			cpuPercPros=new CpuPercPro[cpuList.length];
			for (int i = 0; i < cpuList.length; i++) {
				cpuPercPros[i]=SetCpuPerc(cpuList[i]);
			}			
		} catch (SigarException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return cpuPercPros;
	}
	private static CpuPercPro SetCpuPerc(CpuPerc cpu) {
		CpuPercPro cpuPercPro=new CpuPercPro();
		cpuPercPro.setInfo(cpu.toString());
		cpuPercPro.setUser(cpu.getUser());// 用户使用率
		cpuPercPro.setSys(cpu.getSys());// 系统使用率
		cpuPercPro.setWait(cpu.getWait());// 当前等待率
		cpuPercPro.setNice(cpu.getNice());//
		cpuPercPro.setIdle(cpu.getIdle());// 当前空闲率
		cpuPercPro.setTotal(cpu.getCombined());// 总的使用率
		return cpuPercPro;
	}
	// 2.内存资源信息
	public static MemoryPro GetPhysicalMemory() {
		Sigar sigar = new Sigar();
		MemoryPro memoryPro=new MemoryPro();
		try {
			// a)物理内存信息
			Mem mem = sigar.getMem();
			memoryPro.setMemInfo(mem.toMap().toString());
			memoryPro.setMemTotal(mem.getTotal() / 1024L);// 内存总量
			memoryPro.setMemUsed(mem.getUsed() / 1024L);// 当前内存使用量
			memoryPro.setMemFree(mem.getFree() / 1024L);// 当前内存剩余量
			Swap swap = sigar.getSwap();
			// b)系统页面文件交换区信息
			memoryPro.setSwapInfo(swap.toMap().toString());
			memoryPro.setSwapTotal(swap.getTotal() / 1024L);// 交换区总量
			memoryPro.setSwapUsed(swap.getUsed() / 1024L);// 当前交换区使用量
			memoryPro.setSwapFree(swap.getFree() / 1024L);// 当前交换区剩余量
		} catch (SigarException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return memoryPro;
	}
	// 3.操作系统信息
	// a)取到当前操作系统的名称：
	public static String GetPlatformName() {
		String hostname = "";
		try {
			hostname = InetAddress.getLocalHost().getHostName();
		} catch (Exception exc) {
			Sigar sigar = new Sigar();
			try {
				hostname = sigar.getNetInfo().getHostName();
			} catch (SigarException e) {
				hostname = "localhost.unknown";
			} finally {
				sigar.close();
			}
		}
		return hostname;
	}
	// b)取当前操作系统的信息
	public static OSPro GetOSInfo() {
		OperatingSystem OS = OperatingSystem.getInstance();
		OSPro oSPro=new OSPro();
		// 
		oSPro.setInfo(OS.toMap().toString());
		// 操作系统内核类型如： 386、486、586等x86
		oSPro.setArch(OS.getArch());
		oSPro.setDataModel(OS.getDataModel());
		// 系统描述
		oSPro.setDescription(OS.getDescription());
		oSPro.setMachine(OS.getMachine());
		// 操作系统类型
		oSPro.setName(OS.getName());
		oSPro.setPatchLevel(OS.getPatchLevel());
		// 操作系统的卖主
		oSPro.setVendor(OS.getVendor());
		// 卖主名称
		oSPro.setVendorCodeName(OS.getVendorCodeName());
		// 操作系统名称
		oSPro.setVendorName(OS.getVendorName());
		// 操作系统卖主类型
		oSPro.setVendorVersion(OS.getVendorVersion());
		// 操作系统的版本号
		oSPro.setVersion(OS.getVersion());
		return oSPro;
	}
	// c)取当前系统进程表中的用户信息
	public static WhoPro[] GetWho() {
		WhoPro whoPros[] = null;
		try {
			Sigar sigar = new Sigar();
			org.hyperic.sigar.Who[] who = sigar.getWhoList();
			if (who != null && who.length > 0) {
				whoPros=new WhoPro[who.length];
				for (int i = 0; i < who.length; i++) {
					org.hyperic.sigar.Who _who = who[i];
					WhoPro whoPro=new WhoPro();
					whoPro.setInfo(_who.toMap().toString());
					whoPro.setDevice(_who.getDevice());
					whoPro.setHost(_who.getHost());
					whoPro.setTime(_who.getTime());
					whoPro.setUser(_who.getUser());// 当前系统进程表中的用户名
					whoPros[i]=whoPro;
				}
			}
		} catch (SigarException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		return whoPros;
	}
	// 4.资源信息（主要是硬盘）
	// a)取硬盘已有的分区及其详细信息（通过sigar.getFileSystemList()来获得FileSystem列表对象，然后对其进行编历）：
	public static FileSystemPro[] GetFileSystemInfo() throws Exception {
		Sigar sigar = new Sigar();
		FileSystem fslist[] = sigar.getFileSystemList();
		//String dir = System.getProperty("user.home");// 当前用户文件夹路径
		FileSystemPro fileSystemPros[] = new FileSystemPro[fslist.length];
		for (int i = 0; i < fslist.length; i++) {
			FileSystem fs = fslist[i];
			FileSystemPro fileSystemPro = new FileSystemPro();
			fileSystemPros[i]=fileSystemPro;
			fileSystemPro.setFsInfo(fs.toMap().toString());
			fileSystemPro.setDevName(fs.getDevName());// 分区的盘符名称
			fileSystemPro.setDirName(fs.getDirName());// 分区的盘符名称
			fileSystemPro.setFlags(fs.getFlags());
			fileSystemPro.setSysTypeName(fs.getSysTypeName());// 文件系统类型，比如 FAT32、NTFS
			fileSystemPro.setTypeName(fs.getTypeName());// 文件系统类型名，比如本地硬盘、光驱、网络文件系统等
			fileSystemPro.setType(fs.getType());// 文件系统类型
			FileSystemUsage usage = null;
			try {
				usage = sigar.getFileSystemUsage(fs.getDirName());
			} catch (SigarException e) {
				if (fs.getType() == 2)
					throw e;
				continue;
			}
			switch (fs.getType()) {
			case 0: // TYPE_UNKNOWN ：未知
				break;
			case 1: // TYPE_NONE
				break;
			case 2: // TYPE_LOCAL_DISK : 本地硬盘
				fileSystemPro.setTotal(usage.getTotal());// 文件系统总大小
				fileSystemPro.setFree(usage.getFree());// 文件系统剩余大小
				fileSystemPro.setAvail(usage.getAvail());// 文件系统可用大小
				fileSystemPro.setUsed(usage.getUsed());// 文件系统已经使用量
				fileSystemPro.setUsePercent(usage.getUsePercent());// 文件系统资源的利用率
				break;
			case 3:// TYPE_NETWORK ：网络
				break;
			case 4:// TYPE_RAM_DISK ：闪存
				break;
			case 5:// TYPE_CDROM ：光驱
				break;
			case 6:// TYPE_SWAP ：页面交换
				break;
			}
			fileSystemPro.setUsageInfo(usage.toMap().toString());
			fileSystemPro.setDiskReads(usage.getDiskReads());
			fileSystemPro.setDiskWrites(usage.getDiskWrites());
		}
		return fileSystemPros;
	}
	 // 5.网络信息
	 // a)当前机器的正式域名
	public static String GetFQDN() {
		try {
			return InetAddress.getLocalHost().getCanonicalHostName();
		} catch (UnknownHostException e) {
			Sigar sigar = null;
			try {
				sigar = new Sigar();
				return sigar.getFQDN();
			} catch (SigarException ex) {
				return null;
			} finally {
				if (sigar!=null){
					sigar.close();
				}
			}
		}
	}
	 // b)取到当前机器的IP地址
	public static String GetDefaultIpAddress() {
		String address = null;
		try {
			address = InetAddress.getLocalHost().getHostAddress();
			// 没有出现异常而正常当取到的IP时，如果取到的不是网卡循回地址时就返回
			// 否则再通过Sigar工具包中的方法来获取
			if (!NetFlags.LOOPBACK_ADDRESS.equals(address)) {
				return address;
			}
		} catch (UnknownHostException e) {
			// hostname not in DNS or /etc/hosts
		}
		Sigar sigar = new Sigar();
		try {
			address = sigar.getNetInterfaceConfig().getAddress();
		} catch (SigarException e) {
			address = NetFlags.LOOPBACK_ADDRESS;
		} finally {
			sigar.close();
		}
		return address;
	}
	 // c)获取网络接口信息
	public static NetInterfacePro[] GetNetIfList(int tag) throws Exception {
		Sigar sigar = new Sigar();
		String ifNames[] = sigar.getNetInterfaceList();
		NetInterfacePro[] netInterfacePros=null;
		int len=0;
		if (tag<3){
			for (int i = 0; i < ifNames.length; i++) {
				NetInterfaceConfig ifconfig = sigar.getNetInterfaceConfig(ifNames[i]);
				if ( NetFlags.LOOPBACK_ADDRESS.equals(ifconfig.getAddress())
						|| ((ifconfig.getFlags() & NetFlags.IFF_LOOPBACK) != 0)
						|| NetFlags.NULL_HWADDR.equals(ifconfig.getHwaddr()) ) {
					continue;
				}
				if (tag==2){
					len++;
				}else{
					if ((ifconfig.getFlags() & 1L) <= 0L){
						continue;
					}
					if (tag==1){
						len++;
					}else{
						if (ifconfig.getAddress().toString().equals("0.0.0.0")){
							continue;
						}
						len++;
					}
				}
			}
		}else{
			len=ifNames.length;
		}
		netInterfacePros=new NetInterfacePro[len];
		int point =0;
		for (int i = 0; i < ifNames.length; i++) {
			String name = ifNames[i];
			NetInterfaceConfig ifconfig = sigar.getNetInterfaceConfig(name);
			if ( tag <3 ){
				if ( NetFlags.LOOPBACK_ADDRESS.equals(ifconfig.getAddress())
						|| ((ifconfig.getFlags() & NetFlags.IFF_LOOPBACK) != 0)
						|| NetFlags.NULL_HWADDR.equals(ifconfig.getHwaddr()) ) {
					continue;
				}
				if (tag<2){
					if ((ifconfig.getFlags() & 1L) <= 0L){
						continue;
					}
					if (tag<1){
						if (ifconfig.getAddress().toString().equals("0.0.0.0")){
							continue;
						}
					}
				}
			}
			NetInterfacePro netInterfacePro=new NetInterfacePro();
			netInterfacePro.setConfigInfo(ifconfig.toMap().toString());
			netInterfacePro.setName(ifconfig.getName());// 网络设备名
			netInterfacePro.setAddress(ifconfig.getAddress());// IP地址
			netInterfacePro.setBroadcast(ifconfig.getBroadcast());// 网关广播地址
			netInterfacePro.setNetmask(ifconfig.getNetmask());// 子网掩码
			netInterfacePro.setHwaddr(ifconfig.getHwaddr());// 网卡MAC地址
			netInterfacePro.setDescription(ifconfig.getDescription());// 网卡描述信息
			netInterfacePro.setType(ifconfig.getType());//
			netInterfacePro.setDestination(ifconfig.getDestination());
			netInterfacePro.setFlags(ifconfig.getFlags());//
			netInterfacePro.setMetric(ifconfig.getMetric());
			netInterfacePro.setMtu(ifconfig.getMtu());
			try {
				NetInterfaceStat ifstat = sigar.getNetInterfaceStat(name);
				netInterfacePro.setStatInfo(ifstat.toMap().toString());
				netInterfacePro.setRxPackets(ifstat.getRxPackets());// 接收的总包裹数
				netInterfacePro.setTxPackets(ifstat.getTxPackets());// 发送的总包裹数
				netInterfacePro.setRxBytes(ifstat.getRxBytes());// 接收到的总字节数
				netInterfacePro.setTxBytes(ifstat.getTxBytes());// 发送的总字节数
				netInterfacePro.setRxErrors(ifstat.getRxErrors());// 接收到的错误包数
				netInterfacePro.setTxErrors(ifstat.getTxErrors());// 发送数据包时的错误数
				netInterfacePro.setRxDropped(ifstat.getRxDropped());// 接收时丢弃的包数
				netInterfacePro.setTxDropped(ifstat.getTxDropped());// 发送时丢弃的包数
			} catch (SigarNotImplementedException e) {
			} catch (SigarException e) {
			}
			netInterfacePros[point]=netInterfacePro;
			point++;
		}
		return netInterfacePros;
	}
}

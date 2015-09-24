package com.dhcc.scm.blh.platformManage;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.SysMonitoringDto;
import com.dhcc.scm.service.platformManage.MonStatisticService;
import com.dhcc.scm.service.platformManage.MonSysService;

/**
 * 标题: SysMonitoringBlh.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @date 2013年11月27日
 * @version V1.0 
 */
@Component
public class SysMonitoringBlh  extends AbstractBaseBlh{
	
	@Resource
	private MonStatisticService monStatisticService;
	@Resource
	private MonSysService monSysService;

	/**
	 * 
	* 方法名:          getSystemInfo
	* 方法功能描述:    获取系统信息
	* @param:         
	* @return:        
	* @Create Date:   2013年11月27日 上午11:03:29
	 */
	public void getSystemInfo(BusinessRequest req){
		SysMonitoringDto sysMonitoringDto = super.getDto(SysMonitoringDto.class, req);
		try {
			//调用接口获取系统基本信息
			//Response<SysInfoVo> response = SysMonApiResourceClient.monSysCtrlGetSysInfoForPage();
			//SysInfoVo sysInfoVo = response.getPageData().get(0);
//			sysMonitoringDto.setSysInfoVo(sysInfoVo);
//			//硬盘大小
//			FileSystemPro[] fileSystemPros = sysInfoVo.getFileSystemPros();
//			Long totalTemp = 0L;
//			for(int i=0;i<fileSystemPros.length;i++){
//				totalTemp = totalTemp + fileSystemPros[i].getTotal();
//			}
//			sysMonitoringDto.setHardDiskTotal(totalTemp/(1024*1024));
//			//内存大小
//			sysMonitoringDto.setRamTotal(sysInfoVo.getMemoryPro().getMemTotal()/(1024*1024));
//			
//			NetInterfacePro[] netInterfacePros = sysInfoVo.getNetInterfacePros();
//			//接口名
//			sysMonitoringDto.setName(netInterfacePros[0].getName());
//			//IP
//			sysMonitoringDto.setAddress(netInterfacePros[0].getAddress());
//			//子网掩码
//			sysMonitoringDto.setNetmask(netInterfacePros[0].getNetmask());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
}

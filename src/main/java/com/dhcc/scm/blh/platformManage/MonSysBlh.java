package com.dhcc.scm.blh.platformManage;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.MonSysDto;
import com.dhcc.scm.service.platformManage.MonSysService;

/**
 * 
* <p>标题: MonSysBlh.java</p>
* <p>业务描述: 服务器资源监控信息Blh</p>
* <p>公司: 东华软件股份公司</p>
* <p>版权: dhcc2013</p>
* @author 于鸿
* @date 2013年11月1日
* @version V1.0
 */
@Component
public class MonSysBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(MonSysBlh.class);

	@Resource
	private MonSysService monSysService;

	public MonSysBlh() {
		logger.info("====new MonSysBlh====");
	}
	
	/**
	 * 
	* 方法名:		list
	* 方法功能描述:	进入服务器资源监控列表的入口方法
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:21:26
	 */
	public void list(BusinessRequest res) {
		MonSysDto dto = super.getDto(MonSysDto.class, res);
		
		//调用对应的service方法
		monSysService.list(dto);
	}
	
	/**
	 * 
	* 方法名:		save
	* 方法功能描述:	保存服务器资源监控信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:27
	 */
	public void save(BusinessRequest res) {
		MonSysDto dto = super.getDto(MonSysDto.class, res);
		
		//调用对应的service方法
		monSysService.save(dto);
	}
	
	/**
	 * 
	* 方法名:		delete
	* 方法功能描述:	删除服务器资源监控信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:35
	 */
	public void delete(BusinessRequest res) {
		MonSysDto dto = super.getDto(MonSysDto.class, res);
		
		//调用对应的service方法
		monSysService.delete(dto);
	}
	
	/**
	 * 
	* 方法名:		update
	* 方法功能描述:	更新服务器资源监控信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:39
	 */
	public void update(BusinessRequest res) {
		MonSysDto dto = super.getDto(MonSysDto.class, res);
		
		//调用对应的service方法
		monSysService.update(dto);
	}
	
	/**
	 * 
	* 方法名:		findById
	* 方法功能描述:	根据Id查询服务器资源监控信息
	* @param:		业务请求对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月1日 上午10:22:47
	 */
	public void findById(BusinessRequest res) {
		MonSysDto dto = super.getDto(MonSysDto.class, res);
		
		//调用对应的service方法
		monSysService.findById(dto);
	}
	
}

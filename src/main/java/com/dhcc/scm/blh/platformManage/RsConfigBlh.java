package com.dhcc.scm.blh.platformManage;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.RsConfigDto;
import com.dhcc.scm.entity.platformManage.RsConfig;
import com.dhcc.scm.service.platformManage.RsConfigService;

/**
 * <p>标题: RsConfigBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器配置信息业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月17日
 * @version V1.0 
 */
@Component
public class RsConfigBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(RsConfigBlh.class);
	@Resource
	RsConfigService rsConfigService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public RsConfigBlh() {
		logger.info("====new RsConfigBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改接收服务器配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:43:09
	*/
	public void saveOrUpdate(BusinessRequest res) {
		RsConfig rsConfig = (super.getDto(RsConfigDto.class, res)).getRsConfig();
		
		rsConfigService.saveOrUpdate(rsConfig);
	}
	
	/** 
	* 方法名:          saveRsConfig
	* 方法功能描述:    保存接收服务器配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:46:53
	*/
	public void saveRsConfig(BusinessRequest res) {
		RsConfigDto dto = super.getDto(RsConfigDto.class, res);
		
		rsConfigService.saveRsConfig(dto.getRsConfig());
	}
	
	/** 
	* 方法名:          delRsConfig
	* 方法功能描述:    删除接收服务器配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:50:05
	*/
	public void delRsConfig(BusinessRequest res) {
		RsConfig rsConfig = (super.getDto(RsConfigDto.class, res)).getRsConfig();
		
		rsConfigService.delRsConfig(rsConfig);
	}
	
	/** 
	* 方法名:          findRsConfigById
	* 方法功能描述:    根据ID查找接收服务器配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:53:26
	*/
	public RsConfig findRsConfigById(BusinessRequest res) {
		RsConfig rsConfig = rsConfigService.findRsConfigById((super.getDto(RsConfigDto.class, res)).getRsConfig().getGatewayId());
		
		return rsConfig;
	}
	
	/** 
	* 方法名:          rsConfigList
	* 方法功能描述:    分页查询接收服务器配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月17日 下午3:56:04
	*/
	public void rsConfigList(BusinessRequest res) {
		PagerModel pagerModel = (super.getDto(RsConfigDto.class, res)).getPageModel();
		rsConfigService.findRsConfig(pagerModel);
	}
}

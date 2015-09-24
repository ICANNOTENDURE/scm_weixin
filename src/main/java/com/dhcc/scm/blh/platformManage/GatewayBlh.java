package com.dhcc.scm.blh.platformManage;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.GatewayDto;
import com.dhcc.scm.entity.platformManage.Gateway;
import com.dhcc.scm.service.platformManage.GatewayService;

/**
 * <p>标题: GatewayBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  应用系统安装配置管理业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月4日
 * @version V1.0 
 */
@Component
public class GatewayBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(GatewayBlh.class);
	
	@Resource
	GatewayService gatewayService;
	
	@Resource
	CommonService commonService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p> 
	* @param gatewayService 
	*/
	public GatewayBlh() {
		logger.info("====new GatewayBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月4日 上午11:17:21
	*/
	public void saveOrUpdate(BusinessRequest res) {
		GatewayDto dto = super.getDto(GatewayDto.class, res);
		Gateway gateway = dto.getGateway();
		
		if ("".equals(gateway.getGatewayId()) || "null".equals(gateway.getGatewayId())) {
			gateway.setGatewayId(null);
		} else {
			Date date = new Date();
			dto.getGateway().setUpdateTime(date);
		}
		
		gatewayService.saveOrUpdate(gateway);
	}
	
	/** 
	* 方法名:          saveGateway
	* 方法功能描述:    保存应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月4日 上午11:22:31
	*/
	public void saveGateway(BusinessRequest res) {
		GatewayDto dto = super.getDto(GatewayDto.class, res);
		
		dto.getGateway().setGatewayId("");
		gatewayService.saveGateway(dto.getGateway());
	}
	
	/** 
	* 方法名:          delGateway
	* 方法功能描述:    删除应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月4日 上午11:25:04
	*/
	public void delGateway(BusinessRequest res) {
		Gateway gateway = (super.getDto(GatewayDto.class, res)).getGateway();
		
		gatewayService.delGateway(gateway);
	}
	
	/** 
	* 方法名:          delGatewayById
	* 方法功能描述:    根据ID删除应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月4日 下午12:24:29
	*/
	public void delGatewayById(BusinessRequest res) {
		Gateway gateway = (super.getDto(GatewayDto.class, res)).getGateway();
		
		gatewayService.delGatewayById(gateway.getGatewayId());
	}
	
	/** 
	* 方法名:          findGatewayById
	* 方法功能描述:    根据ID查找应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月21日 下午1:44:36
	*/
	public void findGatewayById(BusinessRequest res) {
		GatewayDto gatewayDto = super.getDto(GatewayDto.class, res);
		Gateway gateway = gatewayService.findGatewayById(gatewayDto.getGateway().getGatewayId());
		gatewayDto.setGateway(gateway);
	}
	
	/** 
	* 方法名:          gatewayList
	* 方法功能描述:    分页查找应用系统安装配置信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月21日 下午1:46:35
	*/
	public void gatewayList(BusinessRequest res) {
		GatewayDto gatewayDto = super.getDto(GatewayDto.class, res);
		PagerModel pagerModel = gatewayDto.getPageModel();
		gatewayService.findGateway(pagerModel, gatewayDto);
			
		Map<String, String> map = new HashMap<String, String>(3);
		map.put("onlineState", "online_state");
		map.put("serverType", "server_type");
		map.put("useState", "use_state");
		commonService.dictionaryConvert(pagerModel.getPageData(), map);
			
		gatewayDto.setPageModel(pagerModel);
		//logger.info("++++++++++++++++++++GatewayVo---------------------"+pagerModel.getPageDataJson());
	}
	
}

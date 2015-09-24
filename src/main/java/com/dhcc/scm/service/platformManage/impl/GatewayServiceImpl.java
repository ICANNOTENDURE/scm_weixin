package com.dhcc.scm.service.platformManage.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.GatewayDao;
import com.dhcc.scm.dto.platformManage.GatewayDto;
import com.dhcc.scm.entity.platformManage.Gateway;
import com.dhcc.scm.service.platformManage.GatewayService;

/**
 * <p>标题: GatewayServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  网关管理模块Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月4日
 * @version V1.0 
 */
@Service("gatewayService")
public class GatewayServiceImpl implements GatewayService {
	
	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
	private GatewayDao gatewayDao;
	
	@Resource
	private CommonService commonService;

	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param gateway   
	* @see com.dhcc.pms.service.platformManage.GatewayService#saveOrUpdate(com.dhcc.pms.entity.platformManage.Gateway)   
	*/
	@Override
	public void saveOrUpdate(Gateway gateway) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in GatewayServiceImpl====");
		gatewayDao.saveOrUpdate(gateway);
	}

	/* (非 Javadoc)   
	* <p>Title: saveGateway</p>   
	* <p>Description: </p>   
	* @param gateway   
	* @see com.dhcc.pms.service.platformManage.GatewayService#saveGateway(com.dhcc.pms.entity.platformManage.Gateway)   
	*/
	@Override
	public void saveGateway(Gateway gateway) {
		// TODO Auto-generated method stub
		log.info("=====this is saveGateway operation in GatewayServiceImpl====");
		gatewayDao.save(gateway);
	}

	/* (非 Javadoc)   
	* <p>Title: updateGateway</p>   
	* <p>Description: </p>   
	* @param gateway   
	* @see com.dhcc.pms.service.platformManage.GatewayService#updateGateway(com.dhcc.pms.entity.platformManage.Gateway)   
	*/
	@Override
	public void updateGateway(Gateway gateway) {
		// TODO Auto-generated method stub
		log.info("=====this is updateGateway operation in GatewayServiceImpl====");
		gatewayDao.update(gateway);
	}

	/* (非 Javadoc)   
	* <p>Title: delGatewayById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.GatewayService#delGatewayById(java.lang.String)   
	*/
	@Override
	public void delGatewayById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delGatewayById operation in GatewayServiceImpl====");
		gatewayDao.deleteById(GatewayDao.class, id);
	}

	/* (非 Javadoc)   
	* <p>Title: delGateway</p>   
	* <p>Description: </p>   
	* @param gateway   
	* @see com.dhcc.pms.service.platformManage.GatewayService#delGateway(com.dhcc.pms.entity.platformManage.Gateway)   
	*/
	@Override
	public void delGateway(Gateway gateway) {
		// TODO Auto-generated method stub
		log.info("=====this is delGateway operation in CertServiceImpl====");
		gatewayDao.delete(gateway);
	}

	/* (非 Javadoc)   
	* <p>Title: findGatewayById</p>   
	* <p>Description: </p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.GatewayService#findGatewayById(java.lang.String)   
	*/
	@Override
	public Gateway findGatewayById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findGatewayById operation in GatewayServiceImpl====");
		Gateway gateway = gatewayDao.findById(id);
		
		return gateway;
	}

	/* (非 Javadoc)   
	* <p>Title: findGateway</p>   
	* <p>Description: </p>   
	* @param pagerModel   
	* @see com.dhcc.pms.service.platformManage.GatewayService#findGateway(com.dhcc.framework.common.PagerModel)   
	*/
	@Override
	public void findGateway(PagerModel pagerModel, GatewayDto gatewayDto) {
		// TODO Auto-generated method stub
		gatewayDao.buildPagerModelQuery(pagerModel, gatewayDto);
		commonService.fillPagerModelData(pagerModel);
		
		log.info("\n===========Num==========\n"+pagerModel.getPageData().size());
	}
}

package com.dhcc.scm.service.platformManage.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.RsConfigDao;
import com.dhcc.scm.entity.platformManage.RsConfig;
import com.dhcc.scm.service.platformManage.RsConfigService;

/**
 * <p>标题: RsConfigServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器配置信息Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月17日
 * @version V1.0 
 */
@Service("rsConfigService")
public class RsConfigServiceImpl implements RsConfigService {

	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	@Resource
	private RsConfigDao rsConfigDao;
	
	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param rsConfig   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#saveOrUpdate(com.dhcc.pms.entity.platformManage.RsConfig)   
	*/
	@Override
	public void saveOrUpdate(RsConfig rsConfig) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in RsConfigServiceImpl====");
		rsConfigDao.saveOrUpdate(rsConfig);
	}
	
	/* (非 Javadoc)   
	* <p>Title: saveRsConfig</p>   
	* <p>Description: </p>   
	* @param rsConfig   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#saveRsConfig(com.dhcc.pms.entity.platformManage.RsConfig)   
	*/
	@Override
	public void saveRsConfig(RsConfig rsConfig) {
		// TODO Auto-generated method stub
		log.info("=====this is saveRsConfig operation in RsConfigServiceImpl====");
		rsConfigDao.save(rsConfig);
	}
	
	/* (非 Javadoc)   
	* <p>Title: updateRsConfig</p>   
	* <p>Description: </p>   
	* @param rsConfig   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#updateRsConfig(com.dhcc.pms.entity.platformManage.RsConfig)   
	*/
	@Override
	public void updateRsConfig(RsConfig rsConfig) {
		// TODO Auto-generated method stub
		log.info("=====this is updateRsConfig operation in RsConfigServiceImpl====");
		rsConfigDao.update(rsConfig);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delRsConfigById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#delRsConfigById(java.lang.String)   
	*/
	@Override
	public void delRsConfigById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delRsConfigById operation in RsConfigServiceImpl====");
		rsConfigDao.deleteById(RsConfigDao.class, id);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delRsConfig</p>   
	* <p>Description: </p>   
	* @param rsConfig   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#delRsConfig(com.dhcc.pms.entity.platformManage.RsConfig)   
	*/
	@Override
	public void delRsConfig(RsConfig rsConfig) {
		// TODO Auto-generated method stub
		log.info("=====this is delRsConfig operation in RsConfigServiceImpl====");
		rsConfigDao.delete(rsConfig);
	}
	
	/* (非 Javadoc)   
	* <p>Title: findRsConfigById</p>   
	* <p>Description: </p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#findRsConfigById(java.lang.String)   
	*/
	@Override
	public RsConfig findRsConfigById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findRsConfigById operation in RsConfigServiceImpl====");
		RsConfig rsConfig = rsConfigDao.findById(id);
		
		return rsConfig;
	}
	
	/* (非 Javadoc)   
	* <p>Title: findRsConfig</p>   
	* <p>Description: </p>   
	* @param pagerModel   
	* @see com.dhcc.pms.service.platformManage.RsConfigService#findRsConfig(com.dhcc.framework.common.PagerModel)   
	*/
	@Override
	public void findRsConfig(PagerModel pagerModel) {
		// TODO Auto-generated method stub
		int totalRows = rsConfigDao.getResultCountWithValuesMap(
			pagerModel.getQueryHql(), pagerModel.getHqlParamMap(), "*", false).intValue();
		int pageNo = pagerModel.getPageNo();
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList<RsConfig>());
		}
		pagerModel.setTotals(totalRows);
		pagerModel.setPageData(rsConfigDao.findByHqlWithValuesMap(
			pagerModel.getQueryHql(), pageNo, pagerModel.getPageSize(),
			pagerModel.getHqlParamMap(), false));
	}
	
	
}

package com.dhcc.scm.service.platformManage.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.MaintainDao;
import com.dhcc.scm.dto.platformManage.MaintainDto;
import com.dhcc.scm.entity.platformManage.Maintain;
import com.dhcc.scm.service.platformManage.MaintainService;

/**
 * <p>标题: MaintainServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录模块Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Service("maintainService")
public class MaintainServiceImpl implements MaintainService {
 
	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
	private MaintainDao maintainDao;
	
	@Resource
	private CommonService commonService;
	
	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param maintain   
	* @see com.dhcc.pms.service.platformManage.MaintainService#saveOrUpdate(com.dhcc.pms.entity.platformManage.Maintain)   
	*/
	@Override
	public void saveOrUpdate(Maintain maintain) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in MaintainServiceImpl====");
		maintainDao.saveOrUpdate(maintain);
	}
	
	/* (非 Javadoc)   
	* <p>Title: saveMaintain</p>   
	* <p>Description: </p>   
	* @param maintain   
	* @see com.dhcc.pms.service.platformManage.MaintainService#saveMaintain(com.dhcc.pms.entity.platformManage.Maintain)   
	*/
	@Override
	public void saveMaintain(Maintain maintain) {
		// TODO Auto-generated method stub
		log.info("=====this is saveMaintain operation in MaintainServiceImpl====");
		maintainDao.save(maintain);
	}
	
	/* (非 Javadoc)   
	* <p>Title: updateMaintain</p>   
	* <p>Description: </p>   
	* @param maintain   
	* @see com.dhcc.pms.service.platformManage.MaintainService#updateMaintain(com.dhcc.pms.entity.platformManage.Maintain)   
	*/
	@Override
	public void updateMaintain(Maintain maintain) {
		// TODO Auto-generated method stub
		log.info("=====this is updateMaintain operation in MaintainServiceImpl====");
		maintainDao.update(maintain);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delMaintainById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.MaintainService#delMaintainById(java.lang.String)   
	*/
	@Override
	public void delMaintainById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delMaintainById operation in MaintainServiceImpl====");
		maintainDao.deleteById(MaintainDao.class, id);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delMaintain</p>   
	* <p>Description: </p>   
	* @param maintain   
	* @see com.dhcc.pms.service.platformManage.MaintainService#delMaintain(com.dhcc.pms.entity.platformManage.Maintain)   
	*/
	@Override
	public void delMaintain(Maintain maintain) {
		// TODO Auto-generated method stub
		log.info("=====this is delMaintain operation in MaintainServiceImpl====");
		maintainDao.delete(maintain);
	}
	
	/* (非 Javadoc)   
	* <p>Title: findMaintainById</p>   
	* <p>Description: </p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.MaintainService#findMaintainById(java.lang.String)   
	*/
	@Override
	public Maintain findMaintainById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findMaintainById operation in MaintainServiceImpl====");
		Maintain maintain = maintainDao.findById(id);
		
		return maintain;
	}
	
	/* (非 Javadoc)   
	* <p>Title: findMaintain</p>   
	* <p>Description: </p>   
	* @param pagerModel   
	* @see com.dhcc.pms.service.platformManage.MaintainService#findMaintain(com.dhcc.framework.common.PagerModel)   
	*/
	@Override
	public void findMaintain(MaintainDto maintainDto) {
		// TODO Auto-generated method stub
		log.info("=====this is findMaintain operation in MaintainServiceImpl====");
		PagerModel pagerModel = maintainDto.getPageModel();
		maintainDao.buildPagerModelQuery(pagerModel, maintainDto);
		commonService.fillPagerModelData(pagerModel);
	}
	
}

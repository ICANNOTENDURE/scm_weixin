package com.dhcc.scm.service.platformManage.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.scm.dao.platformManage.RsPriorityDao;
import com.dhcc.scm.dto.platformManage.RsPriorityDto;
import com.dhcc.scm.entity.platformManage.RsPriority;
import com.dhcc.scm.service.platformManage.RsPriorityService;

/**
 * <p>标题: RsPriorityServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器优先级信息Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月5日
 * @version V1.0 
 */
@Service("rsPriorityService")
public class RsPriorityServiceImpl implements RsPriorityService {
	
	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
	private RsPriorityDao rsPriorityDao;
	
	@Resource
	private CommonService commonService;

	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param rsPriority   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#saveOrUpdate(com.dhcc.pms.entity.platformManage.RsPriority)   
	*/
	@Override
	public void saveOrUpdate(RsPriority rsPriority) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in RsPriorityServiceImpl=====");
		rsPriorityDao.saveOrUpdate(rsPriority);
	}

	/* (非 Javadoc)   
	* <p>Title: saveRsPriority</p>   
	* <p>Description: </p>   
	* @param rsPriority   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#saveRsPriority(com.dhcc.pms.entity.platformManage.RsPriority)   
	*/
	@Override
	public void saveRsPriority(RsPriority rsPriority) {
		// TODO Auto-generated method stub
		log.info("=====this is saveRsPriority operation in RsPriorityServiceImpl====");
		rsPriorityDao.save(rsPriority);
	}

	/* (非 Javadoc)   
	* <p>Title: updateRsPriority</p>   
	* <p>Description: </p>   
	* @param rsPriority   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#updateRsPriority(com.dhcc.pms.entity.platformManage.RsPriority)   
	*/
	@Override
	public void updateRsPriority(RsPriority rsPriority) {
		// TODO Auto-generated method stub
		log.info("=====this is updateRsPriority operation in RsPriorityServiceImpl====");
		rsPriorityDao.update(rsPriority);
	}

	/* (非 Javadoc)   
	* <p>Title: delRsPriority</p>   
	* <p>Description: </p>   
	* @param rsPriority   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#delRsPriority(com.dhcc.pms.entity.platformManage.RsPriority)   
	*/
	@Override
	public void delRsPriority(RsPriority rsPriority) {
		// TODO Auto-generated method stub
		log.info("=====this is delRsPriority operation in RsPriorityServiceImpl====");
		rsPriorityDao.delete(rsPriority);
	}

	/* (非 Javadoc)   
	* <p>Title: findRsPriorityByID</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#findRsPriorityByID(java.lang.String)   
	*/
	@Override
	public RsPriority findRsPriorityById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findRsPriorityById operation in RsPriorityServiceImpl====");
		RsPriority rsPriority = rsPriorityDao.findById(id);
		
		return rsPriority;
	}

	/* (非 Javadoc)   
	* <p>Title: findRsPriority</p>   
	* <p>Description: </p>   
	* @param pagerModel   
	* @see com.dhcc.pms.service.platformManage.RsPriorityService#findRsPriority(com.dhcc.framework.common.PagerModel)   
	*/
	@Override
	public void findRsPriority(RsPriorityDto rsPriorityDto) {
		// TODO Auto-generated method stub
		log.info("=====this is findRsPriority operation in RsPriorityServiceImpl====");
		PagerModel pagerModel = rsPriorityDto.getPageModel();
		rsPriorityDao.buildPagerModelQuery(pagerModel, rsPriorityDto);
		commonService.fillPagerModelData(pagerModel);
	}
	
}


package com.dhcc.scm.service.platformManage.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.scm.dao.platformManage.OrgDao;
import com.dhcc.scm.dto.platformManage.OrgDto;
import com.dhcc.scm.entity.platformManage.Org;
import com.dhcc.scm.service.platformManage.OrgService;

/**
 * <p>标题: OrgServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台 机构管理模块接口实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月30日
 * @version V1.0 
 */
@Service("orgService")
public class OrgServiceImpl implements OrgService {
	
	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
	private OrgDao orgDao;
	
	@Resource
	private CommonService commonService;

	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param org   
	* @see com.dhcc.pms.service.platformManage.OrgService#saveOrUpdate(com.dhcc.pms.entity.platformManage.Org)   
	*/
	@Override
	public void saveOrUpdate(Org org) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in OrgServiceImpl====");
		orgDao.saveOrUpdate(org);
	}

	/* (非 Javadoc)   
	* <p>Title: saveOrg</p>   
	* <p>Description: </p>   
	* @param org   
	* @see com.dhcc.pms.service.platformManage.OrgService#saveOrg(com.dhcc.pms.entity.platformManage.Org)   
	*/
	@Override
	public void saveOrg(Org org) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrg operation in OrgServiceImpl====");
		orgDao.save(org);
	}

	/* (非 Javadoc)   
	* <p>Title: updateOrg</p>   
	* <p>Description: </p>   
	* @param org   
	* @see com.dhcc.pms.service.platformManage.OrgService#updateOrg(com.dhcc.pms.entity.platformManage.Org)   
	*/
	@Override
	public void updateOrg(Org org) {
		// TODO Auto-generated method stub
		log.info("=====this is updateOrg operation in OrgServiceImpl====");
		orgDao.update(org);
	}

	/* (非 Javadoc)   
	* <p>Title: delOrgById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.OrgService#delOrgById(java.lang.String)   
	*/
	@Override
	public void delOrgById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delOrgById operation in OrgServiceImpl====");
		orgDao.deleteById(OrgDao.class, id);
	}

	/* (非 Javadoc)   
	* <p>Title: delOrg</p>   
	* <p>Description: </p>   
	* @param org   
	* @see com.dhcc.pms.service.platformManage.OrgService#delOrg(com.dhcc.pms.entity.platformManage.Org)   
	*/
	@Override
	public void delOrg(Org org) {
		// TODO Auto-generated method stub
		log.info("=====this is delOrg operation in OrgServiceImpl====");
		orgDao.delete(org);
	}

	/* (非 Javadoc)   
	* <p>Title: findOrgById</p>   
	* <p>Description: </p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.OrgService#findOrgById(java.lang.String)   
	*/
	@Override
	public Org findOrgById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findOrgById operation in OrgServiceImpl====");
		Org org = orgDao.findById(id);
		
		return org;
	}

	/* (非 Javadoc)   
	* <p>Title: findOrg</p>   
	* <p>Description: </p>   
	* @param pagerModel
	* @param dto   
	* @see com.dhcc.pms.service.platformManage.OrgService#findOrg(com.dhcc.framework.common.PagerModel, com.dhcc.pms.dto.platformManage.OrgDto)   
	*/
//	@Override
//	public void findOrg(OrgDto orgDto) {
//		PagerModel pagerModel = orgDto.getPageModel();
//		orgDao.buildPagerModelQuery(pagerModel, orgDto);
//		commonService.fillPagerModelData(pagerModel);
//		log.info("\n-------------------Num-------------------\n"+pagerModel.getPageData().size());
//	}

	@Override
	public void findOrg(OrgDto orgDto) {
		// TODO Auto-generated method stub
		log.info("=====this is findOrg operation in OrgServiceImpl====");
		//PagerModel pagerModel = orgDto.getPageModel();
		orgDao.buildOrgSqlQery(orgDto);
		//commonService.fillPagerModelData(pagerModel);
		//commonService.fillSqlPagerModelData(pagerModel, OrgVo.class);
	}
	
}

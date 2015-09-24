package com.dhcc.scm.service.platformManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.scm.dao.platformManage.SystemVersionDao;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.service.platformManage.SystemVersionService;

/**
 * <p>标题: SystemVersionServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本管理模块Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Service("systemVersionService")
public class SystemVersionServiceImpl implements SystemVersionService {

	private static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
	private SystemVersionDao systemVersionDao;
	
	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param systemVersion   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#saveOrUpdate(com.dhcc.pms.entity.platformManage.SystemVersion)   
	*/
	@Override
	public void saveOrUpdate(SystemVersion systemVersion) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in SystemVersionServiceImpl====");
		systemVersionDao.saveOrUpdate(systemVersion);
	}
	
	/* (非 Javadoc)   
	* <p>Title: saveSystemVersion</p>   
	* <p>Description: </p>   
	* @param systemVersion   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#saveSystemVersion(com.dhcc.pms.entity.platformManage.SystemVersion)   
	*/
	@Override
	public void saveSystemVersion(SystemVersion systemVersion) {
		// TODO Auto-generated method stub
		log.info("=====this is saveSystemVersion operation in SystemVersionServiceImpl====");
		systemVersionDao.save(systemVersion);
	}
	
	/* (非 Javadoc)   
	* <p>Title: updateSystemVersion</p>   
	* <p>Description: </p>   
	* @param systemVersion   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#updateSystemVersion(com.dhcc.pms.entity.platformManage.SystemVersion)   
	*/
	@Override
	public void updateSystemVersion(SystemVersion systemVersion) {
		// TODO Auto-generated method stub
		log.info("=====this is saveSystemVersion operation in SystemVersionServiceImpl====");
		systemVersionDao.update(systemVersion);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delSystemVersionById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#delSystemVersionById(java.lang.String)   
	*/
	@Override
	public void delSystemVersionById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delSystemVersionById operation in SystemVersionServiceImpl====");
		systemVersionDao.deleteById(SystemVersionDao.class, id);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delSystemVersion</p>   
	* <p>Description: </p>   
	* @param systemVersion   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#delSystemVersion(com.dhcc.pms.entity.platformManage.SystemVersion)   
	*/
	@Override
	public void delSystemVersion(SystemVersion systemVersion) {
		// TODO Auto-generated method stub
		log.info("=====this is delSystemVersion operation in SystemVersionServiceImpl====");
		systemVersionDao.delete(systemVersion);
	}
	
	/* (非 Javadoc)   
	* <p>Title: findSystemVersionById</p>   
	* <p>Description: </p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#findSystemVersionById(java.lang.String)   
	*/
	@Override
	public SystemVersion findSystemVersionById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is findSystemVersionById operation in SystemVersionServiceImpl====");
		SystemVersion systemVersion = systemVersionDao.findById(id);
		
		return systemVersion;
	}

	/* (非 Javadoc)   
	* <p>Title: systemVersionList</p>   
	* <p>Description: </p>   
	* @param systemVersionDto   
	* @see com.dhcc.pms.service.platformManage.SystemVersionService#systemVersionList(com.dhcc.pms.dto.platformManage.SystemVersionDto)   
	*/
	@Override
	public void getSystemVersion(SystemVersionDto systemVersionDto) {
		// TODO Auto-generated method stub
		log.info("=====this is getSystemVersionCatalog operation in SystemVersionServiceImpl====");
		// 获取非根节点
		List<SystemVersion> versions = systemVersionDao.findSystemVersion(systemVersionDto);
		systemVersionDto.setSystemVersions(versions);
		
//        Map<String, SystemVersion> map = new HashMap<String, SystemVersion>();
//		
//		// 获取根节点
//		List<SystemVersion> roots = new ArrayList<SystemVersion>();
//		
//		// 获取非根节点
//		//List<SystemVersion> versions = systemVersionDto.getSystemVersions();
//		List<SystemVersion> versions = systemVersionDao.findSystemVersion(systemVersionDto);
//		for (int i=0; i<versions.size(); i++) {
//			if (versions.get(i).getParentId() == null) {
//				roots.add(versions.get(i));
//			}
//			map.put(versions.get(i).getVersionId(), versions.get(i));
//		}
//		
//		Iterator<String> keys = map.keySet().iterator();
//		while (keys.hasNext()) {
//			String key = keys.next();
//			SystemVersion systemVersion = map.get(key);
//			if (systemVersion.getParentId() != null) {
//				SystemVersion parentSystem = map.get(systemVersion.getParentId());
//				parentSystem.getChildren().add(systemVersion);
//			}
//		}
//		
//		systemVersionDto.setSystemVersions(roots);
	}
		
}

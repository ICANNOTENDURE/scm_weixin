package com.dhcc.scm.service.platformManage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.app.service.CommonServiceImpl;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.scm.dao.platformManage.ServerDao;
import com.dhcc.scm.dao.platformManage.SystemVersionDao;
import com.dhcc.scm.dto.platformManage.ServerDto;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.entity.vo.platformManage.ServerRegisterVo;
import com.dhcc.scm.service.platformManage.ServerService;

/**
 * <p>标题: ServerServiceImpl.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器管理模块Service实现类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Service("serverService")
public class ServerServiceImpl implements ServerService {

	private  static Log log = LogFactory.getLog(CommonServiceImpl.class);
	
	@Resource
    private ServerDao serverDao;
	
	@Resource
	private SystemVersionDao systemVersionDao;
	
	@Resource
	private CommonService commonService;
	
	/* (非 Javadoc)   
	* <p>Title: saveOrUpdate</p>   
	* <p>Description: </p>   
	* @param server   
	* @see com.dhcc.pms.service.platformManage.ServerService#saveOrUpdate(com.dhcc.pms.entity.platformManage.Server)   
	*/
	@Override
	public void saveOrUpdate(Server server) {
		// TODO Auto-generated method stub
		log.info("=====this is saveOrUpdate operation in ServerServiceImpl====");
		serverDao.saveOrUpdate(server);
	}
	
	/* (非 Javadoc)   
	* <p>Title: saveServer</p>   
	* <p>Description: </p>   
	* @param server   
	* @see com.dhcc.pms.service.platformManage.ServerService#saveServer(com.dhcc.pms.entity.platformManage.Server)   
	*/
	@Override
	public void saveServer(Server server) {
		// TODO Auto-generated method stub
		log.info("=====this is saveServer operation in ServerServiceImpl====");
		serverDao.save(server);
	}
	
	/* (非 Javadoc)   
	* <p>Title: updateServer</p>   
	* <p>Description: </p>   
	* @param server   
	* @see com.dhcc.pms.service.platformManage.ServerService#updateServer(com.dhcc.pms.entity.platformManage.Server)   
	*/
	@Override
	public void updateServer(Server server) {
		// TODO Auto-generated method stub
		log.info("=====this is updateServer operation in ServerServiceImpl====");
		serverDao.update(server);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delServerById</p>   
	* <p>Description: </p>   
	* @param id   
	* @see com.dhcc.pms.service.platformManage.ServerService#delServerById(java.lang.String)   
	*/
	@Override
	public void delServerById(String id) {
		// TODO Auto-generated method stub
		log.info("=====this is delServerById operation in ServerServiceImpl====");
		serverDao.deleteById(ServerDao.class, id);
	}
	
	/* (非 Javadoc)   
	* <p>Title: delServer</p>   
	* <p>Description: </p>   
	* @param server   
	* @see com.dhcc.pms.service.platformManage.ServerService#delServer(com.dhcc.pms.entity.platformManage.Server)   
	*/
	@Override
	public void delServer(Server server) {
		// TODO Auto-generated method stub
		log.info("=====this is delServer operation in ServerServiceImpl====");
		serverDao.delete(server);
	}
	
	/* (非 Javadoc)   
	* <p>Title: findServerById</p>   
	* <p>Description: 不同类型服务器信息图形模式悬停显示多表连接查询</p>   
	* @param id
	* @return   
	* @see com.dhcc.pms.service.platformManage.ServerService#findServerById(java.lang.String)   
	*/
	@Override
	public void findServerGraph(ServerDto serverDto) {
		// TODO Auto-generated method stub
		log.info("=====this is findServerInfo operation in ServerServiceImpl====");
		serverDao.findServersInfo(serverDto);
	}

	/* (非 Javadoc)   
	* <p>Title: findServer</p>   
	* <p>Description: 服务器信息列表模式分页查询</p>   
	* @param server   
	* @see com.dhcc.pms.service.platformManage.ServerService#findServer(com.dhcc.pms.entity.platformManage.Server)   
	*/
	@Override
	public void findServerList(ServerDto serverDto) {
		// TODO Auto-generated method stub
		log.info("=====this is findServer operation in ServerServiceImpl====");
		
//		serverDao.findServersInfo(serverDto);
//		PagerModel pagerModel = serverDto.getPageModel();
//		pagerModel.setPageData(serverDto.getServerVos());
		
		PagerModel pagerModel = serverDto.getPageModel();
		serverDao.buildPagerModelQuery(pagerModel, serverDto);
		commonService.fillPagerModelData(pagerModel);
	}
	
	/* (非 Javadoc)   
	* <p>Title: getSystemVersion</p>   
	* <p>Description: </p>   
	* @param systemVersionDto
	* @return   
	* @see com.dhcc.pms.service.platformManage.ServerService#getSystemVersion(com.dhcc.pms.dto.platformManage.SystemVersionDto)   
	*/
	@Override
	public List<SystemVersion> getSystemVersion(SystemVersionDto systemVersionDto) {
		List<SystemVersion> versions = systemVersionDao.findSystemVersion(systemVersionDto);
		
		return versions;
	}

	/* (非 Javadoc)   
	* <p>Title: findServerId</p>   
	* <p>Description: </p>   
	* @param serverDto   
	* @see com.dhcc.pms.service.platformManage.ServerService#findServerId(com.dhcc.pms.dto.platformManage.ServerDto)   
	*/
	@Override
	public void findServerId(ServerDto serverDto) {
		// TODO Auto-generated method stub
		try {
			log.info("=====this is findServerId operation in ServerServiceImpl====");
			Server server = serverDto.getServer();
			ServerRegisterVo serverRegisterVo = serverDto.getServerRegisterVo();
			if (null != server) {
				//serverDao.save(server);
//				SessionFactory sf = serverDao.getSessionFactory();
//				Session session = sf.openSession();
//				
//				Transaction tx = session.beginTransaction();
//				session.save(server);
//				tx.commit();
//				session.close();
				String serverId = server.getServerId();
				serverRegisterVo.setServerId(serverId);
			}
			log.info("\n+++++++++++++serverId:---------------"+serverRegisterVo.getServerId());
		} catch (Exception e) {
			// TODO: handle exception
			throw new DataBaseException(e.getMessage(), e);
		}
	}
		
}

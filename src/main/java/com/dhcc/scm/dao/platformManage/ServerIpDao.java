package com.dhcc.scm.dao.platformManage;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.ServerIp;

/**
 * <p>标题: ServerIpDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器IP信息持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年11月25日
 * @version V1.0 
 */
@Repository
public class ServerIpDao extends HibernatePersistentObjectDAO<ServerIp> {

	/* (非 Javadoc)   
	* <p>Title: buildPagerModelQuery</p>   
	* <p>Description: </p>   
	* @param arg0
	* @param arg1   
	* @see com.dhcc.framework.hibernate.dao.PersistentObjectDAO#buildPagerModelQuery(com.dhcc.framework.common.PagerModel, com.dhcc.framework.transmission.dto.BaseDto)   
	*/
	@Override
	public void buildPagerModelQuery(PagerModel arg0, BaseDto arg1) {
		// TODO Auto-generated method stub
		
	}

	
}

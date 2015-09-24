package com.dhcc.scm.dao.platformManage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.MaintainDto;
import com.dhcc.scm.entity.platformManage.Maintain;

/**
 * <p>标题: MaintainDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  运维记录信息持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@Repository
public class MaintainDao extends HibernatePersistentObjectDAO<Maintain> {

	/* (非 Javadoc)   
	* <p>Title: buildPagerModelQuery</p>   
	* <p>Description: </p>   
	* @param pagerModel
	* @param dto   
	* @see com.dhcc.framework.hibernate.dao.PersistentObjectDAO#buildPagerModelQuery(com.dhcc.framework.common.PagerModel, com.dhcc.framework.transmission.dto.BaseDto)   
	*/
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		// TODO Auto-generated method stub
		MaintainDto maintainDto = (MaintainDto)dto;
		Maintain maintain = maintainDto.getMaintain();
		pagerModel.setCountProName("maintainId");
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		buildQuery(hqlParamMap, maintain, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	* 方法名:          buildQuery
	* 方法功能描述:    通过maintainId分页查找运维记录信息
	* @param:         map,org,hqlStr
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月9日 下午3:38:40
	*/
	private void buildQuery(Map<String, Object>map, Maintain maintain, StringBuilder hqlStr) {
		 
		hqlStr.append("from Maintain");
		if (maintain != null) {
			hqlStr.append(" where 1=1 ");
			String maintainId = maintain.getMaintainId();
			if (!"".equals(maintainId)) {
				hqlStr.append(" and maintainId=:maintainId");
				map.put("maintainId", maintainId);
			}
		}
	}
}

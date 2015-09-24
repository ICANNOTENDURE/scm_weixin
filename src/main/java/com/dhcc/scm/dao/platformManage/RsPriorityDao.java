package com.dhcc.scm.dao.platformManage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.RsPriorityDto;
import com.dhcc.scm.entity.platformManage.RsPriority;

/**
 * <p>标题: RsPriorityDao.java</p>
 * <p>业务描述:统一运维及安全管理平台 接收服务器优先级信息持久化操作类 </p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
@Repository
public class RsPriorityDao extends HibernatePersistentObjectDAO<RsPriority>{

	/* (非 Javadoc)   
	* <p>Title: buildPagerModelQuery</p>   
	* <p>Description: </p>   
	* @param PagerModel
	* @param BaseDto   
	* @see com.dhcc.framework.hibernate.dao.PersistentObjectDAO#buildPagerModelQuery(com.dhcc.framework.common.PagerModel, com.dhcc.framework.transmission.dto.BaseDto)   
	*/
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		// TODO Auto-generated method stub
		RsPriorityDto rsPriorityDto = (RsPriorityDto)dto;
		pagerModel.setCountProName("rsPiorityId");
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> map = new HashMap<>();
		
		buildQuery(map, rsPriorityDto, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(map);
	}

	/** 
	* 方法名:          buildQuery
	* 方法功能描述:    接收服务器配置信息多表连接查询hql语句
	* @param:         map,rsPriorityDto,hqlStr
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年10月31日 上午9:30:05
	*/
	private void buildQuery(Map<String, Object> map, RsPriorityDto rsPriorityDto, StringBuilder hqlStr) {
		RsPriority rsPriority = rsPriorityDto.getRsPriority();
		
		hqlStr.append("from RsPriority ");
		if (rsPriority != null) {
			hqlStr.append("where 1=1 ");
			String rsPriorityId = rsPriority.getPriorityId();
			if (!"".equals(rsPriorityId)) {
				hqlStr.append("and rsPriorityId=:rsPriorityId ");
				map.put("rsPriorityId", rsPriorityId);
			}
		}
	}
}

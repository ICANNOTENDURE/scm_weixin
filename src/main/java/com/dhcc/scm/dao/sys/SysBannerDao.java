/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.sys;

import java.util.Map;
import java.util.HashMap;

import org.springframework.stereotype.Repository;
import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.entity.sys.SysBanner;
import com.dhcc.scm.dto.sys.SysBannerDto;

@Repository
public class SysBannerDao extends HibernatePersistentObjectDAO<SysBanner> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysBannerDto sysBannerDto = (SysBannerDto) dto;
		SysBanner sysBanner = sysBannerDto.getSysBanner();

		pagerModel.setCountProName(super.getIdName(SysBanner.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, sysBanner, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,SysBanner sysBanner,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from SysBanner where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		

}

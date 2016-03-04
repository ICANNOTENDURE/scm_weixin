/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.ven.VenQualifTypeDto;
import com.dhcc.scm.entity.ven.VenQualifType;

@Repository
public class VenQualifTypeDao extends HibernatePersistentObjectDAO<VenQualifType> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		VenQualifTypeDto venQualifTypeDto = (VenQualifTypeDto) dto;
		VenQualifType venQualifType = venQualifTypeDto.getVenQualifType();

		pagerModel.setCountProName(super.getIdName(VenQualifType.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, venQualifType, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,VenQualifType venQualifType,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from VenQualifType where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(VenQualifType venQualifType){
	
		super.save(venQualifType);
	}
	
	public void delete(VenQualifType venQualifType){
		
		super.delete(venQualifType);
	}
	
	public void update(VenQualifType venQualifType){
	
		super.update(venQualifType);
	}
	
	public VenQualifType findById(VenQualifType venQualifType){

		return super.findById(venQualifType.getVenQualifTypeId());

	} 
}

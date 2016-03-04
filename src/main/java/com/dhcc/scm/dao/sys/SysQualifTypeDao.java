/**
 *  
 *hxy
 */
package com.dhcc.scm.dao.sys;

import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.scm.dto.sys.SysQualifTypeDto;

@Repository
public class SysQualifTypeDao extends HibernatePersistentObjectDAO<SysQualifType> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysQualifTypeDto sysQualifTypeDto = (SysQualifTypeDto) dto;
		SysQualifType sysQualifType = sysQualifTypeDto.getSysQualifType();

		pagerModel.setCountProName(super.getIdName(SysQualifType.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, sysQualifType, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,SysQualifType sysQualifType,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from SysQualifType where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(SysQualifType sysQualifType){
	
		super.save(sysQualifType);
	}
	
	public void delete(SysQualifType sysQualifType){
		
		super.delete(sysQualifType);
	}
	
	public void update(SysQualifType sysQualifType){
	
		super.update(sysQualifType);
	}
	
	public SysQualifType findById(SysQualifType sysQualifType){

		return super.findById(sysQualifType.getQualifTypeId());

	} 
}

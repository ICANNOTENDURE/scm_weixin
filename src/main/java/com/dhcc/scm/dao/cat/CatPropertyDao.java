/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.cat;

import java.util.Map;
import java.util.HashMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.dto.cat.CatPropertyDto;
import com.dhcc.scm.entity.cat.CatProperty;

@Repository
public class CatPropertyDao extends HibernatePersistentObjectDAO<CatProperty> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		CatPropertyDto catPropertyDto = (CatPropertyDto) dto;
		CatProperty catProperty = catPropertyDto.getCatProperty();

		pagerModel.setCountProName(super.getIdName(CatProperty.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, catProperty, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private void buildQuery(@SuppressWarnings("rawtypes") Map hqlParamMap,CatProperty catProperty,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from CatProperty where 1=1 ");
		
		//接下来拼接其他查询条件 如下示例代码所示
		if(StringUtils.isNotBlank(catProperty.getProName())){
			hqlStr.append("and proName like :name ");
			hqlParamMap.put("name","%"+catProperty.getProName()+"%");
		}
	}
		
	public void save(CatProperty catProperty){
	
		super.save(catProperty);
	}
	
	public void delete(CatProperty catProperty){
		
		super.delete(catProperty);
	}
	
	public void update(CatProperty catProperty){
	
		super.update(catProperty);
	}
	

}

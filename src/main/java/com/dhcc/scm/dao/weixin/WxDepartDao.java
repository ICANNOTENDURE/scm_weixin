/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.weixin;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.weixin.WxDepartDto;
import com.dhcc.scm.entity.weixin.WxDepart;

@Repository
public class WxDepartDao extends HibernatePersistentObjectDAO<WxDepart> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		WxDepartDto wxDepartDto = (WxDepartDto) dto;
		WxDepart wxDepart = wxDepartDto.getWxDepart();

		pagerModel.setCountProName(super.getIdName(WxDepart.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, wxDepart, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private void buildQuery(Map hqlParamMap,WxDepart wxDepart,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from WxDepart where 1=1 ");
		if(wxDepart!=null){
			if(StringUtils.isNotBlank(wxDepart.getWxDepartName())){
				hqlStr.append("and wxDepartName like :depart ");
				hqlParamMap.put("depart", "%"+wxDepart.getWxDepartName()+"%");
			}
		}
	}
	
	public void save(WxDepart wxDepart){
	
		super.save(wxDepart);
	}
	
	public void delete(WxDepart wxDepart){
		
		super.delete(wxDepart);
	}
	
	public void update(WxDepart wxDepart){
	
		super.update(wxDepart);
	}
	
	public WxDepart findById(WxDepart wxDepart){

		return super.findById(wxDepart.getWxDepartId());

	} 
}

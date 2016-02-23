/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.weixin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.weixin.MpUser;

@Repository
public class MpUserDao extends HibernatePersistentObjectDAO<MpUser> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		MpUserDto mpUserDto = (MpUserDto) dto;
		MpUser mpUser = mpUserDto.getMpUser();

		pagerModel.setCountProName(super.getIdName(MpUser.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, mpUser, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,MpUser mpUser,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from MpUser where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(MpUser mpUser){
	
		super.save(mpUser);
	}
	
	public void delete(MpUser mpUser){
		
		super.delete(mpUser);
	}
	
	public void update(MpUser mpUser){
	
		super.update(mpUser);
	}
	
	public MpUser findById(MpUser mpUser){

		return super.findById(mpUser.getWxMpUserId());

	} 
}

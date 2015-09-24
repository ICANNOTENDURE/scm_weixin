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
import com.dhcc.scm.dto.weixin.WxUserDto;
import com.dhcc.scm.entity.weixin.WxUser;

@Repository
public class WxUserDao extends HibernatePersistentObjectDAO<WxUser> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		WxUserDto wxUserDto = (WxUserDto) dto;
		WxUser wxUser = wxUserDto.getWxUser();

		pagerModel.setCountProName(super.getIdName(WxUser.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, wxUser, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private void buildQuery(Map hqlParamMap,WxUser wxUser,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from WxUser where 1=1 ");
		if(wxUser!=null){
			if(StringUtils.isNotBlank(wxUser.getWxUserName())){
				hqlStr.append("and wxUserName like :name ");
				hqlParamMap.put("name", "%"+wxUser.getWxUserName()+"%");
			}
			if(wxUser.getWxUserDepartId()!=null){
				hqlStr.append("and wxUserDepartId =:departId ");
				hqlParamMap.put("departId",wxUser.getWxUserDepartId());
			}
		}
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(WxUser wxUser){
	
		super.save(wxUser);
	}
	
	public void delete(WxUser wxUser){
		
		super.delete(wxUser);
	}
	
	public void update(WxUser wxUser){
	
		super.update(wxUser);
	}
	
	public WxUser findById(WxUser wxUser){

		return super.findById(wxUser.getWxUserId());

	} 
}

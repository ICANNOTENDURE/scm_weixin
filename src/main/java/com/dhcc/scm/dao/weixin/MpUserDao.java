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
import com.dhcc.scm.dto.weixin.MpUserDto;
import com.dhcc.scm.entity.weixin.MpUser;

@Repository
public class MpUserDao extends HibernatePersistentObjectDAO<MpUser> {

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		MpUserDto mpUserDto = (MpUserDto) dto;

		pagerModel.setCountProName(super.getIdName(MpUser.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, mpUserDto, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap, MpUserDto dto, StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from MpUser where 1=1 ");
		if (dto.getStartDate() != null) {
			hqlStr.append("and wxMpSubscribeSciTime>=:start ");
			hqlParamMap.put("start", dto.getStartDate());
		}
		if (dto.getEndDate() != null) {
			hqlStr.append("and wxMpSubscribeSciTime<=:end ");
			hqlParamMap.put("end", dto.getEndDate());
		}
		if (dto.getMpUser() != null) {
			if(StringUtils.isNotBlank(dto.getMpUser().getWxMpNickname())){
				hqlStr.append("and wxMpNickname like :name ");
				hqlParamMap.put("name", "%"+dto.getMpUser().getWxMpNickname()+"%");
			}
		}
	}

	public void save(MpUser mpUser) {

		super.save(mpUser);
	}

	public void delete(MpUser mpUser) {

		super.delete(mpUser);
	}

	public void update(MpUser mpUser) {

		super.update(mpUser);
	}

	public MpUser findById(MpUser mpUser) {

		return super.findById(mpUser.getWxMpUserId());

	}
}

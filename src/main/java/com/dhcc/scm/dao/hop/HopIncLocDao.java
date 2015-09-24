/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopIncLocDto;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopIncLoc;

@Repository
public class HopIncLocDao extends HibernatePersistentObjectDAO<HopIncLoc> {

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings({ "unchecked"})
	public void list(HopIncLocDto dto) {
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		PagerModel pagerModel = dto.getPageModel();
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		// 拼接查询条件
		hqlStr.append(" from HopIncLoc where 1=1 ");
		hqlStr.append(" and  incLocLocId="+WebContextHolder.getContext().getUserInfo().getLocId());
		if(StringUtils.isNotBlank(dto.getMinFlag())){
			if(dto.getMinFlag().equals("on")){
				hqlStr.append(" and  incLocQty<=incLocMinQty ");
			}
		}
		if(StringUtils.isNotBlank(dto.getStandFlag())){
			if(dto.getStandFlag().equals("on")){
				hqlStr.append(" and  incLocQty<=incLocStandQty ");
			}
		}
		dto.getPageModel().setTotals(super.getResultCountWithValuesMap(hqlStr.toString(), hqlParamMap, super.getIdName(HopIncLoc.class), false).intValue());
		List<HopIncLoc> hopIncLocs=super.findByHqlWithValuesMap(
				hqlStr.toString(), pagerModel.getPageNo(),
				pagerModel.getPageSize(), hqlParamMap, false);
		for(HopIncLoc hopIncLoc:hopIncLocs){
			HopInc hopInc=super.get(HopInc.class, hopIncLoc.getIncLocParrefId());
			hopIncLoc.setIncname(hopInc.getIncName());
			hopIncLoc.setUom(hopInc.getIncUomname());
		}
		dto.setHopIncLocs(hopIncLocs);
		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}
	}

	public void save(HopIncLoc hopIncLoc) {

		super.save(hopIncLoc);
	}

	public void delete(HopIncLoc hopIncLoc) {

		super.delete(hopIncLoc);
	}

	public void update(HopIncLoc hopIncLoc) {

		super.update(hopIncLoc);
	}

}

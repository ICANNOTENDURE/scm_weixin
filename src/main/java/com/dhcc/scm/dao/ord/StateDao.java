/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ord;

import java.util.Map;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import  com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.scm.dto.ord.StateDto;
import com.dhcc.scm.entity.ord.State;

@Repository
public class StateDao extends HibernatePersistentObjectDAO<State> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		StateDto stateDto = (StateDto) dto;
		State state = stateDto.getState();

		pagerModel.setCountProName(super.getIdName(State.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, state, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,State state,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from State where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(State state){
	
		super.save(state);
	}
	
	public void delete(State state){
		
		super.delete(state);
	}
	
	public void update(State state){
	
		super.update(state);
	}
	
	public State findById(State state){

		return super.findById(state.getStateId());

	} 
}

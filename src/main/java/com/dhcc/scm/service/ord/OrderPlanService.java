/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import com.dhcc.scm.dto.ord.OrderPlanDto;
import com.dhcc.scm.entity.ord.OrderPlan;

public interface OrderPlanService {

	public void list(OrderPlanDto dto);
	
	public void save(OrderPlanDto dto);
	
	public void delete(OrderPlanDto dto);
	
	public void update(OrderPlanDto dto);
	
	public OrderPlan findById(OrderPlanDto dto);
	

}

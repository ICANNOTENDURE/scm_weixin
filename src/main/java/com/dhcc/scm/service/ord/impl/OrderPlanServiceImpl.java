/**
 * 通过模板生成Dto 
 * template by zxx
 */
package com.dhcc.scm.service.ord.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.scm.dao.ord.OrderPlanDao;
import com.dhcc.scm.dto.ord.OrderPlanDto;
import com.dhcc.scm.entity.ord.OrderPlan;
import com.dhcc.scm.service.ord.OrderPlanService;

@Service("orderPlanService")
public class OrderPlanServiceImpl implements OrderPlanService {

	@Resource
	private OrderPlanDao orderPlanDao;
	@Resource
	private CommonService commonService;

	public void list(OrderPlanDto dto){
		orderPlanDao.list(dto);
	}
	
	public void save(OrderPlanDto dto){
	
		orderPlanDao.save(dto.getOrderPlan());
	}
	
	public void delete(OrderPlanDto dto){
	
		orderPlanDao.delete(dto.getOrderPlan());
	}
	
	public void update(OrderPlanDto dto){
	
		orderPlanDao.update(dto.getOrderPlan());
	}
	
	public OrderPlan findById(OrderPlanDto dto){
	
		dto.setOrderPlan(orderPlanDao.findById(dto.getOrderPlan()));
		return dto.getOrderPlan();
	}

}

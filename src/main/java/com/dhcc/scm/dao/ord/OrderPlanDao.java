/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ord;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ord.OrderPlanDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.ord.OrderPlan;
import com.dhcc.scm.entity.vo.ord.PlanGrpByNo;
import com.dhcc.scm.entity.vo.ord.PlanItmVO;

@Repository
public class OrderPlanDao extends HibernatePersistentObjectDAO<OrderPlan> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void list(OrderPlanDto dto){
		
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		hqlBuffer.append("select ");
		hqlBuffer.append("PLAN_NO as planno ");
		hqlBuffer.append("from T_ORD_PLAN  ");
		hqlBuffer.append("where 1=1 ");


		if (dto.getStarDate() != null) {
			hqlBuffer.append(" and PLAN_DATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStarDate());
		}
		if (dto.getEndDate() != null) {
			hqlBuffer.append(" and PLAN_DATE-1<=:enddate");
			hqlParamMap.put("enddate", dto.getEndDate());
		}

		if(StringUtils.isNotBlank(dto.getPlanNo())){
			hqlBuffer.append(" and PLAN_NO=:planno");
			hqlParamMap.put("planno", dto.getPlanNo());
		}
		hqlBuffer.append(" and PLAN_USERID=:userid");
		hqlParamMap.put("userid", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		hqlBuffer.append(" group by PLAN_NO order by PLAN_NO desc ");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		
		dto.getPageModel().setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), PlanGrpByNo.class, hqlParamMap).size());
		List<PlanGrpByNo> planGrpByNos=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), PlanGrpByNo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "PLAN_NO");
		
		
		for(PlanGrpByNo planGrpByNo:planGrpByNos){
			dto.setPlanItmVOs(new ArrayList<PlanItmVO>());
			this.listPlanItm(dto,planGrpByNo.getPlanno());
			planGrpByNo.setPlanItmVOs(dto.getPlanItmVOs());
			if(planGrpByNo.getPlanItmVOs().size()>0){
				planGrpByNo.setPlandate(planGrpByNo.getPlanItmVOs().get(0).getPlandate());
				planGrpByNo.setPlanctloc(super.get(HopCtloc.class, planGrpByNo.getPlanItmVOs().get(0).getCtloc()).getName());
			}
		}
		dto.setPlanGrpByNos(planGrpByNos);
		int page = dto.getPageModel().getTotals() % dto.getPageModel().getPageSize();
		if (page == 0) {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize());
		} else {
			dto.setPageCount(dto.getPageModel().getTotals() / dto.getPageModel().getPageSize() + 1);
		}	
	
	}
	
	
	@SuppressWarnings("unchecked")
	public void listPlanItm(OrderPlanDto dto,String planNo){
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		if (dto.getItmPagerModel() == null) {
			dto.setItmPagerModel(new PagerModel());
		}
		PagerModel pagerModel=dto.getItmPagerModel();
		hqlBuffer.append("select ");
		hqlBuffer.append("t5.INC_NAME as incname, ");
		hqlBuffer.append("t5.INC_ID as hopincid, ");
		hqlBuffer.append("t1.PLAN_ID as planid, ");
		hqlBuffer.append("t1.PLAN_QTY as planqty, ");
		hqlBuffer.append("t3.NAME as venname, ");
		hqlBuffer.append("t4.NAME as manfname, ");
		hqlBuffer.append("t1.PLAN_VENINCID as venincid, ");
		hqlBuffer.append("t1.PLAN_DATE as plandate, ");
		hqlBuffer.append("t1.PLAN_CTLOC as ctloc, ");
		hqlBuffer.append("t2.VEN_INC_PRICE as price ");
		hqlBuffer.append("from T_ORD_PLAN t1 ");
		hqlBuffer.append("left join T_HOP_INC t5 on t5.INC_ID=t1.PLAN_INCID ");
		hqlBuffer.append("left join T_VEN_INC t2 on t2.VEN_INC_ROWID=t1.PLAN_VENINCID ");
		hqlBuffer.append("left join T_VEN_VENDOR t3 on t3.VEN_ID=t1.PLAN_VENDORID ");
		hqlBuffer.append("left join T_HOP_MANF t4 on t4.ID=t2.VEN_INC_MANFID ");
		hqlBuffer.append("where 1=1 ");

		if(StringUtils.isNotBlank(planNo)){
			hqlBuffer.append(" and PLAN_NO=:planno");
			hqlParamMap.put("planno", planNo);
		}
		hqlBuffer.append(" and PLAN_USERID=:userid");
		hqlParamMap.put("userid", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));

		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		
		pagerModel.setTotals(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), PlanItmVO.class, hqlParamMap).size());
		List<PlanItmVO> planItmVOs=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), PlanItmVO.class, hqlParamMap, pagerModel.getPageNo(), pagerModel.getPageSize(), "PLAN_NO");

		
		dto.setPlanItmVOs(planItmVOs);
		int page = pagerModel.getTotals() % pagerModel.getPageSize();
		if (page == 0) {
			dto.setItmPageCount(pagerModel.getTotals() / pagerModel.getPageSize());
		} else {
			dto.setItmPageCount(pagerModel.getTotals() / pagerModel.getPageSize() + 1);
		}	
	
	}
	public void save(OrderPlan orderPlan){
	
		super.save(orderPlan);
	}
	
	public void delete(OrderPlan orderPlan){
		
		super.delete(orderPlan);
	}
	
	public void update(OrderPlan orderPlan){
	
		super.update(orderPlan);
	}

}

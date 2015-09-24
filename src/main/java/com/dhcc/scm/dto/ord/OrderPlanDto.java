/**
 * Dto 
 * template by zxx
 */
package com.dhcc.scm.dto.ord;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.OrderPlan;
import com.dhcc.scm.entity.vo.cat.IncPropertyVO;
import com.dhcc.scm.entity.vo.nur.NurseIncVo;
import com.dhcc.scm.entity.vo.nur.OrderDetailGroupByVenVo;
import com.dhcc.scm.entity.vo.ord.PlanGrpByNo;
import com.dhcc.scm.entity.vo.ord.PlanItmVO;

public class OrderPlanDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OrderPlan orderPlan;

	private String planNo;
	
	private Date starDate;
	
	private Date endDate;
	
	private List<PlanGrpByNo> planGrpByNos;
	
	private List<PlanItmVO> planItmVOs;
	
	private PagerModel itmPagerModel;
	
	private int itmPageCount;
	
	private Float planQty;
	
	
	
	public Float getPlanQty() {
		return planQty;
	}


	public void setPlanQty(Float planQty) {
		this.planQty = planQty;
	}


	/*
	 * 
	 * 查询商品属性
	 */	
	private Map<String,List<IncPropertyVO>> propertyMap;
    
	private List<HopManf> incManfs;
	/*
	 *商品属性查询条件参数 
	 */
	private Long propertyId;
	
	private List<NurseIncVo> nurseIncVos;
	
	private Long incCatId;
	
	private Long hopIncId;
	
	private Long planItmId;
	
	private Long venIncId;
	
	private String planIdStr;
	
	private Map<String, OrderDetailGroupByVenVo> venMap;
	
	
	
	public Map<String, OrderDetailGroupByVenVo> getVenMap() {
		return venMap;
	}


	public void setVenMap(Map<String, OrderDetailGroupByVenVo> venMap) {
		this.venMap = venMap;
	}


	public String getPlanIdStr() {
		return planIdStr;
	}


	public void setPlanIdStr(String planIdStr) {
		this.planIdStr = planIdStr;
	}


	public Long getVenIncId() {
		return venIncId;
	}


	public void setVenIncId(Long venIncId) {
		this.venIncId = venIncId;
	}


	public Long getPlanItmId() {
		return planItmId;
	}


	public void setPlanItmId(Long planItmId) {
		this.planItmId = planItmId;
	}


	public Long getHopIncId() {
		return hopIncId;
	}


	public void setHopIncId(Long hopIncId) {
		this.hopIncId = hopIncId;
	}


	public Long getIncCatId() {
		return incCatId;
	}


	public void setIncCatId(Long incCatId) {
		this.incCatId = incCatId;
	}


	public List<NurseIncVo> getNurseIncVos() {
		return nurseIncVos;
	}


	public void setNurseIncVos(List<NurseIncVo> nurseIncVos) {
		this.nurseIncVos = nurseIncVos;
	}


	public Map<String, List<IncPropertyVO>> getPropertyMap() {
		return propertyMap;
	}


	public void setPropertyMap(Map<String, List<IncPropertyVO>> propertyMap) {
		this.propertyMap = propertyMap;
	}


	public List<HopManf> getIncManfs() {
		return incManfs;
	}


	public void setIncManfs(List<HopManf> incManfs) {
		this.incManfs = incManfs;
	}


	public Long getPropertyId() {
		return propertyId;
	}


	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}


	public List<PlanItmVO> getPlanItmVOs() {
		return planItmVOs;
	}


	public void setPlanItmVOs(List<PlanItmVO> planItmVOs) {
		this.planItmVOs = planItmVOs;
	}


	public int getItmPageCount() {
		return itmPageCount;
	}


	public void setItmPageCount(int itmPageCount) {
		this.itmPageCount = itmPageCount;
	}


	public PagerModel getItmPagerModel() {
		return itmPagerModel;
	}


	public void setItmPagerModel(PagerModel itmPagerModel) {
		this.itmPagerModel = itmPagerModel;
	}


	public List<PlanGrpByNo> getPlanGrpByNos() {
		return planGrpByNos;
	}


	public void setPlanGrpByNos(List<PlanGrpByNo> planGrpByNos) {
		this.planGrpByNos = planGrpByNos;
	}


	public Date getStarDate() {
		return starDate;
	}


	public void setStarDate(Date starDate) {
		this.starDate = starDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public String getPlanNo() {
		return planNo;
	}


	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}


	public OrderPlan getOrderPlan() {
		return orderPlan;
	}

	
	public void setOrderPlan(OrderPlan orderPlan) {
		this.orderPlan = orderPlan;
	}
	
}

/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ord;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.blh.nur.NurseBlh;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.ord.OrderPlanDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderPlan;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.nur.OrderDetailGroupByVenVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.nur.NurseService;
import com.dhcc.scm.service.ord.OrderPlanService;


@Component
public class OrderPlanBlh extends AbstractBaseBlh {


	@Resource
	private OrderPlanService orderPlanService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private NurseBlh nurseBlh;
	
	@Resource
	private NurseService nurseService;
	
	public OrderPlanBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		
		//调用对应的service方法
		orderPlanService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		
		//调用对应的service方法
		//orderPlanService.save(dto);
		commonService.saveOrUpdate(dto.getOrderPlan());
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		
		//调用对应的service方法
		orderPlanService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		
		//调用对应的service方法
		orderPlanService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		
		//调用对应的service方法
		orderPlanService.findById(dto);
		
	}
	//选择
	public void updateOrderPlan(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			OrderPlan orderPlan=commonService.get(OrderPlan.class, dto.getPlanItmId());
			orderPlan.setPlanVenIncId(dto.getVenIncId());
			if(dto.getVenIncId()!=null){
				VenInc venInc=commonService.get(VenInc.class, dto.getVenIncId());
				orderPlan.setPlanVendorId(venInc.getVenIncVenid());
			}
			if(dto.getPlanQty()!=null){
				orderPlan.setPlanQty(dto.getPlanQty());
			}
			commonService.saveOrUpdate(orderPlan);
			dto.getOperateResult().setResultCode("1");
			dto.getOperateResult().setResultContent(orderPlan.getPlanNo());
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultCode("-1");
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
		
	}
	
	//删除选择商品
	public void removeOrderPlan(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			OrderPlan orderPlan=commonService.get(OrderPlan.class, dto.getPlanItmId());
			orderPlan.setPlanVenIncId(null);
			orderPlan.setPlanVendorId(null);
			commonService.saveOrUpdate(orderPlan);
			dto.getOperateResult().setResultCode("1");
			dto.getOperateResult().setResultContent(orderPlan.getPlanNo());
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultCode("-1");
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
		
	}
	
	//生成订单
	public void cmpOrderPlan(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		NurseIncDto nursedto=new NurseIncDto();
		dto.setOperateResult(new OperateResult());
		Map<String, OrderDetailGroupByVenVo> venMap=new HashMap<String, OrderDetailGroupByVenVo>();
		try {
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getPlanIdStr())){
				Long locId=Long.valueOf(super.getLoginInfo().get("LOCID").toString());
				Long userId=Long.valueOf(super.getLoginInfo().get("USERID").toString());
				Long hopId=Long.valueOf(super.getLoginInfo().get("HOSPID").toString());
				String ordNo="";
				String ordNoStr=""; //返回界面单号使用
				HopCtloc ctloc=commonService.get(HopCtloc.class, locId);
				String[] orderIds=dto.getPlanIdStr().split(",");
				for(String planId:orderIds){
					
					OrderDetail orderDetail = new OrderDetail();
					OrderPlan orderPlan = commonService.get(OrderPlan.class, Long.valueOf(planId.trim()));
					String[] propertyNames = { "hopIncId", "venIncId","venHopAuditflag" };
					Object[] values = { orderPlan.getPlanIncId(),orderPlan.getPlanVenIncId(), "Y" };
					List<VenHopInc> venHopIncs = commonService.findByProperties(VenHopInc.class,propertyNames, values);
					if (venHopIncs.size() == 0) {
						dto.getOperateResult().setResultCode("-1");
						continue;
					}	
	
					VenInc venInc = commonService.get(VenInc.class,orderPlan.getPlanVenIncId());
					HopInc hopInc=commonService.get(HopInc.class, orderPlan.getPlanIncId());
					orderDetail.setOrderVenId(venInc.getVenIncVenid());
					orderDetail.setOrderVenuom(venInc.getVenIncUomname());
					orderDetail.setOrderDate(new Date());
					orderDetail.setOrderHopIncId(orderPlan.getPlanIncId());
					orderDetail.setOrderRecLoc(locId);
					orderDetail.setOrderUserId(userId);
					orderDetail.setOrderHopId(hopId);
					orderDetail.setOrderHopUom(hopInc.getIncUomname());
					orderDetail.setOrderVenIncId(orderPlan.getPlanVenIncId());
					orderDetail.setOrderRp(venInc.getVenIncPrice());  //供应商单位进价
					orderDetail.setOrderState(1l);
					float fac = venHopIncs.get(0).getVenFac().floatValue()/ venHopIncs.get(0).getHopFac().floatValue();
					float hopQty =orderPlan.getPlanQty().floatValue();
					float venQty=orderPlan.getPlanQty().floatValue()/fac;
					orderDetail.setOrderHopQty(hopQty);
					orderDetail.setOrderVenQty(venQty);
					orderDetail.setOrderFac(fac);
					
					
					orderDetail.setOrderRecDestination(ctloc.getCtlocDest());
					
					String vendorId=orderPlan.getPlanVendorId().toString();
					if(!venMap.containsKey(vendorId)){
						OrderDetailGroupByVenVo orderDetailGroupByVenVo=new OrderDetailGroupByVenVo();
						orderDetailGroupByVenVo.setOrderDetails(new ArrayList<OrderDetail>());
						orderDetailGroupByVenVo.setOrdShoppings(new ArrayList<OrdShopping>());
						ordNo = nurseBlh.GetAppNo("ORD");
						ordNoStr=ordNo+","+ordNoStr;
						orderDetail.setOrderNo(ordNo);
						orderDetailGroupByVenVo.getOrderDetails().add(orderDetail);
						venMap.put(vendorId,orderDetailGroupByVenVo);
					}else{
						ordNo=venMap.get(vendorId).getOrderDetails().get(0).getOrderNo();
						orderDetail.setOrderNo(ordNo);
						venMap.get(vendorId).getOrderDetails().add(orderDetail);	
					}
					
					
					
				}
				dto.getOperateResult().setResultCode("1");
				nursedto.setVenMap(venMap);
				nurseService.saveOrderDetail(nursedto);
				dto.getOperateResult().setResultContent(ordNoStr);
			
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultCode("-1");
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
		
		
	}
	//删除订单
	public void deleteOrderPlan(BusinessRequest res) {
	
		OrderPlanDto dto = super.getDto(OrderPlanDto.class, res);
		dto.setOperateResult(new OperateResult());
		try {
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getPlanIdStr())){
				String[] orderIds=dto.getPlanIdStr().split(",");
				for(String planId:orderIds){
					OrderPlan orderPlan = commonService.get(OrderPlan.class, Long.valueOf(planId.trim()));
					commonService.delete(orderPlan);
				}
				dto.getOperateResult().setResultCode("1");
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			dto.getOperateResult().setResultCode("-1");
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
		
	}
}

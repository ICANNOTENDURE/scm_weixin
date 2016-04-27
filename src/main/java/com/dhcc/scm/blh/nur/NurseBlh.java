package com.dhcc.scm.blh.nur;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.IpUtil;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.nur.NurseIncDto;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hop.HopVendorLog;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.entity.ord.OrdShopping;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.sys.SysAppNo;
import com.dhcc.scm.entity.sys.SysLog;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalUser;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.VenQualification;
import com.dhcc.scm.entity.ven.VenReghop;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.nur.OrderDetailGroupByVenVo;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.nur.NurseService;
import com.dhcc.scm.service.sys.SysAppParamService;
import com.dhcc.scm.tool.datetime.OperTime;
import com.fasterxml.jackson.core.type.TypeReference;

@Component
public class NurseBlh extends AbstractBaseBlh {
    
	private static Log logger = LogFactory.getLog(NurseBlh.class);

	@Resource
	private NurseService nurseService;

	@Resource
	private CommonService commonService;
	
	@Resource
	private SysAppParamService sysAppParamService;
	
	public NurseBlh() {
		logger.info("====new NurseBlh====");
	}
	
	
	
	/**
	 * 
	 * @Title: addShopCart
	 * @Description: TODO(保存到购物车)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月19日 下午3:59:48
	 */
	public void addShopCart(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			dto.getOperateResult().setResultCode("1");
			dto.getOrdShopping().setShopUserid(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
			nurseService.addShopCart(dto);
			dto.getOperateResult().setResultContent(dto.getOrdShopping().getShopId().toString());
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: addShopCartByOrder
	 * @Description: TODO(再次购买)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月15日 上午9:25:06
	 */
	public void addShopCartByOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			Long userId = Long.valueOf(super.getLoginInfo().get("USERID").toString());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				Map<String, OrdShopping> shopMap = new HashMap<String, OrdShopping>();
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					OrdShopping ordShopping = new OrdShopping(null, orderDetail.getOrderHopIncId(), orderDetail.getOrderVenQty().longValue(), orderDetail.getOrderVenuom(), userId, null, orderDetail.getOrderVenIncId(), orderDetail.getOrderRp());
					ordShopping.setShopVendorId(orderDetail.getOrderVenId());
					HopInc hopInc = commonService.get(HopInc.class, orderDetail.getOrderHopIncId());
					ordShopping.setShopIncName(hopInc.getIncName());
					VenInc venInc = commonService.get(VenInc.class, orderDetail.getOrderVenIncId());
					ordShopping.setShopRp(venInc.getVenIncPrice());
					ordShopping.setShopUom(venInc.getVenIncUomname());
					String key = ordShopping.getShopVenIncid().toString();
					if (shopMap.containsKey(key)) {
						Float qty = shopMap.get(key).getShopQty().floatValue() + orderDetail.getOrderVenQty();
						shopMap.get(key).setShopQty(qty.longValue());
					} else {
						shopMap.put(key, ordShopping);
					}
				}
				for (Map.Entry<String, OrdShopping> entry : shopMap.entrySet()) {
					commonService.saveOrUpdate(entry.getValue());
				}
				dto.getOperateResult().setResultCode("1");
			}

			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: deleteShopCart
	 * @Description: TODO(删除购物车)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月22日 下午3:14:12
	 */
	public void deleteShopCart(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					OrdShopping ordShopping = commonService.get(OrdShopping.class, Long.valueOf(orderId.trim()));
					commonService.delete(ordShopping);
				}
				dto.getOperateResult().setResultCode("1");
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: updateShopCart
	 * @Description: TODO(更新购物车数量)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月22日 下午5:55:03
	 */
	public void updateShopCart(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			dto.getOperateResult().setResultCode("1");
			OrdShopping ordShopping = commonService.get(OrdShopping.class, dto.getOrdShopping().getShopId());
			ordShopping.setShopQty(dto.getOrdShopping().getShopQty());
			commonService.saveOrUpdate(ordShopping);
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: saveOrderDetail
	 * @Description: TODO(提交订单)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月23日 上午9:43:22
	 */
	public void saveOrderDetail(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		dto.setOperateResult(new OperateResult());
		Map<String, OrderDetailGroupByVenVo> venMap = new HashMap<String, OrderDetailGroupByVenVo>();
		try {
			Long locId = Long.valueOf(super.getLoginInfo().get("LOCID").toString());
			Long userId = Long.valueOf(super.getLoginInfo().get("USERID").toString());
			Long hopId = Long.valueOf(super.getLoginInfo().get("HOSPID").toString());
			Long stateId=sysAppParamService.getOrderAudit(null);
			String ordNo = "";
			String ordNoStr = ""; // 返回界面单号使用
			if (dto.getShopIdStr() != null) {
				if (!StringUtils.isNullOrEmpty(dto.getShopIdStr())) {
					dto.getOperateResult().setResultCode("1");
					String[] shopArr = dto.getShopIdStr().split("\\^");
					for (String shopId : shopArr) {
						if (shopId.equals("selectAll"))
							continue;
						OrderDetail orderDetail = new OrderDetail();
						OrdShopping ordShopping = commonService.get(OrdShopping.class, Long.valueOf(shopId));

						String[] propertyNames = { "hopIncId", "venIncId", "venHopAuditflag" };
						Object[] values = { ordShopping.getShopIncid(), ordShopping.getShopVenIncid(), "Y" };
						List<VenHopInc> venHopIncs = commonService.findByProperties(VenHopInc.class, propertyNames, values);
						if (venHopIncs.size() == 0) {
							dto.getOperateResult().setResultCode("-1");
							dto.getOperateResult().setResultContent(dto.getOperateResult().getResultContent() + "," + ordShopping.getShopIncName() + "没有对照不能购买。请联系管理员");
							continue;
						}
						VenInc venInc = commonService.get(VenInc.class, ordShopping.getShopVenIncid());
						orderDetail.setOrderVenId(venInc.getVenIncVenid());
						orderDetail.setOrderVenuom(venInc.getVenIncUomname());
						orderDetail.setOrderDate(new Date());
						orderDetail.setOrderHopIncId(ordShopping.getShopIncid());
						orderDetail.setOrderRecLoc(locId);
						orderDetail.setOrderUserId(userId);
						orderDetail.setOrderHopId(hopId);
						orderDetail.setOrderHopUom(ordShopping.getShopUom());
						orderDetail.setOrderVenIncId(ordShopping.getShopVenIncid());
						orderDetail.setOrderRp(ordShopping.getShopRp()); // 供应商单位进价
						orderDetail.setOrderState(stateId);
						float fac = venHopIncs.get(0).getVenFac().floatValue() / venHopIncs.get(0).getHopFac().floatValue();
						float hopQty = ordShopping.getShopQty().floatValue() * fac; // 医院单位数量
						float venQty = ordShopping.getShopQty().floatValue();
						orderDetail.setOrderHopQty(hopQty);
						orderDetail.setOrderVenQty(venQty);
						orderDetail.setOrderFac(fac);

						if (dto.getDefaultDestion() != null) {
							orderDetail.setOrderRecDestination(dto.getDefaultDestion());
						}
						String vendorId = ordShopping.getShopVendorId().toString();
						if (!venMap.containsKey(vendorId)) {
							OrderDetailGroupByVenVo orderDetailGroupByVenVo = new OrderDetailGroupByVenVo();
							orderDetailGroupByVenVo.setOrderDetails(new ArrayList<OrderDetail>());
							orderDetailGroupByVenVo.setOrdShoppings(new ArrayList<OrdShopping>());
							ordNo = GetAppNo("ORD");
							ordNoStr = ordNo + "," + ordNoStr;
							orderDetail.setOrderNo(ordNo);
							orderDetailGroupByVenVo.getOrderDetails().add(orderDetail);
							orderDetailGroupByVenVo.getOrdShoppings().add(ordShopping);
							venMap.put(vendorId, orderDetailGroupByVenVo);
						} else {
							ordNo = venMap.get(vendorId).getOrderDetails().get(0).getOrderNo();
							orderDetail.setOrderNo(ordNo);
							venMap.get(vendorId).getOrderDetails().add(orderDetail);
							venMap.get(vendorId).getOrdShoppings().add(ordShopping);
						}

					}
				}
			}
			if (dto.getOperateResult().getResultCode().equals("1")) {
				if (StringUtils.isNullOrEmpty(ordNoStr)) {
					dto.getOperateResult().setResultCode("-1");
					dto.getOperateResult().setResultContent("没有明细，请选择要结算的药品");
				} else {
					dto.setVenMap(venMap);
					nurseService.saveOrderDetail(dto);
					dto.getOperateResult().setResultContent(ordNoStr);
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage() + "<br>" + dto.getOperateResult().getResultContent());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: deleteOrderDetai
	 * @Description: TODO(删除订单明细)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月13日 下午12:45:23
	 */
	public void deleteOrderDetail(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					if (orderDetail.getOrderState().floatValue() == 1) {
						commonService.delete(orderDetail);
					} else {
						dto.getOperateResult().setResultCode("-1");
						dto.getOperateResult().setResultContent("订单状态不对");
					}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: updOrderState
	 * @Description: TODO(护士退货申请)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月14日 下午3:57:26
	 */
	public void retReqOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					if (orderDetail.getOrderState().floatValue() == 3) {
						nurseService.updateOrdDetail(Long.valueOf(orderId.trim()), 6l, dto.getRemark());
					} else {
						dto.getOperateResult().setResultCode("-1");
						dto.getOperateResult().setResultContent("订单状态不对");
					}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: closeOrder
	 * @Description: TODO(取消订单)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月14日 下午7:28:25
	 */
	public void closeOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					if (orderDetail.getOrderState().floatValue() == 2) {
						nurseService.updateOrdDetail(Long.valueOf(orderId.trim()), 9l, dto.getRemark());
					} else {
						dto.getOperateResult().setResultCode("-1");
						dto.getOperateResult().setResultContent("订单状态不对");
					}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}

	/**
	 * 
	 * @Title: auditOrder
	 * @Description: TODO(供应商审核退药申请)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月14日 下午7:02:06
	 */
	public void auditOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					if (orderDetail.getOrderState().floatValue() == 6) {
						nurseService.updateOrdDetail(Long.valueOf(orderId.trim()), dto.getOrdState(), dto.getRemark());
					} else {
						dto.getOperateResult().setResultCode("-1");
						dto.getOperateResult().setResultContent("订单状态不对");
					}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	
	/**
	 * 
	* @Title: hopAuditOrder 
	* @Description: TODO(医院审核订单) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月23日 下午5:45:42
	 */
	public void hopAuditOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		try {
			dto.setOperateResult(new OperateResult());
			if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderIdStr())) {
				Long stateId=-6l;
				if(dto.getType().equals("yes")){
					stateId=sysAppParamService.getOrderAudit(dto.getOrdState());
				}
				
				String[] orderIds = dto.getOrderIdStr().split(",");
				for (String orderId : orderIds) {
					dto.getOperateResult().setResultCode("1");
					OrderDetail orderDetail = commonService.get(OrderDetail.class, Long.valueOf(orderId.trim()));
					if (orderDetail.getOrderState().longValue()<1) {
						nurseService.updateOrdDetail(Long.valueOf(orderId.trim()),stateId, dto.getRemark());
					} else {
						dto.getOperateResult().setResultCode("-1");
						dto.getOperateResult().setResultContent("有订单状态不对");
					}
				}
			}
			super.writeJSON(dto.getOperateResult());
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent(e.getMessage());
			super.writeJSON(dto.getOperateResult());
		}
	}
	/**
	 * 
	 * @Title: saveOrderDetail
	 * @Description: TODO(护士确认收货，调用hiswebservice)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月23日 下午11:39:33
	 */
	public void cmpOrder(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		dto.setOperateResultWs(new com.dhcc.scm.ws.his.dhcclient.OperateResult());
		String userId = super.getLoginInfo().get("USERID").toString();
		try {
			nurseService.cmpOrderDetail(dto);
			dto.getOperateResultWs().setResultCode("1");
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResultWs().setResultCode("-1");
			dto.getOperateResultWs().setResultContent(dto.getOperateResultWs().getResultContent() + "<BR>" + e.getMessage());

		} finally {
			// 保存日志
			SysLog log = new SysLog();
			log.setOpName("护士确认收货调用his接口");
			log.setOpIp(WebContextHolder.getContext().getRequest().getRemoteAddr().toString());
			log.setOpDate(new Date());
			log.setOpArg(JsonUtils.toJson(dto.getSciInfoRtMain()));
			log.setOpResult(JsonUtils.toJson(dto.getOperateResultWs()));
			log.setOpType("webservice");
			log.setOpUser(userId.toString());
			commonService.saveOrUpdate(log);
			super.writeJSON(dto.getOperateResultWs());
		}
	}

	/**
	 * 通过订单明细查找订单的执行状态
	 * 
	 * @param res
	 */
	public void getOrderStateById(BusinessRequest res) {
		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		List<OrderExeStateVo> orderStateVos = nurseService.getOrderStateById(dto.getOrderStateDto());
		super.writeJSON(orderStateVos);

	}

	/**
	 * 
	 * @Title: listOrderStateById
	 * @Description: TODO(查询订单状态)
	 * @param @param res 设定文件
	 * @return void 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年4月14日 下午6:29:21
	 */
	public void listOrderStateById(BusinessRequest res) {
		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		dto.setPageModel(new PagerModel());
		List<OrderExeStateVo> orderStateVos = nurseService.getOrderStateById(dto.getOrderStateDto());
		dto.getPageModel().setPageData(orderStateVos);
	}

	public void catGroupList(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		// 调用对应的service方法
		nurseService.listCatGroup(dto);
	}

	public void getSubGroupByID(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		// 调用对应的service方法
		nurseService.getSubGroupByID(dto);
	}

	final ReentrantLock lock = new ReentrantLock();

	/**
	 * 
	 * @Title: GetAppNo
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param pre
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 * @author zhouxin
	 * @date 2015年3月23日 上午9:59:14
	 */
	public String GetAppNo(String pre) {
		StringBuilder appNo = new StringBuilder();
		assert !lock.isHeldByCurrentThread();
		lock.lock();
		try {
			SysAppNo sysAppNo;
			String[] propertyNames = { "appPre", "appDate" };
			Object[] values = { pre, new Date() };
			List<SysAppNo> sysAppNos = commonService.findByProperties(SysAppNo.class, propertyNames, values);
			if (sysAppNos.size() == 0) {
				sysAppNo = new SysAppNo();
				sysAppNo.setAppPre(pre);
				sysAppNo.setAppCount(0l);
				sysAppNo.setAppDate(new Date());
				commonService.saveOrUpdate(sysAppNo);
			} else {
				sysAppNo = sysAppNos.get(0);
			}
			sysAppNo.setAppCount(sysAppNo.getAppCount() + 1l);
			commonService.saveOrUpdate(sysAppNo);
			long currNo = sysAppNo.getAppCount();
			appNo = appNo.append(pre).append(OperTime.getCurrentDate().replaceAll("-", "")).append(String.format("%04d", currNo));
		} finally {
			lock.unlock();
		}

		return appNo.toString();
	}

	/**
	 * 
	 * @Title: NormalAccountBlh.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param req
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月16日 下午12:32:43
	 * @version V1.0
	 */
	public void getUserInfo(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		NormalAccountDto normalAccountDto = new NormalAccountDto();
		dto.setNormalAccountDto(normalAccountDto);
		String userId = WebContextHolder.getContext().getVisit().getUserInfo().getId();
		Long hopId = WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
		Long LocId = WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
		Long venId = WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		Long userType = WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		NormalAccount normalAccount = commonService.get(NormalAccount.class, Long.valueOf(userId));
		dto.getNormalAccountDto().setNormalAccount(normalAccount);
		if (userType == 1) {
			dto.getNormalAccountDto().setHopName(commonService.get(Hospital.class, hopId).getHospitalName());
			HopCtloc hopCtloc = commonService.get(HopCtloc.class, LocId);
			dto.getNormalAccountDto().setLocName(hopCtloc.getName());
			dto.getNormalAccountDto().setDestinationId(hopCtloc.getCtlocDest());
		}
		if (userType == 2) {
			dto.getNormalAccountDto().setHopName(commonService.get(Vendor.class, venId).getName());
		}
		if (userType == 3) {
			dto.getNormalAccountDto().setHopName(commonService.get(Hospital.class, hopId).getHospitalName());
			HopCtloc hopCtloc = commonService.get(HopCtloc.class, LocId);
			dto.getNormalAccountDto().setLocName(hopCtloc.getName());
			// 默认收获地址
			HopCtlocDestination hopCtlocDestination = null;
			if (hopCtloc.getCtlocDest() != null) {
				hopCtlocDestination = commonService.get(HopCtlocDestination.class, hopCtloc.getCtlocDest());
				dto.getNormalAccountDto().setDestinations(hopCtlocDestination.getDestination());
				dto.getNormalAccountDto().setDestinationId(hopCtloc.getCtlocDest());
			}
		}
		super.writeJSON(dto.getNormalAccountDto());
	}

	/**
	 * 保存用户个人信息
	 * 
	 * @param req
	 */
	public void saveInfo(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		NormalUser normalUser = new NormalUser();
		normalUser = commonService.get(NormalAccount.class, Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId())).getNormalUser();
		normalUser.setEmail(dto.getNormalAccountDto().getNormalAccount().getNormalUser().getEmail());
		normalUser.setRealName(dto.getNormalAccountDto().getNormalAccount().getNormalUser().getRealName());
		normalUser.setTelephone(dto.getNormalAccountDto().getNormalAccount().getNormalUser().getTelephone());
		commonService.saveOrUpdate(normalUser);
		dto.getNormalAccountDto().setOpFlg("1");
		super.writeJSON(dto.getNormalAccountDto());
	}

	/**
	 * 查找收获地址
	 * 
	 * @param req
	 */
	public void findLocDesctionComboList(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		dto.getOrderDto().setLoc(Long.valueOf(super.getLoginInfo().get("LOCID").toString()));
		List<HopCtlocDestination> destinationList = nurseService.findLocDesctionComboList(dto.getOrderDto());
		// 判断是否是默认收货地址
		for (int i = 0; i < destinationList.size(); i++) {
			List<HopCtloc> hopCtloc = commonService.findByProperty(HopCtloc.class, "ctlocDest", destinationList.get(i).getHopCtlocDestinationId());
			if (hopCtloc.size() > 0) {
				destinationList.get(i).setIsDefault("Y");
			} else {
				destinationList.get(i).setIsDefault("N");
			}
		}

		super.writeJSON(destinationList);
	}

	/**
	 * 设置默认收货地址
	 * 
	 * @param req
	 */
	public void setDefault(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		try {
			Long locIdLong = Long.valueOf(super.getLoginInfo().get("LOCID").toString());
			HopCtloc hopCtloc = commonService.get(HopCtloc.class, locIdLong);
			hopCtloc.setCtlocDest(dto.getHopCtlocDestinationDto().getHopCtlocDestination().getHopCtlocDestinationId());
			commonService.saveOrUpdate(hopCtloc);
			dto.setOpFlg("1");
			super.writeJSON(dto);
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("0");
		}

	}

	/**
	 * 保存收货地址
	 * 
	 * @param req
	 */
	public void saveDest(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		try {
			nurseService.saveDest(dto);
			super.writeJSON(dto);
			dto.setOpFlg("1");
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("0");
		}
	}

	/**
	 * 删除收货地址
	 * 
	 * @param req
	 */
	public void deleteDest(BusinessRequest req) {
		NurseIncDto dto = this.getDto(NurseIncDto.class, req);
		try {
			nurseService.deleteDest(dto);
			dto.setOpFlg("1");
			super.writeJSON(dto);
		} catch (Exception e) {
			e.printStackTrace();
			dto.setOpFlg("0");
		}
	}

	/**
	 * 供应商注册的同时注册用户，状态为停用，等待医院用户改为可用的时候就可以登录
	 * 
	 * @param res
	 */
	public void saveVendor(BusinessRequest res) {

		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		HopVendorLog log = new HopVendorLog();
		StringBuilder logContent = new StringBuilder();
		//hxy by zxx 将串串拆分 哈哈哈，被本宝宝移到下边去喽~

		try {
			List<VenQualification> venQualificationList = JsonUtils.toObject(dto.getVendorDto().getVenQualificationList(), new TypeReference<List<VenQualification>>() {
			});

			if (dto.getVendorDto().getVendor().getVendorId() == null) {
				log.setOperateType("增加");
				if (StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getName())) {
					logContent.append(" 名称:" + dto.getVendorDto().getVendor().getName());
				}
				if (StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getEmail())) {
					logContent.append(" 邮箱:" + dto.getVendorDto().getVendor().getEmail());
				}
				if (StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getAddress())) {
					logContent.append(" 地址:" + dto.getVendorDto().getVendor().getAddress());
				}
				if (StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getContact())) {
					logContent.append(" 联系人:" + dto.getVendorDto().getVendor().getContact());
				}
				if (StringUtils.isNullOrEmpty(dto.getVendorDto().getVendor().getTaxation())) {
					logContent.append(" 税务号:" + dto.getVendorDto().getVendor().getTaxation());
				}
				for (VenQualification venQualification : venQualificationList) {
					if (org.apache.commons.lang.StringUtils.isNotBlank(venQualification.getDescription())) {
						VenQualifType venQualifType = commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
						logContent.append(" " + venQualifType.getName() + ":" + venQualification.getDescription());
					} else {
						if (venQualification.getExpdate() != null) {
							VenQualifType venQualifType = commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
							logContent.append(" " + venQualifType.getName() + ":" + StringUtils.formatShortDate(venQualification.getExpdate()));
						}
					}
				}
			} else {
				log.setOperateType("修改");
				Vendor vendor = commonService.get(Vendor.class, dto.getVendorDto().getVendor().getVendorId());
				if (!vendor.getName().equals(dto.getVendorDto().getVendor().getName())) {
					logContent.append(" 名称:" + dto.getVendorDto().getVendor().getName());
				}
				if (!vendor.getEmail().equals(dto.getVendorDto().getVendor().getEmail())) {
					logContent.append(" 邮箱:" + dto.getVendorDto().getVendor().getEmail());
				}
				if (!vendor.getAddress().equals(dto.getVendorDto().getVendor().getAddress())) {
					logContent.append(" 地址:" + dto.getVendorDto().getVendor().getAddress());
				}
				if (!vendor.getContact().equals(dto.getVendorDto().getVendor().getContact())) {
					logContent.append(" 联系人:" + dto.getVendorDto().getVendor().getContact());
				}
				if (!vendor.getContact().equals(dto.getVendorDto().getVendor().getTaxation())) {
					logContent.append(" 税务号:" + dto.getVendorDto().getVendor().getTaxation());
				}
				for (VenQualification venQualification : venQualificationList) {
					if (venQualification.getVenQualificationId() == null) {
						if (venQualification.getExpdate() != null) {
							VenQualifType venQualifType = commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
							logContent.append(" " + venQualifType.getName() + ":" + StringUtils.formatShortDate(venQualification.getExpdate()));
						}else{
							if(org.apache.commons.lang.StringUtils.isNotBlank(venQualification.getDescription())){
								VenQualifType venQualifType = commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
								logContent.append(" " + venQualifType.getName() + ":" + venQualification.getDescription());
							}
						}
					} else {
						VenQualification venQualificationTmp = commonService.get(VenQualification.class, venQualification.getVenQualificationId());
						if (!StringUtils.formatShortDate(venQualificationTmp.getExpdate()).equals(StringUtils.formatShortDate(venQualification.getExpdate()))) {
							VenQualifType venQualifType = commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
							logContent.append(" " + venQualifType.getName() + ":" + StringUtils.formatShortDate(venQualification.getExpdate()));
						}
					}
				}
			}

			dto.getVendorDto().getVendor().setVenQualificationList(venQualificationList);
			nurseService.saveOrUpdate(dto.getVendorDto());
			
			//hxy by zxx 将串串拆分
			String[] hops=dto.getHopStr().split(",");
			for(int i=0;i<hops.length;i++){
				//循环中保存到对应表 hxy
				VenReghop venReghop=new VenReghop();
				venReghop.setReghophopid(Long.valueOf(hops[i].trim()));
				venReghop.setVenid(dto.getVendorDto().getVendor().getVendorId());
	            commonService.saveOrUpdate(venReghop);
			}
			
			
			/* 下面代码增加用户帐号 */
			// 默认未激活
			dto.setNormalAccountDto(new NormalAccountDto());
			dto.getNormalAccountDto().setNormalAccount(new NormalAccount());
			dto.getNormalAccountDto().getNormalAccount().setNormalUser(new NormalUser());
			dto.getNormalAccountDto().getNormalAccount().setUseState("3"); // 待审核
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setUseState("3");
			// 帐号
			dto.getNormalAccountDto().getNormalAccount().setAccountAlias(dto.getVendorDto().getVendor().getEmail());
			// Name
			dto.getNormalAccountDto().getNormalAccount().setAccountName(new Date().getTime() + "");
			// 真实姓名
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setRealName(dto.getVendorDto().getVendor().getContact());
			// 邮箱
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setEmail(dto.getVendorDto().getVendor().getEmail());
			// 用户供应商
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setVendorId(dto.getVendorDto().getVendor().getVendorId());
			// 电话
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setTelephone(dto.getVendorDto().getVendor().getTel());
			// 人员类型{0:工作人员,1:医院用户,2:供应商用户,3:护士}
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setType(Long.valueOf("2"));
			// 密码
			dto.getNormalAccountDto().getNormalAccount().setPassword("1");
			// 注册日期
			dto.getNormalAccountDto().getNormalAccount().setRegTime(new Date());
			dto.getNormalAccountDto().getNormalAccount().getNormalUser().setRegTime(new Date());
			this.nurseService.saveNormalAccount(dto.getNormalAccountDto().getNormalAccount());
			/* 上面代码增加用户帐号 */
			dto.setSuccess(true);

			log.setOpContent(logContent.toString());
			log.setOperateIp(IpUtil.getIpAddrByRequest(WebContextHolder.getContext().getRequest()));
			log.setOperateDate(new Date());
			log.setOpUserName(dto.getVendorDto().getVendor().getName());
			log.setVendorId(dto.getVendorDto().getVendor().getVendorId());
			commonService.saveOrUpdate(log);

			super.writeJSON(dto);
		} catch (Exception e) {
			e.printStackTrace();
			dto.getVendorDto().setSuccess(false);
			dto.getVendorDto().setMsg(e.getMessage());
		}
	}

	/**
	 * 
	 * 方法名: upload 方法功能描述: 上传文件到upload文件夹(不用登录可以访问的action)
	 * 
	 * @param:
	 * @return:
	 * @Author: 周鑫
	 * @Create Date: 2014年04月15日
	 */
	public void upload(BusinessRequest res) throws Exception {
		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		Date date = new Date();
		SimpleDateFormat smDateFormat = new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");

		// 生成随机文件名
		String newFileName = smDateFormat.format(date) + UUID.randomUUID() + com.dhcc.framework.util.FileUtils.getFileExp(dto.getVendorDto().getUploadFileName());
		// 获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads");
		// 判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		dto.getVendorDto().setStorgeFileName(newFileName);
		File dstFile = new File(storageFileName, newFileName);
		com.dhcc.framework.util.FileUtils.copyFile(dto.getVendorDto().getUpload(), dstFile, BaseConstants.BUFFER_SIZE);

		nurseService.saveOrUpdatePic(dto.getVendorDto());

		dto.getVendorDto().setOpFlg("1");
		super.writeJSON(dto.getVendorDto());
	}
	
	/**
	 * 验证唯一性
	 */
	@SuppressWarnings("unchecked")
	public void checkVenUnique(BusinessRequest res) throws Exception {
		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		// 税务
		if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getVendorDto().getVendor().getTaxation())) {
			DetachedCriteria criteria=DetachedCriteria.forClass(Vendor.class);
			criteria.add(Restrictions.eq("taxation", dto.getVendorDto().getVendor().getTaxation()));
			criteria.add(Restrictions.eq("audit_flag", "I"));
			List<Vendor> account=commonService.findByDetachedCriteria(criteria);
			if (account.size() > 0) {
				dto.setSuccess(true);
				super.writeJSON(dto.isSuccess());
			}
		}
		// 供应商名称
		if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getVendorDto().getVendor().getName())) {
			DetachedCriteria criteria=DetachedCriteria.forClass(Vendor.class);
			criteria.add(Restrictions.eq("name", dto.getVendorDto().getVendor().getName()));
			criteria.add(Restrictions.eq("audit_flag", "I"));
			List<Vendor> account=commonService.findByDetachedCriteria(criteria);
			if (account.size() > 0) {
				dto.setSuccess(true);
				super.writeJSON(dto.isSuccess());
			}
		}
		// 邮箱
		if (org.apache.commons.lang3.StringUtils.isNotBlank(dto.getVendorDto().getVendor().getAccount())) {

			DetachedCriteria criteria=DetachedCriteria.forClass(Vendor.class);
			criteria.add(Restrictions.eq("email", dto.getVendorDto().getVendor().getAccount()));
			criteria.add(Restrictions.eq("audit_flag", "I"));
			List<Vendor> account=commonService.findByDetachedCriteria(criteria);
			if (account.size() > 0) {
				dto.setSuccess(true);
				super.writeJSON(dto.isSuccess());
			}
		}
	}

	/**
	 * 根据供应商ID检查供应是否审核
	 * 
	 * @param res
	 * @throws Exception
	 */
	public void checkVenAudit(BusinessRequest res) throws Exception {
		NurseIncDto dto = super.getDto(NurseIncDto.class, res);
		Long valuesStrings = dto.getHopVendorDto().getHopVendor().getHopVenId();
		if (null != dto.getHopVendorDto().getHopVendor().getHopVenId().toString() && "" != dto.getHopVendorDto().getHopVendor().getHopVenId().toString()) {
			List<HopVendor> hopVendor = commonService.findByProperty(HopVendor.class, "hopVenId", valuesStrings);
			if (hopVendor.size() > 0) {
				if ((hopVendor.get(0).getHopAuditFlag()).equals("Y")) {
					dto.setSuccess(true);
					super.writeJSON(dto.isSuccess());
				}
			}
		}
	}
}

/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ord;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.weixin.MpMessageBlh;
import com.dhcc.scm.dto.ord.OrderStateDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.ord.State;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.nur.OrderGrpByNo;
import com.dhcc.scm.entity.vo.ord.DevPropertyGridVo;
import com.dhcc.scm.entity.vo.ord.OrderExeStateVo;
import com.dhcc.scm.entity.vo.ord.OrderInfoVo;
import com.dhcc.scm.entity.vo.ord.OrderItmVo;
import com.dhcc.scm.entity.vo.ord.OrderStateVo;
import com.dhcc.scm.entity.vo.ws.OrderWebVo;
import com.dhcc.scm.ws.his.dhcclient.ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.GetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.SCI;
import com.dhcc.scm.ws.his.dhcclient.SCIInpoUmInfoRtMain;

@Repository
public class OrderStateDao extends HibernatePersistentObjectDAO<Order> {

	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	@Resource
	private MpMessageBlh messageBlh;
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {


	}
	
	public void accpOrder(OrderStateDto dto){
		if(org.apache.commons.lang.StringUtils.isNotEmpty(dto.getOrderIdStr())){
			HashSet<String> hashSet=new HashSet<>();
			String[] idArr=dto.getOrderIdStr().split("\\^");
			for(String id:idArr){
				OrderDetail orderDetail=super.get(OrderDetail.class, Long.valueOf(id));
				if(orderDetail.getOrderState()!=1) continue;
				orderDetail.setOrderState(2l);
				super.saveOrUpdate(orderDetail);
				ExeState exeState = new ExeState();
				exeState.setStateId(Long.valueOf(2));
				exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
				exeState.setOrdId(orderDetail.getOrderId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				super.save(exeState);
				hashSet.add(orderDetail.getOrderNo());
			}
			for(String ordno:hashSet){
				List<OrderDetail> details=super.findByProperty(OrderDetail.class, "orderNo", ordno);
				messageBlh.accporderMessage(details.get(0));
			}
		}
	}
	
	/**
	 * 
	* @Title: saveOrderSub 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 下午6:20:45
	 */
	@SuppressWarnings("unchecked")
	public void saveOrderSubCmp(OrderStateDto dto){
		if(org.apache.commons.lang.StringUtils.isNotEmpty(dto.getOrderIdStr())){

			
			String[] idArr=dto.getOrderIdStr().split("\\^");
			for(String id:idArr){
				OrderDetailSub orderDetailSub=super.get(OrderDetailSub.class,id);
				if(orderDetailSub!=null){
					if(org.apache.commons.lang.StringUtils.isNotEmpty(orderDetailSub.getOrdSubStatus())){
						if(orderDetailSub.getOrdSubStatus().equals("Y")) {continue;}
					}
					orderDetailSub.setOrdSubStatus("Y");
					super.saveOrUpdate(orderDetailSub);
					OrderDetail orderDetail=super.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
					orderDetail.setOrderState(3l);
					super.saveOrUpdate(orderDetail);
					
					ExeState exeState = new ExeState();
					exeState.setStateId(Long.valueOf(3));
					exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
					exeState.setOrdId(orderDetail.getOrderId());
					exeState.setRemark(orderDetailSub.getOrdSubInvNo());
					exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
					super.save(exeState);
					
					DetachedCriteria criteria = createDetachedCriteria(SysAppParam.class);
					criteria.setProjection(Property.forName("appValue"));
					criteria.add(Restrictions.eq("appCode",BaseConstants.ADD_HIS_INTERFACE));
					criteria.add(Restrictions.eq("appHopId",orderDetail.getOrderHopId()));
					List<String> sysAppParams=super.findByDetachedCriteria(criteria);
					int insertFlag=0;
					if(sysAppParams.size()>0){
						if(sysAppParams.get(0).equals("1")){
							insertFlag=1;
						}
					}
					//插入HIS中间表
					if(insertFlag==1){
						
						float fac = orderDetail.getOrderFac();

						SimpleDateFormat sdFormat = new SimpleDateFormat("yyy-MM-dd");
						SCIInpoUmInfoRtMain infoRtMain = new SCIInpoUmInfoRtMain();
						ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt = new ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt();
						infoRtMain.setInPoImInfos(arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt);
							
						GetSCIInPoImInfoRt sciInPoImInfoRt = new GetSCIInPoImInfoRt();
							// 批号
						sciInPoImInfoRt.setBatNo(orderDetailSub.getOrdSubBatNo());
						if (orderDetailSub.getOrdSubExpDate() != null) {
							sciInPoImInfoRt.setExpDate(sdFormat.format(orderDetailSub.getOrdSubExpDate()));
							sciInPoImInfoRt.setInvNo(orderDetailSub.getOrdSubInvNo());
						}
						HopCtloc hopCtloc = super.get(HopCtloc.class, orderDetail.getOrderRecLoc());
						sciInPoImInfoRt.setReCTLOCDR(hopCtloc.getCode());
						List<HopVendor> hopVendors = super.findByProperty(HopVendor.class, "hopVenId", orderDetail.getOrderVenId());
						sciInPoImInfoRt.setVendorDR(hopVendors.get(0).getHopCode());
						HopInc hopInc = super.get(HopInc.class, orderDetail.getOrderHopIncId());
						sciInPoImInfoRt.setCTUOMDR(hopInc.getIncUomcode());
						sciInPoImInfoRt.setInciDr(hopInc.getIncCode());
						VenInc venInc=super.get(VenInc.class, orderDetail.getOrderVenIncId());
						if (hopInc.getIncManfid() != null) {
							HopManf hopManf = super.get(HopManf.class, venInc.getVenIncManfid());
							sciInPoImInfoRt.setPhmnfDR(hopManf.getManfCode());
						}
						float hopQty = orderDetailSub.getOrderSubQty() * fac;
						sciInPoImInfoRt.setOrderQty(String.valueOf(orderDetail.getOrderHopQty()));
						sciInPoImInfoRt.setRealqty(String.valueOf(hopQty));
						if (orderDetailSub.getOrderSubRp() == null) {
							orderDetailSub.setOrderSubRp(0f);
						}
						float hopRp = orderDetailSub.getOrderSubRp().floatValue() / fac;
						sciInPoImInfoRt.setRealPrice(String.valueOf(hopRp));
						sciInPoImInfoRt.setPmsInPoID(orderDetailSub.getOrdSubId());
						arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt.getGetSCIInPoImInfo().add(sciInPoImInfoRt);


						// 调his接口
						SCI sci = new SCI();
						com.dhcc.scm.ws.his.dhcclient.OperateResult operateResult = sci.getSCISoap().inpohhImport(infoRtMain);

						if (!operateResult.getResultCode().equals("1")) {
							dto.getOperateResult().setResultCode(operateResult.getResultCode());
							dto.getOperateResult().setResultContent(operateResult.getResultContent());
							throw new RuntimeException();
						}
					}
				}
			}
		}
	}
	/**
	 * 
	* @Title: listNurseOrd 
	* @Description: TODO(供应商确认订单使用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 上午9:25:55
	 */
	public void listVenOrd(OrderStateDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ORDER_NO orderno, ");
		hqlBuffer.append("t1.ORDER_ID orderid, ");
		hqlBuffer.append("t1.ORDER_RP rp, ");
		hqlBuffer.append("t1.ORDER_ODATE orderdate, ");
		hqlBuffer.append("t2.VEN_INC_CODE veninccode, ");
		hqlBuffer.append("t2.VEN_INC_NAME venincname, ");
		hqlBuffer.append("t2.VEN_INC_UOMNAME uom, ");
		hqlBuffer.append("t1.ORDER_VEN_QTY venqty, ");
		hqlBuffer.append("t1.ORDER_HOP_QTY hopqty, ");
		hqlBuffer.append("t3.state_name statedesc, ");
		hqlBuffer.append("t5.ctloc_name as recloc, ");
		hqlBuffer.append("t6.ctlocdes_destination as destination, ");
		hqlBuffer.append("t8.realname as realname, ");
		hqlBuffer.append("t11.NAME as vendor, ");
		hqlBuffer.append("t12.INC_SPEC as spec, ");
		hqlBuffer.append("t12.INC_UOMNAME as hopuom, ");
		hqlBuffer.append("t12.INC_CODE as hopinccode, ");
		hqlBuffer.append("t12.INC_NAME as hopincname, ");
		hqlBuffer.append("t13.NAME as manf, ");
		hqlBuffer.append("t10.HOSPITAL_NAME as hopname ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL t1  ");
		hqlBuffer.append("left join T_VEN_INC t2 on t1.ORDER_VEN_INC_ID=t2.VEN_INC_ROWID  ");
		hqlBuffer.append("left join t_ord_state t3 on t1.ORDER_STATE=t3.state_seq ");
		hqlBuffer.append("left join t_sys_ctloc t5 on t5.ctloc_id=t1.ORDER_RECLOC ");
		hqlBuffer.append("left join t_sys_ctloc_destination t6 on t6.ctlocdes_id=t1.ORDER_RECDESTINATION ");
		hqlBuffer.append("left join t_sys_normal_account t7 on  t7.account_id=t1.ORDER_USER_ID ");
		hqlBuffer.append("left join t_sys_normal_user t8 on  t8.user_id=t7.user_id ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t10 on t10.HOSPITAL_ID=t1.ORDER_HOP_ID ");
		hqlBuffer.append("left join T_VEN_VENDOR t11 on t11.VEN_ID=t1.ORDER_VEN_ID ");
		hqlBuffer.append("left join T_HOP_INC t12 on t1.ORDER_HOP_INC_ID=t12.INC_ID  ");
		hqlBuffer.append("left join T_HOP_MANF t13 on t2.VEN_INC_MANFID=t13.ID  ");
		hqlBuffer.append("where 1=1 ");
		
		if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getOrderNo())){
			hqlBuffer.append("and t1.ORDER_NO=:OrderNo ");
			hqlParamMap.put("OrderNo", dto.getOrderNo());
		}
		
		if(dto.getStdate()!=null){
			hqlBuffer.append("and t1.ORDER_ODATE>=:Stdate ");
			hqlParamMap.put("Stdate", dto.getStdate());
		}
		if(dto.getEddate()!=null){
			hqlBuffer.append("and t1.ORDER_ODATE<=:Etdate ");
			hqlParamMap.put("Etdate", dto.getEddate());
		}
		if(dto.getState()!=null){
			hqlBuffer.append("and t1.ORDER_STATE=:State ");
			hqlParamMap.put("State", dto.getState());
		}
		if(dto.getHopId()!=null){
			hqlBuffer.append("and t1.ORDER_HOP_ID=:hopId ");
			hqlParamMap.put("hopId", dto.getHopId());
		}
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType().longValue()==2){
			hqlBuffer.append("and t1.ORDER_VEN_ID=:vendorid ");
			hqlParamMap.put("vendorid", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		}
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType().longValue()==3){
			hqlBuffer.append("and t1.ORDER_HOP_ID=:hop ");
			hqlParamMap.put("hop", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
			if(dto.getState()!=null){
				//科主任审核
				if(dto.getState().longValue()==-4){
					hqlBuffer.append("and t1.ORDER_RECLOC=:loc ");
					hqlParamMap.put("loc", WebContextHolder.getContext().getVisit().getUserInfo().getLocId());
				}
			}
		}
		if(dto.getRecLoc()!=null){
			hqlBuffer.append("and t1.ORDER_RECLOC=:recloc ");
			hqlParamMap.put("recloc", dto.getRecLoc());
		}
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrdId())){
			hqlBuffer.append("and t1.ORDER_IMP_ID=:impid ");
			hqlParamMap.put("impid", dto.getOrdId());
		
		}
		hqlBuffer.append(" order by ORDER_ID desc ");
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), OrderInfoVo.class, "t1.ORDER_ID");
	}

	
	
	/**
	 * 
	* @Title: listNurseOrd 
	* @Description: TODO(供应商录入发票使用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月25日 上午9:25:55
	 */
	public void listVenSend(OrderStateDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ORDER_NO orderno, ");
		hqlBuffer.append("t1.ORDER_ID orderid, ");
		hqlBuffer.append("t1.ORDER_STATE stateid, ");
		hqlBuffer.append("t4.ordsub_id ordersubid, ");
		hqlBuffer.append("t1.ORDER_ODATE orderdate, ");
		hqlBuffer.append("t2.VEN_INC_CODE veninccode, ");
		hqlBuffer.append("t2.VEN_INC_NAME venincname, ");
		hqlBuffer.append("t2.VEN_INC_UOMNAME uom, ");
		hqlBuffer.append("t1.ORDER_VEN_QTY ordqty, ");
		hqlBuffer.append("t1.ORDER_RP rp, ");
		hqlBuffer.append("t3.state_name statedesc, ");
		hqlBuffer.append("t5.ctloc_name as recloc, ");
		hqlBuffer.append("t4.ordsub_expdate as expdate, ");
		hqlBuffer.append("t4.ordsub_arrivedate as arrivedate, ");
		hqlBuffer.append("t4.ordsub_invno as invno, ");
		hqlBuffer.append("t4.ordsub_batno as batno, ");
		hqlBuffer.append("t4.ordsub_qty as devqty, ");
		hqlBuffer.append("t4.ordsub_date as operatedate, ");
		hqlBuffer.append("t8.realname as operatuser, ");
		hqlBuffer.append("t10.HOSPITAL_NAME as hopname ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL t1  ");
		hqlBuffer.append("left join T_ORD_ORDERDETAILSUB t4 on t4.ordsub_detail_id=t1.ORDER_ID  ");
		hqlBuffer.append("left join T_VEN_INC t2 on t1.ORDER_VEN_INC_ID=t2.VEN_INC_ROWID  ");
		hqlBuffer.append("left join t_ord_state t3 on t1.ORDER_STATE=t3.state_seq ");
		hqlBuffer.append("left join t_sys_ctloc t5 on t5.ctloc_id=t1.ORDER_RECLOC ");
		hqlBuffer.append("left join t_sys_normal_account t7 on  t4.ordsub_userid=t7.account_id ");
		hqlBuffer.append("left join t_sys_normal_user t8 on  t8.user_id=t7.user_id ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t10 on t10.HOSPITAL_ID=t1.ORDER_HOP_ID ");
		hqlBuffer.append("where 1=1 ");
	
		if(dto.getStdate()!=null){
			hqlBuffer.append("and t1.ORDER_ODATE>=:Stdate ");
			hqlParamMap.put("Stdate", dto.getStdate());
		}
		if(dto.getEddate()!=null){
			hqlBuffer.append("and t1.ORDER_ODATE<=:Etdate ");
			hqlParamMap.put("Etdate", dto.getEddate());
		}
		if(dto.getState()!=null){
			hqlBuffer.append("and t1.ORDER_STATE=:State ");
			hqlParamMap.put("State", dto.getState());
		}
		if(dto.getHopId()!=null){
			hqlBuffer.append("and t1.ORDER_HOP_ID=:hopId ");
			hqlParamMap.put("hopId", dto.getHopId());
		}
		hqlBuffer.append("and t1.ORDER_VEN_ID=:vendorid ");
		hqlParamMap.put("vendorid", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		hqlBuffer.append(" order by ORDER_ID desc ");
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DevPropertyGridVo.class, "ORDER_ID");
	}
	
    /**
     * 
    * @Title: OrdStateDao.java
    * @Description: TODO(查询所有订单)
    * @param ordShopping
    * @return
    * @return:List<ShopCartVo> 
    * @author zhouxin  
    * @date 2014年5月28日 上午9:34:43
    * @version V1.0
     */
	public void listOrderState(OrderStateDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.remark remark, ");
		hqlBuffer.append("t1.RECDESTINATION destinationid, ");
		hqlBuffer.append("t1.order_no hisno, ");
		hqlBuffer.append("t1.vendor_id vendorid, ");
		hqlBuffer.append("t1.recloc reclocid, ");
		hqlBuffer.append("t1.purloc purlocid, ");
		hqlBuffer.append("t3.state_name statedesc, ");
		hqlBuffer.append("t1.order_id orderid, ");
		hqlBuffer.append("t1.emflag as emflag, ");
		hqlBuffer.append("t4.ctloc_name as recloc, ");
		hqlBuffer.append("t5.ctloc_name as purloc, ");
		hqlBuffer.append("t6.ctlocdes_destination as destination, ");
		hqlBuffer.append("t7.name exeuser, ");
		hqlBuffer.append("t8.realname as realname, ");
		hqlBuffer.append("t1.deliverydate as deliverydate, ");
		hqlBuffer.append("t2.exedate as exedate, ");
		hqlBuffer.append("t10.HOSPITAL_NAME as hopname, ");
		hqlBuffer.append("t1.ORDER_SERIAL as serialno, ");
		hqlBuffer.append("t9.H_NAME as vendor ");
		hqlBuffer.append("from t_ord_order t1  ");
		hqlBuffer.append("left join t_ord_exestate t2 on t1.exestate_id=t2.exestate_id  ");
		hqlBuffer.append("left join t_ord_state t3 on t2.state_id=t3.state_seq ");
		hqlBuffer.append("left join t_sys_ctloc t4 on t4.ctloc_id=t1.recloc ");
		hqlBuffer.append("left join t_sys_ctloc t5 on t5.ctloc_id=t1.purloc ");
		hqlBuffer.append("left join t_sys_ctloc_destination t6 on t6.ctlocdes_id=t1.recdestination ");
		hqlBuffer.append("left join t_sys_normal_account t7 on  t7.account_id=t1.createuser ");
		hqlBuffer.append("left join t_sys_normal_user t8 on  t8.user_id=t7.user_id ");
		hqlBuffer.append("left join T_HOP_VENDOR t9 on t9.H_VENID=t1.vendor_id ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t10 on t10.HOSPITAL_ID=t1.HOP_ID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		

		if(!StringUtils.isNullOrEmpty(dto.getEmflag())){
			if(dto.getEmflag().equals("checked")){
				hqlBuffer.append("and t1.emflag=:emflag ");
				hqlParamMap.put("emflag", dto.getEmflag());
			}
		}
	
		if(dto.getStdate()!=null){
			hqlBuffer.append("and t1.plandate>=:Stdate ");
			hqlParamMap.put("Stdate", dto.getStdate());
		}
		if(dto.getEddate()!=null){
			hqlBuffer.append("and t1.plandate<=:Eddate ");
			hqlParamMap.put("Eddate", dto.getEddate());
		}
		if(dto.getReqStDate()!=null){
			hqlBuffer.append("and t1.deliverydate>=:ReqStDate ");
			hqlParamMap.put("ReqStDate", dto.getReqStDate());
		}
		if(dto.getReqEdDate()!=null){
			hqlBuffer.append("and t1.deliverydate<=:ReqEdDate ");
			hqlParamMap.put("ReqEdDate", dto.getReqEdDate());
		}
		
		if(dto.getState()!=null){
			if(dto.getState().toString().equals("0")){
				hqlBuffer.append("and t2.state_id is null ");
			}else{ 
				hqlBuffer.append("and t2.state_id=:State ");
				hqlParamMap.put("State", dto.getState());
			}
		}
		
		if(dto.getVendor()!=null){
			hqlBuffer.append("and t1.vendor_id=:Vendor ");
			hqlParamMap.put("Vendor", dto.getVendor());
		}
		
		if(dto.getPurloc()!=null){
			hqlBuffer.append("and t1.purloc=:purloc ");
			hqlParamMap.put("purloc", dto.getPurloc());
		}
		
		if(dto.getRecLoc()!=null){
			hqlBuffer.append("and t1.recloc=:recloc ");
			hqlParamMap.put("recloc", dto.getRecLoc());
		}
		if((dto.getCmpFlag()!=null)&&(dto.getCmpFlag().toString().equals("1"))){
			hqlBuffer.append("and t1.ORD_FLAG=:cmpflag ");
			hqlParamMap.put("cmpflag", dto.getCmpFlag());
		}
		if(dto.getHopId()!=null){
			hqlBuffer.append("and t1.HOP_ID=:hopid ");
			hqlParamMap.put("hopid", dto.getHopId());
		}
		
		Long userType=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		if(userType==null){
			return;
		}
		//医院
		if(userType==1){
			hqlBuffer.append("and t1.HOP_ID=:tmphop ");
			hqlParamMap.put("tmphop", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		//供应商
		if(userType==2){
			hqlBuffer.append("and t9.H_VENDORID=:tmpVendor ");
			hqlParamMap.put("tmpVendor", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		}
		
		hqlBuffer.append(" order by order_id desc ");
		if(dto.getPageModel()==null){
			PagerModel pageModel=new PagerModel();
			pageModel.setPageNo(1);
			pageModel.setPageSize(10);
			dto.setPageModel(pageModel);
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), OrderStateVo.class, "order_id");
	}
	
	
	/**
	 * 
	* @Title: OrderStateDao.java
	* @Description: TODO(查询一个订单历史)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月28日 下午5:38:25
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public List<OrderExeStateVo> listOrderExeState(OrderStateDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();

		
		hqlBuffer.append("select t2.state_name as statedesc, ");
		hqlBuffer.append("t1.exedate as exedate, ");
		hqlBuffer.append("t1.remark as remark, ");
		hqlBuffer.append("t4.realName as exeuser, ");
		hqlBuffer.append("t4.tel as tel ");
		hqlBuffer.append("from t_ord_exestate t1  ");
		hqlBuffer.append("left join t_ord_state t2 on t2.state_seq=t1.state_id ");
		hqlBuffer.append("left join t_sys_normal_account t3 on  t3.account_id=t1.user_id ");
		hqlBuffer.append("left join t_sys_normal_user t4 on  t4.user_id=t3.user_id ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		if(dto.getExeState()!=null){
			if (dto.getExeState().getOrdId()!=null){
				hqlBuffer.append("and t1.ord_id=:ord ");
				hqlParamMap.put("ord", dto.getExeState().getOrdId());
			}
			if (dto.getExeState().getDeliverId()!=null){
				hqlBuffer.append("and t1.DELIVER_ID=:deliverId ");
				hqlParamMap.put("deliverId", dto.getExeState().getDeliverId());
			}
		}

		
		hqlBuffer.append("order by t1.exestate_id  ");
		

		return jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderExeStateVo.class, hqlParamMap);
	}
	
	
	/**
	 * 
	* @Title: OrderStateDao.java
	* @Description: TODO(查询订单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月29日 上午9:22:16
	* @version V1.0
	 */
	public void listOrderItm(OrderStateDto dto){
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ord_id as orderid, ");
		hqlBuffer.append("t1.orderitm_id as orderitmid, ");
		hqlBuffer.append("t1.inc_id as hopincid, ");
		hqlBuffer.append("t2.inc_name as incname, ");
		hqlBuffer.append("t2.inc_code as inccode, ");
		hqlBuffer.append("t1.reqqty as qty , ");
		hqlBuffer.append("t1.rp as rp, ");
		hqlBuffer.append("t1.DELIVERQTY as delqty, ");
		hqlBuffer.append("t1.uom as uom, ");
		hqlBuffer.append("t3.name as manf ");
		hqlBuffer.append("from t_ord_order t4 ");
		hqlBuffer.append("left join t_ord_orderitm t1 on t1.ord_id=t4.ORDER_ID ");
		hqlBuffer.append("left join t_hop_inc t2 on t2.inc_id=t1.inc_id ");
		hqlBuffer.append("left join t_hop_manf t3 on t2.inc_manfid=t3.id ");
		hqlBuffer.append("left join T_HOP_VENDOR t10 on t10.H_VENID=t4.VENDOR_ID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		if(dto.getCmpFlag()!=null){
			hqlBuffer.append("and t1.flag=:cmpflag ");
			hqlParamMap.put("cmpflag", dto.getCmpFlag());
		}
		if(dto.getPageModel()==null){
			PagerModel pagerModel=new PagerModel();
			pagerModel.setPageNo(1);
			pagerModel.setPageSize(10);
			dto.setPageModel(pagerModel);
		}
		if(dto.getExeState()!=null){
			if (dto.getExeState().getOrdId()!=null){
				hqlBuffer.append("and t1.ord_id=:ord ");
				hqlParamMap.put("ord", dto.getExeState().getOrdId());
			}
		}
		if(dto.getOrder()!=null){
			if (!StringUtils.isNullOrEmpty(dto.getOrder().getOrderSerial())){
				hqlBuffer.append("and t4.ORDER_SERIAL=:serial ");
				hqlParamMap.put("serial", dto.getOrder().getOrderSerial());
			}
		}
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType()!=null){
			String type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType().toString();
			if(type.equals("2")){
				hqlBuffer.append("and t10.H_VENDORID=:vendorid ");
				hqlParamMap.put("vendorid", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
			}
		}
		if((dto.getOrder()==null)&&(dto.getExeState()==null)){
			return;
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), OrderItmVo.class, "orderitm_id");
	}
	
	
	
	
	/**
	 * 
	* @Title: OrderStateDao.java
	* @Description: TODO(查询咋状态列表)
	* @return
	* @return:List<State> 
	* @author zhouxin  
	* @date 2014年5月29日 下午2:40:53
	* @version V1.0
	 */
	public List<State> getComboList(){
		return (List<State>)super.getAll(State.class, "stateSeq",true);
	}
		
	@SuppressWarnings("unchecked")
	public List<OrderItm> getOrderItms(Long orderId){
		StringBuffer hql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		hql.append(" from ");
		hql.append(" OrderItm t ");
		hql.append(" where 1=1 ");
		hql.append(" and t.ordId = :key ");
		paramMap.put("key", orderId);	
		return (List<OrderItm>) this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrderByNo(String no){
		StringBuffer hql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		hql.append(" from ");
		hql.append(" Order t ");
		hql.append(" where 1=1 ");
		hql.append(" and t.orderNo = :key ");
		paramMap.put("key", no);
		List<Order> orders=(List<Order>) this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
		List<Order> orders2=new ArrayList<Order>();
		Long loginVendor=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		for(Order tmpOrder:orders){
			HopVendor hopVendor=super.get(HopVendor.class, tmpOrder.getVendorId());
			
			if((hopVendor.getHopVenId()!=null)&&(hopVendor.getHopVenId().toString().equals(loginVendor.toString()))){
				orders2.add(tmpOrder);
			}
		}
		return orders2;

	}
	
	
	
	
	
	
	
	
	/**
	 * 
	* @Title: OrderStateDao.java
	* @Description: TODO( webservice 查询医院订单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月2日 上午11:37:44
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void listOrderWS(OrderStateDto dto) {

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.order_no orderno, ");
		hqlBuffer.append("t1.REMARK remark, ");
		hqlBuffer.append("t1.EMFLAG emflag, ");
		hqlBuffer.append("t1.order_id orderid, ");
		hqlBuffer.append("t4.ctloc_name as recloc, ");
		hqlBuffer.append("t5.ctloc_name as purloc, ");
		hqlBuffer.append("t6.ctlocdes_destination as desction, ");
		hqlBuffer.append("t1.DELIVERYDATE as deliverdate, ");
		hqlBuffer.append("t10.HOSPITAL_NAME as hopname ");
		hqlBuffer.append("from t_ord_order t1  ");
		hqlBuffer.append("left join t_ord_exestate t2 on t1.exestate_id=t2.exestate_id  ");
		hqlBuffer.append("left join t_sys_ctloc t4 on t4.ctloc_id=t1.recloc ");
		hqlBuffer.append("left join t_sys_ctloc t5 on t5.ctloc_id=t1.purloc ");
		hqlBuffer.append("left join t_sys_ctloc_destination t6 on t6.ctlocdes_id=t1.recdestination ");
		hqlBuffer.append("left join T_HOP_VENDOR t9 on t9.H_VENID=t1.vendor_id ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t10 on t10.HOSPITAL_ID=t1.HOP_ID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
	

		hqlBuffer.append("and t2.state_id=:State ");
		hqlParamMap.put("State", 1);
		if(dto.getSendFlag().equals("1")){
			hqlBuffer.append("and t1.sendflag=:sendflag ");
			hqlParamMap.put("sendflag", dto.getSendFlag());
		}else{
			hqlBuffer.append("and t1.sendflag is null ");
		}
		
		hqlBuffer.append("and t9.H_VENDORID=:Vendor ");
		hqlParamMap.put("Vendor", dto.getVendor());

		dto.setOrderWSVos(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderWebVo.class, hqlParamMap));
	}
	

	/**
	 * 
	* @Title: OrderStateDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月3日 下午2:28:32
	* @version V1.0
	 */
	public void listOrderItmWS(OrderWebVo wsVo){
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ord_id as orderid, ");
		hqlBuffer.append("t2.INC_SPEC as spec, ");
		hqlBuffer.append("t7.NAME as manf, ");
		hqlBuffer.append("t1.orderitm_id as orderitmid, ");
		hqlBuffer.append("t1.inc_id as hopincid, ");
		hqlBuffer.append("t3.VEN_INC_NAME as venincname, ");
		hqlBuffer.append("t3.VEN_INC_CODE as veninccode, ");
		hqlBuffer.append("t1.reqqty as hisqty , ");
		hqlBuffer.append("t1.rp as hisrp, ");
		hqlBuffer.append("t6.VEN_FAC/t6.HOP_FAC as fac, ");
		hqlBuffer.append("t3.VEN_INC_UOMNAME as venuom, ");
		hqlBuffer.append("t1.rp/t6.VEN_FAC/t6.HOP_FAC as venrp, ");
		hqlBuffer.append("t1.reqqty/t6.VEN_FAC/t6.HOP_FAC as venqty, ");
		hqlBuffer.append("t2.INC_NAME as hopincname, ");
		hqlBuffer.append("t1.uom as hisuom ");
		hqlBuffer.append("from t_ord_orderitm t1 ");
		hqlBuffer.append("left join t_hop_inc t2 on t2.inc_id=t1.inc_id ");
		hqlBuffer.append("left join t_ven_hop_inc t6 on t1.inc_id=t6.hop_inc_id ");
		hqlBuffer.append("left join t_ven_inc t3 on t3.ven_inc_rowid=t6.ven_inc_id ");
		hqlBuffer.append("left join T_HOP_MANF t7 on t7.ID=t2.INC_MANFID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		hqlBuffer.append("and t1.ord_id=:ordrowid ");
		hqlParamMap.put("ordrowid", wsVo.getOrderid());

		//wsVo.setOrderItmWSVos(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderItmWebVo.class, hqlParamMap));
	}
    
    
    
    /******************************采用新表 *******************************************************************/
    /**
     * 
    * @Title: listOrderWS 
    * @Description: TODO(T_ORD_ORDERDETAIL,供应商查询订单接口,) 
    * @param @param wsVo    设定文件 
    * @return void    返回类型 
    * @throws 
    * @author zhouxin   
    * @date 2015年7月9日 下午9:09:00
     */
    @SuppressWarnings("unchecked")
	public void listOrdWS(OrderStateDto dto){
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ORDER_ID as orderid, ");
		hqlBuffer.append("t2.INC_SPEC as spec, ");
		hqlBuffer.append("t7.NAME as manf, ");
		hqlBuffer.append("t1.ORDER_HOP_INC_ID as hopincid, ");
		hqlBuffer.append("t3.VEN_INC_NAME as venincname, ");
		hqlBuffer.append("t3.VEN_INC_CODE as veninccode, ");
		hqlBuffer.append("t1.ORDER_HOP_QTY as hisqty , ");
		hqlBuffer.append("t1.ORDER_RP as hisrp, ");
		hqlBuffer.append("t1.ORDER_FAC as fac, ");
		hqlBuffer.append("t1.ORDER_VEN_UOM as venuom, ");
		hqlBuffer.append("t1.ORDER_RP*t1.ORDER_FAC as venrp, ");
		hqlBuffer.append("t1.ORDER_VEN_QTY as venqty, ");
		hqlBuffer.append("t2.INC_NAME as hopincname, ");
		hqlBuffer.append("t1.ORDER_HOP_UOM as hisuom, ");
		hqlBuffer.append("t1.ORDER_HISNO orderno, ");
		hqlBuffer.append("t1.ORDER_EMFLAG emflag, ");
		hqlBuffer.append("t4.ctloc_name as recloc, ");
		hqlBuffer.append("t5.ctloc_name as purloc, ");
		hqlBuffer.append("t11.ctlocdes_destination as desction, ");
		hqlBuffer.append("t10.HOSPITAL_NAME as hopname ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL t1 ");
		hqlBuffer.append("left join t_hop_inc t2 on t2.inc_id=t1.ORDER_HOP_INC_ID ");
		hqlBuffer.append("left join t_ven_inc t3 on t3.ven_inc_rowid=t1.ORDER_VEN_INC_ID ");
		hqlBuffer.append("left join T_HOP_MANF t7 on t7.ID=t2.INC_MANFID ");
		hqlBuffer.append("left join t_sys_ctloc t4 on t4.ctloc_id=t1.ORDER_RECLOC ");
		hqlBuffer.append("left join t_sys_ctloc t5 on t5.ctloc_id=t1.ORDER_PUR_LOC ");
		hqlBuffer.append("left join t_sys_ctloc_destination t11 on t11.ctlocdes_id=t1.ORDER_RECDESTINATION ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t10 on t10.HOSPITAL_ID=t1.ORDER_HOP_ID ");
		
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		if(dto.getSendFlag().equals("1")){
			hqlBuffer.append("and t1.ORDER_SENDFLAG=:sendflag ");
			hqlParamMap.put("sendflag", dto.getSendFlag());
		}else{
			hqlBuffer.append("and t1.ORDER_SENDFLAG is null ");
		}
		hqlBuffer.append("and t1.ORDER_STATE=1 and t1.ORDER_STATE is not null ");
		hqlBuffer.append("and t1.ORDER_VEN_ID=:Vendor ");
		hqlParamMap.put("Vendor", dto.getVendor());
		dto.getOrdWebVo().setOrderWebVos(jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderWebVo.class, hqlParamMap));
    }
    
    
    
    
    
    @SuppressWarnings("unchecked")
	public void listOrdGrpNo(OrderStateDto dto){

		
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();

		hqlBuffer.append("select ");
		hqlBuffer.append("ORDER_NO as orderno, ");
		hqlBuffer.append("ORDER_EMFLAG as emflag, ");
		hqlBuffer.append("t2.NAME as venname, ");
		hqlBuffer.append("ORDER_ODATE as date, ");
		hqlBuffer.append("t3.CTLOC_NAME as purloc, ");
		hqlBuffer.append("t4.CTLOC_NAME as recloc ");
		hqlBuffer.append("from T_ORD_ORDERDETAIL  t1 ");
		hqlBuffer.append("LEFT JOIN t_ven_vendor t2 ON t1.ORDER_VEN_ID = t2.VEN_ID  ");
		hqlBuffer.append("LEFT JOIN t_sys_ctloc t3 ON t1.ORDER_PUR_LOC=t3.CTLOC_ID  ");
		hqlBuffer.append("LEFT JOIN t_sys_ctloc t4 ON t1.ORDER_RECLOC =t4.CTLOC_ID  ");
		hqlBuffer.append("where 1=1 ");

		if (dto.getState() != null) {
			if (dto.getState().floatValue() != 0l) {
				hqlBuffer.append(" and ORDER_STATE=:ordstate");
				hqlParamMap.put("ordstate", dto.getState());
			}
		}
		if (dto.getStdate() != null) {
			hqlBuffer.append(" and ORDER_ODATE>=:startdate");
			hqlParamMap.put("startdate", dto.getStdate());
		}
		if (dto.getEddate() != null) {
			hqlBuffer.append(" and date_add(ORDER_ODATE,interval -1 day)<=:enddate");
			hqlParamMap.put("enddate", dto.getEddate());
		}
		if (dto.getVendor()!= null) {
			hqlBuffer.append(" and ORDER_VEN_ID=:venid");
			hqlParamMap.put("venid", dto.getVendor());
		}
		
		hqlBuffer.append(" and ORDER_USER_ID=:userid");
		hqlParamMap.put("userid", Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		hqlBuffer.append(" group by ORDER_NO order by ORDER_NO desc ");
		Integer total=jdbcTemplateWrapper.getResultCount(hqlBuffer.toString(), hqlParamMap);
		dto.getPageModel().setTotals(total);
		List<OrderGrpByNo> dataList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), OrderGrpByNo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "ORDER_NO");
		dto.getPageModel().setPageData(dataList);
    }
}

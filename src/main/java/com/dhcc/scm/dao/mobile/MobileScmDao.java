/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.mobile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrdLabel;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.sys.SysAppParam;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.ws.his.dhcclient.ArrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.GetSCIInPoImInfoRt;
import com.dhcc.scm.ws.his.dhcclient.SCI;
import com.dhcc.scm.ws.his.dhcclient.SCIInpoUmInfoRtMain;
import com.google.gson.JsonObject;

@Repository
public class MobileScmDao extends HibernatePersistentObjectDAO<OrderDetailSub> {

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	private static Log logger = LogFactory.getLog(MobileScmDao.class);
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

	}
	
	
	/**
	 * 
	* @Title: cmpOrderDetail 
	* @Description: TODO(医院pda扫码入库) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年10月20日 下午4:29:38
	 */
	public void cmpOrderDetail(JsonObject jsonObject) {
		
		StringBuffer errMsg=new StringBuffer();
		String[] propertyNames = { "appCode", "appValue" };
		Object[] values = {"INSERTHIS", "2"};
		List<SysAppParam> appParams=super.findByProperties(SysAppParam.class, propertyNames, values);
		boolean insertFlag=false;
		if(appParams.size()>=1){
			insertFlag=true;
		}
		Long userId=jsonObject.get("userid").getAsLong();
		if(StringUtils.isNotBlank(jsonObject.get("value").toString())){
			String[] subOrderIds = jsonObject.get("value").toString().split(",");
			for (String subId : subOrderIds) {
				OrderDetailSub orderDetailSub = super.get(OrderDetailSub.class,subId.replaceAll("\"",""));
				if(orderDetailSub==null){
					errMsg.append("条码"+subId+"错误,系统无此条码");
					logger.info(errMsg.toString());
					continue;
				}
				if(!StringUtils.equals(orderDetailSub.getOrdSubStatus(), "Y")){
					errMsg.append("条码"+subId+"已入库,不能再入");
					logger.info(errMsg.toString());
					continue;
				}	
				OrderDetail orderDetail=super.get(OrderDetail.class,orderDetailSub.getOrdSubDetailId());
				if(orderDetail==null){
					errMsg.append("呵呵,这是啥bug");
					logger.info(errMsg.toString());
					continue;
				}
				//更新发货表
				orderDetailSub.setOrdSubStatus("T");
				orderDetailSub.setOrdIngdrecDate(new Date());
				super.saveOrUpdate(orderDetailSub);
				// 存执行记录
				ExeState exeState = new ExeState();
				exeState.setStateId(4l);
				exeState.setUserid(userId);
				exeState.setOrdId(orderDetailSub.getOrdSubDetailId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				exeState.setRemark("pda 入库(mobile scm)");
				super.saveOrUpdate(exeState);
				
				//调用插入his中间表接口
				float fac = orderDetail.getOrderFac();
				if(insertFlag){
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
					
					// 更新订单子表发货状态
					// 调his接口
					com.dhcc.scm.ws.his.dhcclient.OperateResult operateResult = new com.dhcc.scm.ws.his.dhcclient.OperateResult();
					SCI sci = new SCI();
					operateResult = sci.getSCISoap().inpohhImport(infoRtMain);
					if (!operateResult.getResultCode().equals("1")) {
						throw new RuntimeException();
					}
				}
				// 更新订单表
				orderDetail.setOrderState(4l);
				if (orderDetail.getOrderRecQty() == null) {
					orderDetail.setOrderRecQty(0f);
				}
				orderDetail.setOrderRecQty(orderDetail.getOrderRecQty().floatValue() + orderDetailSub.getOrderSubQty().floatValue() * fac);
				super.saveOrUpdate(orderDetail);
			}
		}
		if(StringUtils.isNotBlank(errMsg.toString())){
			jsonObject.addProperty("resultMsg", errMsg.toString());
		}else{
			jsonObject.addProperty("resultCode", "0");
		}
	}
	
	
	public void cmpOrderDetailByQty(JsonObject jsonObject) {
		
		StringBuffer errMsg=new StringBuffer();
		String[] propertyNames = { "appCode", "appValue" };
		Object[] values = {"INSERTHIS", "2"};
		List<SysAppParam> appParams=super.findByProperties(SysAppParam.class, propertyNames, values);
		boolean insertFlag=false;
		if(appParams.size()>=1){
			insertFlag=true;
		}
		Long userId=jsonObject.get("userid").getAsLong();
		if(StringUtils.isNotBlank(jsonObject.get("value").toString())){
			String[] subOrderIds = jsonObject.get("value").toString().split(",");
			for (String subId : subOrderIds) {
				OrdLabel ordLabel = super.get(OrdLabel.class,subId.replaceAll("\"",""));
				if(ordLabel==null){
					errMsg.append("条码"+subId+"错误,系统无此条码");
					logger.info(errMsg.toString());
					continue;
				}
				//D 发货 T 入库
				if(!StringUtils.equals(ordLabel.getLabelStatus(), "D")){
					errMsg.append("条码"+subId+"已入库,不能再入");
					logger.info(errMsg.toString());
					continue;
				}	

				//更新条码表
				ordLabel.setLabelStatus("T");
				ordLabel.setLabelIngdrecDate(new Date());
				super.saveOrUpdate(ordLabel);
				
				OrderDetailSub orderDetailSub=super.get(OrderDetailSub.class, ordLabel.getLabelParentId());
				if(orderDetailSub==null){
					errMsg.append("条码"+subId+"错误");
					logger.info(errMsg.toString());
					continue;
				}
				orderDetailSub.setOrdSubStatus("T");
				orderDetailSub.setOrdIngdrecDate(new Date());
				super.saveOrUpdate(orderDetailSub);
				
				OrderDetail orderDetail=super.get(OrderDetail.class, orderDetailSub.getOrdSubDetailId());
				if(orderDetail==null){
					errMsg.append("条码"+subId+"错误");
					logger.info(errMsg.toString());
					continue;
				}
				// 存执行记录
				ExeState exeState = new ExeState();
				exeState.setStateId(4l);
				exeState.setUserid(userId);
				exeState.setOrdId(orderDetailSub.getOrdSubDetailId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				exeState.setRemark("pda 入库(mobile scm) ByQty");
				super.saveOrUpdate(exeState);
				
				//调用插入his中间表接口
				float fac = orderDetail.getOrderFac();
				if(insertFlag){
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
					float hopQty = 1* fac;
					sciInPoImInfoRt.setOrderQty(String.valueOf(orderDetail.getOrderHopQty()));
					sciInPoImInfoRt.setRealqty(String.valueOf(hopQty));
					if (orderDetailSub.getOrderSubRp() == null) {
						orderDetailSub.setOrderSubRp(0f);
					}
					float hopRp = orderDetailSub.getOrderSubRp().floatValue() / fac;
					sciInPoImInfoRt.setRealPrice(String.valueOf(hopRp));
					sciInPoImInfoRt.setPmsInPoID(orderDetailSub.getOrdSubId());
					arrayOfGetSCIInPoImInfoGetSCIInPoImInfoRt.getGetSCIInPoImInfo().add(sciInPoImInfoRt);
					
					// 更新订单子表发货状态
					// 调his接口
					com.dhcc.scm.ws.his.dhcclient.OperateResult operateResult = new com.dhcc.scm.ws.his.dhcclient.OperateResult();
					SCI sci = new SCI();
					operateResult = sci.getSCISoap().inpohhImport(infoRtMain);
					if (!operateResult.getResultCode().equals("1")) {
						throw new RuntimeException();
					}
				}
				// 更新订单表
				orderDetail.setOrderState(4l);
				if (orderDetail.getOrderRecQty() == null) {
					orderDetail.setOrderRecQty(0f);
				}
				orderDetail.setOrderRecQty(orderDetail.getOrderRecQty().floatValue() + orderDetailSub.getOrderSubQty().floatValue() * fac);
				super.saveOrUpdate(orderDetail);
			}
		}
		if(StringUtils.isNotBlank(errMsg.toString())){
			jsonObject.addProperty("resultMsg", errMsg.toString());
		}else{
			jsonObject.addProperty("resultCode", "0");
		}
	}
}

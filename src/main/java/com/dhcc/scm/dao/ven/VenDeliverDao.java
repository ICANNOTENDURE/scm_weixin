/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.nur.NurseBlh;
import com.dhcc.scm.dao.hop.HopIncDao;
import com.dhcc.scm.dao.ord.OrderStateDao;
import com.dhcc.scm.dto.ven.VenDeliverDto;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.Order;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.ord.OrderItm;
import com.dhcc.scm.entity.ven.VenDel;
import com.dhcc.scm.entity.ven.VenDeliver;
import com.dhcc.scm.entity.ven.VenDeliveritm;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ven.DeliverItmVo;
import com.dhcc.scm.entity.vo.ven.DeliverVo;
import com.dhcc.scm.entity.vo.ws.HisInvInfoItmWeb;

@Repository
public class VenDeliverDao extends HibernatePersistentObjectDAO<VenDeliver> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	@Resource
	private HopIncDao hopIncDao;
	
	@Resource
	private OrderStateDao orderStateDao;
	
	@Resource
	private VenIncDao venIncDao;
	
	@Resource
	private NurseBlh nurseBlh;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {

	}		
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(更具订单生成发货单 )
	* @param orderId
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月18日 下午3:29:01
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void AccectOrder(VenDeliverDto dto){
		StringBuilder hqlStr = new StringBuilder();
		Long vendorId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		Order order=super.get(Order.class, dto.getVenDeliver().getDeliverOrderid());
		VenDeliver venDeliver=new VenDeliver();
		venDeliver.setDeliverHopid(order.getHopId());
		venDeliver.setDeliverOrderid(order.getOrderId());
		venDeliver.setDeliverUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		venDeliver.setDeliverPurloc(order.getPurLoc());
		venDeliver.setDeliverRecloc(order.getRecLoc());
		venDeliver.setHopVendorId(order.getVendorId()); //医院供应商
		venDeliver.setDeliverVendorid(super.get(HopVendor.class, order.getVendorId()).getHopVenId()); //供应商
		venDeliver.setDeliverDestinationid(order.getRecDestination());
		venDeliver.setDeliverAccpecctDate(new java.sql.Timestamp(new Date().getTime()));
		super.saveOrUpdate(venDeliver);
		//保存发货主表t_ven_deliver
		
		ExeState exeState=new ExeState();
		exeState.setDeliverId(venDeliver.getDeliverId());
		exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState.setStateId(Long.valueOf(3));
		exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		super.saveOrUpdate(exeState);
		//保存订单执行表t_ord_exestate
		
		venDeliver.setDeliverExestateid(exeState.getExestateId());
		super.saveOrUpdate(venDeliver);
		dto.setVenDeliver(venDeliver);
		//更新发货主表
		
		hqlStr.delete(0, hqlStr.length());
		hqlStr.append(" from OrderItm t where t.ordId=?");
		List<OrderItm> orderItms=super.findByHql(hqlStr.toString(), dto.getVenDeliver().getDeliverOrderid());
		for(OrderItm tmpOrderItm:orderItms){
			if((tmpOrderItm.getFlag()==null)||(tmpOrderItm.getFlag().toString().equals("1"))){
				VenDeliveritm venDeliveritm=new VenDeliveritm();
				venDeliveritm.setDeliveritmHopincid(tmpOrderItm.getIncId());
				venDeliveritm.setDeliveritmOrderitmid(tmpOrderItm.getOrderitmId());
				venDeliveritm.setDeliveritmParentid(venDeliver.getDeliverId());
				
				venDeliveritm.setDeliveritmUom(tmpOrderItm.getUom());
				venDeliveritm.setDeliveritmRp(tmpOrderItm.getRp());
				//venDeliveritm.setDeliveritmVenincid(hopIncDao.getVenIncByHopInc(tmpOrderItm.getIncId()));
				
				DetachedCriteria criteria = DetachedCriteria.forClass(VenHopInc.class);
				criteria.add(Restrictions.eq("hopIncId", tmpOrderItm.getIncId()));
				List<VenHopInc> venHopIncs=super.findByCriteria(criteria);
				for(VenHopInc venHopInc:venHopIncs){
					VenInc venInc=super.get(VenInc.class, venHopInc.getVenIncId());
					if(venInc.getVenIncVenid().toString().equals(vendorId.toString())){
						venDeliveritm.setDeliveritmVenincid(venInc.getVenIncId());
						venDeliveritm.setDeliveritmFac(venHopInc.getVenIncFac());

						venDeliveritm.setDeliveritmHisRp(venDeliveritm.getDeliveritmRp().floatValue()*venHopInc.getVenIncFac().floatValue());
						if(tmpOrderItm.getDeliverqty()==null){
							venDeliveritm.setDeliveritmHisQty(tmpOrderItm.getReqqty()/venHopInc.getVenIncFac().floatValue());
						}else{
							//venDeliveritm.setDeliveritmQty(tmpOrderItm.getReqqty().floatValue()-tmpOrderItm.getDeliverqty().floatValue());
							venDeliveritm.setDeliveritmHisQty(tmpOrderItm.getReqqty().floatValue()-tmpOrderItm.getDeliverqty().floatValue());
						}
						venDeliveritm.setDeliveritmQty(venDeliveritm.getDeliveritmHisQty().floatValue()/venHopInc.getVenIncFac().floatValue());
						break;
					}
				}
				
				tmpOrderItm.setDeliverqty(tmpOrderItm.getReqqty());
				tmpOrderItm.setFlag(2l);
				super.saveOrUpdate(tmpOrderItm);
				super.saveOrUpdate(venDeliveritm);
			}
		}
		order.setOrdFlag(2l);
		super.saveOrUpdate(order);
		//保存发货明细表
	}
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(查询发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 上午9:52:04
	* @version V1.0
	 */
	public void listDeliver(VenDeliverDto dto){
		
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.DELIVER_ROWID as deliverid,  ");
		hqlBuffer.append("t1.DELIVER_ACCPECTDATE as deliveraccpectdate,  ");
		hqlBuffer.append("t1.DELIVER_DATE as deliverdate,  ");
		hqlBuffer.append("t3.state_name as statedesc,  ");
		hqlBuffer.append("t4.hospital_name as hopname,  ");
		hqlBuffer.append("t1.DELIVER_REMARK as remark,  ");
		hqlBuffer.append("t5.order_no as hisno,  ");
		hqlBuffer.append("t7.realname as deliveraccpectuser,  ");
		hqlBuffer.append("t9.realname as deliveruser,  ");
		hqlBuffer.append("t10.ctloc_name as purloc,  ");
		hqlBuffer.append("t11.ctloc_name as recloc,  ");
		hqlBuffer.append("t12.ctlocdes_destination as destination,  ");
		hqlBuffer.append("t1.DELIVER_NO as serialno  ");
		hqlBuffer.append("from  t_ven_deliver t1 ");
		hqlBuffer.append("left join t_ord_exestate t2 on t1.deliver_exestateid=t2.exestate_id ");
		hqlBuffer.append("left join t_ord_state t3 on t3.state_seq=t2.state_id ");
		hqlBuffer.append("left join t_sys_hospital t4 on t4.hospital_id=t1.deliver_hopid ");
		hqlBuffer.append("left join t_ord_order t5 on t5.order_id=t1.deliver_orderid ");
		hqlBuffer.append("left join t_sys_normal_account t6 on t6.account_id=t1.deliver_userid ");
		hqlBuffer.append("left join t_sys_normal_user t7 on t7.faccount_id=t6.account_id ");
		hqlBuffer.append("left join t_sys_normal_account t8 on t8.account_id=t1.deliver_accpuserid ");
		hqlBuffer.append("left join t_sys_normal_user t9 on t9.faccount_id=t8.account_id ");
		hqlBuffer.append("left join t_sys_ctloc t10 on t10.ctloc_id=t1.deliver_purloc ");
		hqlBuffer.append("left join t_sys_ctloc t11 on t11.ctloc_id=t1.deliver_recloc ");
		hqlBuffer.append("left join t_sys_ctloc_destination t12 on t12.ctlocdes_id=t1.deliver_destinationid ");
		//hqlBuffer.append("left join T_HOP_VENDOR t13 on t13.H_VENID=t1.DELIVER_VENDORID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
        
		if(dto.getStDate()!=null){
			hqlBuffer.append("and t1.DELIVER_DATE>=:Stdate ");
			hqlParamMap.put("Stdate", dto.getStDate());
		}
		if(dto.getEdDate()!=null){
			hqlBuffer.append("and t1.DELIVER_DATE<=:Eddate ");
			hqlParamMap.put("Eddate", dto.getEdDate());
		}
		if(dto.getAccpStDate()!=null){
			hqlBuffer.append("and t1.DELIVER_ACCPECTDATE>=:ReqStDate ");
			hqlParamMap.put("ReqStDate", dto.getAccpStDate());
		}
		if(dto.getAccpEdDate()!=null){
			hqlBuffer.append("and t1.DELIVER_ACCPECTDATE<=:ReqEdDate ");
			hqlParamMap.put("ReqEdDate", dto.getAccpEdDate());
		}
		if(dto.getHopId()!=null){
			hqlBuffer.append("and t1.DELIVER_HOPID=:hopId ");
			hqlParamMap.put("hopId", dto.getHopId());
		}
		if(!StringUtils.isNullOrEmpty(dto.getEmFlag())){
			hqlBuffer.append("and t5.emflag=:emflag ");
			hqlParamMap.put("emflag", dto.getEmFlag());
		}
		if(dto.getPurLocId()!=null){
			hqlBuffer.append("and t1.DELIVER_PURLOC=:PurLocId ");
			hqlParamMap.put("PurLocId", dto.getPurLocId());
		}
		if(dto.getState()!=null){
			hqlBuffer.append("and t3.STATE_SEQ=:State ");
			hqlParamMap.put("State", dto.getState());
		}
		
		
		
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		if(type==2){
			hqlBuffer.append("and t1.DELIVER_VENDORID=:venId ");
			hqlParamMap.put("venId", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		}
		if(type==1){
			hqlBuffer.append("and t1.deliver_hopid=:hopId2 ");
			hqlParamMap.put("hopId2", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		
		if(!StringUtils.isNullOrEmpty(dto.getSort())){

			hqlBuffer.append(" order by "+dto.getSort()+"	"+dto.getSortOrder());
			
		}
		
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DeliverVo.class, "DELIVER_ROWID");
	}
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(查询发货单明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 下午3:59:03
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void listDeliverItm(VenDeliverDto dto){
		
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.DELIVERITM_ID as deliveritmid,  ");
		hqlBuffer.append("t1.deliveritm_hopincid as hopincid,  ");
		hqlBuffer.append("t2.VEN_INC_CODE as venincncode,  ");
		hqlBuffer.append("t2.VEN_INC_NAME as venincname,  ");
		hqlBuffer.append("t3.INC_NAME as hopincname,  ");
		hqlBuffer.append("t2.VEN_INC_UOMNAME as uom,  ");
		hqlBuffer.append("t1.DELIVERITM_QTY as deliverqty,  ");
		hqlBuffer.append("t5.REQQTY/t6.VEN_INC_FAC as orderqty,  ");
		hqlBuffer.append("t5.DELIVERQTY/t6.VEN_INC_FAC as sendedqty,  ");
		hqlBuffer.append("t1.DELIVERITM_BATNO as batno,  ");
		hqlBuffer.append("t1.DELIVERITM_INVNOE as invno,  ");
		hqlBuffer.append("t1.DELIVERITM_EXPDATE as expdate,  ");
		hqlBuffer.append("t1.DELIVERITM_RP as rp,  ");
		hqlBuffer.append("t1.DELIVERITM_RPAMT as rpamt,  ");
		hqlBuffer.append("t1.DELIVERITM_ORDERITMID as orderitmid,  ");
		hqlBuffer.append("t4.NAME as manf  ");
		hqlBuffer.append("from t_ven_deliveritm t1 ");
		
		hqlBuffer.append("left join t_hop_inc t3 on t1.deliveritm_hopincid=t3.inc_id ");
		hqlBuffer.append("left join t_hop_manf t4 on t4.id=t3.inc_manfid ");
		hqlBuffer.append("left join t_ord_orderitm t5 on t5.orderitm_id=t1.deliveritm_orderitmid ");
		hqlBuffer.append("left join t_ven_hop_inc t6 on t1.deliveritm_hopincid=t6.hop_inc_id ");
		hqlBuffer.append("left join t_ven_inc t2 on t2.ven_inc_rowid=t6.ven_inc_id ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
        
		if(dto.getVenDeliver()==null){
			dto.getPageModel().setPageDataJson(null);
			dto.getPageModel().setTotals(0);
			return;
		}
		if(dto.getVenDeliver()!=null){
			if(dto.getVenDeliver().getDeliverId()!=null){
				hqlBuffer.append("and t1.DELIVERITM_PARENTID=:parentid ");
				hqlParamMap.put("parentid", dto.getVenDeliver().getDeliverId());
			}
		}
		
		hqlBuffer.append(" order by t3.INC_NAME");
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DeliverItmVo.class, "DELIVERITM_ID");
		Map<String,DeliverItmVo> map=new HashMap<String,DeliverItmVo>();
		if(dto.getPageModel().getPageData().size()>0){
			List<DeliverItmVo> deliverItmVos=new ArrayList<DeliverItmVo>();
			for(DeliverItmVo deliverItmVo:(List<DeliverItmVo>)dto.getPageModel().getPageData()){
				if(!map.containsKey(deliverItmVo.getDeliveritmid().toString())){
					map.put(deliverItmVo.getDeliveritmid().toString(), deliverItmVo);
					deliverItmVos.add(deliverItmVo);
				}
			}
			dto.getPageModel().getPageData().removeAll(dto.getPageModel().getPageData());
			dto.getPageModel().setPageData(deliverItmVos);
			dto.getPageModel().setPageSize(deliverItmVos.size());
		}
	}
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(保存更新发货表明细)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月19日 下午4:56:39
	* @version V1.0
	 */
	public void saveDeliverItm(VenDeliverDto dto){
		Long vendorId=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
		VenDeliveritm venDeliveritm=new VenDeliveritm();
		if(dto.getVenDeliveritm().getDeliveritmId()!=null){
			venDeliveritm=super.get(VenDeliveritm.class, dto.getVenDeliveritm().getDeliveritmId());
		}else{
			venDeliveritm.setDeliveritmParentid(dto.getVenDeliveritm().getDeliveritmParentid());
			venDeliveritm.setDeliveritmHopincid(dto.getVenDeliveritm().getDeliveritmHopincid());
			//venDeliveritm.setDeliveritmVenincid(hopIncDao.getVenIncByHopInc(dto.getVenDeliveritm().getDeliveritmHopincid()));
		    
			
		}
		if(dto.getVenDeliveritm().getDeliveritmQty()==null){
			dto.getVenDeliveritm().setDeliveritmQty(0f);
		}
		if(dto.getVenDeliveritm().getDeliveritmRp()==null){
			dto.getVenDeliveritm().setDeliveritmRp(0f);
		}
		DetachedCriteria criteria = DetachedCriteria.forClass(VenHopInc.class);
		criteria.add(Restrictions.eq("hopIncId", dto.getVenDeliveritm().getDeliveritmHopincid()));
		@SuppressWarnings("unchecked")
		List<VenHopInc> venHopIncs=super.findByCriteria(criteria);
		for(VenHopInc venHopInc:venHopIncs){
			VenInc venInc=super.get(VenInc.class, venHopInc.getVenIncId());
			if(venInc.getVenIncVenid().toString().equals(vendorId.toString())){
				venDeliveritm.setDeliveritmVenincid(venInc.getVenIncId());
				venDeliveritm.setDeliveritmFac(venHopInc.getVenIncFac());
				venDeliveritm.setDeliveritmHisQty(dto.getVenDeliveritm().getDeliveritmQty()*venHopInc.getVenIncFac().floatValue());
				venDeliveritm.setDeliveritmHisRp(dto.getVenDeliveritm().getDeliveritmRp().floatValue()*venHopInc.getVenIncFac().floatValue());
				break;
			}
		}
		
		venDeliveritm.setDeliveritmQty(dto.getVenDeliveritm().getDeliveritmQty());
		venDeliveritm.setDeliveritmBatno(dto.getVenDeliveritm().getDeliveritmBatno());
		venDeliveritm.setDeliveritmExpdate(dto.getVenDeliveritm().getDeliveritmExpdate());
		venDeliveritm.setDeliveritmInvnoe(dto.getVenDeliveritm().getDeliveritmInvnoe());
		venDeliveritm.setDeliveritmRp(dto.getVenDeliveritm().getDeliveritmRp());
		venDeliveritm.setDeliveritmOrderitmid(dto.getVenDeliveritm().getDeliveritmOrderitmid());
		super.saveOrUpdate(venDeliveritm);
		dto.setVenDeliveritm(venDeliveritm);
	}
	
	@SuppressWarnings("unchecked")
	public List<VenDeliveritm> getDeliveritms(Long deliverId){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from VenDeliveritm h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.deliveritmParentid = :deliverId ");
		hqlParamMap.put("deliverId",deliverId);
		return (List<VenDeliveritm>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
	
		
	}
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(导入发票,按发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月20日 下午2:28:19
	* @version V1.0
	 */
	public void impInv(VenDeliverDto dto){
		List<VenDeliveritm> venDeliveritms =this.getDeliveritms(dto.getVenDeliver().getDeliverId());
		
		for(VenDeliveritm tmpVenDeliveritm:venDeliveritms){
			int j=0;;
			for(int i=0;i<dto.getVenDeliveritms().size();i++){
				String tmpString=tmpVenDeliveritm.getDeliveritmHopincid().toString();
				VenDeliveritm tmpsVenDeliveritm=dto.getVenDeliveritms().get(i);
				String tmpsString=tmpsVenDeliveritm.getDeliveritmHopincid().toString();
				if(tmpString.equals(tmpsString)){
					if(!StringUtils.isNullOrEmpty(tmpsVenDeliveritm.getDeliveritmBatno())){
						tmpVenDeliveritm.setDeliveritmBatno(tmpsVenDeliveritm.getDeliveritmBatno());
					}
					if(tmpsVenDeliveritm.getDeliveritmExpdate()!=null){
						tmpVenDeliveritm.setDeliveritmExpdate(tmpsVenDeliveritm.getDeliveritmExpdate());
					}
					if(!StringUtils.isNullOrEmpty(tmpsVenDeliveritm.getDeliveritmInvnoe())){
						tmpVenDeliveritm.setDeliveritmInvnoe(tmpsVenDeliveritm.getDeliveritmInvnoe());
					}
					if(tmpsVenDeliveritm.getDeliveritmQty()!=null){
						tmpVenDeliveritm.setDeliveritmQty(tmpsVenDeliveritm.getDeliveritmQty());
					}
					if(tmpsVenDeliveritm.getDeliveritmRp()!=null){
						tmpVenDeliveritm.setDeliveritmRp(tmpsVenDeliveritm.getDeliveritmRp());
					}
					j=i;
					
					super.save(tmpVenDeliveritm);
				}
			}
			if(j!=0){
				dto.getVenDeliveritms().remove(j);
				j=0;
			}
		}
		if(dto.getVenDeliveritms().size()>0){
			for(VenDeliveritm tmpssVenDeliveritm:dto.getVenDeliveritms()){
				for(VenDeliveritm tmpsssVenDeliveritm:venDeliveritms){
					String tmpString=tmpssVenDeliveritm.getDeliveritmHopincid().toString();
					String tmpsString=tmpsssVenDeliveritm.getDeliveritmHopincid().toString();
					if(tmpString.equals(tmpsString)){
						tmpssVenDeliveritm.setDeliveritmOrderitmid(tmpsssVenDeliveritm.getDeliveritmOrderitmid());
						tmpssVenDeliveritm.setDeliveritmParentid(dto.getVenDeliver().getDeliverId());
						super.save(tmpssVenDeliveritm);
					}
				}
			}
		}
		
	}
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(更据订单号导入发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月20日 下午10:46:44
	* @version V1.0
	 */
	public void impByOrder(VenDeliverDto dto){
		String no=UUID.randomUUID().toString();
		Iterator<String> it = dto.getOrderMap().keySet().iterator();
		q1:
		while(it.hasNext()){
			String key = (String) it.next();
			List<Order> orders=orderStateDao.getOrderByNo(key);
			
			Order order=new Order();
			if(orders.size()==1){
				order=orders.get(0);
			}
			if(orders.size()==0){
				dto.setOpFlg("2");
				dto.setMsg(key+"订单号在his里没有");
				break q1;
			}
			if(orders.size()>1){
				dto.setOpFlg("2");
				dto.setMsg(key+"订单号在his里重复");
				break q1;
			}
			
			/*********************保存发货表关联订单执行表t_ord_exestate和发货表t_ven_delivery  start***********************/
			VenDeliver venDeliver=new VenDeliver();
			venDeliver.setDeliverHopid(order.getHopId());
			venDeliver.setDeliverOrderid(order.getOrderId());
			venDeliver.setDeliverUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
			venDeliver.setDeliverPurloc(order.getPurLoc());
			venDeliver.setDeliverRecloc(order.getRecLoc());
			venDeliver.setHopVendorId(order.getVendorId()); //医院供应商
			venDeliver.setDeliverVendorid(super.get(HopVendor.class, order.getVendorId()).getHopVenId()); //供应商
			venDeliver.setDeliverDestinationid(order.getRecDestination());
			venDeliver.setDeliverAccpecctDate(new java.sql.Timestamp(new Date().getTime()));
			venDeliver.setDeliverNo(no);
			super.saveOrUpdate(venDeliver);
			ExeState exeState=new ExeState();
			exeState.setDeliverId(venDeliver.getDeliverId());
			exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState.setStateId(Long.valueOf(2));
			exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
			super.saveOrUpdate(exeState);
			venDeliver.setDeliverExestateid(exeState.getExestateId());
			super.saveOrUpdate(venDeliver);
			/*************保存发货表关联订单执行表t_ord_exestate和发货表t_ven_delivery  end**********************/
			ExeState exeState2=new ExeState();
			exeState2.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState2.setOrdId(order.getOrderId());
			exeState2.setStateId(Long.valueOf(2));
			exeState2.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
			super.saveOrUpdate(exeState2);
			order.setExeStateId(exeState2.getExestateId());
			super.saveOrUpdate(venDeliver);
			//保存订单表关联订单执行表t_ord_exestate和订单表t_ord_order
			
			
			
			//保存发货子表 ，一条订单会有多个批次的发货记录
			List<VenDeliveritm> venDeliveritms = dto.getOrderMap().get(key);
			List<OrderItm> orderItms=orderStateDao.getOrderItms(order.getOrderId());
			for(OrderItm tmpOrderItm:orderItms){
				int j=0;
				for(int i=0;i<venDeliveritms.size();i++){
					if(tmpOrderItm.getIncId().toString().equals(venDeliveritms.get(i).getDeliveritmHopincid().toString())){
						VenDeliveritm tmpVenDeliveritm=venDeliveritms.get(i);
						tmpVenDeliveritm.setDeliveritmOrderitmid(tmpOrderItm.getOrderitmId());
						tmpVenDeliveritm.setDeliveritmParentid(venDeliver.getDeliverId());
						super.saveOrUpdate(tmpVenDeliveritm);
						j=1;
					}
				}
				if(j!=0){
					dto.getOrderMap().get(key).remove(j);
					j=0;
				}
			}
			//一个药多批次
			if(dto.getOrderMap().get(key).size()>0){
				for(VenDeliveritm venDeliveritm:dto.getOrderMap().get(key)){
					for(OrderItm tmpOrderItm:orderItms){
						if(tmpOrderItm.getIncId().toString().equals(venDeliveritm.getDeliveritmHopincid().toString())){
							venDeliveritm.setDeliveritmOrderitmid(tmpOrderItm.getOrderitmId());
							venDeliveritm.setDeliveritmParentid(venDeliver.getDeliverId());
							super.saveOrUpdate(venDeliveritm);
						}
					}
				}
				
			}
		}
	}
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(供应商发货)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 上午11:03:31
	* @version V1.0
	 */
	public void deliver(VenDeliverDto dto){
		
		ExeState exeState=new ExeState();
		exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState.setDeliverId(dto.getVenDeliver().getDeliverId());
		exeState.setStateId(Long.valueOf(5));  //发货
		exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		super.saveOrUpdate(exeState);
		Long deliverId=dto.getVenDeliver().getDeliverId();
		VenDeliver venDeliver=super.get(VenDeliver.class, deliverId);
		venDeliver.setDeliverDate(new java.sql.Timestamp(new Date().getTime()));
		venDeliver.setDeliverUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		venDeliver.setDeliverExestateid(exeState.getExestateId());
		super.saveOrUpdate(venDeliver);
		
		
		ExeState exeState2=new ExeState();
		exeState2.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState2.setOrdId(venDeliver.getDeliverOrderid());
		exeState2.setStateId(Long.valueOf(5));  //发货
		exeState2.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		super.saveOrUpdate(exeState2);
		Order order=super.get(Order.class, venDeliver.getDeliverOrderid());
		order.setExeStateId(exeState2.getExestateId());
		
		
		
		
		List<VenDeliveritm> venDeliveritms =this.getDeliveritms(dto.getVenDeliver().getDeliverId());
		for(VenDeliveritm tmpVenDeliveritm:venDeliveritms){
			OrderItm orderItm=super.get(OrderItm.class, tmpVenDeliveritm.getDeliveritmOrderitmid());
			if(orderItm.getDeliverqty()==null){
				orderItm.setDeliverqty(0f);
			}
			if(tmpVenDeliveritm.getDeliveritmQty()==null){
				tmpVenDeliveritm.setDeliveritmQty(0f);
			}
			Float deliverqty=orderItm.getDeliverqty().floatValue()+tmpVenDeliveritm.getDeliveritmQty().floatValue();
			//logger.info("deliverqty:"+deliverqty);
			//logger.info("deliverqty1:"+orderItm.getDeliverqty().floatValue());
			//logger.info("deliverqty2:"+tmpVenDeliveritm.getDeliveritmQty().floatValue());
			orderItm.setDeliverqty(deliverqty);
			orderItm.setFlag(Long.valueOf("1"));
			if((orderItm.getDeliverqty().floatValue()-orderItm.getReqqty().floatValue())>=0){
				orderItm.setFlag(Long.valueOf("2"));
			}
			super.saveOrUpdate(orderItm);
		}
		
		List<OrderItm> orderItms=orderStateDao.getOrderItms(order.getOrderId());
		int orderFlag=0;
		for(OrderItm tmpOrderItm:orderItms){
			if(tmpOrderItm.getFlag()!=null){
				if(!tmpOrderItm.getFlag().toString().equals("2")){
					orderFlag=1;
				}
			}else{
				orderFlag=1;
			}
		}
		order.setOrdFlag(Long.valueOf("1"));
		if(orderFlag==0){
			order.setOrdFlag(Long.valueOf("2"));
		}
		super.saveOrUpdate(order);
	}
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(删除发货单)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 下午4:14:11
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void delete(VenDeliverDto dto){
		//VenDeliver venDeliver=super.get(VenDeliver.class, dto.getVenDeliver().getDeliverId(),LockMode.WRITE); //(VenDeliver.class, dto.getVenDeliver().getDeliverId());;
		//以收货
		VenDeliver venDeliver=super.get(VenDeliver.class, dto.getVenDeliver().getDeliverId());
		if(super.get(ExeState.class, venDeliver.getDeliverExestateid()).getStateId().toString().equals("4")){
			
			dto.setOpFlg("2");
			return;
		}
		Order order=super.get(Order.class, venDeliver.getDeliverOrderid());
		super.delete(venDeliver);
		StringBuilder hqlBuffer = new StringBuilder();
	
		
		hqlBuffer.delete(0, hqlBuffer.length());
		hqlBuffer.append(" delete from ExeState t ");
		hqlBuffer.append(" where t.deliverId = ?");
		this.updateByHqlWithFreeParam(hqlBuffer.toString(),dto.getVenDeliver().getDeliverId());
		
		
		ExeState exeState=new ExeState();
		exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState.setOrdId(order.getOrderId());
		exeState.setStateId(Long.valueOf(1));  //新建
		exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		exeState.setRemark("删除发货单");
		super.saveOrUpdate(exeState);
		
	
		order.setExeStateId(exeState.getExestateId());
		order.setOrdFlag(1l);
		super.saveOrUpdate(order);
		
		
		
		//List<VenDeliveritm> venDeliveritms =this.getDeliveritms(dto.getVenDeliver().getDeliverId());
		DetachedCriteria criteria =null;
		criteria = DetachedCriteria.forClass(VenDeliveritm.class);
		criteria.add(Restrictions.eq("deliveritmParentid",dto.getVenDeliver().getDeliverId()));
		List<VenDeliveritm> venDeliveritms=super.findByCriteria(criteria);
		for(VenDeliveritm tmpVenDeliveritm:venDeliveritms){
			OrderItm orderItm=super.get(OrderItm.class, tmpVenDeliveritm.getDeliveritmOrderitmid());
			if(orderItm.getDeliverqty()==null){
				orderItm.setDeliverqty(0f);
			}
			if(tmpVenDeliveritm.getDeliveritmQty()==null){
				tmpVenDeliveritm.setDeliveritmQty(0f);
			}
			Float deliverqty=orderItm.getDeliverqty().floatValue()-tmpVenDeliveritm.getDeliveritmHisQty().floatValue();
			orderItm.setDeliverqty(deliverqty);
			orderItm.setFlag(1l);
			super.saveOrUpdate(orderItm);
		}
		
		hqlBuffer.delete(0, hqlBuffer.length());
		hqlBuffer.append(" delete from VenDeliveritm t ");
		hqlBuffer.append(" where t.deliveritmParentid = ?");
		this.updateByHqlWithFreeParam(hqlBuffer.toString(),dto.getVenDeliver().getDeliverId());
	}
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(取消发货状态)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月24日 下午4:52:00
	* @version V1.0
	 */
	public void cancelComplete(VenDeliverDto dto){
		VenDeliver venDeliver=super.get(VenDeliver.class, dto.getVenDeliver().getDeliverId());
		Order order=super.get(Order.class, venDeliver.getDeliverOrderid());
		//以收货
		if(!super.get(ExeState.class, venDeliver.getDeliverExestateid()).getStateId().toString().equals("5")){
			
			dto.setOpFlg("2");
			return;
		}
		ExeState exeState=new ExeState();
		exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState.setDeliverId(dto.getVenDeliver().getDeliverId());
		exeState.setStateId(Long.valueOf(2));  //接收
		exeState.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		exeState.setRemark("取消发货状态");
		super.saveOrUpdate(exeState);
		
		venDeliver.setDeliverExestateid(exeState.getExestateId());
		super.saveOrUpdate(venDeliver);
		
		
		ExeState exeState2=new ExeState();
		exeState2.setExedate(new java.sql.Timestamp(new Date().getTime()));
		exeState2.setOrdId(order.getOrderId());
		exeState2.setStateId(Long.valueOf(2));  //接收
		exeState2.setUserid(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		exeState2.setRemark("取消发货状态");
		super.saveOrUpdate(exeState2);
		
		order.setExeStateId(exeState2.getExestateId());
		super.saveOrUpdate(order);
		
		
		List<VenDeliveritm> venDeliveritms =this.getDeliveritms(dto.getVenDeliver().getDeliverId());
		for(VenDeliveritm tmpVenDeliveritm:venDeliveritms){
			OrderItm orderItm=super.get(OrderItm.class, tmpVenDeliveritm.getDeliveritmOrderitmid());
			if(orderItm.getDeliverqty()==null){
				orderItm.setDeliverqty(0f);
			}
			if(tmpVenDeliveritm.getDeliveritmQty()==null){
				tmpVenDeliveritm.setDeliveritmQty(0f);
			}
			Float deliverqty=orderItm.getDeliverqty().floatValue()-tmpVenDeliveritm.getDeliveritmQty().floatValue();
			orderItm.setDeliverqty(deliverqty);
			orderItm.setFlag(Long.valueOf("1"));
			super.saveOrUpdate(orderItm);
		}
		
	}
	
	
	
	
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(根据供应商发货生成发货单webservice 导入)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月9日 下午2:49:36
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void Deliver(Map<String, List<VenDeliveritm>> map){
		
		VenDel venDel=new VenDel();
		venDel.setDelvVendorid(WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		venDel.setDelvDate(new Date());
		super.save(venDel);
		
		String no=venDel.getDelvId();
		
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()){
			String key = (String) it.next();
			Order order=super.get(Order.class, Long.valueOf(key));
			//保存发货主表
			VenDeliver venDeliver=new VenDeliver();
			venDeliver.setDeliverHopid(order.getHopId());
			venDeliver.setDeliverOrderid(order.getOrderId());
			venDeliver.setDeliverPurloc(order.getPurLoc());
			venDeliver.setDeliverRecloc(order.getRecLoc());
			venDeliver.setHopVendorId(order.getVendorId()); //医院供应商
			venDeliver.setDeliverVendorid(super.get(HopVendor.class, order.getVendorId()).getHopVenId()); //供应商
			venDeliver.setDeliverDestinationid(order.getRecDestination());
			venDeliver.setDeliverDate(new java.sql.Timestamp(new Date().getTime()));
			venDeliver.setDeliverWpsId(map.get(key).get(0).getDeliveritmWpsId());
			venDeliver.setDeliverNo(no);
			super.saveOrUpdate(venDeliver);
			//执行表(发货表)
			ExeState exeState=new ExeState();
			exeState.setDeliverId(venDeliver.getDeliverId());
			exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState.setStateId(3l);  //导入
			exeState.setRemark("平台 webservice 导入");
			super.saveOrUpdate(exeState);
			//更新发货表执行表ID
			venDeliver.setDeliverExestateid(exeState.getExestateId());
			super.saveOrUpdate(venDeliver);
			//执行表(订单表)
			ExeState exeState1=new ExeState();
			exeState1.setOrdId(order.getOrderId());
			exeState1.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState1.setStateId(3l);  //导入
			exeState1.setRemark("平台 webservice 导入");
			super.saveOrUpdate(exeState1);
			//更新订单表执行状态
			order.setExeStateId(exeState1.getExestateId());
			super.saveOrUpdate(order);
			
			
			
			//保存发货明细表
			List<VenDeliveritm> deliveritms=map.get(key);
			for(VenDeliveritm tmpVenDeliveritm:deliveritms){
				tmpVenDeliveritm.setDeliveritmParentid(venDeliver.getDeliverId());
				super.saveOrUpdate(tmpVenDeliveritm);
				
				
				/********************************暂时在这里处理 ******************************************/
				//更新订单表里发货数量
				OrderItm orderItm=super.get(OrderItm.class, tmpVenDeliveritm.getDeliveritmOrderitmid());
				if(orderItm.getDeliverqty()==null){
					orderItm.setDeliverqty(0f);
				}
				Float deliverqty=orderItm.getDeliverqty().floatValue()+tmpVenDeliveritm.getDeliveritmHisQty().floatValue();
				orderItm.setDeliverqty(deliverqty);
				orderItm.setFlag(Long.valueOf("1"));
				if((orderItm.getDeliverqty().floatValue()-orderItm.getReqqty().floatValue())>=0){
					orderItm.setFlag(Long.valueOf("2"));
				}
				super.saveOrUpdate(orderItm);
			}
			
			
			
			//更新订单表
			DetachedCriteria criteria = DetachedCriteria.forClass(OrderItm.class);
			criteria.add(Restrictions.eq("orderitmId",Long.valueOf(key)));
			List<OrderItm> orderItms=super.findByCriteria(criteria);
			int orderFlag=0;
			for(OrderItm tmpOrderItm:orderItms){
				if(tmpOrderItm.getFlag()!=null){
					if(!tmpOrderItm.getFlag().toString().equals("2")){
						orderFlag=1;
					}
				}else{
					orderFlag=1;
				}
			}
			//1是部分上传，2是全部上传
			order.setOrdFlag(1l);
			if(orderFlag==0){
				order.setOrdFlag(2l);
			}
			super.saveOrUpdate(order);
		}	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(根据订单明细导入发票，excel 导入)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月22日 下午3:14:54
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public void impByOrderItm(VenDeliverDto dto){
		
		VenDel venDel=new VenDel();
		venDel.setDelvDate(new Date());
		super.save(venDel);
		
		String no=venDel.getDelvId();
		Map<String,List<VenDeliveritm>> map=dto.getOrderMap();
		Iterator<String> it = map.keySet().iterator();
		dto.setMsg("<br>");
		dto.setOpFlg("1");
		while(it.hasNext()){
			String key = (String) it.next();
			Order order=super.get(Order.class, Long.valueOf(key));
			//保存发货主表
			VenDeliver venDeliver=new VenDeliver();
			venDeliver.setDeliverHopid(order.getHopId());
			venDeliver.setDeliverOrderid(order.getOrderId());
			venDeliver.setDeliverPurloc(order.getPurLoc());
			venDeliver.setDeliverRecloc(order.getRecLoc());
			venDeliver.setHopVendorId(order.getVendorId()); //医院供应商
			venDeliver.setDeliverVendorid(super.get(HopVendor.class, order.getVendorId()).getHopVenId()); //供应商
			venDeliver.setDeliverDestinationid(order.getRecDestination());
			venDeliver.setDeliverDate(new java.sql.Timestamp(new Date().getTime()));
			venDeliver.setDeliverAccpecctDate(new java.sql.Timestamp(new Date().getTime()));
			venDeliver.setDeliverWpsId(map.get(key).get(0).getDeliveritmWpsId());
			venDeliver.setDeliverNo(no);
			super.saveOrUpdate(venDeliver);
			//更新流水表供应商id
			venDel.setDelvVendorid(venDeliver.getDeliverVendorid());
			super.saveOrUpdate(venDel);
			//执行表(发货表)
			ExeState exeState=new ExeState();
			exeState.setDeliverId(venDeliver.getDeliverId());
			exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState.setStateId(3l);
			exeState.setRemark(dto.getOperateType());
			super.saveOrUpdate(exeState);
			//更新发货表执行表ID
			venDeliver.setDeliverExestateid(exeState.getExestateId());
			super.saveOrUpdate(venDeliver);
			//执行表(订单表)
			ExeState exeState1=new ExeState();
			exeState1.setOrdId(order.getOrderId());
			exeState1.setExedate(new java.sql.Timestamp(new Date().getTime()));
			exeState1.setStateId(3l);
			exeState1.setRemark(dto.getOperateType());
			super.saveOrUpdate(exeState1);
			//更新订单表执行状态
			order.setExeStateId(exeState1.getExestateId());
			super.saveOrUpdate(order);
			
			
			Map<String, Float> delQtyMap=new HashMap<String,Float>();
			//保存发货明细表
			List<VenDeliveritm> deliveritms=map.get(key);
			for(VenDeliveritm tmpVenDeliveritm:deliveritms){
				tmpVenDeliveritm.setDeliveritmParentid(venDeliver.getDeliverId());
				if(tmpVenDeliveritm.getDeliveritmFac()==null){
					float fac=venIncDao.getFacByhopInc(tmpVenDeliveritm.getDeliveritmHopincid(), venDeliver.getDeliverVendorid());
					tmpVenDeliveritm.setDeliveritmFac(fac);
					tmpVenDeliveritm.setDeliveritmHisQty(tmpVenDeliveritm.getDeliveritmQty().floatValue()*fac);	
					tmpVenDeliveritm.setDeliveritmHisRp(tmpVenDeliveritm.getDeliveritmRp().floatValue()*fac);
					tmpVenDeliveritm.setDeliveritmFac(fac);
				}
				super.saveOrUpdate(tmpVenDeliveritm);
				if(delQtyMap.containsKey(tmpVenDeliveritm.getDeliveritmOrderitmid().toString())){
					Float delQty=delQtyMap.get(tmpVenDeliveritm.getDeliveritmOrderitmid().toString());
					delQtyMap.put(tmpVenDeliveritm.getDeliveritmOrderitmid().toString(),delQty+tmpVenDeliveritm.getDeliveritmHisQty().floatValue());
					
				}else{
					delQtyMap.put(tmpVenDeliveritm.getDeliveritmOrderitmid().toString(),tmpVenDeliveritm.getDeliveritmHisQty().floatValue());
				}
			}
			
			
			//更新订单表
			DetachedCriteria criteria=null;
			criteria = DetachedCriteria.forClass(OrderItm.class);
			criteria.add(Restrictions.eq("ordId",Long.valueOf(key)));
			List<OrderItm> orderItms=super.findByCriteria(criteria);
			order.setOrdFlag(2l);
			for(OrderItm tmpOrderItm:orderItms){
				
				if(delQtyMap.containsKey(tmpOrderItm.getOrderitmId().toString())){
					if(tmpOrderItm.getDeliverqty()==null){tmpOrderItm.setDeliverqty(0f);}
					Float deliverqty=tmpOrderItm.getDeliverqty().floatValue()+delQtyMap.get(tmpOrderItm.getOrderitmId().toString()).floatValue();
					tmpOrderItm.setDeliverqty(deliverqty);
					tmpOrderItm.setFlag(1l);
					if((tmpOrderItm.getDeliverqty().floatValue()-tmpOrderItm.getReqqty().floatValue())==0){
						tmpOrderItm.setFlag(2l);	
					}
					if((tmpOrderItm.getDeliverqty().floatValue()-tmpOrderItm.getReqqty().floatValue())>0){
						dto.setOpFlg("-1");
						dto.setMsg(dto.getMsg()+"订单明细ID:"+tmpOrderItm.getOrderitmId()+"发货数量大于订单数量<br> 订单数量:"+tmpOrderItm.getReqqty().floatValue()+" 发货数量:"+delQtyMap.get(tmpOrderItm.getOrderitmId().toString()).floatValue());
					}
					if((tmpOrderItm.getDeliverqty().floatValue()-tmpOrderItm.getReqqty().floatValue())<0){
						order.setOrdFlag(1l);
					}
					super.saveOrUpdate(tmpOrderItm);
				}
			}
			//1是部分上传，2是全部上传
			super.saveOrUpdate(order);
			delQtyMap=null;
			
		}
		if(!dto.getOpFlg().equals("1")){
			throw new RuntimeException();
		}
	}
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @return
	* @return:boolean 
	* @author zhouxin  
	* @date 2014年7月22日 下午3:16:46
	* @version V1.0
	 */
	public boolean checkInvExist(String inv,Long orditmId){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(VenDeliveritm.class);
		criteria.add(Restrictions.eq("deliveritmInvnoe", inv));
		criteria.add(Restrictions.eq("deliveritmOrderitmid", orditmId));
		criteria.add(Restrictions.isNull("deliveritmRecFlag"));
		@SuppressWarnings("unchecked")
		List<VenDeliveritm> deliveritms=super.findByCriteria(criteria);
		if(deliveritms.size()>0){
			return false;
		}
		return true;
	}
	
	public Float getFac(Long hopId,Long venId){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(VenHopInc.class);
		criteria.add(Restrictions.eq("hopIncId", hopId));
		criteria.add(Restrictions.eq("venIncId", venId));
		@SuppressWarnings("unchecked")
		List<VenHopInc> venHopIncs=super.findByCriteria(criteria);
		if(venHopIncs.size()==0){
			return 1f;
		}
		return venHopIncs.get(0).getVenFac()/venHopIncs.get(0).getHopFac();
	}
	
	
	
	/**
	 * 
	* @Title: VenDeliverDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param hopId
	* @param vendorId
	* @param inv
	* @return
	* @return:HisInvInfoWeb 
	* @author zhouxin  
	* @date 2014年7月30日 上午11:43:01
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public List<HisInvInfoItmWeb> getRecItmByInv_bak(Long hopId,Long vendorId,String inv){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		
		hqlBuffer.append("select ");
		
		hqlBuffer.append("t1.INC_CODE as hopinccode, ");
		hqlBuffer.append("t3.ORDER_NO as orderno, ");
		hqlBuffer.append("t.DELIVERITM_ID as deliveritmid, ");
		hqlBuffer.append("t.DELIVERITM_HISRP as rp, ");
		hqlBuffer.append("t.DELIVERITM_HISQTY as qty, ");
		hqlBuffer.append("t.DELIVERITM_RPAMT as rpamt, ");
		hqlBuffer.append("t.DELIVERITM_EXPDATE as expdate, ");
		hqlBuffer.append("t.DELIVERITM_BATNO as batno ");
		
		hqlBuffer.append("from t_ven_deliveritm t  left join t_ven_deliver t2  ");
		hqlBuffer.append("on t.deliveritm_parentid=t2.deliver_rowid  ");
		hqlBuffer.append("left join t_hop_inc t1  on t.DELIVERITM_HOPINCID=t1.INC_ID ");
		hqlBuffer.append("left join t_ord_order t3  on t2.DELIVER_ORDERID=t3.ORDER_ID ");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append("and t.deliveritm_invnoe=:invNo ");
		hqlBuffer.append("and t.DELIVERITM_RECFLAG is null ");
		hqlBuffer.append("and t2.deliver_hopid=:hopId ");
		hqlBuffer.append("and t2.deliver_vendorid=:vendorId ");
		hqlParamMap.put("invNo", inv);
		hqlParamMap.put("hopId", hopId);
		hqlParamMap.put("vendorId", vendorId);
		
		List<HisInvInfoItmWeb> hisInvInfoWebs=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), HisInvInfoItmWeb.class, hqlParamMap);
		return hisInvInfoWebs;
	}
	
	
	
	public void listDeliverNew(VenDeliverDto dto){
		
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append(" distinct t2.ORDER_NO hisno  ");
		hqlBuffer.append("FROM ");
		hqlBuffer.append("T_ORD_ORDERDETAILSUB t1 ");
		hqlBuffer.append("LEFT JOIN T_ORD_ORDERDETAIL t2 ON T1.ORDSUB_DETAIL_ID = t2.ORDER_ID ");

		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
        
		if(dto.getStDate()!=null){
			hqlBuffer.append("and t2.ORDER_ODATE>=:Stdate ");
			hqlParamMap.put("Stdate", dto.getStDate());
		}
		if(dto.getEdDate()!=null){
			hqlBuffer.append("and t2.ORDER_ODATE<=:Eddate ");
			hqlParamMap.put("Eddate", dto.getEdDate());
		}
		if(dto.getHopId()!=null){
			hqlBuffer.append("and t1.ORDER_HOP_ID=:hopId ");
			hqlParamMap.put("hopId", dto.getHopId());
		}
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		if(type==2){
			hqlBuffer.append("and t2.ORDER_VEN_ID=:venId ");
			hqlParamMap.put("venId", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		}
		if(type==1){
			hqlBuffer.append("and t2.ORDER_HOP_ID=:hopId2 ");
			hqlParamMap.put("hopId2", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getPrintFlag())){
			if(dto.getPrintFlag().equals("1")){
				hqlBuffer.append("and t1.ORDSUB_PRINTFLAG=1 ");
			}
			if(dto.getPrintFlag().equals("2")){
				hqlBuffer.append("and t1.ORDSUB_PRINTFLAG is null ");
			}
		}
		if(dto.getState()!=null){
			hqlBuffer.append("and t2.ORDER_STATE=:status ");
			hqlParamMap.put("status", dto.getState());
		}
		if(!StringUtils.isNullOrEmpty(dto.getSort())){
			hqlBuffer.append(" order by "+dto.getSort()+"	"+dto.getSortOrder());	
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DeliverVo.class, "distinct t2.ORDER_NO");
	}
	
	public void listDeliverItmNew(VenDeliverDto dto){
		
		
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.ORDSUB_ID as deliveritmid,  ");
		hqlBuffer.append("t3.VEN_INC_CODE as venincncode,  ");
		hqlBuffer.append("t3.VEN_INC_NAME as venincname,  ");
		hqlBuffer.append("t3.VEN_INC_UOMNAME as uom,  ");
		hqlBuffer.append("t1.ORDSUB_QTY as deliverqty,  ");
		hqlBuffer.append("t2.ORDER_VEN_QTY as orderqty,  ");
		hqlBuffer.append("t1.ORDSUB_QTY as sendedqty,  ");
		hqlBuffer.append("t1.ORDSUB_BATNO as batno,  ");
		hqlBuffer.append("t1.ORDSUB_INVNO as invno,  ");
		hqlBuffer.append("t1.ORDSUB_EXPDATE as expdate,  ");
		hqlBuffer.append("t1.ORDSUB_RP as rp,  ");
		hqlBuffer.append(" round(t1.ORDSUB_RP*t1.ORDSUB_QTY,2) as rpamt,  ");
		hqlBuffer.append("t2.ORDER_ID as orderitmid,  ");
		hqlBuffer.append("t5.HOSPITAL_NAME as hopname,  ");
		hqlBuffer.append("t4.NAME as manf  ");
		hqlBuffer.append("from T_ORD_ORDERDETAILSUB t1 ");
		hqlBuffer.append("LEFT JOIN T_ORD_ORDERDETAIL t2 ON T1.ORDSUB_DETAIL_ID = t2.ORDER_ID ");
		hqlBuffer.append("LEFT JOIN T_VEN_INC t3 ON t3.VEN_INC_ROWID = t2.ORDER_VEN_INC_ID ");
		hqlBuffer.append("left join t_hop_manf t4 on t4.id=t3.VEN_INC_MANFID ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t5 on t5.HOSPITAL_ID=t2.ORDER_HOP_ID ");
		hqlBuffer.append("where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
        

		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getOrderno())){
			hqlBuffer.append("and t2.ORDER_NO=:orderno ");
			hqlParamMap.put("orderno", dto.getOrderno());
		}
		
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getImpId())){
			hqlBuffer.append("and t1.ORDSUB_IMP_ID=:impid ");
			hqlParamMap.put("impid", dto.getImpId());
		}
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), DeliverItmVo.class, "t1.ORDSUB_ID");


	}
	
	/**
	 * 
	* @Title: impInvByOrd 
	* @Description: TODO(导入发票) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月2日 上午11:48:30
	 */
	public void impInvByOrd(VenDeliverDto dto){
		
		String devNo=nurseBlh.GetAppNo("IMPINV");
		VenDel venDel=new VenDel();
		venDel.setDelvDate(new Date());
		venDel.setDelvVendorid(WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		venDel.setDelvNo(devNo);
		venDel.setDelvUserId(Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId()));
		super.save(venDel);
		for(OrderDetailSub orderDetailSub:dto.getOrderDetailSubs()){
			orderDetailSub.setOrderSubImpId(venDel.getDelvId());
			super.saveOrUpdate(orderDetailSub);
		}
	}
	
	
	/**
	 * 
	* @Title: getRecItmByInv 
	* @Description: TODO(T_ORD_ORDDETAIL 新表发票查询订单明细) 
	* @param @param hopId
	* @param @param vendorId
	* @param @param inv
	* @param @return    设定文件 
	* @return List<HisInvInfoItmWeb>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年7月10日 上午9:14:09
	 */
	@SuppressWarnings("unchecked")
	public List<HisInvInfoItmWeb> getRecItmByInv(Long hopId,Long vendorId,String inv){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		
		hqlBuffer.append("select ");
		
		hqlBuffer.append("t1.INC_CODE as hopinccode, ");
		hqlBuffer.append("t2.ORDER_NO as orderno, ");
		hqlBuffer.append("t.ordsub_id as deliveritmid, ");
		hqlBuffer.append("t.ORDSUB_HIS_RP as rp, ");
		hqlBuffer.append("t.ORDSUB_HIS_QTY as qty, ");
		hqlBuffer.append("t.ORDSUB_RPAMT as rpamt, ");
		hqlBuffer.append("t.ordsub_expdate as expdate, ");
		hqlBuffer.append("t.ordsub_batno as batno ");
		
		hqlBuffer.append("from T_ORD_ORDERDETAILSUB t  ");
		hqlBuffer.append("left join T_ORD_ORDERDETAIL t2  on t.ordsub_detail_id=t2.ORDER_ID ");
		hqlBuffer.append("left join t_hop_inc t1  on t2.ORDER_HOP_INC_ID=t1.INC_ID ");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append("and t.ordsub_invno=:invNo ");
		hqlBuffer.append("and t2.ORDER_HOP_ID=:hopId ");
		hqlBuffer.append("and t2.ORDER_VEN_ID=:vendorId ");
		hqlParamMap.put("invNo", inv);
		hqlParamMap.put("hopId", hopId);
		hqlParamMap.put("vendorId", vendorId);
		
		return jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), HisInvInfoItmWeb.class, hqlParamMap);
	}
}

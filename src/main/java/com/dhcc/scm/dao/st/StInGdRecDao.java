/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.st;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.blh.sys.LockAppUtil;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.st.StInGdRecPic;

@Repository
public class StInGdRecDao extends HibernatePersistentObjectDAO<StInGdRec> {
	
	@Resource
	private LockAppUtil lockAppUtil;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		StInGdRecDto stInGdRecDto = (StInGdRecDto) dto;
		StInGdRec stInGdRec = stInGdRecDto.getStInGdRec();

		pagerModel.setCountProName(super.getIdName(StInGdRec.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, stInGdRec, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,StInGdRec stInGdRec,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from StInGdRec where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(StInGdRec stInGdRec){
	
		super.save(stInGdRec);
	}
	
	public void delete(StInGdRec stInGdRec){
		
		super.delete(stInGdRec);
	}
	
	public void update(StInGdRec stInGdRec){
	
		super.update(stInGdRec);
	}
	
	public StInGdRec findById(StInGdRec stInGdRec){

		return super.findById(stInGdRec.getIngdrecId());
	} 
	
	public void mpInGdRec(StInGdRecDto dto){
		
		dto.getStInGdRec().setIngdrecNo(lockAppUtil.GetAppNo("INGDREC"));
		dto.getStInGdRec().setIndrecDate(new Date());
		super.saveOrUpdate(dto.getStInGdRec());
		
		for(StInGdRecPic inGdRecPic:dto.getInGdRecPics()){
			inGdRecPic.setIngdrecpicParrefId(dto.getStInGdRec().getIngdrecId());
			super.saveOrUpdate(inGdRecPic);
		}
		
		String[] OrdSubIds=dto.getOrdSubId().split(BaseConstants.COMMA);
		for(String ordSubId:OrdSubIds){
			if(org.apache.commons.lang3.StringUtils.isNotBlank(ordSubId)){
				OrderDetailSub orderDetailSub=super.get(OrderDetailSub.class, ordSubId.trim());
				if(orderDetailSub.getOrdSubStatus().equals("T")){
					continue;
				}
				OrderDetail orderDetail=super.get(OrderDetail.class,orderDetailSub.getOrdSubDetailId());
				
				StInGdRecItm stInGdRecItm=new StInGdRecItm();
				stInGdRecItm.setIngdrecitmBatNo(orderDetailSub.getOrdSubBatNo());
				stInGdRecItm.setIngdrecitmExpDate(orderDetailSub.getOrdSubExpDate());
				stInGdRecItm.setIngdrecitmIncId(orderDetail.getOrderHopIncId());
				stInGdRecItm.setIngdrecitmInvNo(orderDetailSub.getOrdSubInvNo());
				stInGdRecItm.setIngdrecitmOrdsubId(orderDetailSub.getOrdSubId());
				stInGdRecItm.setIngdrecitmQty(orderDetailSub.getOrderSubQty().floatValue()*orderDetail.getOrderFac().floatValue());
				stInGdRecItm.setIngdrecitmRp(orderDetailSub.getOrderSubRp().floatValue()/orderDetail.getOrderFac().floatValue());
				stInGdRecItm.setIngdrecitmUom(orderDetail.getOrderHopUom());
				stInGdRecItm.setIngdrecitmParrefId(dto.getStInGdRec().getIngdrecId());
				super.save(stInGdRecItm);
				ExeState exeState = new ExeState();
				exeState.setStateId(orderDetail.getOrderState());
				exeState.setUserid(orderDetail.getOrderUserId());
				exeState.setOrdId(orderDetail.getOrderId());
				exeState.setExedate(new java.sql.Timestamp(new Date().getTime()));
				exeState.setRemark("微信扫码入库");
				super.saveOrUpdate(exeState);
				
				orderDetailSub.setOrdSubStatus("T");
				orderDetailSub.setOrdIngdrecDate(new Date());
				super.saveOrUpdate(orderDetailSub);
			}
		}
		
	}

}

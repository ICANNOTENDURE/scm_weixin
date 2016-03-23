/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.st;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.blh.sys.LockAppUtil;
import com.dhcc.scm.dto.st.StInGdRecDto;
import com.dhcc.scm.dto.weixin.MpInGdRecDto;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.st.StInGdRec;
import com.dhcc.scm.entity.st.StInGdRecItm;
import com.dhcc.scm.entity.st.StInGdRecPic;
import com.dhcc.scm.entity.vo.st.InGdRecVO;

@Repository
public class StInGdRecDao extends HibernatePersistentObjectDAO<StInGdRec> {
	
	@Resource
	private LockAppUtil lockAppUtil;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {

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
		Long venId=null;
		for(String ordSubId:OrdSubIds){
			if(org.apache.commons.lang3.StringUtils.isNotBlank(ordSubId)){
				OrderDetailSub orderDetailSub=super.get(OrderDetailSub.class, ordSubId.trim());
				if(orderDetailSub.getOrdSubStatus().equals("T")){
					continue;
				}
				OrderDetail orderDetail=super.get(OrderDetail.class,orderDetailSub.getOrdSubDetailId());
				if(venId==null){
					venId=orderDetail.getOrderVenId();
				}
				HopInc hopInc=super.get(HopInc.class, orderDetail.getOrderHopIncId());
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
				stInGdRecItm.setIngdrecitmIncBarCode(hopInc.getIncBarCode());
				stInGdRecItm.setIngdrecitmIncName(hopInc.getIncName());
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
		dto.getStInGdRec().setIngdrecVenId(venId);
		super.saveOrUpdate(dto.getStInGdRec());
	}
	
	
	
	public void listInGdRec(MpInGdRecDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("  SELECT ");
		hqlBuffer.append("  t1.ingdrec_id as id , ");
		hqlBuffer.append("  t1.ingdrec_date as date , ");
		hqlBuffer.append("	t1.ingdrec_no as no , ");
		hqlBuffer.append("  t2.CTLOC_NAME as loc , ");
		hqlBuffer.append("	t3.NAME as ven , ");
		hqlBuffer.append("	t4.ALIAS as user ");
		hqlBuffer.append("	FROM ");
		hqlBuffer.append(" t_st_ingdrec t1 ");
		hqlBuffer.append(" LEFT JOIN t_sys_ctloc t2 ON t1.ingdrec_locid = t2.CTLOC_ID ");
		hqlBuffer.append(" LEFT JOIN t_ven_vendor t3 ON t1.ingdrec_venid = t3.VEN_ID ");
		hqlBuffer.append(" LEFT JOIN t_sys_normal_account t4 ON t1.ingdrec_userid = t4.ACCOUNT_ID ");
		hqlBuffer.append(" where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("and t1.ingdrec_locid =:loc ");
		hqlParamMap.put("loc", dto.getLocId());
		if(dto.getStartDate()!=null){
			hqlBuffer.append("and t1.ingdrec_date >=:start ");
			hqlParamMap.put("start", dto.getStartDate());
		}
		if(dto.getEndDate()!=null){
			hqlBuffer.append("and t1.ingdrec_date <=:end ");
			hqlParamMap.put("end", dto.getEndDate());
		}
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), InGdRecVO.class, "t1.ingdrec_id");
		List<InGdRecVO> gdRecVOs=new ArrayList<InGdRecVO>();
		for(Object o:dto.getPageModel().getPageData()){
			gdRecVOs.add((InGdRecVO)o);
		}
		dto.setGdRecVOs(gdRecVOs);
	}

}

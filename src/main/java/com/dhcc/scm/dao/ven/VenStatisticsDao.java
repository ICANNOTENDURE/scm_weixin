/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VenStatisticsDto;
import com.dhcc.scm.entity.hv.HvLabel;
import com.dhcc.scm.entity.vo.nur.OrderGrpByNo;
import com.dhcc.scm.entity.vo.ven.VenStatisticsVo;

@Repository
public class VenStatisticsDao extends HibernatePersistentObjectDAO<HvLabel> {
	
	@Resource JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
	}

	@SuppressWarnings("unchecked")
	public void listvenStatistics(VenStatisticsDto dto){
		

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("  SELECT ");
		hqlBuffer.append("  t4.VEN_INC_NAME as venincname , ");
		hqlBuffer.append("  sum(t1.ordsub_qty) as ordsubqty , ");
		hqlBuffer.append("	t1.ordsub_rp as ordsubrp , ");
		//hqlBuffer.append("  t1.ORDSUB_HIS_QTY as ordsubhisqty , ");
		//hqlBuffer.append("  t1.ORDSUB_HIS_RP as ordsubhisrp , ");
		hqlBuffer.append("	sum(t1.ordsub_qty*t1.ordsub_rp) as ordsubrpamt , ");
		hqlBuffer.append("	t3.HOSPITAL_NAME  as hosp ,");
		hqlBuffer.append("  t1.ordsub_date as ordsubdate ");
		hqlBuffer.append("	FROM ");
		hqlBuffer.append(" T_ORD_ORDERDETAILSUB t1 ");
		hqlBuffer.append(" LEFT JOIN T_ORD_ORDERDETAIL t2 ON t2.ORDER_ID = t1.ordsub_detail_id  ");
		hqlBuffer.append(" left join t_sys_hospital t3 on t3.HOSPITAL_ID = t2.ORDER_HOP_ID   ");
		hqlBuffer.append(" left join t_ven_inc t4 on t4.VEN_INC_ROWID= t2.ORDER_VEN_INC_ID   ");
		hqlBuffer.append(" left join t_hv_label t5 on t5.hv_venincid = t4.VEN_INC_ROWID ");
		hqlBuffer.append(" where 1=1 ");
		
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("  and  t5.hv_vendorid=:vendorid ");
		hqlParamMap.put("vendorid", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		if(dto.getOrdStart()!=null){
			hqlBuffer.append("  and  t1.ordsub_date>=:start ");
			hqlParamMap.put("start", dto.getOrdStart());
		}
		if(dto.getOrdEnd()!=null){
			hqlBuffer.append("  and  t1.ordsub_date<=:end ");
			hqlParamMap.put("end", dto.getOrdEnd());
		}
		
		if(StringUtils.isNotBlank(dto.getVenincname())){
			hqlBuffer.append("  and  t4.VEN_INC_NAME like :venincname");
			hqlParamMap.put("venincname", "%"+dto.getVenincname()+"%");
		}
		if(StringUtils.isNotBlank(dto.getHosp())){
			hqlBuffer.append("  and  t3.HOSPITAL_NAME like :hosp ");
			hqlParamMap.put("hosp", "%"+dto.getHosp()+"%");
		}
		
		
		if("venincname".equals(dto.getSort())){
			hqlBuffer.append(" order by  t4.VEN_INC_NAME "+dto.getSortOrder());
		}
		if("hosp".equals(dto.getSort())){
			hqlBuffer.append(" order by t3.HOSPITAL_NAME "+dto.getSortOrder());
		}
		if("ordSubDate".equals(dto.getSort())){
			hqlBuffer.append(" order by t1.ordsub_date "+dto.getSortOrder());
		}
		
		hqlBuffer.append(" GROUP BY t4.VEN_INC_NAME,t1.ordsub_rp   ");
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		
		Integer total=jdbcTemplateWrapper.getResultCount(hqlBuffer.toString(), hqlParamMap);
		dto.getPageModel().setTotals(total);
		List<VenStatisticsVo> dataList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), VenStatisticsVo.class, hqlParamMap, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize(), "t1.ORDSUB_ID");
		dto.getPageModel().setPageData(dataList);
		
		
		//dto.getPageModel().setQueryHql(hqlBuffer.toString());
		//dto.getPageModel().setHqlParamMap(hqlParamMap);
		//jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VenStatisticsVo.class, "t1.ORDSUB_ID");

	
	}
		
}

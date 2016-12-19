/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hv;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hv.HvLabelDto;
import com.dhcc.scm.entity.hv.HvLabel;
import com.dhcc.scm.entity.vo.hv.HvInvNoVo;

@Repository
public class HvLabelDao extends HibernatePersistentObjectDAO<HvLabel> {
	
	@Resource JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
	}

	
	public void listHvLabel(HvLabelDto dto){
		

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("  SELECT ");
		hqlBuffer.append("  t1.hv_flag as flag , ");
		hqlBuffer.append("  t1.hv_id as id , ");
		hqlBuffer.append("	t1.hv_invno as invno , ");
		hqlBuffer.append("   t1.hv_invnodate as invnodate , ");
		hqlBuffer.append("   t1.hv_recno as recno , ");
		hqlBuffer.append("	t1.hv_label as label , ");
		hqlBuffer.append("	t1.hv_orddate as orddate , ");
		hqlBuffer.append("	t1.hv_qty as qty, ");
		hqlBuffer.append("	t2.HOSPITAL_NAME as hosp , ");
		hqlBuffer.append("	t3.VEN_INC_NAME as venincname , ");
		hqlBuffer.append("	t3.VEN_INC_PRICE as rp , ");
		hqlBuffer.append("	t3.VEN_INC_SPEC as spec , ");
		hqlBuffer.append("	t4.name as name  ");
		hqlBuffer.append("	FROM ");
		hqlBuffer.append(" t_hv_label t1 ");
		hqlBuffer.append(" LEFT JOIN t_sys_hospital t2 ON t1.hv_hopid = t2.HOSPITAL_ID ");
		hqlBuffer.append(" left join t_ven_inc t3 on t3.VEN_INC_ROWID  =t1.hv_venincid  ");
		hqlBuffer.append(" left join t_ven_vendor t4 on t4.VEN_ID  =t1.hv_vendorid  ");
		hqlBuffer.append(" where 1=1 ");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("  and  t1.hv_vendorid=:vendorid ");
		hqlParamMap.put("vendorid", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		if(dto.getOrdStart()!=null){
			hqlBuffer.append("  and  t1.hv_orddate>=:start ");
			hqlParamMap.put("start", dto.getOrdStart());
		}
		if(dto.getOrdEnd()!=null){
			hqlBuffer.append("  and  t1.hv_orddate<=:end ");
			hqlParamMap.put("end", dto.getOrdEnd());
		}
		if("1".equals(dto.getFlag())){
			hqlBuffer.append("  and  t1.hv_flag='Y' ");
		}
		if(StringUtils.isNotBlank(dto.getIncname())){
			hqlBuffer.append("  and  t3.VEN_INC_NAME like :incname");
			hqlParamMap.put("incname", "%"+dto.getIncname()+"%");
		}
		if(StringUtils.isNotBlank(dto.getInvno())){
			hqlBuffer.append("  and  t1.hv_invno=:invno ");
			hqlParamMap.put("invno", dto.getInvno());
		}
		if("2".equals(dto.getFlag())){
			hqlBuffer.append("  and  t1.hv_flag is null ");
		}
		
		if("venincname".equals(dto.getSort())){
			hqlBuffer.append(" order by  t3.VEN_INC_NAME "+dto.getSortOrder());
		}
		if("spec".equals(dto.getSort())){
			hqlBuffer.append(" order by t3.VEN_INC_SPEC "+dto.getSortOrder());
		}
		if("orddate".equals(dto.getSort())){
			hqlBuffer.append(" order by t1.hv_orddate "+dto.getSortOrder());
		}
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), HvInvNoVo.class, "t1.hv_id");

	
	}
		
}

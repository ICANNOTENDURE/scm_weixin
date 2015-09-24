/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.cat;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.cat.CatGroupPropertyDto;
import com.dhcc.scm.entity.cat.CatGroupProperty;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.vo.cat.CatPropertyVO;

@Repository
public class CatGroupPropertyDao extends HibernatePersistentObjectDAO<CatGroupProperty> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
		
	}
	
	public void listCatProperty(CatGroupPropertyDto dto) {
	
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" SELECT ");
		hqlBuffer.append(" T1.GRP_PRO_ID grpproid, ");
		hqlBuffer.append(" t1.GRP_PRO_DESC grpprodesc, ");
		hqlBuffer.append(" T1.GRP_PRO_PARREFID grpparrefid,");
		hqlBuffer.append(" T2.PRO_NAME grpproname,");
		hqlBuffer.append(" T2.PRO_CODE grpprocode,");
		hqlBuffer.append(" T1.GRP_PARREFID subcatgroupid,");
		hqlBuffer.append(" t3.SDGI_DESC subcatgroupname ,");
		hqlBuffer.append(" t4.SDG_Desc catgroupname ,");
		hqlBuffer.append(" t5.SG_Desc groupname");
		hqlBuffer.append(" FROM ");
		hqlBuffer.append(" T_CAT_GROUPPROPERTY t1");
		hqlBuffer.append(" LEFT JOIN T_CAT_PROPERTY t2 ON T1.GRP_PRO_PARREFID = T2.PRO_ID ");
		hqlBuffer.append(" LEFT JOIN T_CAT_DRUGGROUPITM t3 on t3.sdgi_id=t1.grp_parrefid ");
		hqlBuffer.append(" LEFT JOIN T_CAT_DRUGGROUP t4 on t4.SDG_ID=t3.SDGI_Parref_ID ");
		hqlBuffer.append(" LEFT JOIN T_CAT_GROUP t5 on t5.SG_ID=t4.SDG_PARREF_ID ");
		hqlBuffer.append(" where 1=1 ");
		if(dto.getCatGroupProperty()!=null){
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getCatGroupProperty().getGrpProDesc())){
				hqlBuffer.append(" and t1.GRP_PRO_DESC like :sdgidesc ");
				hqlParamMap.put("sdgidesc", "%"+dto.getCatGroupProperty().getGrpProDesc()+"%");
			}
			
		}
		if(dto.getCatgroup()!=null){
			hqlBuffer.append(" and t4.SDG_ID=:sdgi_id ");
			hqlParamMap.put("sdgi_id",dto.getCatgroup());
		}
		if(dto.getSubcatgroup()!=null){
			hqlBuffer.append(" and T1.grp_parrefid=:PRO_ID ");
			hqlParamMap.put("PRO_ID",dto.getSubcatgroup());
		}
		if(dto.getGroup()!=null){
			hqlBuffer.append(" and t5.SG_ID=:SG_ID ");
			hqlParamMap.put("SG_ID",dto.getGroup());
		}
		hqlBuffer.append(" order by T1.GRP_PARREFID,T1.GRP_PRO_PARREFID desc ");
		if(dto.getPageModel()==null){
			PagerModel pageModel=new PagerModel();
			pageModel.setPageNo(1);
			pageModel.setPageSize(10);
			dto.setPageModel(pageModel);
		}
		//获取总条数
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), CatPropertyVO.class, "T1.GRP_PRO_ID");
		for(Object o:dto.getPageModel().getPageData()){
			CatPropertyVO catPropertyVO=(CatPropertyVO) o;
			if(catPropertyVO.getGrpprocode().equals("1")){
				if(StringUtils.isNumeric(catPropertyVO.getGrpprodesc())){
					HopManf hopManf=super.get(HopManf.class, Long.valueOf(catPropertyVO.getGrpprodesc()));
					if(hopManf!=null){
						catPropertyVO.setGrpprodesc(hopManf.getManfName());
					}
				}
			}
		}
	}

	
		
	public void save(CatGroupProperty catGroupProperty){
	
		super.save(catGroupProperty);
	}
	
	public void delete(CatGroupProperty catGroupProperty){
		
		super.delete(catGroupProperty);
	}
	
	public void update(CatGroupProperty catGroupProperty){
	
		super.update(catGroupProperty);
	}
	
}

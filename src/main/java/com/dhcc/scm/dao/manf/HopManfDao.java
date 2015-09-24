/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.manf;

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
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.manf.HopManfDto;
import com.dhcc.scm.entity.manf.HopManf;
import com.dhcc.scm.entity.vo.combo.ComboxVo;

@Repository
public class HopManfDao extends HibernatePersistentObjectDAO<HopManf> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HopManfDto hopManfDto = (HopManfDto) dto;
		HopManf hopManf = hopManfDto.getHopManf();

		pagerModel.setCountProName(super.getIdName(HopManf.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hopManf, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,HopManf hopManf,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from HopManf h ");
		//拼接查询条件		
		if (hopManf!=null) {
			hqlStr.append(" where 1=1 ");
			String manfCode =hopManf.getManfCode();
			String manfName =hopManf.getManfName();
			Long manfHisDr=hopManf.getManfHisid();
			if(!StringUtils.isNullOrEmpty(manfCode)){
				hqlStr.append(" AND h.manfCode like:manfCode ");
				hqlParamMap.put("manfCode","%"+manfCode+"%");
			}
			if(!StringUtils.isNullOrEmpty(manfName)){
				hqlStr.append(" AND h.manfName like:manfName ");
				hqlParamMap.put("manfName","%"+manfName+"%");
			}
			if(manfHisDr!=null){
				hqlStr.append(" AND h.manfHisid =:manfHisDr ");
				hqlParamMap.put("manfHisDr",manfHisDr);
			}
			
		}
	}
		
	public void save(HopManf hopManf){
	
		super.save(hopManf);
	}
	
	public void delete(HopManf hopManf){
		
		super.delete(hopManf);
	}
	
	public void update(HopManf hopManf){
	
		super.update(hopManf);
	}
	
	public HopManf findById(HopManf hopManf){

		return super.findById(hopManf.getHopManfId());

	}

	/**
	 * @param hopManf
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HopManf> getManfInfo(HopManf hopManf) {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new HopManf(");
		hqlBuffer.append(" h.hopManfId, ");
		hqlBuffer.append(" h.manfName) ");
		hqlBuffer.append(" from HopManf h");
		
		return (List<HopManf>)this.findByHql(hqlBuffer.toString());
	} 
	
	
	/**
	 * 
	* @Title: HopManfDao.java
	* @Description: TODO(产地描述查找ID)
	* @param funcDto
	* @throws Exception
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月10日 下午3:13:38
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public Long getIdByName(String name){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" HopManf t ");
		hql.append(" where 1=1 ");
		hql.append(" and t.manfName = :manfname ");
		paramMap.put("manfname", name);
		List<HopManf> manfs=(List<HopManf>) this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
		if(manfs.size()==1){
			return manfs.get(0).getHopManfId();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<ComboxVo> findManfComboxVos(HopManfDto dto) {
		
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("select ");
		hqlBuffer.append("t.NAME as name, ");
		hqlBuffer.append("t.ID id ");			
		hqlBuffer.append("from T_HOP_MANF t ");
		hqlBuffer.append("where 1=1 ");

		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			hqlBuffer.append("and t.NAME like :name ");
			hqlParamMap.put("name", dto.getComgridparam()+"%");
		}
		return (List<ComboxVo>)jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ComboxVo.class, hqlParamMap, 1,BaseConstants.COMBOX_PAGE_SIZE, "id");
	
	} 
}

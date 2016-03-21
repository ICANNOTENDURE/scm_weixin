/**
 *  
 *hxy
 */
package com.dhcc.scm.dao.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.sys.SysQualifTypeDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.scm.entity.ven.VenIncqQualifPic;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;

@Repository
public class SysQualifTypeDao extends HibernatePersistentObjectDAO<SysQualifType> {
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		SysQualifTypeDto sysQualifTypeDto = (SysQualifTypeDto) dto;
		SysQualifType sysQualifType = sysQualifTypeDto.getSysQualifType();

		pagerModel.setCountProName(super.getIdName(SysQualifType.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, sysQualifType, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String,Object> hqlParamMap, SysQualifType sysQualifType, StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from SysQualifType where 1=1 ");
		// 接下来拼接其他查询条件 如下示例代码所示
		// hqlStr.append("WHERE YEAR=:year ");
		// hqlParamMap.put("year", year);
		// hqlStr.append("AND MONTH=:month ");
		// hqlParamMap.put("month", month);
		// hqlStr.append("AND DAY=:day ");
		// hqlParamMap.put("day", day);
	}

	public void save(SysQualifType sysQualifType) {

		super.save(sysQualifType);
	}

	public void delete(SysQualifType sysQualifType) {

		super.delete(sysQualifType);
	}

	public void update(SysQualifType sysQualifType) {

		super.update(sysQualifType);
	}

	public SysQualifType findById(SysQualifType sysQualifType) {

		return super.findById(sysQualifType.getQualifTypeId());

	}

	// add hxy
	@SuppressWarnings("unchecked")
	public List<CatGroup> getCatInfo(SysQualifTypeDto dto) {
		// return null;
		if (dto.getPageModel() == null) {
			dto.setPageModel(new PagerModel());
		}
		DetachedCriteria criteria = DetachedCriteria.forClass(CatGroup.class);
		if (org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())) {
			criteria.add(Restrictions.like("GroupName", dto.getComgridparam().trim(), MatchMode.ANYWHERE));
		}
		return (List<CatGroup>) this.findByCriteria(criteria, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize());
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<VenQualifTypeVO> queryQualifyType(SysQualifTypeDto dto) {



		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select ");
		hqlBuffer.append("  t1.QUALIF_TYPE_ID as type, ");
		hqlBuffer.append("  t1.QUALIF_TYPE_NAME as name , ");
		hqlBuffer.append("	t2.qualif_date as expdate , ");
		hqlBuffer.append("  t2.qualif_id as qualif, ");
		hqlBuffer.append("  t1.QUALIF_TYPE_TYPE as fieldtype, ");
		hqlBuffer.append("  t2.qualif_description as description  ");																														// ");
		hqlBuffer.append(" from ");
		hqlBuffer.append(" t_sys_qualif_type t1   left  join t_ven_inc_qualif t2 ");
		hqlBuffer.append(" on t1.QUALIF_TYPE_ID=t2.qualif_typeid");
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append(" AND t2.qualif_incid=:incid ");
		hqlParamMap.put("incid", dto.getVenIncId());
		
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" order by t1.QUALIF_TYPE_SEQ ");
		List<VenQualifTypeVO> venQualifTypeVOList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), VenQualifTypeVO.class, hqlParamMap);
		for(int i=0;i<venQualifTypeVOList.size();i++){
			if(venQualifTypeVOList.get(i).getQualif()!=null){
				Map<String, Object> paramMap = new HashMap<String, Object>();
				StringBuffer hql = new StringBuffer();
				hql.append(" from ");
				hql.append(" VenIncqQualifPic t ");
				hql.append(" where t.picParrefId = :qualifyid ");
				paramMap.put("qualifyid",venQualifTypeVOList.get(i).getQualif());
				List<VenIncqQualifPic> incqQualifPics=this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
				venQualifTypeVOList.get(i).setIncqQualifPics(incqQualifPics);
			}
		}
		return venQualifTypeVOList;
	}
}

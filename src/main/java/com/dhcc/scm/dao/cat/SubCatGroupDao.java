/**
 * 
 */
package com.dhcc.scm.dao.cat;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.cat.SubCatGroupDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.vo.cat.SubCatGroupVO;

/**
 * @author duyadong
 *
 */
@Repository
public class SubCatGroupDao extends HibernatePersistentObjectDAO<SubCatGroup>{
	
	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		SubCatGroupDto subCatGroupDto = (SubCatGroupDto) dto;
		SubCatGroup subCatGroup = subCatGroupDto.getSubCatGroup();
		pagerModel.setCountProName(super.getIdName(SubCatGroup.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, subCatGroup, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	
	private void buildQuery(Map hqlParamMap, SubCatGroup subCatGroup,
			StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from SubCatGroup c where 1=1 ");
		if (null != subCatGroup){
			if(!StringUtils.isNullOrEmpty(subCatGroup.getSubGroupCode())){
				hqlStr.append(" AND s.subGroupCode like:groupCode ");
				hqlParamMap.put("groupCode","%"+subCatGroup.getSubGroupCode()+"%");
			}
			if(!StringUtils.isNullOrEmpty(subCatGroup.getSubGroupName())){
				hqlStr.append(" AND s.subGroupName like:groupName ");
				hqlParamMap.put("groupCode","%"+subCatGroup.getSubGroupName()+"%");
			}
			if(!StringUtils.isNullOrEmpty(subCatGroup.getSubParrefGroupID().toString())){
				hqlStr.append(" AND s.groupName like:groupName ");
				hqlParamMap.put("groupCode","%"+subCatGroup.getSubGroupName()+"%");
			}
		}
	}

	public void getListInfo(SubCatGroupDto dto) {
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select");
		hqlBuffer.append(" s.sdgi_parref_id subparrefgroupid, ");
		hqlBuffer.append(" s.sdgi_code subcatgroupcode, ");
		hqlBuffer.append(" s.sdgi_desc subcatgroupname, ");
		hqlBuffer.append(" s.sdgi_id subcatgroupid, ");
		hqlBuffer.append(" c.sdg_desc subparrefgroupname ");
		hqlBuffer.append(" from t_cat_druggroupitm s left join t_cat_druggroup  c ");
		hqlBuffer.append(" on s.sdgi_parref_id=c.sdg_id where 1=1 ");
		if(dto.getSubCatGroup()!=null){
			if(dto.getSubCatGroup().getSubParrefGroupID()!=null){
				hqlBuffer.append(" and c.sdg_id=:sdgid ");
				hqlParamMap.put("sdgid", dto.getSubCatGroup().getSubParrefGroupID());
			}
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getSubCatGroup().getSubGroupName())){
				hqlBuffer.append(" and s.sdgi_desc like :sdgidesc ");
				hqlParamMap.put("sdgidesc", "%"+dto.getSubCatGroup().getSubGroupName()+"%");
			}
			
		}
		if(dto.getPageModel()==null){
			PagerModel pageModel=new PagerModel();
			pageModel.setPageNo(1);
			pageModel.setPageSize(10);
			dto.setPageModel(pageModel);
		}
		//获取总条数
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), SubCatGroupVO.class, "sdgi_id");
	}
	
	public void save(SubCatGroup subCatGroup) {
		super.save(subCatGroup);
	}

	public void delete(SubCatGroup subCatGroup) {

		super.delete(subCatGroup);
	}

	public void update(SubCatGroup subCatGroup) {

		super.update(subCatGroup);
	}

	public  SubCatGroup findById(SubCatGroup subCatGroup) {

		return super.findById(subCatGroup.getSubGroupID());
		
	}
	
	
}

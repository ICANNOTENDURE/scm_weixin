/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.cat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.cat.CatGroupDto;
import com.dhcc.scm.entity.cat.CatGroup;
import com.dhcc.scm.entity.cat.Group;
import com.dhcc.scm.entity.vo.cat.CatGroupVO;

@Repository
public class CatGroupDao extends HibernatePersistentObjectDAO<CatGroup> {
	
	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		CatGroupDto catGroupDto = (CatGroupDto) dto;
		CatGroup catGroup = catGroupDto.getCatGroup();

		pagerModel.setCountProName(super.getIdName(CatGroup.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, catGroup, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	
	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap, CatGroup catGroup,
			StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from CatGroup c where 1=1 ");
		if (null != catGroup){
			if(!StringUtils.isNullOrEmpty(catGroup.getGroupCode())){
				hqlStr.append(" AND c.groupCode like:groupCode ");
				hqlParamMap.put("groupCode","%"+catGroup.getGroupCode()+"%");
			}
			if(!StringUtils.isNullOrEmpty(catGroup.getGroupName())){
				hqlStr.append(" AND c.groupName like:groupName ");
				hqlParamMap.put("groupCode","%"+catGroup.getGroupName()+"%");
			}
		}
	}
	
	public void save(CatGroup catGroup) {
		super.save(catGroup);
	}

	public void delete(CatGroup catGroup) {

		super.delete(catGroup);
	}

	public void update(CatGroup catGroup) {

		super.update(catGroup);
	}

	public CatGroup findById(CatGroup catGroup) {

		return super.findById(catGroup.getGroupID());
		
	}
	
	
	/**
	 * 
	* @Title: listGroup 
	* @Description: TODO(查询大类祖) 
	* @param @param catGroup    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午2:22:19
	 */
	public void listGroup(CatGroupDto dto) {
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		DetachedCriteria criteria = DetachedCriteria.forClass(Group.class);
		if(dto.getGroup()!=null){
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getGroup().getSgDesc())){
				criteria.add(Restrictions.like("sgDesc",dto.getGroup().getSgDesc().trim(),MatchMode.ANYWHERE));
			}
		}
		dto.getPageModel().setPageSize(this.findByCriteria(criteria).size());
		dto.getPageModel().setPageData(this.findByCriteria(criteria, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize()));
	
	}
	
	/**
	 * 
	* @Title: listCatGroup 
	* @Description: TODO() 查询类祖
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午3:22:06
	 */
	public void listCatGroup(CatGroupDto dto) {
		
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.SDG_ID as catgroupid, ");
		hqlBuffer.append("t1.SDG_CODE as catgroupcode, ");
		hqlBuffer.append("t1.SDG_Desc as catgroupname, ");
		hqlBuffer.append("t1.SDG_PARREF_ID as groupid, ");
		hqlBuffer.append("t2.SG_Desc as groupname ");

		hqlBuffer.append("from ");
		hqlBuffer.append("T_CAT_DRUGGROUP t1 left join T_CAT_GROUP t2 on t1.SDG_PARREF_ID=t2.SG_ID ");
		hqlBuffer.append(" where 1=1");
	

		if(dto.getCatGroup()!=null){
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getCatGroup().getGroupName())){
				hqlBuffer.append(" and t1.SDG_Desc like :sdgdesc ");
				hqlParamMap.put("sdgdesc","%"+dto.getCatGroup().getGroupName()+"%");
			}
			if(dto.getCatGroup().getParrefId()!=null){
				hqlBuffer.append(" and t1.SDG_PARREF_ID like :sdgparref ");
				hqlParamMap.put("sdgparref",dto.getCatGroup().getParrefId());
			}
		}
	
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), CatGroupVO.class, "SDG_ID");
	}
	
	
	/**
	 * 
	* @Title: listGroupComb 
	* @Description: TODO(类祖下拉列表框使用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月2日 下午3:44:52
	 */
	@SuppressWarnings("unchecked")
	public void listGroupComb(CatGroupDto dto) {
		
		dto.setGroups(new ArrayList<Group>());
		DetachedCriteria criteria = DetachedCriteria.forClass(Group.class);
		if(dto.getGroup()!=null){
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getGroup().getSgDesc())){
				criteria.add(Restrictions.like("sgDesc",dto.getGroup().getSgDesc().trim(),MatchMode.ANYWHERE));
			}
		}
		dto.setGroups((this.findByCriteria(criteria)));
	}

}

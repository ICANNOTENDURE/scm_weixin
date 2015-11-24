/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopCtlocDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopCtlocVo;

@Repository
public class HopCtlocDao extends HibernatePersistentObjectDAO<HopCtloc> {
	
	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HopCtlocDto hopCtlocDto = (HopCtlocDto) dto;
		HopCtloc hopCtloc = hopCtlocDto.getHopCtloc();
		
		pagerModel.setCountProName(super.getIdName(HopCtloc.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hopCtloc, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,HopCtloc hopCtloc,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from HopCtloc h ");
		//拼接查询条件		
		if (hopCtloc!=null) {
			hqlStr.append(" where 1=1 ");
			String codeStr =hopCtloc.getCode();
			String nameStr =hopCtloc.getName();	
			Long hospDr=hopCtloc.getHospid();
			if(!StringUtils.isNullOrEmpty(codeStr)){
				hqlStr.append(" AND h.code like:codeStr ");
				hqlParamMap.put("codeStr","%"+codeStr+"%");
			}
			if(!StringUtils.isNullOrEmpty(nameStr)){
				hqlStr.append(" AND h.name like:nameStr ");
				hqlParamMap.put("nameStr","%"+nameStr+"%");
			}
			if(hospDr!=null){
				hqlStr.append(" AND h.hospid =:hospDr ");
				hqlParamMap.put("hospDr",hospDr);
			}
			
		}
	}
		
	public void save(HopCtloc hopCtloc){
	
		super.save(hopCtloc);
	}
	
	public void delete(HopCtloc hopCtloc){
		
		super.delete(hopCtloc);
	}
	
	public void update(HopCtloc hopCtloc){
	
		super.update(hopCtloc);
	}
	
	public HopCtloc findById(HopCtloc hopCtloc){

		return super.findById(hopCtloc.getHopCtlocId());

	}

	/**
	 * @param hopCtloc
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HopCtloc> getCtlocInfo(HopCtloc hopCtloc) {
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" select new HopCtloc(");
		hqlBuffer.append(" h.hopCtlocId, ");
		hqlBuffer.append(" h.name) ");
		hqlBuffer.append(" from HopCtloc h");
		hqlBuffer.append(" where 1=1 ");
		if(hopCtloc!=null){
			if(hopCtloc.getHospid()!=null){
				hqlBuffer.append(" and h.hospid = :hop ");
				hqlParamMap.put("hop",hopCtloc.getHospid());
			}
		}
		return (List<HopCtloc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
	}

	/**
	 * @param hopCtloc
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HopCtlocVo> getListInfo(PagerModel pagerModel,List<HopCtlocVo> hopCtlocVos,HopCtloc hopCtloc) {			
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new com.dhcc.scm.entity.vo.hop.HopCtlocVo(");
		hqlBuffer.append(" h.hopCtlocId, ");
		hqlBuffer.append(" h.code, ");
		hqlBuffer.append(" h.name, ");
		hqlBuffer.append(" h.hospid, ");
		hqlBuffer.append(" hs.hospitalName, ");
		hqlBuffer.append(" h.hisid, ");
		hqlBuffer.append(" h.type) ");
		hqlBuffer.append(" from HopCtloc h , Hospital hs ");		
		hqlBuffer.append(" where h.hospid=hs.hospitalId ");
		if(hopCtloc!=null){
			String codeStr =hopCtloc.getCode();
			String nameStr =hopCtloc.getName();	
//			Long hospDr=hopCtloc.getHospid();
			if(!StringUtils.isNullOrEmpty(codeStr)){
				hqlBuffer.append(" and h.code like:codeStr ");
				hqlParamMap.put("codeStr","%"+codeStr+"%");
			}
			if(!StringUtils.isNullOrEmpty(nameStr)){
				hqlBuffer.append(" and h.name like:nameStr ");
				hqlParamMap.put("nameStr","%"+nameStr+"%");
			}
//			if(hospDr!=null){
//				hqlBuffer.append(" and h.hospid =:hospDr ");
//				hqlParamMap.put("hospDr",hospDr);
//			}
		}
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		if(type.toString().equals("1")){
			Long hopIdLong=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
			hqlBuffer.append(" and h.hospid =:hospDr ");
			hqlParamMap.put("hospDr",hopIdLong);
		}
		//return (List<HopCtlocVo>)findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap, true);
		
		pagerModel.setCountProName("CTLOC_ID");
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		int totalRows = pagerModel.getTotals();
		if (totalRows == 0) {
			totalRows = commonDao.getResultCountWithValuesMap(
					pagerModel.getQueryHql(), pagerModel.getHqlParamMap(),
					pagerModel.getCountProName(), false).intValue();
		}
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList<Object>(1));
			return null;
		}
		pagerModel.setTotals(totalRows);
		
		return (List<HopCtlocVo>)findByHqlWithValuesMap(hqlBuffer.toString(),
			pagerModel.getPageNo(),pagerModel.getPageSize(), hqlParamMap, true);
	}


	
	
	@SuppressWarnings("unchecked")
	public List<ComboxVo> findHopLocComboxVos(HopCtlocDto dto){
		
		Long userId=Long.valueOf(WebContextHolder.getContext().getVisit().getUserInfo().getId());
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t3.ctloc_name as name, ");
		hqlBuffer.append("t3.ctloc_id as id ");
		hqlBuffer.append("from t_sys_ctloc t3 ");
		hqlBuffer.append("where t3.ctloc_id in ");
		hqlBuffer.append("(select t2.sys_loc_id from t_sys_normalaccount_role t1,t_sys_role_loc t2 where t2.sys_role_id=t1.role_id and t1.account_id=:userId) ");
		hqlParamMap.put("userId", userId);
		if(!StringUtils.isNullOrEmpty(dto.getComgridparam())){
			hqlBuffer.append("and t3.ctloc_name like :alias ");
			hqlParamMap.put("alias", "%"+dto.getComgridparam()+"%");
		}
		if(!StringUtils.isNullOrEmpty(WebContextHolder.getContext().getRequest().getParameter("q"))){
			hqlBuffer.append("and t3.ctloc_name like :xxx ");
			hqlParamMap.put("xxx", WebContextHolder.getContext().getRequest().getParameter("q")+"%");
		}
		if(!StringUtils.isNullOrEmpty(dto.getType())){
			if(dto.getType().equals("3")){
				hqlBuffer.append("and t3.ctloc_type is not null");
			}
			if(dto.getType().equals("2")){
				hqlBuffer.append("and (t3.ctloc_type =3 or t3.ctloc_type =2)");
			}
			if(dto.getType().equals("1")){
				hqlBuffer.append("and (t3.ctloc_type =3 or t3.ctloc_type =1) ");
			}
		}
		return (List<ComboxVo>)jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ComboxVo.class, hqlParamMap, 1,BaseConstants.COMBOX_MAX_PAGE_SIZE, "sys_role_loc_id");
	
	}


	/**
	 * @param dto
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public  List<ComboxVo> findHopLocAndroid(HopCtlocDto dto) {
		Long userId=dto.getUserId();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t3.ctloc_name as name, ");
		hqlBuffer.append("t3.ctloc_id as id ");
		hqlBuffer.append("from t_sys_ctloc t3 ");
		hqlBuffer.append("where t3.ctloc_id in ");
		hqlBuffer.append("(select t2.sys_loc_id from t_sys_normalaccount_role t1,t_sys_role_loc t2 where t2.sys_role_id=t1.role_id and t1.account_id=:userId) ");
		hqlParamMap.put("userId", userId);
		if(!StringUtils.isNullOrEmpty(dto.getComgridparam())){
			hqlBuffer.append("and t3.ctloc_name like :alias ");
			hqlParamMap.put("alias", "%"+dto.getComgridparam()+"%");
		}
		if(!StringUtils.isNullOrEmpty(dto.getType())){
			if(dto.getType().equals("3")){
				hqlBuffer.append("and t3.ctloc_type is not null");
			}
			if(dto.getType().equals("2")){
				hqlBuffer.append("and (t3.ctloc_type =3 or t3.ctloc_type =2)");
			}
			if(dto.getType().equals("1")){
				hqlBuffer.append("and (t3.ctloc_type =3 or t3.ctloc_type =1) ");
			}
		}
		return (List<ComboxVo>)jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ComboxVo.class, hqlParamMap, 1,BaseConstants.COMBOX_MAX_PAGE_SIZE, "sys_role_loc_id");
		
	}

	
	
	
	/**
	 * 
	* @Title: HopCtlocDao.java
	* @Description: TODO(更具科室描述取id)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月17日 上午10:27:02
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public Long getLocIdByName(String name) {
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from HopCtloc h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.name = :name ");
		hqlParamMap.put("name",name);
		
		Long hopId=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
		hqlBuffer.append(" and h.hospid = :hopId ");
		hqlParamMap.put("hopId",hopId);
		
		List<HopCtloc> hopCtlocs=(List<HopCtloc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
		if(hopCtlocs.size()>0){
			return hopCtlocs.get(0).getHopCtlocId();
		}
		return null;
	}
}

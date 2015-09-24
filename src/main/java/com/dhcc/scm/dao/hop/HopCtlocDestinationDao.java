/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopCtlocDestinationDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopCtlocDestination;
import com.dhcc.scm.entity.vo.hop.HopDestinationVo;

@Repository
public class HopCtlocDestinationDao extends HibernatePersistentObjectDAO<HopCtlocDestination> {

	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HopCtlocDestinationDto hopCtlocDestinationDto = (HopCtlocDestinationDto) dto;
		HopCtlocDestination hopCtlocDestination = hopCtlocDestinationDto.getHopCtlocDestination();

		pagerModel.setCountProName(super.getIdName(HopCtlocDestination.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hopCtlocDestination, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,HopCtlocDestination hopCtlocDestination,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from HopCtlocDestination h");
		//拼接查询条件		
		if (hopCtlocDestination!=null) {
			hqlStr.append(" where 1=1 ");
			Long ctlocId =hopCtlocDestination.getCtlocDr();
			String destinatonStr =hopCtlocDestination.getDestination();	
			//String contactStr=hopCtlocDestination.getContact();
			if(!StringUtils.isNullOrEmpty(destinatonStr)){
				hqlStr.append(" AND h.destination like:destinatonStr ");
				hqlParamMap.put("destinatonStr","%"+destinatonStr+"%");
			}
			if(ctlocId!=null){
				hqlStr.append(" AND h.ctlocDr like:ctlocId ");
				hqlParamMap.put("ctlocId","%"+ctlocId+"%");
			}
//			if(!StringUtils.isNullOrEmpty(contactStr)){
//				hqlStr.append(" AND h.contact like:contactStr ");
//				hqlParamMap.put("contactStr","%"+contactStr+"%");
//			}
		}
	}
		
	public void save(HopCtlocDestination hopCtlocDestination){
	
		super.save(hopCtlocDestination);
	}
	
	public void delete(HopCtlocDestination hopCtlocDestination){
		
		super.delete(hopCtlocDestination);
	}
	
	public void update(HopCtlocDestination hopCtlocDestination){
	
		super.update(hopCtlocDestination);
	}
	
	public HopCtlocDestination findById(HopCtlocDestination hopCtlocDestination){

		return super.findById(hopCtlocDestination.getHopCtlocDestinationId());

	}

	/**
	 * @param dto
	 * @return 
	 */	
	public HopCtloc getCtloc(HopCtlocDestinationDto dto) throws Exception{
		
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" HopCtoloc h ");
		hql.append(" where h.hopCtlocId = :hopctlocDr ");		
		
		HopCtloc hopCtloc=(HopCtloc) this.findByHql(hql.toString());
		//dto.getHopCtlocDestination().setTSysCtloc(hopCtloc);
		return hopCtloc;
		
	}

	/**
	 * @param hopDestinationVos
	 * @return
	 */
	public void getListInfo(HopCtlocDestinationDto dto) {
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select ");
		hqlBuffer.append(" h.CTLOCDES_ID as hopctlocdestinationid, ");
		hqlBuffer.append(" h.CTLOCDES_DESTINATION as destination, ");
		hqlBuffer.append(" h.CTLOCDES_CONTACT2 as descontact, ");
		hqlBuffer.append(" h.CTLOCDES_TEL as destel, ");
		hqlBuffer.append(" h.CTLOCDES_CTLOCDR as desctlocdr, ");
		hqlBuffer.append(" h.CTLOCDES_MAIL as mail, ");
		hqlBuffer.append(" hc.CTLOC_DEST as defaultdestion, ");
		hqlBuffer.append(" h.CTLOCDES_CODE as desccode, ");
		hqlBuffer.append(" hc.CTLOC_NAME as desctlocname ");
		hqlBuffer.append(" from T_SYS_CTLOC_DESTINATION h ");
		hqlBuffer.append(" left join T_SYS_CTLOC hc on h.CTLOCDES_CTLOCDR=hc.CTLOC_ID ");
		hqlBuffer.append(" where 1=1 ");
		if (dto.getHopCtlocDestination()!=null) {			
			if(!StringUtils.isNullOrEmpty(dto.getHopCtlocDestination().getDestination())){
				hqlBuffer.append(" AND h.CTLOCDES_DESTINATION like:destinatonStr ");
				hqlParamMap.put("destinatonStr","%"+dto.getHopCtlocDestination().getDestination()+"%");
			}
			if(dto.getHopCtlocDestination().getCtlocDr()!=null){
				hqlBuffer.append(" AND h.CTLOCDES_CTLOCDR =:ctlocId ");
				hqlParamMap.put("ctlocId",dto.getHopCtlocDestination().getCtlocDr());
			}
		}
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		if(type.toString().equals("1")){
			hqlBuffer.append(" AND hc.CTLOC_HOSPID =:hopId ");
			hqlParamMap.put("hopId",WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), HopDestinationVo.class, "CTLOCDES_ID");
	}
	
	
	/**
	 * 
	* @Title: HopCtlocDestinationDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param code
	* @param hopId
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月11日 上午10:48:58
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public HopCtlocDestination getDesctionByCode(String code,Long hopId){
		DetachedCriteria criteriaOrderNo = DetachedCriteria.forClass(HopCtlocDestination.class);
		criteriaOrderNo.add(Restrictions.eq("code",code));
		List<HopCtlocDestination> orders=super.findByDetachedCriteria(criteriaOrderNo);
		for(HopCtlocDestination HopCtlocDestination:orders){
			HopCtloc HopCtloc=super.get(HopCtloc.class, HopCtlocDestination.getCtlocDr());
			if(HopCtloc.getHospid().toString().equals(hopId.toString())){
				return HopCtlocDestination;
			}		
		}
		return null;
	}
		
}

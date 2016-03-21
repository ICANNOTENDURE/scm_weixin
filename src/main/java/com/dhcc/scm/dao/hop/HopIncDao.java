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
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopIncDto;
import com.dhcc.scm.entity.cat.SubCatGroup;
import com.dhcc.scm.entity.hop.HopInc;
import com.dhcc.scm.entity.hop.HopIncAlias;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.combo.ComboxVo;
import com.dhcc.scm.entity.vo.hop.HopIncVo;
import com.dhcc.scm.entity.vo.hop.ShowHopIncVo;

@Repository
public class HopIncDao extends HibernatePersistentObjectDAO<HopInc> {
	
	@Resource
	private CommonDao commonDao;
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HopIncDto hopIncDto = (HopIncDto) dto;
		HopInc hopInc = hopIncDto.getHopInc();

		pagerModel.setCountProName(super.getIdName(HopInc.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hopInc, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,HopInc hopInc,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from HopInc h ");
		//拼接查询条件		
		if (hopInc!=null) {
			hqlStr.append(" where 1=1 ");
			String codeStr =hopInc.getIncCode();
			String nameStr =hopInc.getIncName();	
			Long manfDr=hopInc.getIncManfid();
			Long hospDr=hopInc.getIncHospid();
			Long hissysDr=hopInc.getIncHissysid();
			if(!StringUtils.isNullOrEmpty(codeStr)){
				hqlStr.append(" AND h.incCode like:codeStr ");
				hqlParamMap.put("codeStr","%"+codeStr+"%");
			}
			if(!StringUtils.isNullOrEmpty(nameStr)){
				hqlStr.append(" AND h.incName like:nameStr ");
				hqlParamMap.put("nameStr","%"+nameStr+"%");
			}
			if(manfDr!=null){
				hqlStr.append(" AND h.incManfid =:manfDr ");
				hqlParamMap.put("manfDr",manfDr);
			}
			if(hospDr!=null){
				hqlStr.append(" AND h.incHospid =:hospDr ");
				hqlParamMap.put("hospDr",hospDr);
			}
			if(hissysDr!=null){
				hqlStr.append(" AND h.incHissysid =:hissysDr ");
				hqlParamMap.put("hissysDr",hissysDr);
			}
			
		}
	}
		
	public void save(HopInc hopInc){
	
		super.save(hopInc);
	}
	
	public void delete(HopInc hopInc){
		
		super.delete(hopInc);
	}
	
	public void update(HopInc hopInc){
	
		super.update(hopInc);
	}
	
	public HopInc findById(HopInc hopInc){

		return super.findById(hopInc.getIncId());

	}

	/**
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HopIncVo> getIncInfo(List<HopIncVo> list) {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new com.dhcc.scm.entity.vo.hop.HopIncVo(");
		hqlBuffer.append(" h.incId, ");
		hqlBuffer.append(" h.incCode, ");
		hqlBuffer.append(" h.incName, ");		
		hqlBuffer.append(" h.incUomname, ");		
		hqlBuffer.append(" h.incBuomname, ");		
		hqlBuffer.append(" hs.hospitalName, ");		
		hqlBuffer.append(" hm.manfName, ");
		hqlBuffer.append(" h.incHissysid) ");
		hqlBuffer.append(" from HopInc h , Hospital hs ,HopManf hm ");		
		hqlBuffer.append(" where h.incHospid=hs.hospitalId and h.incManfid=hm.hopManfId");
		
		return (List<HopIncVo>)this.findByHql(hqlBuffer.toString());
	}

	/**
	 * @author pengzhikun
	 * @param hopIncVos
	 * @param hopInc
	 * @return 新组成的药品图片显示信息，其中包含父表HopInc的所有信息，以及子表HopIncPic与父表关联的信息
	 */
	public void getListInfo(HopIncDto dto){
				
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.INC_CODE as inccode, ");
		hqlBuffer.append("t1.INC_NAME as incname, ");
		hqlBuffer.append("t1.INC_UOMCODE as incuomcode, ");
		hqlBuffer.append("t1.INC_UOMNAME as incuomname, ");
		hqlBuffer.append("t1.INC_BUOMCODE as incbuomcode, ");
		hqlBuffer.append("t1.INC_BUOMNAME as incbuomname, ");
		hqlBuffer.append("t1.INC_FAC as incfac, ");
		hqlBuffer.append("t1.INC_MANFID as incmanfid, ");
		hqlBuffer.append("t1.INC_ID as incid, ");
		hqlBuffer.append("t1.INC_HISSYSID as inchissysid, ");
		hqlBuffer.append("t1.INC_HOSPID as inchospid, ");
		hqlBuffer.append("t1.INC_RP as incrp, ");
		hqlBuffer.append("t2.HOSPITAL_NAME as hospitalname, ");
		hqlBuffer.append("t3.NAME as manfname, ");
		hqlBuffer.append("t4.INC_PIC_ID as hopincpicid, ");
		hqlBuffer.append("t4.INC_PIC_PATH as incpicpath, ");
		hqlBuffer.append("t4.INC_PIC_SEQ as incpicseq ");
		hqlBuffer.append("from ");
		hqlBuffer.append("t_hop_inc t1 left join t_sys_hospital t2 on t1.inc_hospid=t2.hospital_id ");
		hqlBuffer.append("left join t_hop_manf t3 on t1.inc_manfid=t3.id ");
		hqlBuffer.append("left join t_hop_inc_pic t4 on t4.inc_pic_incid=t1.inc_id ");
		hqlBuffer.append(" where 1=1");
	
		HopInc hopInc=dto.getHopInc();
		if (hopInc!=null) {			
			String codeStr =hopInc.getIncCode();
			String nameStr =hopInc.getIncName();	
			Long manfDr=hopInc.getIncManfid();
			Long hospDr=hopInc.getIncHospid();
			Long hissysDr=hopInc.getIncHissysid();
			if(!StringUtils.isNullOrEmpty(codeStr)){
				hqlBuffer.append(" AND t1.INC_CODE like:codeStr ");
				hqlParamMap.put("codeStr","%"+codeStr+"%");
			}
			if(!StringUtils.isNullOrEmpty(nameStr)){
				hqlBuffer.append(" AND t1.INC_NAME like:nameStr ");
				hqlParamMap.put("nameStr","%"+nameStr+"%");
			}
			if(manfDr!=null){
				hqlBuffer.append(" AND t1.INC_MANFID =:manfDr ");
				hqlParamMap.put("manfDr",manfDr);
			}
			if(hospDr!=null){
				hqlBuffer.append(" AND t1.INC_HOSPID =:hospDr ");
				hqlParamMap.put("hospDr",hospDr);
			}
			if(hissysDr!=null){
				hqlBuffer.append(" AND t1.INC_HISSYSID =:hissysDr ");
				hqlParamMap.put("hissysDr",hissysDr);
			}
			
		}
		if(!StringUtils.isNullOrEmpty(dto.getComgridparam())){
			hqlBuffer.append(" AND t1.INC_NAME like:nameStr ");
			hqlParamMap.put("nameStr","%"+dto.getComgridparam()+"%");
		}
		hqlBuffer.append(" and t1.inc_hospid =:incihopid ");
		hqlParamMap.put("incihopid",WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
	
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), ShowHopIncVo.class, "INC_ID");
		
		
	}
	
	/**\
	 * 
	* @Title: HopIncDao.java
	* @Description: TODO(保存导入药品信息)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月10日 下午3:22:39
	* @version V1.0
	 */
	public void saveInc(HopIncDto dto){
		
		List<HopInc> hopIncs=dto.getHopIncs();
		if(hopIncs.size()>0){
			 for(int i=0;i<hopIncs.size();i++){
				 hopIncs.get(i).setIncHospid(WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
				 Long hopincIdLong=(Long)super.saveEntity(hopIncs.get(i));
				 if (!org.apache.commons.lang.StringUtils.isBlank(hopIncs.get(i).getIncAliaS())){
					 String sarray[]=hopIncs.get(i).getIncAliaS().split(BaseConstants.COMMA);
					 if (sarray.length>0){
						 for(int j=0;j<sarray.length;j++){
							 HopIncAlias incAlias=new HopIncAlias();
							 incAlias.setIncAliasText(sarray[j]);
							 incAlias.setIncAliaIncId(hopincIdLong);
							 super.save(incAlias);
						 }	 
					 }
				 }else{
					 String aliasString=PingYinUtil.getFirstSpell(hopIncs.get(i).getIncName());
					 HopIncAlias incAlias=new HopIncAlias();
					 incAlias.setIncAliasText(aliasString);
					 incAlias.setIncAliaIncId(hopincIdLong);
					 super.save(incAlias);	
				 }
			 }	 
		}
	}
	
	
	/**
	 * 
	* @Title: HopIncDao.java
	* @Description: TODO(更具药品描述取id)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月17日 上午10:30:55
	* @version V1.0
	 */
	public HopInc getIncIdByName(String name) {
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from HopInc h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.incName = :name ");
		hqlParamMap.put("name",name);
		
		Long hopId=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
		hqlBuffer.append(" and h.incHospid = :hopId ");
		hqlParamMap.put("hopId",hopId);
		
		@SuppressWarnings("unchecked")
		List<HopInc> hopCtlocs=(List<HopInc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
		if(hopCtlocs.size()>0){
			return hopCtlocs.get(0);
		}
		return null;
	}
	
	/**
	 * 医院药品id取供应商药品标识
	* @Title: HopIncDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param inc
	* @return
	* @return:String 
	* @author zhouxin  
	* @date 2014年6月19日 下午2:55:17
	* @version V1.0
	 */
	public Long getVenIncByHopInc(Long inc){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from VenHopInc h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.hopIncId = :inc ");
		hqlParamMap.put("inc",inc);

		@SuppressWarnings("unchecked")
		List<VenHopInc> venHopIncs=(List<VenHopInc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
		if(venHopIncs.size()>0){
			return venHopIncs.get(0).getVenIncId();
		}
		return null;
	}
	
	
	public Long getVenIncByCode(String code){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from VenInc h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.venIncCode = :code ");
		hqlParamMap.put("code",code);
		hqlBuffer.append(" and h.venIncVenid = :venid ");
		hqlParamMap.put("venid",WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		@SuppressWarnings("unchecked")
		List<VenInc> venHopIncs=(List<VenInc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
		if(venHopIncs.size()>0){
			return venHopIncs.get(0).getVenIncId();
		}
		return null;
	}
	
	
	public Long getHopIncByVenInc(Long inc){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		hqlBuffer.append(" from VenHopInc h");
		hqlBuffer.append(" where 1=1 ");
		hqlBuffer.append(" and h.venIncId = :inc ");
		hqlParamMap.put("inc",inc);

		@SuppressWarnings("unchecked")
		List<VenHopInc> venHopIncs=(List<VenHopInc>)this.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
		if(venHopIncs.size()>0){
			return venHopIncs.get(0).getHopIncId();
		}
		return null;
	}
	
	
	/**
	 * 
	* @Title: HopIncDao.java
	* @Description: TODO(根据医院ID和药品代码查找医院药品)
	* @param code
	* @param hopId
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年7月29日 下午7:59:54
	* @version V1.0
	 */
	public Long getHopIncByCode(String code,Long hopId){
		

		DetachedCriteria criteria = DetachedCriteria.forClass(HopInc.class);
		criteria.add(Restrictions.eq("incCode", code));
		criteria.add(Restrictions.eq("incHospid", hopId));
		@SuppressWarnings("unchecked")
		List<HopInc> hopIncs=super.findByCriteria(criteria);
		if(hopIncs.size()==0){
			return null;
		}
		return hopIncs.get(0).getIncId();
	}
	
	
	/**
	 * 
	* @Title: getSubCatInfo 
	* @Description: TODO(分页查询商品分类) 
	* @param @param dto
	* @param @return    设定文件 
	* @return List<SubCatGroup>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年3月31日 下午3:21:55
	 */
	@SuppressWarnings("unchecked")
	public List<SubCatGroup> getSubCatInfo(HopIncDto dto){
		
		if(dto.getPageModel()==null){
			dto.setPageModel(new PagerModel());
		}
		DetachedCriteria criteria = DetachedCriteria.forClass(SubCatGroup.class);
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			criteria.add(Restrictions.like("subGroupName",dto.getComgridparam().trim(),MatchMode.ANYWHERE));
		}
		return (List<SubCatGroup>)this.findByCriteria(criteria, dto.getPageModel().getPageNo(), dto.getPageModel().getPageSize());
	}
	
	
	/**
	 * 
	* @Title: findHopIncComboxVos 
	* @Description: TODO(查询医院商品) 
	* @param @param dto
	* @param @return    设定文件 
	* @return List<ComboxVo>    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 上午10:26:51
	 */
	@SuppressWarnings("unchecked")
	public List<ComboxVo> findHopIncComboxVos(HopIncDto dto) {
		
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		
		hqlBuffer.append("select ");
		hqlBuffer.append("t.INC_NAME as name, ");
		hqlBuffer.append("t.INC_ID id ");			
		hqlBuffer.append("from T_HOP_INC t ");
		hqlBuffer.append("where 1=1 ");

		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
				hqlBuffer.append("and t.INC_NAME like :name ");
				hqlParamMap.put("name", dto.getComgridparam()+"%");
		}
		return (List<ComboxVo>)jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ComboxVo.class, hqlParamMap, 1,BaseConstants.COMBOX_PAGE_SIZE, "id");
	
	} 
}

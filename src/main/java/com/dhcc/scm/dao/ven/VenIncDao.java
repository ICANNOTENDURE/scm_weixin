/**
 *  
2 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VenIncDto;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ven.ShowVenIncVo;
import com.dhcc.scm.entity.vo.ven.VenContranstIncVo;
import com.dhcc.scm.entity.vo.ven.VenIncContranstVo;

@Repository
public class VenIncDao extends HibernatePersistentObjectDAO<VenInc> {

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		VenIncDto venIncDto = (VenIncDto) dto;
		VenInc venInc = venIncDto.getVenInc();

		pagerModel.setCountProName(super.getIdName(VenInc.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, venInc, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap, VenInc venInc, StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from VenInc v ");
		// 拼接查询条件
		if (venInc != null) {
			hqlStr.append(" where 1=1 ");
			String codeStr = venInc.getVenIncCode();
			String nameStr = venInc.getVenIncName();
			Long manfDr = venInc.getVenIncManfid();
			Long venDr = venInc.getVenIncVenid();
			String vensysDr = venInc.getVenIncVensysid();
			if (!StringUtils.isNullOrEmpty(codeStr)) {
				hqlStr.append(" AND v.venIncCode like:codeStr ");
				hqlParamMap.put("codeStr", "%" + codeStr + "%");
			}
			if (!StringUtils.isNullOrEmpty(nameStr)) {
				hqlStr.append(" AND v.venIncName like:nameStr ");
				hqlParamMap.put("nameStr", "%" + nameStr + "%");
			}
			if (manfDr != null) {
				hqlStr.append(" AND v.venIncManfid =:manfDr ");
				hqlParamMap.put("manfDr", manfDr);
			}
			if (venDr != null) {
				hqlStr.append(" AND v.venIncVenid =:venDr ");
				hqlParamMap.put("venDr", venDr);
			}
			if (vensysDr != null) {
				hqlStr.append(" AND v.venIncVensysid =:vensysDr ");
				hqlParamMap.put("vensysDr", vensysDr);
			}

		}
	}

	public void save(VenInc venInc) {

		super.save(venInc);
	}

	public void delete(VenInc venInc) {

		super.delete(venInc);
	}

	public void update(VenInc venInc) {

		super.update(venInc);
	}

	public VenInc findById(VenInc venInc) {

		return super.findById(venInc.getVenIncId());

	}

	/**
	 * @param venInc
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<VenInc> getIncInfo(VenInc venInc) {

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new VenInc(");
		hqlBuffer.append(" v.venIncId, ");
		hqlBuffer.append(" v.venIncCode, ");
		hqlBuffer.append(" v.venIncName, ");
		hqlBuffer.append(" v.venIncUomname, ");
		hqlBuffer.append(" v.venIncBuomname, ");
		hqlBuffer.append(" v.venIncManfid, ");
		hqlBuffer.append(" v.venIncVenid, ");
		hqlBuffer.append(" v.venIncVensysid) ");
		hqlBuffer.append(" from VenInc v");
		return (List<VenInc>) this.findByHql(hqlBuffer.toString());
	}

	/**
	 * @author pzk
	 * @param venIncVos
	 * @param venInc
	 * @return 供应商药品信息列表
	 */
	public void getListInfo(PagerModel pagerModel, List<ShowVenIncVo> showVenIncVos, VenInc venInc) {
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.VEN_INC_CODE     as  veninccode, ");
		hqlBuffer.append("t1.VEN_INC_SPEC     as  spec, ");
		hqlBuffer.append("t1.VEN_INC_NAME     as  venincname, ");
		hqlBuffer.append("t1.VEN_INC_UOMCODE  as  venincuomcode, ");
		hqlBuffer.append("t1.VEN_INC_UOMNAME  as  venincuomname, ");
		hqlBuffer.append("t1.VEN_INC_BUOMCODE as  venincbuomcode, ");
		hqlBuffer.append("t1.VEN_INC_BUOMNAME as  venincbuomname, ");
		hqlBuffer.append("t1.VEN_INC_FAC      as  venincfac, ");
		hqlBuffer.append("t1.VEN_INC_MANFID   as  venincmanfid, ");
		hqlBuffer.append("t1.VEN_INC_ROWID       as  venincid, ");
		hqlBuffer.append("t1.VEN_INC_VENSYSID as  venincvensysid, ");
		hqlBuffer.append("t1.VEN_INC_VENID    as  venIncVenid, ");
		hqlBuffer.append("t1.VEN_INC_PRICE    as  venincprice, ");
		hqlBuffer.append("t1.VEN_INC_CATID    as  venincsubcatid, ");
		hqlBuffer.append("t2.NAME             as  name, ");
		hqlBuffer.append("t3.NAME             as  manfname, ");
		hqlBuffer.append("t4.VEN_INC_PIC_ID   as  venincpicid, ");
		hqlBuffer.append("t5.SDGI_Desc 		  as  cat, ");
		hqlBuffer.append("t6.SDG_Desc 	      as  groupcat, ");
		hqlBuffer.append("t7.SG_Desc 	      as  venincgroup, ");
		hqlBuffer.append("t4.VEN_INC_PIC_PATH as  venincpicpath, ");
		hqlBuffer.append("t4.VEN_INC_PIC_SEQ  as  venincpicseq ");
		hqlBuffer.append("from ");
		hqlBuffer.append("T_VEN_INC t1 left join T_VEN_VENDOR t2 on t1.ven_inc_venid=t2.ven_id ");
		hqlBuffer.append("left join T_HOP_MANF t3 on t1.ven_inc_manfid=t3.id ");
		hqlBuffer.append("left join T_VEN_INC_PIC t4 on t4.ven_inc_pic_venincid=t1.ven_inc_rowid and t4.VEN_INC_PIC_SEQ=1 ");
		
		hqlBuffer.append("left join T_CAT_DRUGGROUPITM t5 on t5.SDGI_ID=t1.VEN_INC_CATID ");
		hqlBuffer.append("left join T_CAT_DRUGGROUP t6 on t6.SDG_ID=t5.SDGI_Parref_ID ");
		hqlBuffer.append("left join T_CAT_GROUP t7 on t7.SG_ID=t6.SDG_PARREF_ID ");
		hqlBuffer.append(" where 1=1 ");
		// 拼接查询条件
		if (venInc != null) {
			String codeStr = venInc.getVenIncCode();
			String nameStr = venInc.getVenIncName();
			Long manfDr = venInc.getVenIncManfid();
			Long venDr = venInc.getVenIncVenid();
			if (!StringUtils.isNullOrEmpty(codeStr)) {
				hqlBuffer.append(" AND t1.VEN_INC_BARCODE  like:codeStr ");
				hqlParamMap.put("codeStr", "%" + codeStr + "%");
			}
			if (!StringUtils.isNullOrEmpty(nameStr)) {
				hqlBuffer.append(" AND t1.VEN_INC_NAME like:nameStr ");
				hqlParamMap.put("nameStr", "%" + nameStr + "%");
			}
			if (manfDr != null) {
				hqlBuffer.append(" AND t1.VEN_INC_MANFID =:manfDr ");
				hqlParamMap.put("manfDr", manfDr);
			}
			if (venDr != null) {
				hqlBuffer.append(" AND t1.VEN_INC_VENID =:venDr ");
				hqlParamMap.put("venDr", venDr);
			}
			if(venInc.getVenIncCatId()!=null){
				hqlBuffer.append(" AND t1.VEN_INC_CATID =:IncCatId ");
				hqlParamMap.put("IncCatId", venInc.getVenIncCatId());
			}
			if (!StringUtils.isNullOrEmpty(venInc.getVenIncAlias())) {
				hqlBuffer.append(" AND t1.VEN_INC_ALIAS like :venalias ");
				hqlParamMap.put("venalias", "%" + venInc.getVenIncAlias() + "%");
			}
			if(venInc.getGroupId()!=null){
				hqlBuffer.append(" AND t7.SG_ID =:groupId ");
				hqlParamMap.put("groupId", venInc.getGroupId());
			}
			if(venInc.getCatGroupId()!=null){
				hqlBuffer.append(" AND t6.SDG_ID =:catGroupId ");
				hqlParamMap.put("catGroupId", venInc.getCatGroupId());
			}
		}
		String type = WebContextHolder.getContext().getVisit().getUserInfo().getUserType().toString();
		if (type.equals("2")) {
			hqlBuffer.append(" AND t1.VEN_INC_VENID =:venDr ");
			hqlParamMap.put("venDr", WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong());
		}
		hqlBuffer.append(" order by t1.VEN_INC_VENID desc");
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(pagerModel, ShowVenIncVo.class, "VEN_INC_ROWID");

	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(医院药品对照使用)
	 * @return:void
	 * @author zhouxin
	 * @date 2014年5月29日 下午9:08:20
	 * @version V1.0
	 */
	public void listContrantInc(VenIncDto dto) {

		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append(" t1.inc_id as hopincid, ");
		hqlBuffer.append("t1.inc_code as hopinccode, ");
		hqlBuffer.append("t6.name as manf, ");
		hqlBuffer.append("t1.INC_UOMNAME as uom, ");
		hqlBuffer.append("t1.INC_SPEC as spec, ");

		hqlBuffer.append("t1.inc_name as hopincname, ");
		hqlBuffer.append("t4.hospital_name as hopname, ");
		hqlBuffer.append("t1.inc_hissysid as hopincsysid, ");
		hqlBuffer.append("t3.ven_inc_rowid  as venincid, ");
		hqlBuffer.append("t3.ven_inc_name as venincname, ");
		hqlBuffer.append("t5.name as venname, ");
		hqlBuffer.append("t3.VEN_INC_PRICE as rp, ");
		hqlBuffer.append("t8.VEN_INC_PIC_PATH as picpath, ");
		hqlBuffer.append("t3.ven_inc_vensysid as vensysid ");
		hqlBuffer.append(" from t_hop_inc t1 ");
		hqlBuffer.append("left join (SELECT HOP_INC_ID,min(VEN_INC_ID) as VEN_INC_ID from T_VEN_HOP_INC GROUP BY HOP_INC_ID) t2 on t1.inc_id=t2.hop_inc_id ");
		hqlBuffer.append("left join t_ven_inc t3 on t2.ven_inc_id=t3.VEN_INC_ROWID ");
		if (dto.getVenIncContranstDto() != null) {
			if (dto.getVenIncContranstDto().getVenId() != null) {
				hqlBuffer.append(" AND t3.ven_inc_venid =:venDr ");
				hqlParamMap.put("venDr", dto.getVenIncContranstDto().getVenId());
			}
		}
		hqlBuffer.append("left join t_ven_inc_pic t8 on t2.ven_inc_id=t8.VEN_INC_PIC_VENINCID and t8.VEN_INC_PIC_SEQ=1 ");
		hqlBuffer.append("left join t_sys_hospital t4 on t1.inc_hospid=t4.hospital_id ");
		hqlBuffer.append("left join t_ven_vendor t5 on t5.ven_id=t3.ven_inc_venid ");
		hqlBuffer.append("left join t_hop_manf t6 on t1.inc_manfid=t6.id ");
		if (dto.getVenInc() != null) {
			if (!StringUtils.isNullOrEmpty(dto.getVenInc().getVenIncAlias())) {
				hqlBuffer.append("left join (select distinct INCALIAS_TEXT,INCALIAS_INCID from T_HOP_INCALIAS where INCALIAS_TEXT like :incalias) t7 on t1.inc_id=t7.INCALIAS_INCID ");
				hqlParamMap.put("incalias", "%" + dto.getVenInc().getVenIncAlias() + "%");
			}
		}
		hqlBuffer.append(" where 1=1 ");
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType().longValue()!=0){
			hqlBuffer.append(" AND t1.inc_hospid =:hopid ");
			hqlParamMap.put("hopid", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		
		if (dto.getVenInc() != null) {
			if (!StringUtils.isNullOrEmpty(dto.getVenInc().getVenIncAlias())) {
				hqlBuffer.append("and t7.INCALIAS_TEXT like :incalias1 ");
				hqlParamMap.put("incalias1", "%" + dto.getVenInc().getVenIncAlias() + "%");
			}
		}
		if (dto.getVenIncContranstDto() != null) {

			if (!StringUtils.isNullOrEmpty(dto.getVenIncContranstDto().getIncName())) {
				hqlBuffer.append(" AND t1.inc_name  like :hopincname11 ");
				hqlParamMap.put("hopincname11", "%" + dto.getVenIncContranstDto().getIncName() + "%");
			}
			if (!StringUtils.isNullOrEmpty(dto.getVenIncContranstDto().getIncCode())) {
				hqlBuffer.append(" AND t1.INC_BARCODE  like :hopincode11 ");
				hqlParamMap.put("hopincode11", "%" + dto.getVenIncContranstDto().getIncCode() + "%");
			}
			if (dto.getVenIncContranstDto().getFlag().equals("1")) {
				hqlBuffer.append(" AND t3.ven_inc_rowid is not null ");
			}
			if (dto.getVenIncContranstDto().getFlag().equals("2")) {
				hqlBuffer.append(" AND t3.ven_inc_rowid is  null ");
			}
			if(dto.getVenIncContranstDto().getHopId()!=null){
				hqlBuffer.append(" AND t1.inc_hospid  like :hopid ");
				hqlParamMap.put("hopid", dto.getVenIncContranstDto().getHopId() );
			}
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VenIncContranstVo.class, "inc_id");
	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(保存药品关联)
	 * @param dto
	 * @return:void
	 * @author zhouxin
	 * @date 2014年5月30日 下午5:27:29
	 * @version V1.0
	 */
	public void saveContranst(VenIncDto dto) {

		StringBuffer hqlStr = new StringBuffer();
		hqlStr.delete(0, hqlStr.length());
		hqlStr.append(" delete from  VenHopInc t ");
		hqlStr.append(" where t.venIncId = ? ");
		this.updateByHqlWithFreeParam(hqlStr.toString(), dto.getVenHopInc().getVenIncId());

		hqlStr.delete(0, hqlStr.length());
		hqlStr.append(" delete from  VenHopInc t ");
		hqlStr.append(" where  t.hopIncId=?");
		this.updateByHqlWithFreeParam(hqlStr.toString(), dto.getVenHopInc().getHopIncId());
		super.save(dto.getVenHopInc());
		dto.setOpFlg("1");
	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(列出供应商药品供医院对照)
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月11日 下午12:00:53
	 * @version V1.0
	 */
	public void listVenContranst(VenIncDto dto) {
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append("select ");
		hqlBuffer.append("t1.VEN_INC_CODE as veninccode, ");
		hqlBuffer.append("t1.VEN_INC_ROWID as venincid, ");
		hqlBuffer.append("t1.VEN_INC_NAME as venincname, ");
		hqlBuffer.append("t4.name as manf, ");
		hqlBuffer.append("t1.VEN_INC_UOMNAME as uom, ");
		hqlBuffer.append("t1.VEN_INC_SPEC as spec, ");
		hqlBuffer.append("t1.VEN_INC_VENSYSID as vensysid, ");
		hqlBuffer.append("t1.VEN_INC_PRICE as rp, ");
		hqlBuffer.append("t3.inc_code as hopinccode, ");
		hqlBuffer.append("t3.INC_UOMNAME as hopincuom, ");
		hqlBuffer.append("t3.inc_id as hopincid, ");
		hqlBuffer.append("t3.inc_name as hopincname, ");
		hqlBuffer.append("t3.inc_hissysid as hopincsysid, ");
		hqlBuffer.append("t5.name as venname, ");
		hqlBuffer.append("t6.HOSPITAL_NAME as hopname, ");
		hqlBuffer.append("t2.VEN_HOP_INC_ID as facId, ");
		hqlBuffer.append("t2.VEN_FAC as venfac, ");
		hqlBuffer.append("t2.HOP_FAC as hopfac, ");
		hqlBuffer.append("round(t1.VEN_INC_PRICE*t2.VEN_FAC/t2.HOP_FAC,2) as hoprp, ");
		hqlBuffer.append("t2.VEN_HOP_AUDITFLAG as auditflag, ");
		hqlBuffer.append("t2.VEN_INC_FAC as fac ");

		hqlBuffer.append(" from t_ven_inc t1 ");
		hqlBuffer.append("left join t_ven_hop_inc t2 on t2.ven_inc_id=t1.VEN_INC_ROWID ");
		hqlBuffer.append("left join t_hop_inc t3 on t3.inc_id=t2.hop_inc_id  ");
		//医院用户审核自己医院的商品
		if (WebContextHolder.getContext().getVisit().getUserInfo().getUserType() == 1) {
			hqlBuffer.append(" and t3.inc_hospid =:incihopid ");
			hqlParamMap.put("incihopid", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		hqlBuffer.append("left join t_hop_manf t4 on t1.VEN_INC_MANFID=t4.id ");
		hqlBuffer.append("left join t_ven_vendor t5 on t1.VEN_INC_VENID=t5.ven_id ");
		hqlBuffer.append("left join T_SYS_HOSPITAL t6 on t3.INC_HOSPID=t6.HOSPITAL_ID ");
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			hqlBuffer.append("left join (select distinct INCALIAS_TEXT,INCALIAS_INCID from T_HOP_INCALIAS where INCALIAS_TEXT like :incalias) t7 on t3.inc_id=t7.INCALIAS_INCID ");
			hqlParamMap.put("incalias", "%" + dto.getComgridparam() + "%");
		}
		hqlBuffer.append(" where 1=1 ");
		
		if (WebContextHolder.getContext().getVisit().getUserInfo().getUserType() == 1) {
			hqlBuffer.append(" and t3.inc_hospid =:incihopid ");
			hqlParamMap.put("incihopid", WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getComgridparam())){
			//hqlBuffer.append(" AND (t3.inc_name  like :inputstr )");
			//hqlParamMap.put("inputstr", "%" + dto.getComgridparam().trim() + "%");
			hqlBuffer.append(" AND ( t7.INCALIAS_INCID is not null or t3.inc_name  like :inputstr)");
			hqlParamMap.put("inputstr", "%" + dto.getComgridparam().trim() + "%");
		}
		
		if (dto.getVenIncContranstDto() != null) {
			
			if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getVenIncContranstDto().getHopIncCode())){
				hqlBuffer.append(" AND t3.INC_CODE  like :hopincode ");
				hqlParamMap.put("hopincode", "%" + dto.getVenIncContranstDto().getHopIncCode() + "%");
			}
			
			if(org.apache.commons.lang3.StringUtils.isNotBlank(dto.getVenIncContranstDto().getHopIncName())){
				hqlBuffer.append(" AND t3.INC_NAME  like :hopincname ");
				hqlParamMap.put("hopincname", "%" + dto.getVenIncContranstDto().getHopIncName() + "%");
			}

			
			if (!StringUtils.isNullOrEmpty(dto.getVenIncContranstDto().getIncName())) {
				hqlBuffer.append(" AND t1.VEN_INC_NAME  like :venincname ");
				hqlParamMap.put("venincname", "%" + dto.getVenIncContranstDto().getIncName() + "%");
			}
			if (!StringUtils.isNullOrEmpty(dto.getVenIncContranstDto().getIncCode())) {
				hqlBuffer.append(" AND t1.ven_inc_code  like :venincode ");
				hqlParamMap.put("venincode", "%" + dto.getVenIncContranstDto().getIncCode() + "%");
			}
			if (dto.getVenIncContranstDto().getFlag().equals("1")) {
				hqlBuffer.append(" AND t2.hop_inc_id is not null ");
			}
			if (dto.getVenIncContranstDto().getFlag().equals("2")) {
				hqlBuffer.append(" AND t2.hop_inc_id is  null ");
			}
			// 供应商药品审批资质
			if (dto.getVenIncContranstDto().getAuditflag() != null) {
				if (dto.getVenIncContranstDto().getAuditflag().equals("1")) {
					hqlBuffer.append(" AND t2.VEN_HOP_AUDITFLAG is null ");
				}
				if (dto.getVenIncContranstDto().getAuditflag().equals("2")) {
					hqlBuffer.append(" AND t2.VEN_HOP_AUDITFLAG='Y' ");
				}
				if (dto.getVenIncContranstDto().getAuditflag().equals("3")) {
					hqlBuffer.append(" AND t2.VEN_HOP_AUDITFLAG='N' ");
				}
			}
			if(dto.getVenIncContranstDto().getHopId()!=null){
				hqlBuffer.append(" and t3.inc_hospid =:hopid ");
				hqlParamMap.put("hopid", dto.getVenIncContranstDto().getHopId());
			}
		}
		if (dto.getVenInc() != null) {
			if (!StringUtils.isNullOrEmpty(dto.getVenInc().getVenIncAlias())) {
				hqlBuffer.append(" AND t1.VEN_INC_ALIAS  like :venincalias ");
				hqlParamMap.put("venincalias", "%" + dto.getVenInc().getVenIncAlias() + "%");
			}
			if (dto.getVenInc().getVenIncVenid() != null) {
				hqlBuffer.append(" AND t1.VEN_INC_VENID  =:vendorid ");
				hqlParamMap.put("vendorid", dto.getVenInc().getVenIncVenid());
			}
		}
		if (dto.getVenHopInc() != null) {
			if (dto.getVenHopInc().getHopIncId() != null) {
				hqlBuffer.append(" AND t2.hop_inc_id  =:hopincid2 ");
				hqlParamMap.put("hopincid2", dto.getVenHopInc().getHopIncId());
			}
		}
		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VenContranstIncVo.class, "VEN_INC_ROWID");

	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(导入供应商药品)
	 * @param dto
	 * @return:void
	 * @author zhouxin
	 * @date 2014年6月12日 下午2:13:07
	 * @version V1.0
	 */
	public void exportVenInc(VenIncDto dto) {
		super.batchSaveOrUpdate(dto.getVenIncs());
	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param code
	 * @return
	 * @return:Long
	 * @author zhouxin
	 * @date 2014年7月11日 下午4:40:19
	 * @version V1.0
	 */
	public Long getVenIncByCode(String code, Long venId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(VenInc.class);
		criteria.add(Restrictions.eq("venIncCode", code));
		criteria.add(Restrictions.eq("venIncVenid", venId));
		@SuppressWarnings("unchecked")
		List<VenInc> venIncs = super.findByCriteria(criteria);
		if (venIncs.size() == 0) {
			return null;
		}
		return venIncs.get(0).getVenIncId();
	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO()
	 * @param hopIncs
	 * @return:void
	 * @author zhouxin
	 * @date 2014年7月30日 上午9:44:12
	 * @version V1.0
	 */
	public void saveVenHopIncList(List<VenHopInc> hopIncs) {
		super.batchSaveOrUpdate(hopIncs);
	}

	/**
	 * 
	 * @Title: VenIncDao.java
	 * @Description: TODO(用一句话描述该文件做什么)
	 * @param hopInc
	 * @param vendorId
	 * @return
	 * @return:float
	 * @author zhouxin
	 * @date 2014年7月30日 下午4:21:09
	 * @version V1.0
	 */
	public float getFacByhopInc(long hopInc, Long vendorId) {

		List<VenHopInc> venHopIncs = super.findByProperty(VenHopInc.class, "hopIncId", hopInc);
		float fac = 0f;
		if (venHopIncs.size() == 0) {
			return 0f;
		}
		for (VenHopInc venHopInc : venHopIncs) {
			VenInc venInc = super.get(VenInc.class, venHopInc.getVenIncId());
			if (venInc.getVenIncVenid().toString().equals(vendorId.toString())) {
				fac = venHopInc.getVenFac().floatValue() / venHopInc.getHopFac().floatValue();
				return fac;
			}
		}
		return fac;
	}
	

}

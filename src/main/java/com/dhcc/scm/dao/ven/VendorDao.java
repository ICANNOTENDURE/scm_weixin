/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.IpUtil;
import com.dhcc.framework.util.PingYinUtil;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.hop.HopVendorLog;
import com.dhcc.scm.entity.ven.VenQualifPic;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.VenQualification;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;
import com.dhcc.scm.entity.vo.ven.VendorVo;

@Repository
public class VendorDao extends HibernatePersistentObjectDAO<Vendor> {

	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;

	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {

		VendorDto vendorDto = (VendorDto) dto;
		Vendor vendor = vendorDto.getVendor();

		pagerModel.setCountProName(super.getIdName(Vendor.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();

		buildQuery(hqlParamMap, vendor, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/**
	 * 拼接查询条件的方法
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void buildQuery(Map hqlParamMap, Vendor vendor, StringBuilder hqlStr) {
		// 拼接查询条件
		hqlStr.append(" from Vendor where 1=1 ");
		if (vendor!=null){
			if (vendor.getCode()!=null){
				 hqlStr.append(" and code like :code ");
				 hqlParamMap.put("code", "%"+vendor.getCode()+"%");
			}
			if (vendor.getName()!=null){
				 hqlStr.append(" and name like :name ");
				 hqlParamMap.put("name", "%"+vendor.getName()+"%");
			}
			if (!StringUtils.isNullOrEmpty(vendor.getAlias())){
				 hqlStr.append(" and alias like :alias ");
				 hqlParamMap.put("alias", "%"+vendor.getAlias().toLowerCase()+"%");
			}
		}
	}

	public void save(Vendor vendor) {

		super.save(vendor);
	}

	public void delete(Vendor vendor) {

		super.delete(vendor);
	}

	public void update(Vendor vendor) {

		super.update(vendor);
	}

	public Vendor findById(Vendor vendor) {

		return super.findById(vendor.getVendorId());

	}

	public void saveOrUpdate(VendorDto dto) {

		if(StringUtils.isNullOrEmpty(dto.getVendor().getAlias())){
			dto.getVendor().setAlias(PingYinUtil.getFirstSpell(dto.getVendor().getName()));
		}
		super.saveOrUpdate(dto.getVendor());
		for (int i = 0; i < dto.getVendor().getVenQualificationList().size(); i++) {
			VenQualification qualification=dto.getVendor().getVenQualificationList().get(i);
			qualification.setVendorid(dto.getVendor().getVendorId());
			VenQualifType qualifType=super.get(VenQualifType.class,qualification.getVenQualifTypeId());
			if(!qualifType.getType().equals("图片")){
				super.saveOrUpdate(qualification);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public List<VenQualifTypeVO> queryQualifyType(VendorDto dto) {

		Vendor vendor = dto.getVendor();

		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select ");
		hqlBuffer.append("t1.venqualiftype_id as type,t1.name as name ,t2.EXPDATE as expdate ,t2.QUALIFICATION_ID as   qualif,t1.type as fieldtype,t2.QUALIFY_DESCRIPTION as description,t1.code code  ");// ,t2.venQualificationId,t2.expdate,t2.vendorid)																														// ");
		hqlBuffer.append(" from ");
		hqlBuffer.append(" T_VEN_QUALIF_TYPE t1   left  join T_VEN_QUALIFICATION t2 ");
		hqlBuffer.append(" on t1.VENQUALIFTYPE_ID=t2.QUALIFY_TYPE_ID");
	
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		if (vendor != null) {
			if ((vendor.getVendorId() != null)) {
				hqlBuffer.append(" AND t2.VENDOR_ID=:vendorid ");
				hqlParamMap.put("vendorid", vendor.getVendorId());

			}
		}
		hqlBuffer.append(" order by t1.seq ");
		List<VenQualifTypeVO> venQualifTypeVOList=jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), VenQualifTypeVO.class, hqlParamMap);
		for(int i=0;i<venQualifTypeVOList.size();i++){
			if(venQualifTypeVOList.get(i).getQualif()!=null){
				Map<String, Object> paramMap = new HashMap<String, Object>();
				StringBuffer hql = new StringBuffer();
				hql.append(" from ");
				hql.append(" VenQualifPic t ");
				hql.append(" where t.qualifyid = :qualifyid ");
				paramMap.put("qualifyid",venQualifTypeVOList.get(i).getQualif());
				List<VenQualifPic> VenQualifPics=super.findByHqlWithValuesMap(hql.toString(),paramMap,false);
				venQualifTypeVOList.get(i).setVenQualifPics(VenQualifPics);
			}
		}
		return venQualifTypeVOList;
	}
	
	
	/**
	 * 
	* @Title: saveOrUpdatePic 
	* @Description: TODO(供应商上传资质图片) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月27日 下午2:45:45
	 */
	@SuppressWarnings({ "unchecked" })
	public void saveOrUpdatePic(VendorDto dto) {

		if (dto.getVendor()==null){
			Vendor vendor=new Vendor();
			super.saveOrUpdate(vendor);
			dto.setVendor(vendor);
		}
		
		if (dto.getVenQualifTypeVO().getQualif()==null){
			String[] propertyNames={"venQualifTypeId","vendorid"};
			Object[] values={dto.getVenQualifTypeVO().getType(),dto.getVendor().getVendorId()};
			List<VenQualification> VenQualificationList=super.findByProperties(VenQualification.class, propertyNames, values);
			if(VenQualificationList.size()>0){
				dto.getVenQualifTypeVO().setQualif(VenQualificationList.get(0).getVenQualificationId());
			}		
		}
		
		if (dto.getVenQualifTypeVO().getQualif()==null){
			VenQualification venQualification=new VenQualification();
			venQualification.setVendorid(dto.getVendor().getVendorId());
			venQualification.setVenQualifTypeId(dto.getVenQualifTypeVO().getType());
			super.saveOrUpdate(venQualification);
			dto.getVenQualifTypeVO().setQualif(venQualification.getVenQualificationId());
		}
		VenQualifPic venQualifPic=new VenQualifPic();
		venQualifPic.setPath(dto.getStorgeFileName());
		venQualifPic.setName(dto.getUploadFileName());
		venQualifPic.setQualifyid(dto.getVenQualifTypeVO().getQualif());
		super.saveOrUpdate(venQualifPic);
	   
		///供应商修改历史日志记录
        VenQualifType venQualifType=super.get(VenQualifType.class, dto.getVenQualifTypeVO().getType());
        HopVendorLog log=new HopVendorLog();
        log.setOperateType("增加");
        log.setOperateType("P");
        log.setOptitle(venQualifType.getName());
        log.setVendorId(dto.getVendor().getVendorId());
        log.setOpContent(venQualifPic.getPath());
		log.setOperateIp(IpUtil.getIpAddrByRequest(WebContextHolder.getContext().getRequest()));
		log.setOperateDate(new Date());
		if(WebContextHolder.getContext().getVisit()==null){
			log.setOpUserName(dto.getVendor().getName());
		}else{
			log.setOpUserName(WebContextHolder.getContext().getVisit().getUserInfo().getName());
		}
		
		super.saveOrUpdate(log);
		dto.setVenQualifPic(venQualifPic);
	}
	
	@SuppressWarnings("unchecked")
	public List<Vendor> findVenComboList(VendorDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append(" select new Vendor(");
		hqlBuffer.append(" t.vendorId, ");
		hqlBuffer.append(" t.name ) ");
		hqlBuffer.append(" from Vendor t ");
		hqlBuffer.append(" where 1=1 ");
		if(dto.getVendor()!=null){
			if(dto.getVendor().getName()!=null){
				hqlBuffer.append("and  (t.name like :name");
				hqlParamMap.put("name", dto.getVendor().getName()+"%");
				hqlBuffer.append(" or t.alias like :alias )");
				hqlParamMap.put("alias", dto.getVendor().getName()+"%");
			}
		}
		if(!StringUtils.isNullOrEmpty(dto.getComgridparam())){
				hqlBuffer.append("and (t.name like :name");
				hqlParamMap.put("name", dto.getComgridparam()+"%");
				hqlBuffer.append(" or t.alias like :alias )");
				hqlParamMap.put("alias", dto.getComgridparam()+"%");
			
		}
		if(!StringUtils.isNullOrEmpty(WebContextHolder.getContext().getRequest().getParameter("venid"))){
			hqlBuffer.append(" and t.vendorId =:yyy ");
			hqlParamMap.put("yyy", Long.valueOf(WebContextHolder.getContext().getRequest().getParameter("venid")));
		}
		return (List<Vendor>)super.findByHqlWithValuesMap(hqlBuffer.toString(),1,20,hqlParamMap,true);
		
	}
	
	
	/**
	 * 
	* @Title: VendorDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param name
	* @return
	* @return:Long 
	* @author zhouxin  
	* @date 2014年6月12日 下午2:37:21
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public Long findVendorIdByName(String name){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" Vendor t ");
		hql.append(" where 1=1 ");
		hql.append(" and t.name = :name ");
		paramMap.put("name", name);
		List<Vendor> hopVendors=(List<Vendor>) this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
		if(hopVendors.size()==1){
			return hopVendors.get(0).getVendorId();
		}
		return null;
	}
	
	
	/**
	 * 
	* @Title: listVendor 
	* @Description: TODO(查询供应商，供应商注册审核时使用) 
	* @param @param name    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 上午8:28:31
	 */
	public void listVendor(VendorDto dto){
		
		
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		Long hopId=WebContextHolder.getContext().getVisit().getUserInfo().getHopId();
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select ");
		sqlStr.append("t1.VEN_ID vendorid, ");
		sqlStr.append("t1.CODE code, ");
		sqlStr.append("t1.NAME name, ");
		sqlStr.append("t1.ADDRESS address, ");
		sqlStr.append("t1.FAX fax, ");
		sqlStr.append("t1.TEL tel, ");
		sqlStr.append("t1.ACCOUNT account, ");
		sqlStr.append("t1.CONTACT contact, ");
		sqlStr.append("t1.EMAIL email, ");
		sqlStr.append("t1.TAXATION taxation, ");
		sqlStr.append("t2.H_AUDITFLAG auditflag, ");//add hxy
		sqlStr.append("t2.H_VENID hopvendorid ");//主键
		sqlStr.append("from ");
		sqlStr.append("T_VEN_VENDOR t1 ") ; 
		sqlStr.append("left join T_HOP_VENDOR t2 on t1.VEN_ID=T2.H_VENDORID ");
		sqlStr.append("where 1=1 ");
		//根据登录人员做判断   感觉还是有问题
		if(type==1){
			sqlStr.append(" and t2.H_HOPID="+hopId);
		}
		
		//审批资质
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getAuditFlag())){
			if(dto.getAuditFlag().equals("1")){
				sqlStr.append(" and t2.H_AUDITFLAG='Y' " );
			}
			if(dto.getAuditFlag().equals("2")){
				sqlStr.append(" and t2.H_AUDITFLAG='N' " );
			}
			if(dto.getAuditFlag().equals("3")){
				sqlStr.append(" and t2.H_AUDITFLAG is null " );
			}
		}
		if(dto.getVendor()!=null){
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getVendor().getName())){
				sqlStr.append(" and t1.NAME like :name" );
				hqlParamMap.put("name", "%"+dto.getVendor().getName().trim()+"%");
			}
			if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getVendor().getAlias())){
				sqlStr.append(" and t1.ALIAS like :alias" );
				hqlParamMap.put("alias", "%"+dto.getVendor().getAlias().trim()+"%");
			}
		}
		if(org.apache.commons.lang.StringUtils.isNotBlank(dto.getInputStr())){
			sqlStr.append(" and (t1.ACCOUNT=:inputStr or t1.TAXATION=:inputStr or t1.EMAIL=:inputStr)" );
			hqlParamMap.put("inputStr", dto.getInputStr().trim());
		}
		dto.getPageModel().setQueryHql(sqlStr.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VendorVo.class, "t1.VEN_ID");
	}
	
	/**
	*@Title: listVendorHistory 
	* @Description: TODO(供应商审核历史) 
	* @author hxy   
	* @date 2016年3月31日 上午11:10:31
	 */
	public void listVendorHistory(VendorDto dto){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
//		String userId=WebContextHolder.getContext().getVisit().getUserInfo().getId();
		
		hqlBuffer.append(" select ");
		hqlBuffer.append(" t1.VEN_ID vendorid, ");
		hqlBuffer.append(" t1.CODE code, ");
		hqlBuffer.append(" t1.NAME name, ");
		hqlBuffer.append(" t2.AUDIT_LOG_USERID loguserid, ");
		hqlBuffer.append(" t2.AUDIT_LOG_DATE logdate, ");
		hqlBuffer.append(" t2.AUDIT_LOG_RESULT logresult, ");
		hqlBuffer.append(" t2.AUDIT_LOG_IP logip, ");
		hqlBuffer.append(" t2.AUDIT_LOG_TYPE logtype ");		
		hqlBuffer.append(" from ");
		hqlBuffer.append(" T_VEN_VENDOR t1 left join T_VEN_AUDIT_LOG t2 on t1.VEN_ID=T2.AUDIT_LOG_VENID  ");
		hqlBuffer.append(" where 1=1 ");
        //hqlBuffer.append(" and t2.AUDIT_LOG_USERID ="+userId||1 );//当前和平台
		if(dto.getVendor().getVendorId()!=null){
		hqlBuffer.append(" and t2.AUDIT_LOG_VENID ="+dto.getVendor().getVendorId() );
		}

		dto.getPageModel().setQueryHql(hqlBuffer.toString());
		dto.getPageModel().setHqlParamMap(hqlParamMap);
		jdbcTemplateWrapper.fillPagerModelData(dto.getPageModel(), VendorVo.class, "t1.VEN_ID");
	}
}

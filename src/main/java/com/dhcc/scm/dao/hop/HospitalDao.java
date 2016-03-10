/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.hop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.hop.HospitalDto;
import com.dhcc.scm.entity.hop.Hospital;

@Repository
public class HospitalDao extends HibernatePersistentObjectDAO<Hospital> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		HospitalDto hospitalDto = (HospitalDto) dto;
		Hospital hospital = hospitalDto.getHospital();

		pagerModel.setCountProName("HOSPITAL_ID");
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, hospital, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map<String, Object> hqlParamMap,Hospital hospital,StringBuilder hqlStr){
		
//		hqlStr.append(" select new com.dhcc.pms.entity.hop.Hospital(");
//		hqlStr.append(" h.hospitalId, ");
//		hqlStr.append(" h.hospitalCode, ");
//		hqlStr.append(" h.hospitalHisdr, ");
//		hqlStr.append(" h.hospitalName) ");
		hqlStr.append(" from Hospital h ");
		//拼接查询条件		
		if (hospital!=null) {
			hqlStr.append(" where 1=1 ");
			String hospCode =hospital.getHospitalCode();
			String hospName =hospital.getHospitalName();	
			Long hosHisDr=hospital.getHospitalHisdr();
			if(!StringUtils.isNullOrEmpty(hospCode)){
				hqlStr.append(" AND h.hospitalCode like:hospCode ");
				hqlParamMap.put("hospCode","%"+hospCode+"%");
			}
			if(hosHisDr!=null){
				hqlStr.append(" AND h.hospitalHisdr =:hosHisDr ");
				hqlParamMap.put("hosHisDr",hosHisDr);
			}
			if(!StringUtils.isNullOrEmpty(hospName)){
				hqlStr.append(" AND h.hospitalName like:hospName ");
				hqlParamMap.put("hospName","%"+hospName+"%");
			}
		}
	}
		
	public void save(Hospital hospital){
	
		super.save(hospital);
	}
	
	public void delete(Hospital hospital){
		
		super.delete(hospital);
	}
	
	public void update(Hospital hospital){
	
		super.update(hospital);
	}
	
	public Hospital findById(Hospital hospital){

		return super.findById(hospital.getHospitalId());

	}

	
	@SuppressWarnings("unchecked")
	public List<Hospital> getHospInfo(Hospital hospital) {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new Hospital(");
		hqlBuffer.append(" h.hospitalId, ");
		hqlBuffer.append(" h.hospitalName) ");
		hqlBuffer.append(" from Hospital h");
		
		return (List<Hospital>)this.findByHql(hqlBuffer.toString());
		
		
	} 
	
	
	/**
	 * 
	* @Title: HospitalDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param name
	* @return
	* @return:Hospital 
	* @author zhouxin  
	* @date 2014年7月28日 下午5:50:07
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public Hospital getHospitalByName(String name){
		DetachedCriteria criteria = DetachedCriteria.forClass(Hospital.class);
		criteria.add(Restrictions.eq("hospitalName", name));
		List<Hospital> hospitals=super.findByDetachedCriteria(criteria);
		if(hospitals.size()==0){
			return null;
		}
//		System.out.println(hospitals.get(0).toString());
		return hospitals.get(0);
	}

}

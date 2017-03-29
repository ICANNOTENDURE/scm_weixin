/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.ven;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.ven.VenQualifTypeDto;
import com.dhcc.scm.entity.ven.VenIncqQualif;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.VenQualification;

@Repository
public class VenQualifTypeDao extends HibernatePersistentObjectDAO<VenQualifType> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		VenQualifTypeDto venQualifTypeDto = (VenQualifTypeDto) dto;
		VenQualifType venQualifType = venQualifTypeDto.getVenQualifType();

		pagerModel.setCountProName(super.getIdName(VenQualifType.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, venQualifType, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,VenQualifType venQualifType,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from VenQualifType where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
		//hqlStr.append("WHERE YEAR=:year ");
		//hqlParamMap.put("year", year);
		//hqlStr.append("AND MONTH=:month ");
		//hqlParamMap.put("month", month);
		//hqlStr.append("AND DAY=:day ");
		//hqlParamMap.put("day", day);
	}
		
	public void save(VenQualifType venQualifType){
	
		super.save(venQualifType);
	}
	
	public void delete(VenQualifType venQualifType){
		
		super.delete(venQualifType);
	}
	
	public void update(VenQualifType venQualifType){
	
		super.update(venQualifType);
	}
	
	public VenQualifType findById(VenQualifType venQualifType){

		return super.findById(venQualifType.getVenQualifTypeId());

	}
	
	/**
	 * 检查供应商资质是否过期
	 * @param venId
	 * @return
	 */
	public String checkVenQualify(Long venId){
		
		StringBuffer sb=new StringBuffer();
		long now=new Date().getTime();
		String[] propertyNames={"vendorid"};
		Object[] values={venId};
		List<VenQualification> list=super.findByProperties(VenQualification.class, propertyNames, values);
		for(VenQualification qualification:list){
			if(qualification.getExpdate()!=null){
				if(qualification.getExpdate().getTime()<now){
					sb.append(qualification.getVenQualifType().getName()+"过期.");
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 检查供应商商品资质是否过期
	 * @param 商品id
	 * @return 
	 */
	public String checkVenIncQualify(Long id){
		
		StringBuffer sb=new StringBuffer();
		long now=new Date().getTime();
		String[] propertyNames={"qualifyIncId"};
		Object[] values={id};
		List<VenIncqQualif> list=super.findByProperties(VenIncqQualif.class, propertyNames, values);
		for(VenIncqQualif incqQualif:list){
			if(incqQualif.getQualifDate()!=null){
				if(incqQualif.getQualifDate().getTime()<now){
					sb.append(incqQualif.getSysQualifType().getName()+"过期.");
				}
			}
		}
		return sb.toString();
	}
}

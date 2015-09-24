/**
 *  
 * template by zxx
 */
package com.dhcc.scm.dao.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.sys.SysImpModelDto;
import com.dhcc.scm.entity.sys.ImpModel;
import com.fasterxml.jackson.core.type.TypeReference;

@Repository
public class ImpModelDao extends HibernatePersistentObjectDAO<ImpModel> {

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		SysImpModelDto sysImpModelDto = (SysImpModelDto) dto;
		ImpModel impModel = sysImpModelDto.getImpModel();

		pagerModel.setCountProName(super.getIdName(ImpModel.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, impModel, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(@SuppressWarnings("rawtypes") Map hqlParamMap,ImpModel impModel,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append(" from ImpModel where 1=1 ");
		//接下来拼接其他查询条件 如下示例代码所示
//		hqlStr.append("WHERE YEAR=:year ");
//		hqlParamMap.put("year", year);
//		hqlStr.append("AND MONTH=:month ");
//		hqlParamMap.put("month", month);
//		hqlStr.append("AND DAY=:day ");
//		hqlParamMap.put("day", day);
	}
		
	public void save(ImpModel impModel){
	
		super.save(impModel);
	}
	
	public void delete(ImpModel impModel){
		
		super.delete(impModel);
	}
	
	public void update(ImpModel impModel){
	
		super.update(impModel);
	}
	
	public ImpModel findById(ImpModel impModel){

		return super.findById(impModel.getImpModelId());

	}
	
	/**
	 * 
	* @Title: ImpModelDao.java
	* @Description: TODO(查找模版的字段)
	* @param impMode
	* @return
	* @return:Literal<ImpModel> 
	* @author zhouxin  
	* @date 2014年6月2日 下午5:10:47
	* @version V1.0
	 */

	@SuppressWarnings("unchecked")
	public List<ImpModel> getModelList(ImpModel impMode){
		
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append(" from  ImpModel t ");
		if(!StringUtils.isNullOrEmpty(impMode.getType())){
			hqlBuffer.append(" where t.type = :type");
			hqlParamMap.put("type",impMode.getType());
		}
		hqlBuffer.append(" order by t.seq ");
		return (List<ImpModel>)super.findByHqlWithValuesMap(hqlBuffer.toString(),hqlParamMap,false);
	}
	
	
	/**
	 * 
	* @Title: ImpModelDao.java
	* @Description: TODO(保存excel顺序)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月3日 上午10:03:00
	* @version V1.0
	 */
	public void saveModel(SysImpModelDto dto){
		
		StringBuffer hqlStr = new StringBuffer();
		hqlStr.delete(0, hqlStr.length());
		hqlStr.append(" delete from  ImpModel t ");
		hqlStr.append(" where t.type = ? ");
		this.updateByHqlWithFreeParam(hqlStr.toString(),dto.getImpModel().getType());
		
		List<ImpModel> ImpModelList=JsonUtils.toObject(dto.getImModelString(), new TypeReference<List<ImpModel>>() { });

		super.batchSaveOrUpdate(ImpModelList);
		dto.setOpFlg("1");
	}
}

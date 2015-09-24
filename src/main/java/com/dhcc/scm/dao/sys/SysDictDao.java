package com.dhcc.scm.dao.sys;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.sys.SysDictDto;
import com.dhcc.scm.entity.sys.SysDict;

/**
 * <p>标题：</p>
 * <p>业务描述：</p>
 * <p>公司：东华软件股份公司</p>
 * <p>版权：dhcc2013</p>
 * @author 吴杰
 * @date 2013年12月9日
 * @version 
 */
@Repository
public class SysDictDao extends HibernatePersistentObjectDAO<SysDict> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		//把dto转化为需要的DemoDto,得到Demo对象
		SysDictDto sysDictDto=(SysDictDto)dto;
		SysDict sysDict=sysDictDto.getSysDict();
		//用来统计总记录数的属性，实体类的属性名,与entity中的相同
		pagerModel.setCountProName("id");
		
		StringBuilder hqlStr=new StringBuilder();
		Map<String, Object>hqlParamMap=new HashMap<String, Object>();
		
		buildQuery(hqlParamMap,sysDict,hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		
	}

	
	private void buildQuery(Map hqlParamMap, SysDict sysDict,
			StringBuilder hqlStr) {

		hqlStr.append(" from SysDict s ");
		if (sysDict!=null) {
			hqlStr.append(" where 1=1 ");
			String dicName =sysDict.getName();
			String dicType =sysDict.getType();			
			if(!StringUtils.isNullOrEmpty(dicName)){
				hqlStr.append(" AND s.name like:dicName ");
				hqlParamMap.put("dicName","%"+dicName+"%");
			}
			if(!StringUtils.isNullOrEmpty(dicType)){
				hqlStr.append(" AND s.type like:dicType ");
				hqlParamMap.put("dicType","%"+dicType+"%");
			}
		}
	}
	

	public void save(SysDict sysDict){
			
		super.saveOrUpdate(sysDict);
	}
	
	public void delete(SysDict sysDict){
		
		super.delete(sysDict);
	}
	
	public void update(SysDict sysDict){
	
		super.update(sysDict);
	}
	
	public SysDict findById(SysDict sysDict){
		
		 return super.findById(sysDict.getId());
	}

	
}

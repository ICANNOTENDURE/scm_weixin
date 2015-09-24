package com.dhcc.scm.dao.sys;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.scm.dto.sys.LogDto;
import com.dhcc.scm.entity.sys.SysDict;
import com.dhcc.scm.entity.sys.SysLog;

/**
 * <p>标题：</p>
 * <p>业务描述：</p>
 * <p>公司：东华软件股份公司</p>
 * <p>版权：dhcc2013</p>
 * @date 2013年12月9日
 * @version 
 */
@Repository
public class LogDao extends HibernatePersistentObjectDAO<SysDict> {

	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		//把dto转化为需要的DemoDto,得到Demo对象
		LogDto logDto=(LogDto)dto;
		SysLog log=logDto.getTlog();
		//用来统计总记录数的属性，实体类的属性名,与entity中的相同
		pagerModel.setCountProName("opId");
		
		StringBuilder hqlStr=new StringBuilder();
		Map<String, Object>hqlParamMap=new HashMap<String, Object>();
		
		hqlStr.append(" from SysLog s ");
		hqlStr.append(" where 1=1 ");
		if(log!=null){
			hqlStr.append(" and opName=:OPName ");
			hqlParamMap.put("OPName", log.getOpName());
		}
		if(logDto.getStartDate()!=null){
			hqlStr.append(" and opDate>=:stdate ");
			hqlParamMap.put("stdate", logDto.getStartDate());
		}
		if(logDto.getEndDate()!=null){
			hqlStr.append(" and opDate<=:eddate ");
			hqlParamMap.put("eddate", logDto.getEndDate());
		}
		if(!StringUtils.isNullOrEmpty(dto.getSort())){
				hqlStr.append(" order by  "+dto.getSort());
				if(!StringUtils.isNullOrEmpty(dto.getSortOrder())){
					hqlStr.append(" "+dto.getSortOrder());
				}
		}
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
		
	}

	
}

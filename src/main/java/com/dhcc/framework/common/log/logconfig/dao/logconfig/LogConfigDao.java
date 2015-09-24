package com.dhcc.framework.common.log.logconfig.dao.logconfig;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.entity.LogConfigure;
import com.dhcc.framework.common.log.logconfig.dto.logconfig.LogConfigDto;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;

@Repository
public class LogConfigDao extends HibernatePersistentObjectDAO<LogConfigure> {
	

	public void buildPagerModelQuery(PagerModel pagerModel,BaseDto dto) {
	
		LogConfigDto logConfigDto = (LogConfigDto) dto;
		LogConfigure logConfigure = logConfigDto.getLogConfigure();
		//按主键来统计记录数，如有必要可以手动指定其他属性，
		//如多对像连查时，且主建名相同，这时就要手动加上"别名.主键名"形式
		pagerModel.setCountProName(super.getIdName(LogConfigure.class));
		StringBuilder hqlStr = new StringBuilder();
		Map<String,Object> hqlParamMap = new HashMap<String,Object>();
		
		buildQuery(hqlParamMap, logConfigure, hqlStr);
		pagerModel.setQueryHql(hqlStr.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}

	/** 
	 * 拼接查询条件的方法  
	 * @param hql
	 * @return
	 */
	private void buildQuery(Map hqlParamMap,LogConfigure logConfigure,StringBuilder hqlStr){
		//拼接查询条件
		hqlStr.append("from LogConfigure where 1=1 ");
		if(logConfigure != null){
			String title = logConfigure.getTitle();
			String args = logConfigure.getArgs();
			String method = logConfigure.getMethod();
			//拼接查询条件
			//接下来拼接其他查询条件 如下示例代码所示
			if(title != null && !"".equals(title)){
				hqlStr.append("AND log_title=:title ");
				hqlParamMap.put("title", title);
			}
			if(method != null && !"".equals(method)){
				hqlStr.append("AND log_method=:method ");
				hqlParamMap.put("method", method);
			}
			if(args != null && !"".equals(args)){
				hqlStr.append("AND log_args=:args ");
				hqlParamMap.put("args", args);
			}
		}
	}
		
	public void save(LogConfigure logConfigure){
	
		super.saveOrUpdate(logConfigure);
	}
	
	public void delete(LogConfigure logConfigure){
		
		super.delete(logConfigure);
	}
}
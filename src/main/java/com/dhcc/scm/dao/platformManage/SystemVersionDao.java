package com.dhcc.scm.dao.platformManage;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.SystemVersion;

/**
 * <p>标题: SystemVersionDao.java</p>
 * <p>业务描述:统一运维及安全管理平台  业务系统版本库持久化操作类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@Repository
public class SystemVersionDao extends HibernatePersistentObjectDAO<SystemVersion>{

	/* (非 Javadoc)   
	* <p>Title: buildPagerModelQuery</p>   
	* <p>Description: </p>   
	* @param pagerModel
	* @param dto   
	* @see com.dhcc.framework.hibernate.dao.PersistentObjectDAO#buildPagerModelQuery(com.dhcc.framework.common.PagerModel, com.dhcc.framework.transmission.dto.BaseDto)   
	*/
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		// TODO Auto-generated method stub
		
	}

	/** 
	* 方法名:          buildQueryHql
	* 方法功能描述:    拼接查询语句
	* @param:         systemVersionDto
	* @return:        String
	* @Author:        李飞
	* @Create Date:   2013年10月18日 下午2:56:48
	*/
	private String buildQueryHql(SystemVersionDto systemVersionDto) {
		StringBuilder hqlStr = new StringBuilder();
		hqlStr.append("select new SystemVersion( ");
		hqlStr.append("s.versionId, ");
		hqlStr.append("s.parentId, ");
		hqlStr.append("s.description, ");
		hqlStr.append("s.filePath, ");
		hqlStr.append("s.systemType, ");
		hqlStr.append("s.systemName, ");
		hqlStr.append("s.contextRoot, ");
		hqlStr.append("s.useState, ");
		hqlStr.append("s.version) ");
		hqlStr.append("from SystemVersion s ");
		hqlStr.append("where 1=1 ");
		if(systemVersionDto.getColumnName().length()!=0&&systemVersionDto.getColumnValue().length()!=0){
			if("parentId".equals(systemVersionDto.getColumnName())){
				hqlStr.append(" and s."+systemVersionDto.getColumnName()+" = "+systemVersionDto.getColumnValue());
			}else{
				hqlStr.append(" and s."+systemVersionDto.getColumnName()+" = '"+systemVersionDto.getColumnValue()+"'");
			}
		}

        return hqlStr.toString();
	}
	
	/** 
	* 方法名:          findSystemVersion
	* 方法功能描述:    获取列表树
	* @param:         SystemVersionDto
	* @return:        List<SystemVersion>
	* @Author:        李飞
	* @Create Date:   2013年10月21日 下午2:43:11
	*/
	@SuppressWarnings("unchecked")
	public List<SystemVersion> findSystemVersion(SystemVersionDto systemVersionDto) {
		try {
			String hql = buildQueryHql(systemVersionDto);
			List<SystemVersion> list = super.findByHql(hql);
			
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			throw new DataBaseException(e.getMessage(), e);
		}
	}
}

package com.dhcc.scm.dao.userManage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.StatelessSession;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.userManage.RoleDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.entity.userManage.RoleFunc;
import com.dhcc.scm.entity.userManage.RoleLoc;
import com.dhcc.scm.entity.userManage.RoleVendor;

/**
 * 标题: RoleDao.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年9月3日
 * @version V1.0 
 */
@Repository
public class RoleDao extends HibernatePersistentObjectDAO<Role>{

	/**
	 * 
	* 方法名:          buildPagerModelQuery
	* 方法功能描述:     分页获取角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年8月30日 下午6:05:47
	 */
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		RoleDto roleDto = (RoleDto)dto;
		pagerModel.setCountProName("roleId");
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap= new HashMap<String, Object>();
		
		this.buildQuery(roleDto,hqlBuffer,hqlParamMap);
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(hqlParamMap);
	}
	/**
	 * 
	* 方法名:          buildQuery
	* 方法功能描述:     拼装分页查询语句
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月30日 下午5:35:47
	 */
	private void buildQuery(RoleDto roleDto,StringBuffer hqlBuffer,Map<String, Object> hqlParamMap){
		hqlBuffer.append(" from Role ");
		hqlBuffer.append(" where 1=1 ");
		if(roleDto.getColumnName().length()!=0&&roleDto.getColumnValue().length()!=0){
			hqlBuffer.append(" and "+roleDto.getColumnName()+" like :columnValue ");
			hqlParamMap.put("columnValue", "%"+roleDto.getColumnValue()+"%");
		}
		hqlBuffer.append(" and useState = :useState ");
		hqlParamMap.put("useState", roleDto.getRole().getUseState());
    }
	
	/**
	 * 
	* 方法名:          getFuncsByRoleId
	* 方法功能描述:    获取角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午2:04:26
	 */
	@SuppressWarnings("unchecked")
	public void getRoleFuncs(RoleDto roleDto) throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append(" from RoleFunc t ");
		hql.append(" where t.roleId = ? ");
		List<RoleFunc> roleFuncs = (List<RoleFunc>)this.findByHql(hql.toString(),Long.valueOf(roleDto.getRoleId()));
		roleDto.setRoleFuncs(roleFuncs);
	}
	
	/**
	 * 
	* 方法名:          removeRoleFunc
	* 方法功能描述:    移除角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月29日 下午4:35:43
	 */
	public void removeRoleFunc(RoleDto roleDto) throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append(" delete ");
		hql.append(" from RoleFunc t ");
		hql.append(" where ");
		hql.append(" t.roleId = ? ");
		
		this.updateByHqlWithFreeParam(hql.toString(), roleDto.getRoleId());
	}
	
	/**
	 * 
	* 方法名:          saveRoleFuncs
	* 方法功能描述:    批量保存角色权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月11日 下午4:55:57
	 */
	public void saveRoleFuncs(List<RoleFunc> roleFuncs) throws Exception{
		StatelessSession session = null;
		try {
			session = this.getSessionFactory().openStatelessSession();
			session.beginTransaction();
			for(int i=0;i<roleFuncs.size();i++){
				session.insert(roleFuncs.get(i));
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(), e);
		}finally{
			if(session!=null){
				session.close();
			}
		}
		
	}
	
	
	
	/**
	 * 
	* 方法名:          queryNormalAccountByPageModel
	* 方法功能描述:    获取拥有该角色的普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月31日 上午11:31:29
	 */
	public void queryNormalAccountByPageModel(RoleDto roleDto) throws Exception{
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select ");
		hqlBuffer.append(" new NormalAccount(t2.accountName,t2.accountAlias,t2.onlineState,t2.useState) ");
		hqlBuffer.append(" from ");
		hqlBuffer.append(" NormalAccountRole t1,NormalAccount t2,Role t3 ");
		hqlBuffer.append(" where ");
		hqlBuffer.append(" t1.accountId = t2.accountId ");
		hqlBuffer.append(" and t1.roleId = t3.roleId ");
		hqlBuffer.append(" and t3.roleId = '"+roleDto.getRoleId()+"' ");
		if(roleDto.getColumnName().length()!=0&&roleDto.getColumnValue().length()!=0){
			hqlBuffer.append(" and t2."+roleDto.getColumnName()+" like '%"+roleDto.getColumnValue()+"%' ");
		}
		
		PagerModel pagerModel = roleDto.getPageModel();
		pagerModel.setQueryHql(hqlBuffer.toString());
		pagerModel.setHqlParamMap(null);

		int totalRows = this.getResultCountWithValuesMap(
				pagerModel.getQueryHql(), pagerModel.getHqlParamMap(), "*", false).intValue();
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList<NormalAccount>());
		}
		pagerModel.setTotals(totalRows);
		
		pagerModel.setPageData(this.findByHqlWithValuesMap(
				pagerModel.getQueryHql(), pagerModel.getPageNo(), pagerModel.getPageSize(),
				pagerModel.getHqlParamMap(), false));
		
	}
	
	/**
	 * 
	* 方法名:          findRole
	* 方法功能描述:    获取某个角色信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月25日 下午4:15:39
	 */
	@SuppressWarnings("unchecked")
	public List<Role> findRole(RoleDto roleDto) {
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" Role t ");
		hql.append(" where t.systemType = ? ");
		hql.append(" and t.roleCode = ? ");
		return (List<Role>)this.findByHql(hql.toString(), roleDto.getSystemType(),roleDto.getRole().getRoleCode());
	}
	
	/**
	 * 
	* @Title: RoleDao.java
	* @Description: TODO(查询权限有的供应商)
	* @param roleDto
	* @throws Exception
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午4:23:45
	* @version V1.0
	 */
	public void getRoleVens(RoleDto roleDto) {
		StringBuffer hql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		hql.append(" from RoleVendor t ");
		hql.append(" where t.sysRoleId = ? ");
		@SuppressWarnings("unchecked")
		List<RoleVendor> roleVendors = (List<RoleVendor>)this.findByHql(hql.toString(),Long.valueOf(roleDto.getRoleId()));
		roleDto.setRoleVendors(roleVendors);
		
		
		hql.delete(0, hql.length());
		hql.append(" from HopVendor t ");
		hql.append(" where 1=1 ");
		
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType()==1){
			hql.append(" and t.hopHopId = :hopId ");
			paramMap.put("hopId",WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		@SuppressWarnings("unchecked")
		List<HopVendor> hopVendors = (List<HopVendor>)this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
		roleDto.setHopVendors(hopVendors);
	}
	
	/**
	 * 
	* @Title: RoleDao.java
	* @Description: TODO(查询权限有的科室)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午4:38:43
	* @version V1.0
	 */
	public void getRoleLocs(RoleDto roleDto) {
		StringBuffer hql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		hql.append(" from RoleLoc t ");
		hql.append(" where t.sysRoleId = ? ");
		@SuppressWarnings("unchecked")
		List<RoleLoc> roleLocs = (List<RoleLoc>)this.findByHql(hql.toString(),Long.valueOf(roleDto.getRoleId()));
		roleDto.setRoleLocs(roleLocs);
		
		
		hql.delete(0, hql.length());
		hql.append(" from HopCtloc t ");
		hql.append(" where 1=1 ");
		
		if(WebContextHolder.getContext().getVisit().getUserInfo().getUserType()==1){
			hql.append(" and t.hospid = :hopId ");
			paramMap.put("hopId",WebContextHolder.getContext().getVisit().getUserInfo().getHopId());
		}
		@SuppressWarnings("unchecked")
		List<HopCtloc> hopCtlocs = (List<HopCtloc>)this.findByHqlWithValuesMap(hql.toString(),paramMap,false);
		roleDto.setHopCtlocs(hopCtlocs);
	}
	
	/**
	 * 
	* @Title: RoleDao.java
	* @Description: TODO(保存角色供应商权限)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:55:21
	* @version V1.0
	 */
	public void saveRoleVen(RoleDto roleDto){
		StringBuffer hql = new StringBuffer();
		hql.append(" delete ");
		hql.append(" from RoleVendor t ");
		hql.append(" where ");
		hql.append(" t.sysRoleId = ? ");
		this.updateByHqlWithFreeParam(hql.toString(), roleDto.getRoleId());
		
		super.batchSaveOrUpdate(roleDto.getRoleVendors());
	}
	
	/**
	 * 
	* @Title: RoleDao.java
	* @Description: TODO(保存角色科室权限)
	* @param roleDto
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月12日 下午8:55:43
	* @version V1.0
	 */
	public void saveRoleLoc(RoleDto roleDto){
		
		StringBuffer hql = new StringBuffer();
		hql.append(" delete ");
		hql.append(" from RoleLoc t ");
		hql.append(" where ");
		hql.append(" t.sysRoleId = ? ");
		this.updateByHqlWithFreeParam(hql.toString(), roleDto.getRoleId());
		
		super.batchSaveOrUpdate(roleDto.getRoleLocs());
	}
}

package com.dhcc.scm.dao.userManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.StatelessSession;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.userManage.NormalAccountDto;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.userManage.NormalAccountRole;
import com.dhcc.scm.entity.userManage.Role;
import com.dhcc.scm.entity.vo.combo.ComboxVo;

/**
 * 标题: NormalAccountDao.java
 * 业务描述：安全运维管理平台
 * 公司:东华软件股份公司
 * 版权:dhcc2013
 * @author 聂文来
 * @date 2013年10月16日
 * @version V1.0 
 */ 
@Repository
public class NormalAccountDao extends HibernatePersistentObjectDAO<NormalAccount>{
	
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	/**
	 * 
	* 方法名:          buildPagerModelQuery
	* 方法功能描述:       分页获取普通用户帐户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 上午10:09:19
	 */
	@Override
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto) {
		NormalAccountDto normalAccountDto = (NormalAccountDto)dto;
		pagerModel.setCountProName("name");
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap= new HashMap<String, Object>();
		
		this.buildQuery(normalAccountDto,hqlBuffer,hqlParamMap);
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
	private void buildQuery(NormalAccountDto normalAccountDto,StringBuffer hqlBuffer,Map<String, Object> hqlParamMap){
		hqlBuffer.append(" from NormalAccount ");
		hqlBuffer.append(" where 1=1 ");
		if(normalAccountDto.getColumnName().length()!=0&&normalAccountDto.getColumnValue().length()!=0){
			hqlBuffer.append(" and "+normalAccountDto.getColumnName()+" like :columnValue ");
			hqlParamMap.put("columnValue", "%"+normalAccountDto.getColumnValue()+"%");
		}
    }
	
	/**
	 * 
	* 方法名:          deleteNormalAccount
	* 方法功能描述:    根据id删除普通用户账户
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午6:20:40
	 */
	public void deleteNormalAccount(Long accountId) throws Exception{
		NormalAccount normalAccount = this.get(NormalAccount.class, accountId);
		this.delete(normalAccount);
	}
	
	/**
	 * 
	* 方法名:          getRoles
	* 方法功能描述:    获取该系统所有角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月14日 下午2:13:05
	 */
	@SuppressWarnings("unchecked")
	public void getRoles(NormalAccountDto normalAccountDto) throws Exception{
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" from Role ");
		hqlBuffer.append(" where 1=1 ");
		if(normalAccountDto.getColumnName().length()!=0&&normalAccountDto.getColumnValue().length()!=0){
			hqlBuffer.append(" and "+normalAccountDto.getColumnName()+" like '%"+normalAccountDto.getColumnValue()+"%' ");
		}
		
		normalAccountDto.setRoles((List<Role>)this.findByHql(hqlBuffer.toString()));
	}
	/**
	 * 
	* 方法名:          getPraAccountRole
	* 方法功能描述:    根据账户获取账户角色
	* @param:        
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月12日 上午9:24:16
	 */
	@SuppressWarnings("unchecked")
	public void getNormalAccountRoles(NormalAccountDto normalAccountDto) throws Exception{
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" from  NormalAccountRole t ");
		hqlBuffer.append(" where t.accountId = ? ");
		normalAccountDto.setNormalAccountRoles((List<NormalAccountRole>)this.findByHql(hqlBuffer.toString(), Long.valueOf(normalAccountDto.getAccountId())));
	}
	
	/**
	 * 
	* 方法名:          removePraAccountRole
	* 方法功能描述:    移除账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月14日 上午11:05:09
	 */
	@SuppressWarnings("unchecked")
	public void removeNormalAccountRole(NormalAccountDto normalAccountDto) throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append(" select ");
		hql.append(" new NormalAccountRole(t1.accountId,t1.roleId) ");
		hql.append(" from ");
		hql.append(" NormalAccountRole t1,Role t2 ");
		hql.append(" where ");
		hql.append(" t1.roleId = t2.roleId ");
		hql.append(" and t1.accountId = ? ");
		List<NormalAccountRole> normalAccountRoles = (List<NormalAccountRole>)this.findByHql(hql.toString(),Long.valueOf(normalAccountDto.getAccountId()));
		
		StatelessSession session = null;
		try {
			session = this.getSessionFactory().openStatelessSession();
			session.beginTransaction();
			for(int i=0;i<normalAccountRoles.size();i++){
				session.delete(normalAccountRoles.get(i));
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
	* 方法名:          saveNormalAccountRoles
	* 方法功能描述:    批量保存普通用户账户角色
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月11日 下午4:46:30
	 */
	public void saveNormalAccountRoles(List<NormalAccountRole> normalAccountRoles) throws Exception{
		StatelessSession session = null;
		try {
			session = this.getSessionFactory().openStatelessSession();
			session.beginTransaction();
			for(int i=0;i<normalAccountRoles.size();i++){
				session.insert(normalAccountRoles.get(i));
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
	* 方法名:          getNormalAccountFunc
	* 方法功能描述:     根据普通账户id获取账户权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月16日 下午8:22:40
	 */
	@SuppressWarnings("unchecked")
	public void getNormalAccountFunc(NormalAccountDto normalAccountDto) throws Exception{
    	StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select distinct ");
		hqlBuffer.append(" new Func(t4.funcId,t4.funcName,t4.parentId) ");
		hqlBuffer.append(" from ");
		hqlBuffer.append(" NormalAccount t1,NormalAccountRole t2,RoleFunc t3,Func t4 ");
		hqlBuffer.append(" where ");
		hqlBuffer.append(" t1.accountId = t2.accountId ");
		hqlBuffer.append(" and t2.roleId = t3.roleId ");
		hqlBuffer.append(" and t3.funcId = t4.funcId ");
		hqlBuffer.append(" and t1.accountId = ? ");
		
		normalAccountDto.setFuncs((List<Func>)this.findByHql(hqlBuffer.toString(), Long.valueOf(normalAccountDto.getAccountId()))); 
	}
	
	/**
	 * 
	* 方法名:          findNormalAccount
	* 方法功能描述:    根据帐户名和密码获取账户信息
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月18日 下午4:18:08
	 */
	@SuppressWarnings("unchecked")
	public List<NormalAccount> findNormalAccount(NormalAccountDto normalAccountDto){
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" from ");
		hqlBuffer.append(" NormalAccount t ");
		hqlBuffer.append(" where t.accountAlias =? ");
		hqlBuffer.append(" and t.password =? ");
		return (List<NormalAccount>)this.findByHql(hqlBuffer.toString(), normalAccountDto.getNormalAccount().getAccountAlias(),normalAccountDto.getNormalAccount().getPassword());
	}
	
	/**
	 * 
	* 方法名:          updatePassword
	* 方法功能描述:     更新普通用户账户密码
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年10月28日 下午4:18:30
	 */
	public void updatePassword(NormalAccount normalAccount) throws Exception{
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" update ");
		hqlBuffer.append(" NormalAccount t ");
		hqlBuffer.append(" set t.password = ? ");
		hqlBuffer.append(" where t.accountId = ? ");
		this.updateByHqlWithFreeParam(hqlBuffer.toString(), normalAccount.getPassword(), normalAccount.getAccountId());
	}
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月21日 下午3:35:13
	 */
	@SuppressWarnings("unchecked")
	public void configOnly(NormalAccountDto normalAccountDto) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" NormalAccount t ");
		hql.append(" where t.accountAlias = :accountAlias ");
		paramMap.put("accountAlias",normalAccountDto.getNormalAccount().getAccountAlias());
		if(null!=normalAccountDto.getAccountAliasOld()&&normalAccountDto.getAccountAliasOld().length()>0){
			hql.append(" and t.accountAlias != :accountAliasOld ");
			paramMap.put("accountAliasOld", normalAccountDto.getAccountAliasOld());
		}
		
		normalAccountDto.setNormalAccounts((List<NormalAccount>)this.findByHqlWithValuesMap(hql.toString(),paramMap,false));
	}
	

	/**
	 * 
	* @Title: NormalAccountDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param locid
	* @return
	* @return:List<ComboxVo> 
	* @author zhouxin  
	* @date 2014年6月25日 上午11:28:31
	* @version V1.0
	 */
	@SuppressWarnings("unchecked")
	public List<ComboxVo> getUserByLoc(Long locid){
		StringBuffer hqlBuffer = new StringBuffer();
		Map<String, Object> hqlParamMap = new HashMap<String, Object>();
		hqlBuffer.append("select t1.user_id as id, ");
		hqlBuffer.append("t1.realname as name ");
		hqlBuffer.append("from t_sys_normal_user t1  ");
		hqlBuffer.append("where  t1.locid=:locid");
		hqlParamMap.put("locid", locid);
		return jdbcTemplateWrapper.queryAllMatchListWithParaMap(hqlBuffer.toString(), ComboxVo.class, hqlParamMap);
	}
	
	/**
	 * 
	* @Title: NormalAccountDao.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param account
	* @return
	* @return:NormalAccount 
	* @author zhouxin  
	* @date 2014年7月2日 下午5:34:26
	* @version V1.0
	 */
	public NormalAccount getNormalAccountByAccount(String account) {


		StringBuilder hqlStr=new StringBuilder(64);
		hqlStr.append(" from NormalAccount t where ");
		hqlStr.append("accountAlias=?");
		@SuppressWarnings("unchecked")
		List<NormalAccount>  normalAccounts=this.findByHql(hqlStr.toString(), account);
		if(normalAccounts.size()>=1){
			return normalAccounts.get(0);
		}
		return null;
	}
}

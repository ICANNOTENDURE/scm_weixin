package com.dhcc.scm.dao.userManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.StatelessSession;
import org.springframework.stereotype.Repository;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.HibernatePersistentObjectDAO;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.dto.userManage.FuncDto;
import com.dhcc.scm.entity.userManage.Func;


@Repository
public class FuncDao extends HibernatePersistentObjectDAO<Func>{

	@Override
	public void buildPagerModelQuery(PagerModel arg0, BaseDto arg1) {
		
	}
	
	/**
	 * 
	* 方法名:          funcList
	* 方法功能描述:      获取权限树
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年9月23日 下午3:01:16
	 */
	@SuppressWarnings("unchecked")
	public List<Func> findFuncs(FuncDto funcDto) throws Exception{
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new Func(");
		hqlBuffer.append(" t.funcId, ");
		hqlBuffer.append(" t.funcName, ");
		hqlBuffer.append(" t.parentId, ");
		hqlBuffer.append(" t.isLeaf, ");
		hqlBuffer.append(" t.menuSeq, ");
		hqlBuffer.append(" t.url, ");
		hqlBuffer.append(" t.imgUrl, ");
		hqlBuffer.append(" t.secutiryUrl, ");
		hqlBuffer.append(" t.useState,");
		hqlBuffer.append(" t.backColor) ");
		hqlBuffer.append(" from Func t ");
		
		//hqlBuffer.append(" where t.useState = '1'");
		
		return (List<Func>)this.findByHql(hqlBuffer.toString());
	}
	
	/**
	 * 
	* 方法名:          getFuncListBySystemType
	* 方法功能描述:    通过系统类型代码获取该系统下的所有权限
	* @param:         
	* @return:        
	 */
	@SuppressWarnings("unchecked")
	public void getFuncListBySystemType(FuncDto funcDto) throws Exception {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select new Func( ");
		hqlBuffer.append(" t.secutiryUrl) ");
		hqlBuffer.append(" from Func t ");
		hqlBuffer.append(" where t.useState = '1' ");
		
		funcDto.setFuncs(this.findByHql(hqlBuffer.toString()));
	}
	
	/**
	 * 
	* 方法名:          saveFuncs
	* 方法功能描述:     批量保存权限
	* @param:         
	* @return:        
	 */
	public void saveFuncs(List<Func> funcs) throws Exception {
		StatelessSession session = null;
		try {
			session = this.getSessionFactory().openStatelessSession();
			session.beginTransaction();
			for(int i=0;i<funcs.size();i++){
				session.insert(funcs.get(i));
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
	* 方法名:          structuringFunc
	* 方法功能描述:     结构化权限
	* @param:         
	* @return:        
	* @Author:        聂文来
	* @Create Date:   2013年11月6日 上午9:21:26
	 */
	@SuppressWarnings("unchecked")
	public void structuringFunc(Func func) throws Exception{
		List<Func> funcs = null;
		StringBuffer hqlBuffer = new StringBuffer();
		
		//获取该节点的所有子节点
		hqlBuffer.append(" from Func t ");
		hqlBuffer.append(" where t.seq = ? ");
		hqlBuffer.append(" and t.useState = ? ");
		funcs = (List<Func>)this.findByHql(hqlBuffer.toString(), func.getMenuSeq(),func.getUseState());
		
		//若该节点有子节点
		if(null!=funcs&&funcs.size()>0){
			
			//将该节点设为非叶子节点
			hqlBuffer.delete(0, hqlBuffer.length());
			hqlBuffer.append(" update Func t ");
			hqlBuffer.append(" set t.isLeaf = 0 ");
			hqlBuffer.append(" where t.menuSeq = ? ");
			hqlBuffer.append(" and t.useState = ? ");
			this.updateByHqlWithFreeParam(hqlBuffer.toString(),func.getMenuSeq(),func.getUseState());
			
			//获取该节点
			hqlBuffer.delete(0, hqlBuffer.length());
			hqlBuffer.append(" from Func t ");
			hqlBuffer.append(" where t.menuSeq = ? ");
			hqlBuffer.append(" and t.useState = ? ");
			funcs = (List<Func>)this.findByHql(hqlBuffer.toString(), func.getMenuSeq(),func.getUseState());
			Func funcTemp = null; 
			if(null!=funcs&&funcs.size()>0){
				funcTemp = funcs.get(0);
			}
			
			//将该节点所有子节点parentId设为该节点的id
			if(null!=funcTemp){
				hqlBuffer.delete(0, hqlBuffer.length());
				hqlBuffer.append(" update Func t ");
				hqlBuffer.append(" set t.parentId = ? ");
				hqlBuffer.append(" where t.seq = ? ");
				hqlBuffer.append(" and t.useState = ? ");
				this.updateByHqlWithFreeParam(hqlBuffer.toString(), funcTemp.getFuncId(),func.getMenuSeq(),func.getUseState());
			}
	    //若该节点无子节点,将该节点设为叶子节点
		}else{
			hqlBuffer.delete(0, hqlBuffer.length());
			hqlBuffer.append(" update Func t ");
			hqlBuffer.append(" set t.isLeaf = 1 ");
			hqlBuffer.append(" where t.menuSeq = ? ");
			hqlBuffer.append(" and t.useState = ? ");
			this.updateByHqlWithFreeParam(hqlBuffer.toString(), func.getMenuSeq(),func.getUseState(),func.getUseState());
		}
	}
	
	/**
	 * 
	* 方法名:          getFuncsByAccount
	* 方法功能描述:     通过账户信息获取账户权限
	* @param:         
	* @return:        
	* @Author:       
	 */
	@SuppressWarnings("unchecked")
	public void getFuncsByAccount(FuncDto funcDto) throws Exception {
		StringBuffer hqlBuffer = new StringBuffer();
		hqlBuffer.append(" select distinct ");
		hqlBuffer.append(" new Func(t4.funcId,t4.funcName,t4.parentId,t4.isLeaf,t4.menuSeq,t4.url,t4.imgUrl,t4.secutiryUrl) ");
		hqlBuffer.append(" from ");
		hqlBuffer.append(" NormalAccount t1,NormalAccountRole t2,RoleFunc t3,Func t4 ");
		hqlBuffer.append(" where ");
		hqlBuffer.append(" t1.accountId = t2.accountId ");
		hqlBuffer.append(" and t2.roleId = t3.roleId ");
		hqlBuffer.append(" and t3.funcId = t4.funcId ");
		hqlBuffer.append(" and t1.accountId = ? ");
		List<Func> funcs = (List<Func>)this.findByHql(hqlBuffer.toString(), funcDto.getAccountId());
		funcDto.setFuncs(funcs);
	}
	
	/**
	 * 
	* 方法名:          configOnly
	* 方法功能描述:    确定权限编号的唯一性
	* @param:         
	* @return:        
	* @Author:        
	 */
	@SuppressWarnings("unchecked")
	public void configOnly(FuncDto funcDto) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		hql.append(" from ");
		hql.append(" Func t ");
		hql.append(" where t.useState = :useState ");
		hql.append(" and t.menuSeq = :menuSeq ");
		paramMap.put("useState",funcDto.getFunc().getUseState());
		paramMap.put("menuSeq",funcDto.getFunc().getMenuSeq());
		if(null!=funcDto.getMenuSeqOld()&&funcDto.getMenuSeqOld().length()>0){
			hql.append(" and t.menuSeq != :menuSeqOld ");
			paramMap.put("menuSeqOld", funcDto.getMenuSeqOld());
		}
		
		funcDto.setFuncs((List<Func>)this.findByHqlWithValuesMap(hql.toString(),paramMap,false));
	}
	
}







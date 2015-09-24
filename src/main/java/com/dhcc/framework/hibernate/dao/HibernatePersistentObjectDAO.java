package com.dhcc.framework.hibernate.dao;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import com.dhcc.framework.util.GenericsUtils;

/**
 * PersistentObjectDAO 的hibernate实现
 * @author liuyg
 * @version 0.5
 * @since 2013-07-21
 */
public abstract  class HibernatePersistentObjectDAO<T extends Serializable> extends CommonDao  implements
		PersistentObjectDAO<T> {
	
	
	protected static Log logger = LogFactory.getLog(HibernatePersistentObjectDAO.class);
	protected Class<T> entityClass;



	@SuppressWarnings("unchecked")
	protected HibernatePersistentObjectDAO() {
		super();
		this.entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	}
	
	protected HibernatePersistentObjectDAO(Class<T> entityClass) {
		super();
		this.entityClass = entityClass;
	}
	
	@SuppressWarnings("unchecked")
	public void  comonDelete(@SuppressWarnings("rawtypes") Map praAndValueMap ){
		
		if(praAndValueMap==null||(praAndValueMap!=null&&praAndValueMap.isEmpty())){
			logger.info("no parameter and it's value ,so dont't exe delete opration");
			return ;
		}
		StringBuilder hql = new StringBuilder() ;
		hql.append("delete from ").append( entityClass.getName() );
		if(praAndValueMap!=null&&!praAndValueMap.isEmpty()){
			hql.append(" where 1=1 ");
			@SuppressWarnings("rawtypes")
			Iterator it = praAndValueMap.entrySet().iterator();
			while (it.hasNext()) {
				
				Map.Entry<String, Object> me = (Map.Entry<String, Object>) it.next();
				if(me.getValue() instanceof List){
					hql.append(" and  ").append(me.getKey()).append(" in (:").append(me.getKey()).append(")");
				}else{
					hql.append(" and  ").append(me.getKey()).append(" =:").append(me.getKey());
				}
			}
		}
		super.updateByHqlWithValuesMap(hql.toString(), praAndValueMap);
	}

	public List<T> findAll() {
		return findByWhere("", "");
	}

	public List<Long> findAllIds() {
		return findIdsByWhere("", "");
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findById(Serializable id) {
		T entity = null;
		try {
			entity = ((T) getCurrentSession().get(entityClass, id));
			if (entity != null ){
				return entity;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return entity;
	}
	
	public T findById(String id){
		T entity = null;
		try {
			entity = ((T) getCurrentSession().get(entityClass, id));
			if (entity != null ){
				return entity;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return entity;
	}

	@Override
	public List<T> findByWhere(String where, String order) {
		return findByWhere(where, new Object[0], order);
	}

	public Integer updateByHqlWithFreePara(final String hql, final Object[] objects){
		Query query = this.createQuery(hql);
		if (objects != null) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return (Integer)query.executeUpdate();
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<T> findByWhere(String where, Object[] values, String order) {
		List<T> coll = new ArrayList<T>();
		try {
			String query = "from " + entityClass.getCanonicalName() 
					+ (StringUtils.isNotEmpty(where) ? " and (" + where + ") " : " ")
					+ (StringUtils.isNotEmpty(order) ? order : " ");
			logger.debug("Execute query: " + query);
			coll = (List<T>) super.findByHql(query, values,false);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return coll;
	}

	@Override
	public List<Long> findIdsByWhere(String where, String order) {
		return findIdsByWhere(where, new Object[0], order);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Long> findIdsByWhere(String where, Object[] values, String order) {
		List<Long> coll = new ArrayList<Long>();
		try {
			String query = "select "+super.getIdName(entityClass) +" from " + entityClass.getCanonicalName()
					+ (StringUtils.isNotEmpty(where) ? " and (" + where + ") " : " ")
					+ (StringUtils.isNotEmpty(order) ? order : " ");
			logger.debug("Execute query: " + query);
			coll = (List<Long>)super.findByHql(query, values,false);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return coll;
	}

	@SuppressWarnings("unchecked")
	public List<Object> findByQuery(String query, Object[] values) {
		List<Object> coll = new ArrayList<Object>();
		try {
			logger.debug("Execute query: " + query);
			coll = (List<Object>) super.findByHql(query, values != null ? values : new Object[0],false);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return coll;
	}

	public boolean store(T entity) {
		boolean result = true;
		try {
			super.saveOrUpdate(entity);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result = false;
		}
		return result;
	}

	
	public void initialize(T entity) {
		
	}




}

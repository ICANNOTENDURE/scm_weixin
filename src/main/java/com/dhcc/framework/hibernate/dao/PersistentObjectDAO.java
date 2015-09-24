package com.dhcc.framework.hibernate.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;

import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.dto.BaseDto;

/**
 * 持久化对像DAO操作接口
 * 
 * @author liuyg
 */
public interface PersistentObjectDAO<T extends Serializable> {
	
	/**
	 * This method persists the entity object.
	 * 
	 * @param entity entity to be stored.
	 * @return True if successfully stored in a database.
	 */
	public boolean store(T entity);

	/**
	 * This method deletes an entity or many entity.
	 * 
	 * @param praAndValueMap  of the entity which should be deleted ,key will be the property as where express .
	 */
	@SuppressWarnings("rawtypes")
	public void  comonDelete(Map praAndValueMap );

	/**
	 * This method finds an entity by ID.
	 * 
	 * @param Object ID of the entity.
	 * @return Entity with given ID.
	 */
	public T findById(Serializable id);
	
	
	public T findById(String id);

	/**
	 * Finds all entities in the database
	 * 
	 * @return The list of all entities
	 */
	public List<T> findAll();

	/**
	 * Finds all entities ids
	 * 
	 * @param where The where clause expression
	 * @return The list of all entities ids
	 */
	public List<Long> findAllIds();

	/**
	 * Finds all entities by the given expression. Use _entity alias to
	 * reference attributes in the where expression.
	 * 
	 * @param where The where clause expression
	 * @param order The order clause expression
	 * @return The list of marching entities
	 */
	public List<T> findByWhere(String where, String order);

	/**
	 * Finds all entities by the given expression. Use _entity alias to
	 * reference attributes in the where expression.
	 * 
	 * @param where The where clause expression
	 * @param values Parameters used in the where expression
	 * @param order The order clause expression
	 * @return The list of marching entities
	 */
	public List<T> findByWhere(String where, Object[] values, String order);

	/**
	 * Find everything you want from the DB using the ORM query language
	 * 
	 * @param query The query to execute
	 * @param values Array of paramaters
	 * @return Query result
	 */
	public List<Object> findByQuery(String query, Object[] values);

	/**
	 * Finds all entities ids by the given expression. Use _entity alias to
	 * reference attributes in the where expression.
	 * 
	 * @param where The where clause expression
	 * @param order The order clause expression
	 * @return The list of marching entities ids
	 */
	public List<Long> findIdsByWhere(String where, String order);

	/**
	 * Finds all entities ids by the given expression. Use _entity alias to
	 * reference attributes in the where expression.
	 * 
	 * @param where The where clause expression
	 * @param values Parameters used in the where expression
	 * @param order The order clause expression
	 * @return The list of marching entities ids
	 */
	public List<Long> findIdsByWhere(String where, Object[] values, String order);

	/**
	 * Initialises lazy loaded data such as collections
	 * 
	 * @param entity The entity to be initialised
	 */
	public void initialize(T entity);

	
	/**
	 * execute hql for update 
	 * @param hql
	 * @param objects
	 * @return
	 */
	public Integer updateByHqlWithFreePara(final String hql, final Object[] objects);
	
	
	public Integer updateByHqlWithValuesMap(final String hql, final Map<String, Object> praValuesMap);
	
	@SuppressWarnings("rawtypes")
	public List findBySqlWithValuesMap(final String sql, final Class clasz ,final Map<String, Object> praValuesMap) ;
	
	
	@SuppressWarnings("hiding")
	public <T> T load(Class<T> clasz, Serializable id)throws HibernateException;
	
	@SuppressWarnings("hiding")
	public <T> T get(Class<T> clasz, String id);
	
	public <T> T load(Class<T> clasz, String id)throws HibernateException;
	
	@SuppressWarnings("hiding")
	public <T> T get(Class<T> clasz, Serializable id);
	
	/**
	 * 依据可变的查询条件查询数??可以接受模糊查询	 * 
	 * @param <T>
	 * @param clasz
	 * @param propertyNames查询
	 * @param object[]查询值对
	 * @param orderStr排序
	 * @param asc升序 desc 降序
	 */
	@SuppressWarnings("hiding")
	public <T> List<T> getListByPorpertyParamater(Class<T> clasz, String[] propertyNames, Object[] values, final String orderStr, final Boolean asc) ;
	
	public void delete(Object entity) ;
	@SuppressWarnings("rawtypes")
	public void delete(Collection collection) ;
	
	@SuppressWarnings("hiding")
	public <T> T merge(T entity) ;
	
	public void update(Object entity) ;
	
	/**
	 * 构造分页查询的查询语句,如不需分页查询，写一个没任何操作的方法即可
	 * @param pagerModel
	 */
	public void buildPagerModelQuery(PagerModel pagerModel, BaseDto dto );
}

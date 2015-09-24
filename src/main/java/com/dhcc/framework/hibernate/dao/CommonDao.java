package com.dhcc.framework.hibernate.dao;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.context.annotation.DependsOn;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;

import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.common.entity.BaseDictionary;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.expression.HibernateExpression;
import com.dhcc.framework.util.CalendaUtilities;
import com.dhcc.framework.util.DhccBeanUtils;


/**
 * 
 * 通用dao
 * @author liuyg
 * @version 0.5
 * @since  2013-07-22
 * @Company dhcc
 * @
 *
 */

@SuppressWarnings("deprecation")
@Repository
@DependsOn("propertiesBean")
public  class CommonDao  {

	//cacheQueries缓存标记
	private boolean cacheQueries = false;
	@SuppressWarnings("unused")
	private static Log log = LogFactory.getLog(CommonDao.class);
	private SessionFactory sessionFactory;
	public CommonDao() {
		if("true".equals(PropertiesBean.getInstance().getProperty("conf.hibernate.cacheQueries"))){
			cacheQueries = true;
		}
	}
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 得到当前线程绑定session
	 * 如当前线程没绑定session
	 * 则open一下并把他绑定到线程中
	 * @return
	 */
	protected  Session getCurrentSession(){
		Session session =  this.sessionFactory.getCurrentSession();
		return session;
	}
	public void setCacheQueries(boolean cacheQueries) {
		this.cacheQueries = cacheQueries;
	}

	public boolean isCacheQueries() {
		return this.cacheQueries;
	}

	
	/**
	 * 根所有HQL 创建一个hql Query
	 * @param hql
	 * @return
	 * @throws HibernateException
	 */
	protected Query createQuery(String hql) throws HibernateException {
		Query query = this.getCurrentSession().createQuery(hql);
		if (isCacheQueries()) {
			query.setCacheable(true);
		}
		return query;
	}

	/**
	 * 
	 * @param clasz
	 * @param id
	 * @return
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public <T> T load(Class<T> clasz, Serializable id)throws HibernateException {
		return (T) getCurrentSession().load(clasz, id);
	}

	
	/**
	 * 
	 * @param clasz
	 * @param id
	 * @param lockMode
	 * @return
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public <T> T load(Class<T> clasz, Serializable id, LockMode lockMode)throws HibernateException {
		return (T) getCurrentSession().load(clasz, id, lockMode);
	}

	public <T> T load(Class<T> clasz, String id, LockMode lockMode)throws HibernateException {
		return (T) getCurrentSession().load(clasz, id, lockMode);
	}
	@SuppressWarnings("unchecked")
	public <T> T get(Class<T> clasz, Serializable id) {
		return (T) getCurrentSession().get(clasz, id);
	}

	public <T> T get(Class<T> clasz, String id) {
		return (T) getCurrentSession().get(clasz, id);
	}
	
	public Object get(String entityName, Serializable id) {
		return getCurrentSession().get(entityName, id);
	}

	public String getEntityName(Object obj) {
		return getSessionFactory().getClassMetadata(obj.getClass()).getEntityName();
	}

	
	@SuppressWarnings("unchecked")
	public <T> T get(Class<T> clasz, Serializable id, LockMode lockMode) {
		return (T) getCurrentSession().get(clasz, id, lockMode);
	}

	/**
	 * 依据可变的查询条件查询数 可以接受模糊查询	 * 
	 * @param <T>
	 * @param clasz
	 * @param propertyNames查询 
	 * @param object[]查询值对
	 * @param orderStr排序
	 * @param asc升序 desc 降序
	 */
	
	@SuppressWarnings("unchecked")
	public <T> List<T> getListByPorpertyParamater(Class<T> clasz, String[] propertyNames, Object[] values, final String orderStr, final Boolean asc) {
		final DetachedCriteria deCriteria = createDetachedCriteria(clasz);
		List<T> list = new ArrayList<T>();
		for (int i = 0; i < propertyNames.length; i++) {
			// 如果条件值为空则不加入where子句中，值为""和null都默认为不作为查询条件
			if (values[i] != null && !values[i].toString().equalsIgnoreCase("")) {
				String str = values[i].toString();
				if (str.indexOf("%") == 0)
					deCriteria.add(Expression.like(propertyNames[i], values[i]));
				else
					deCriteria.add(Expression.eq(propertyNames[i], values[i]));
			}
		}
		
		Criteria criteria = deCriteria.getExecutableCriteria(getCurrentSession());
		if (!"".equals(orderStr) && orderStr != null) {
			if (asc) {
				criteria.addOrder(Order.asc(orderStr));
			} else {
				criteria.addOrder(Order.desc(orderStr));
			}
		}
		list = criteria.list();
		return list ;
	}

	/**
	 * 删除  entity
	 * @param entity
	 */
	public void delete(Object entity) {
		getCurrentSession().delete(entity);
	}

	/**
	 * 批量删除Collection为所有 bean 
	 * 内部实际是for 循环一个一个来删除的
	 * @param entities
	 */
	public void delete(@SuppressWarnings("rawtypes") Collection entities) {
		Session session = getCurrentSession();
		for (Object entity : entities) {
			session.delete(entity);
		}
	}

	/**
	 * 和saveOrUpdate 功能差不多
	 * 区别在于它可以处理游离态的对像
	 * @param entity
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> T merge(T entity) {
		return (T) getCurrentSession().merge(entity);
	}

	/**
	 * 更新一个实体
	 * @param entity
	 */
	public void update(Object entity) {
		getCurrentSession().update(entity);
	}

	/**
	 * 和save功能类似，区别在于把一个瞬态的实例持久化，但是并"不保证"标识符被立刻填入到持久化实例中，
	 * 标识符的填入可能被推迟到flush的时间,当它在一个transaction外部被调用的时候并不触发一个Sql Insert
	 * save,它要返回标识符，所以它会立即执行Sql insert
	 * @param entity
	 */
	public void persist(Object entity) {
		getCurrentSession().persist(entity);
	}

	/**
	 * 保存一个实体
	 * @param entity
	 */
	public void save(Object entity) {
		Session session = getCurrentSession();
		//session.beginTransaction();
		session.save(entity);
		//session.getTransaction().commit();
	}

	/**
	 * 
	 * @param entity
	 * @return
	 */
	public java.io.Serializable saveEntity(Object entity) {
		return getCurrentSession().save(entity);
	}

	/**
	 * 
	 * @param entity
	 */
	public void saveOrUpdate(Object entity) {
		getCurrentSession().saveOrUpdate(entity);
	}

	public <T> void deleteById(Class<T> clasz, Serializable id)  {
		delete(get(clasz, id));
	}

	/**
	 * 以?号占位位符定义的hql 及可变长参数值生成 Query
	 * @param hql
	 * @param values
	 * @return
	 */
	@SuppressWarnings("unused")
	private Query createQuery(String hql, Object... values) {
		Query query = createQuery(hql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		return query;
	}

	protected <T> Criteria createCriteria(Class<T> clasz, Criterion... criterions) {
		Criteria criteria = createCriteria(clasz);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	public <T> DetachedCriteria createDetachedCriteria(Class<T> clasz, Criterion... criterions) {
		DetachedCriteria criteria = createDetachedCriteria(clasz);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	@SuppressWarnings("rawtypes")
	protected Criteria createCriteria(Class clazz) {

		Criteria criteria = this.getCurrentSession().createCriteria(clazz);
		if (isCacheQueries()) {
			criteria.setCacheable(true);
		}
		return criteria;
	}

	@SuppressWarnings("rawtypes")
	protected DetachedCriteria createDetachedCriteria(Class clazz) {
		return DetachedCriteria.forClass(clazz);
	}

	protected <T> DetachedCriteria getEQDetachedCriteria(Class<T> clasz, String[] propertyNames, Object[] values) {
		DetachedCriteria criteria = createDetachedCriteria(clasz);
		int i = 0;
		for (String propertyName : propertyNames) {
			criteria.add(Restrictions.eq(propertyName, values[i]));
			i++;
		}
		return criteria;
	}

	protected <T> DetachedCriteria createDetachedCriteria(Class<T> clasz, String orderBy, boolean isAsc, Criterion... criterions) {
		DetachedCriteria criteria = createDetachedCriteria(clasz, criterions);
		if (isAsc)
			criteria.addOrder(Order.asc(orderBy));
		else
			criteria.addOrder(Order.desc(orderBy));
		return criteria;
	}

	protected <T> DetachedCriteria createDetachedCriteria(Class<T> clasz, Collection<HibernateExpression> expressions) {
		List<Criterion> criterions = new ArrayList<Criterion>();
		for (HibernateExpression expression : expressions) {
			Criterion criterion = expression.createCriteria();
			if (criterion != null) {
				criterions.add(criterion);
			}
		}
		return createDetachedCriteria(clasz, criterions.toArray(new Criterion[0]));
	}



	private Integer getUniqueNum(final DetachedCriteria criteria) {
		Session session = getCurrentSession();
		Criteria cri = criteria.getExecutableCriteria(session);
		return (Integer)cri.uniqueResult();
	}

	/**
	 * 取得对象的主键,辅助函数
	 * @param clasz
	 * @param entity
	 * @return
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public Serializable getId(@SuppressWarnings("rawtypes") Class clasz, Object entity)throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
		return (Serializable) PropertyUtils.getProperty(entity, getIdName(clasz));
	}

	/**
	 * 取得对象的主键,辅助函数
	 * @param entity
	 * @return
	 */
	public Serializable getId(Object entity) {
		return this.getCurrentSession().getIdentifier(entity);
	}

	/**
	 * 取得对象的主键名,辅助函数
	 * @param clazz
	 * @return
	 */
	public String getIdName(@SuppressWarnings("rawtypes") Class clazz) {
		ClassMetadata meta = getSessionFactory().getClassMetadata(clazz);
		String idName = meta.getIdentifierPropertyName();
		return idName;
	}




	/** 
	 * 去除hql的select 子句，未考虑union的情况用于分页查询
	 * @param hql
	 * @return
	 */
	private static String removeSelect(String hql) {
		int beginPos = hql.toLowerCase().indexOf("from");
		return hql.substring(beginPos);
	}

	/** 
	 * 去除hql的orderby 用于页查果询 
	 * @param hql
	 * @return
	 */
	private static String removeOrders(String hql) {
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

	/**
	 *  获取任一页的取始记录数
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	private static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}

	/** 为Hibernate3.1之前版本做兼*/
	public static Long toLong(Object obj) {
		if (obj instanceof Long) {
			return (Long) obj;
		} else if (obj instanceof Integer) {
			Integer i = (Integer) obj;
			return i.longValue();
		} else {
			return 0L;
		}
	}
	
	/** 
	 * 执行含参数占位符的update HQL
	 * @param hql 含参数占位符的HQL
	 * @param objects 可变长参数对应参数站位符的顺序来皮配,不能是集合对像
	 * @return
	 */
	public Integer updateByHqlWithFreeParam(final String hql, final Object... objects)throws HibernateException {
		Query query = this.createQuery(hql);
		if (objects != null) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return (Integer)query.executeUpdate();
	}
	

	
	/**
	 *  执行含参数占位符的 update sql 
	 * @param sql 含参数占位符的sql
	 * @param objects,objects 可变长参数对应参数站位符的顺序来皮配,不能是集合对像
	 * @return
	 */
	public Integer updateBySql(final String sql, final Object... objects)throws HibernateException {
		Session session = getCurrentSession();
		Query query = session.createSQLQuery(sql);
		if (objects != null) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return (Integer)query.executeUpdate();
	}
	
	
	/**
	 * 执行命名参数占位符形式update HQL
	 * @param hql  命名参数占位符形式update HQL
	 * @param praValuesMap key为hql中的命名参数，value为期对应参数值，支持集合对像
	 * @return
	 */
	public Integer updateByHqlWithValuesMap(final String hql, final Map<String, Object> praValuesMap) throws HibernateException {
		Session session = getCurrentSession();
		Query queryObject = session.createQuery(hql);
		if (!praValuesMap.isEmpty()) {
			queryObject.setProperties(praValuesMap);
		}
		return  (Integer) queryObject.executeUpdate();

	}

	/**
	 * updateByHqlWithValuesMap 方法的批量执行
	 * @param hql  
	 * @param praValuesList map命名参数的list ,list中的每个map 执行一次更新操作
	 * @return
	 */
	public boolean batchUpdateByHqlWithValuesMap(final String hql, final List<Map<String, Object>> praValuesList)throws HibernateException{
		Session session = getCurrentSession();
		if(praValuesList != null &&  praValuesList.size() > 0){
			for(Map<String, Object> praValuesMap : praValuesList){
				Query queryObject = session.createQuery(hql);
				if (!praValuesMap.isEmpty()) {
					queryObject.setProperties(praValuesMap);
				}
				queryObject.executeUpdate();
			}
		}
		return true;
	}
	

	/**
	 * 批量保存或更新存对像
	 * @param objects
	 */
	public <T> void batchSaveOrUpdate(final List<T> objects)throws HibernateException {
		if(CalendaUtilities.isNullOrEmpty(objects)){
			return;
		}
		Session session = this.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Iterator it = objects.iterator();
		while(it.hasNext()){
			Object object = it.next();
			if(object != null)
				session.saveOrUpdate(object);
		}

	}

	protected void prepareCriteria(Criteria ct) {
		if (isCacheQueries()) {
			ct.setCacheable(true);
		}
	}


	/**
	 * Criteria 方式查询所entityClass所有地像
	 * @param entityClass 实体类
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> getAll(Class<T> entityClass) {
		Session session = this.getCurrentSession();
		Criteria criteria = session.createCriteria(entityClass);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		prepareCriteria(criteria);
		return criteria.list();
	}

	/**
	 * Criteria 方式查询所entityClass所有地像
	 * @param clasz 实体类 
	 * @param orderBy 排序属性名称
	 * @param isAsc  是否升序，如为flase则降序
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> getAll(Class<T> clasz, String orderBy, boolean isAsc) throws HibernateException{
		if (isAsc){
			return this.findByCriteria(DetachedCriteria.forClass(clasz).addOrder(Order.asc(orderBy)));
		}else{
			return this.findByCriteria(DetachedCriteria.forClass(clasz).addOrder(Order.desc(orderBy)));
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List findByCriteria(DetachedCriteria criteria) throws DataAccessException {
        Session session = this.getCurrentSession();
        Criteria executableCriteria = criteria.getExecutableCriteria(session);
        prepareCriteria(executableCriteria);
        //return findByCriteria(criteria, -1, -1);
        return executableCriteria.list();
	}

	/**
	 * criteria 方式的分页查询
	 * @param criteria
	 * @param firstResult 
	 * @param maxResults
	 * @return
	 * @throws DataAccessException
	 */
	@SuppressWarnings("rawtypes")
	public List findByCriteriaByStart(final DetachedCriteria criteria, final int firstResult, final int maxResults)
			throws DataAccessException {
		
		Assert.notNull(criteria, "DetachedCriteria must not be null");
		Session session = this.getCurrentSession();
		Criteria executableCriteria = criteria.getExecutableCriteria(session);
		prepareCriteria(executableCriteria);
		if (firstResult >= 0) {
			executableCriteria.setFirstResult(firstResult);
		}
		if (maxResults > 0) {
			executableCriteria.setMaxResults(maxResults);
		}
		return executableCriteria.list();
	}
	/**
	 * 可变长参数HQL查询
	 * @param hql  以?号占位位符定义的hql 
	 * @param values 可变长参数，期限顺序与?占位符按顺序对应,不支持集合对像
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHql(String hql, Object... values)throws HibernateException {
		Session session = getCurrentSession();
		Query query = session.createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.list();
	}
	

	
	/**
	 * 根据属性名和对应的值的Criteria查询
	 * @param clasz 实体类名
	 * @param propertyName 属性名
	 * @param value  属性值
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> findByProperty(Class<T> clasz, String propertyName, Object value)throws HibernateException {
		return this.findByCriteria(createDetachedCriteria(clasz, Restrictions.eq(propertyName, value)));
	}

	/**
	 * 根据属性名和对应的值的Criteria查询
	 * @param clasz 实体类名
	 * @param propertyNames 属性名数组
	 * @param values 属性值数组 按顺序与属性名数对应
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> findByProperties(Class<T> clasz, String[] propertyNames, Object[] values)throws HibernateException {
		DetachedCriteria criteria = this.getEQDetachedCriteria(clasz, propertyNames, values);
		return this.findByCriteria(criteria);
	}

	/**
	 * 根据属性名和对应的值的Criteria且带排序查询
	 * @param clasz 实体类名
	 * @param propertyName  属性名
	 * @param value 属性值 
	 * @param orderBy 排序属性
	 * @param isAsc   升序或降序，ture为升
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> findByClassAndPropetryName(Class<T> clasz, String propertyName, Object value, String orderBy, boolean isAsc)throws HibernateException {
		return this.findByCriteria(createDetachedCriteria(clasz, orderBy, isAsc, Restrictions.eq(propertyName, value)));
	}

	/**
	 * 根据属性名和对应的值的Criteria且查询唯一值
	 * @param clasz 实体类名
	 * @param propertyName 属性名
	 * @param value   属性值 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> T findUnique(final Class<T> clasz, final String propertyName, final Object value)throws HibernateException {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(clasz);
		criteria.add(Restrictions.eq(propertyName, value));
		return  (T)criteria.uniqueResult();
	}

	/**
	 * ?号占位符hql 查询记录数，在分页时调用，一般很少用到
	 * @param hql hql语句,不能含count
	 * @param values  参数值可变长参数,顺序与?号占位符一一对应,不支持集合对像
	 * @param columnNameForCount 计算计录数count时用的列
	 * @return
	 */
	public Long getResultCount(String hql, String columnNameForCount,Object... values)throws HibernateException {
		Assert.notNull(columnNameForCount,"columnNameForCount must not be null");
		String countQueryString = " select count(" + columnNameForCount + ") " + removeSelect(removeOrders(hql));
		if(hql.indexOf(" fetch ")>0){
			countQueryString = countQueryString.replaceAll(" fetch ", " ");
		}
		Session session = getCurrentSession();
		Query queryObject = session.createQuery(countQueryString).setCacheable(true);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		@SuppressWarnings("rawtypes")
		List countlist = queryObject.list();
		return toLong(countlist.get(0));
	}

	/**
	 * ?号占位符sql 查询记录数，在分页时调用，一般很少用到
	 * @param sql sql语句,不能含count
	 * @param values  参数值可变长参数,顺序与?号占位符一一对应,不支持集合对像
	 * @param columnNameForCount 计算计录数count时用的列
	 * @return
	 */
	public Long getResultCountBySql(String sql, String columnNameForCount,final Object...values)throws HibernateException {
		
		Assert.notNull(columnNameForCount,"columnNameForCount must not be null");
		String countQueryString = " select count("+columnNameForCount+") "+ removeSelect(removeOrders(sql));
		Session session = getCurrentSession();
		Query queryObject = session.createSQLQuery(countQueryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		@SuppressWarnings("rawtypes")
		List countlist = queryObject.list();
		return new Long(countlist.size() == 0 ? "0" : countlist.get(0).toString());
	}
	
	/**
	 * 命令参数占位符sql 查询记录数，在分页时调用，一般很少用到
	 * @param sql ,命名参数SQL，不能含count 
	 * @param praValuesMap 参数值map ,key 为命名参数，value为参数值
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Long getResultCountBySqlWithValuesMap(final String sql,String columnNameForCount, final Map<String, Object> praValuesMap) {
		
		String countQueryString = " select count("+columnNameForCount+") " + removeSelect(removeOrders(sql));
		Session session = getCurrentSession();
		Query queryObject = session.createSQLQuery(countQueryString);
		if (!praValuesMap.isEmpty()) {
			queryObject.setProperties(praValuesMap);
		}
		List countlist = queryObject.list();
		return new Long(countlist.size() == 0 ? "0" : countlist.get(0).toString());
	}
	
	/**
	 * Criteria 方查查询数据数
	 * @param dcriteria
	 * @return
	 */
	public Long getResultCount(DetachedCriteria dcriteria) {
		Criteria criteria = dcriteria.getExecutableCriteria(this.getCurrentSession());
		this.prepareCriteria(criteria);
		return getResultCount(criteria);
	}

	/**
	 * Criteria 方查查询数据数
	 * @param criteria
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Long getResultCount(Criteria criteria) {
		CriteriaImpl impl = (CriteriaImpl) criteria;
		Long totalCount = 0L;
		try {
			Projection projection = impl.getProjection();
			List<CriteriaImpl.OrderEntry> orderEntries;
			try {
				orderEntries = (List) DhccBeanUtils.forceGetProperty(impl, "orderEntries");
				DhccBeanUtils.forceSetProperty(impl, "orderEntries", new ArrayList());
			} catch (Exception e) {
				throw new DataBaseException(" Runtime Exception impossibility throw ",e);
			}
			// 执行查		
			totalCount = toLong(criteria.setProjection(Projections.rowCount()).uniqueResult());
			// 将之前的Projection和OrderBy 重新设回
			criteria.setProjection(projection);
			if (projection == null) {
				criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
			}

			try {
				DhccBeanUtils.forceSetProperty(impl, "orderEntries", orderEntries);
			} catch (Exception e) {
				throw new DataBaseException(" Runtime Exception impossibility throw ",e);
			}
		} finally {
			SessionFactoryUtils.closeSession((Session) impl.getSession());
		}
		return totalCount;
	}

	/**
	 * Criteria 方查查询数据数 
	 * @param clasz
	 * @param criterions
	 * @return
	 */
	public Long getResultCount(@SuppressWarnings("rawtypes") Class clasz, Criterion... criterions) {
		@SuppressWarnings("unchecked")
		Criteria criteria = createCriteria(clasz, criterions);
		return getResultCount(criteria);
	}

	
	public Long getResultCount(@SuppressWarnings("rawtypes") Class clasz, Collection<HibernateExpression> expressions) {
		Criteria criteria = createCriteria(clasz);
		for (HibernateExpression expression : expressions) {
			Criterion criterion = expression.createCriteria();
			if (criterion != null) {
				criteria.add(criterion);
			}
		}
		return getResultCount(criteria);
	}

	/**
	 * ?号占位符sql 查询
	 * @param sql
	 * @param clasz 实体类名
	 * @param values 可变长参数值，顺序与占位符顺序对应,不支持集合对像
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySql(final String sql, final Class clasz ,final Object ...values) {
		Session session = getCurrentSession();
		Query queryObject = null;
		if (clasz == null) {
			queryObject = session.createSQLQuery(sql);
		} else {
			queryObject = session.createSQLQuery(sql).addEntity(clasz);
		}
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		return queryObject.list();
	}
	

	
	/**
	 * ?号占位符sql 查询 
	 * @param sql 
	 * @param values sql参数值数组，指顺序与sql 中的占位符对应
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySql(final String sql,final Object[] values) {
		Session session = getCurrentSession();
		Query queryObject = session.createSQLQuery(sql);
		if(null != values && values.length > 0){
			for(int i = 0; i < values.length; i++){
				queryObject.setParameter(i, values[i]);
			}
		}
		return queryObject.list();
	}
	
	/**
	 * 以命名参数形式占位符SQL查询  
	 * @param sql
	 * @param clasz 实体类名
	 * @param praValuesMap 参数值map key为命名参数值为其对应参数值
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySqlWithValuesMap(final String sql, final Class clasz ,final Map<String, Object> praValuesMap) {
		Session session = getCurrentSession();
		Query queryObject = null;
		if (clasz == null) {
			queryObject = session.createSQLQuery(sql);
		} else {
			queryObject = session.createSQLQuery(sql).addEntity(clasz);
		}
		if (!praValuesMap.isEmpty()) {
			queryObject.setProperties(praValuesMap);
		}
		return queryObject.list();

	}

	/**
	 * 命名参数占位符形式SQL的分页查询
	 * @param sql
	 * @param pageNo
	 * @param pageSize
	 * @param clasz 实体类名
	 * @param praValuesMap 参数值map key为命名参数值为其对应参数值
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySqlWithValuesMap(final String sql, final int pageNo, final int pageSize, final Class clasz ,final Map<String, Object> praValuesMap) {
		Session session = getCurrentSession();
		Query queryObject = null;
		if (clasz == null) {
			queryObject = session.createSQLQuery(sql);
		} else {
			queryObject = session.createSQLQuery(sql).addEntity(clasz);
		}
		if (!praValuesMap.isEmpty()) {
			queryObject.setProperties(praValuesMap);
		}
		int startIndex = getStartOfPage(pageNo, pageSize);
		return queryObject.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}	

	
	/**
	 * criteria 方式分页查询
	 * @param criteria
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByCriteria(DetachedCriteria criteria, int pageNo, int pageSize) {
		int startIndex = getStartOfPage(pageNo, pageSize);
		return this.findByCriteriaByStart(criteria, startIndex, pageSize);

	}

	/** 
	 * 按起始记录查询 返回记录
	 * @param criteria
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByWithStart(DetachedCriteria criteria, int startIndex, int endIndex) {
		return this.findByCriteria(criteria, startIndex, endIndex);
	}

	/**
	 * criteria 方式与可变长参数形式分页查询
	 * @param clasz
	 * @param pageNo
	 * @param pageSize
	 * @param criterions
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBy(Class clasz, int pageNo, int pageSize, Criterion... criterions) {
		@SuppressWarnings("unchecked")
		DetachedCriteria criteria = createDetachedCriteria(clasz, criterions);
		int startIndex = getStartOfPage(pageNo, pageSize);
		return this.findByCriteria(criteria, startIndex, pageSize);
	}

	/** 
	 * HibernateExpression 分页查询
	 * @param clasz
	 * @param pageNo
	 * @param pageSize
	 * @param expressions
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBy(Class clasz, int pageNo, int pageSize, Collection<HibernateExpression> expressions) {
		@SuppressWarnings("unchecked")
		DetachedCriteria criteria = createDetachedCriteria(clasz, expressions);
		int startIndex = getStartOfPage(pageNo, pageSize);
		return this.findByCriteria(criteria, startIndex, pageSize);
	}

	/** 
	 * 按起始记录查询带有HibernateExpression 
	 * @param clasz
	 * @param startIndex
	 * @param rowSize
	 * @param expressions
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByWithStart( Class clasz, int startIndex, int rowSize, Collection<HibernateExpression> expressions) {
		@SuppressWarnings("unchecked")
		DetachedCriteria criteria = createDetachedCriteria(clasz, expressions);
		return findByWithStart(criteria, startIndex, rowSize);
	}

	/** 
	 * 带排序功功分页查询,带有HibernateExpression 
	 * @param clasz
	 * @param pageNo
	 * @param pageSize
	 * @param orderBy
	 * @param isAsc
	 * @param expressions
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBy(Class clasz, int pageNo, int pageSize, String orderBy, boolean isAsc, Collection<HibernateExpression> expressions) {
		@SuppressWarnings("unchecked")
		DetachedCriteria criteria = createDetachedCriteria(clasz, orderBy, isAsc, expressions);
		return findByCriteria(criteria, pageNo, pageSize);
	}

	/**
	 * 
	 * @param clasz
	 * @param orderBy
	 * @param isAsc
	 * @param expressions
	 * @return
	 */
	protected <T> DetachedCriteria createDetachedCriteria(Class<T> clasz,
			String orderBy, boolean isAsc,
			Collection<HibernateExpression> expressions) {
		List<Criterion> criterions = new ArrayList<Criterion>();
		for (HibernateExpression expression : expressions) {
			Criterion criterion = expression.createCriteria();
			if (criterion != null) {
				criterions.add(criterion);
			}
		}
		return createDetachedCriteria(clasz, orderBy, isAsc,
				criterions.toArray(new Criterion[0]));
	}

	/** 分页查询 */
	@SuppressWarnings("rawtypes")
	public List findBy(Class clasz, int pageNo, int pageSize, String orderBy, boolean isAsc, Criterion... criterions) {
		@SuppressWarnings("unchecked")
		DetachedCriteria criteria = createDetachedCriteria(clasz, orderBy, isAsc, criterions);
		return findByCriteria(criteria, pageNo, pageSize);
	}

	
	public <T> boolean isUnique(Class<T> clasz, Object entity, String uniquePropertyNames) {
		DetachedCriteria criteria = createDetachedCriteria(clasz).setProjection(Projections.rowCount());
		String[] nameList = uniquePropertyNames.split(",");
		try {
			
			for (String name : nameList) {
				criteria.add(Restrictions.eq(name, PropertyUtils.getProperty(entity, name)));
			}
			Serializable id = getId(clasz, entity);
			
			if (id != null) {
				String idName = getIdName(clasz);
				criteria.add(Restrictions.not(Restrictions.eq(idName, id)));
			}
		} catch (Exception e) {
			ReflectionUtils.handleReflectionException(e);
		}
		Integer resultCount = getUniqueNum(criteria);
		// Integer resultCount = (Integer)criteria.uniqueResult();
		return resultCount.intValue() == 0;
	}
	
	
	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria) {
		Criteria ct = criteria.getExecutableCriteria(this.getCurrentSession());
		this.prepareCriteria(ct);
		return ct.list();
	}

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria) {
		this.prepareCriteria(criteria);
		return criteria.list();
	}
	
	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria, int pageNo, int pageSize) {
		int startIndex = getStartOfPage(pageNo, pageSize);
		Criteria ct = criteria.getExecutableCriteria(this.getCurrentSession());
		this.prepareCriteria(ct);
		return ct.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria, int pageNo, int pageSize) {
		int startIndex = getStartOfPage(pageNo, pageSize);
		this.prepareCriteria(criteria);
		return criteria.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}
	


	
	/**
	 * ?号占位符HQL分页查询
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @param values
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHql(final String hql, final int pageNo, final int pageSize, final Object... values) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setCacheable(true);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		int startIndex = getStartOfPage(pageNo, pageSize);
		return query.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}
	
	/**
	 *?号占位符HQL查询 
	 * @param hql
	 * @param values 占位符按顺序所对应的参数值数组
	 * @param cacheable 是否缓缓查询，只有开启了缓存开关时，这个参数才有用,否则设置为true也没用
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHql(final String hql, final Object[] values, final boolean cacheable) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setCacheable(cacheable);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query.list();
	}
	
	
	/**
	 * ?号占位符HQL查询  
	 * @param hql
	 * @param values 占位符参数值数组，顺序与HQL中占位符顺序相同
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHqlWithPraValues(final String hql, final Object[] values) {
		Session session = this.getCurrentSession();
		Query queryObject = session.createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		return queryObject.list();

	}

	/**
	 * ？号占位符分页查询
	 * @param hql
	 * @param pageNo 
	 * @param pageSize
	 * @param values  占位符参数值数组，顺序与HQL中占位符顺序相同
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHqlWithPraValues( String hql,  int pageNo,  int pageSize,  Object[] values) {
		Session session = this.getCurrentSession();
		Query queryObject = session.createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i,values[i]);
			}
		}
		int startIndex = getStartOfPage(pageNo, pageSize);
		return queryObject.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}
	

	/**
	 * 命名参数形式HQL分页统计记录数
	 * @param hql
	 * @param praValuesMap 参数值map key 为命名参数value 为其值
	 * @param columnNameForCount,计算记录数时要时要 count 的属性
	 * @param isRefresh 是否刷缓存，不开启缓存时，这参数不取作用
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Long getResultCountWithValuesMap(String hql, final Map<String, Object> praValuesMap, String columnNameForCount, final boolean isRefresh) {

		String countQueryString = " select count(" + columnNameForCount + ") " + removeSelect(removeOrders(hql));
		if(hql.indexOf(" fetch ")>0){
			countQueryString = countQueryString.replaceAll(" fetch ", " ");
		}
		Session session = this.getCurrentSession();
		Query query = session.createQuery(countQueryString);
		if(cacheQueries){
			query.setCacheable(true);
		}
		if(isRefresh){
			query.setCacheMode(org.hibernate.CacheMode.REFRESH);
		}
		if (praValuesMap!=null&&!praValuesMap.isEmpty()) {
			query.setProperties(praValuesMap);
		}
		List countlist = query.list();
		return toLong(countlist.get(0));
	}
	
	/**
	 * 命名参数形式HQL查询
	 * @param praValuesMap 参数值map key 为命名参数value 为其值
	 * @param columnNameForCount,计算记录数时要时要 count 的属性
	 * @param isRefresh 是否刷缓存，不开启缓存时，这参数不取作用
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHqlWithValuesMap(final String hql, final Map<String, Object> praValuesMap, final boolean isRefresh) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(cacheQueries){
			query.setCacheable(true);
		}
		if(isRefresh){
			query.setCacheMode(org.hibernate.CacheMode.REFRESH);
		}
		if (praValuesMap!=null&&!praValuesMap.isEmpty()) {
			query.setProperties(praValuesMap);
		}
		return query.list();
	}

	/**
	 * 命名参数形式HQL分页查询
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @param praValuesMap 参数值map key 为命名参数value 为其值
	 * @param isRefresh 是否刷缓存，不开启缓存时，这参数不取作用
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByHqlWithValuesMap(final String hql, final int pageNo, final int pageSize, final Map<String, Object> praValuesMap, final boolean isRefresh) {
		Session session = this.getCurrentSession();
		Query query = session.createQuery(hql);
		if(cacheQueries){
			query.setCacheable(true);
		}
		if (praValuesMap!=null&&!praValuesMap.isEmpty()) {
			query.setProperties(praValuesMap);
		}
		
		if(isRefresh){
			query.setCacheMode(org.hibernate.CacheMode.REFRESH);
		}
		int startIndex = getStartOfPage(pageNo, pageSize);
		return query.setFirstResult(startIndex).setMaxResults(pageSize).list();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<BaseDictionary> findDictionary(String dictionaryName ){
		
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery(" from " +dictionaryName);
		List list = query.list();
		session.close();
		return list;
	}
	public <T> T load(Class<T> clasz, String id) throws HibernateException{
		return (T) getCurrentSession().load(clasz, id);
	}

}

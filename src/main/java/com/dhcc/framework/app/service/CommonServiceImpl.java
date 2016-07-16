package com.dhcc.framework.app.service;

import static com.dhcc.framework.common.LogWrap.info;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.springframework.stereotype.Service;

import com.dhcc.framework.common.ConvertObjArrayToVo;
import com.dhcc.framework.common.EnumConstants;
import com.dhcc.framework.common.EnumConstants.RelaTypeEnum;
import com.dhcc.framework.common.HtmlListQueryObj;
import com.dhcc.framework.common.ListObject;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.cache.service.impl.DictionaryCacheServiceImpl;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.jdbc.JdbcTemplateWrapper;
import com.dhcc.framework.util.DhccBeanUtils;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.hv.HvLabel;
import com.dhcc.scm.entity.ord.ExeState;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenHopInc;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ws.OperateResult;

@Service("commonService")
public class CommonServiceImpl implements CommonService {

	private static Log logger = LogFactory.getLog(CommonServiceImpl.class);

	private CommonDao commonDao;
	@Resource
	private JdbcTemplateWrapper jdbcTemplateWrapper;
	
	public CommonServiceImpl() {
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	@Resource
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	/**
	 * qbe 查询
	 * 
	 * @param clasz
	 *            实体类名
	 * @param qbeObject
	 *            实体对像，QBE 查询时，只要对像对属性有值就作为查询条件，以等于且and连接
	 * @param pageNo
	 *            param pageSize
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getListDataByQBE(Class clasz, Object qbeObject, int pageNo,
			int pageSize) {
		if (qbeObject == null) {
			try {
				qbeObject = clasz.newInstance();
			} catch (InstantiationException e) {
				throw new DataBaseException(e.getMessage(), e);
			} catch (IllegalAccessException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
		if (qbeObject == null) {
			return new ArrayList(1);
		}

		DetachedCriteria criteria = this.createDetachedCriteria(clasz,
				qbeObject);
		return this.findByDetachedCriteria(criteria, pageNo, pageSize);
	}

	public void update(Object object) {
		this.commonDao.update(object);
	}

	public void add(Object entity) {
		this.getCommonDao().save(entity);
	}

	public void saveOrUpdate(Object entity) {
		this.getCommonDao().saveOrUpdate(entity);
	}

	public void batchSaveOrUpdate(final List<?> objects) {
		this.getCommonDao().batchSaveOrUpdate(objects);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void delete(Class clasz, String id) {
		this.getCommonDao().deleteById(clasz, id);
	}

	@SuppressWarnings("unchecked")
	public void delete(@SuppressWarnings("rawtypes") Class clasz, Long id) {
		this.getCommonDao().deleteById(clasz, id);
	}

	public void delete(Object entity) {
		commonDao.delete(entity);
	}

	public <T> T get(Class<T> clasz, String id) {
		return commonDao.get(clasz, id);
	}

	public <T> DetachedCriteria createDetachedCriteria(Class<T> clasz,
			Criterion... criterions) {
		return commonDao.createDetachedCriteria(clasz, criterions);
	}

	public <T> DetachedCriteria createDetachedCriteria(Class<T> clasz,
			Object qbeObject, Criterion... criterions) {
		Example example = Example.create(qbeObject);
		example.enableLike(MatchMode.ANYWHERE);
		example.ignoreCase();
		DetachedCriteria criteria = commonDao.createDetachedCriteria(clasz,
				criterions);
		criteria.add(example);
		return criteria;
	}

	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria, int pageNo,
			int pageSize) {
		int totalRows = commonDao.getResultCount(criteria).intValue();
		pageNo = this.getValidPage(pageNo, totalRows, pageSize);
		if (totalRows == 0) {
			return new ArrayList(1);
		}
		return this.getCommonDao().findByDetachedCriteria(criteria, pageNo,
				pageSize);
	}

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria, int pageNo, int pageSize) {
		int totalRows = commonDao.getResultCount(criteria).intValue();
		pageNo = this.getValidPage(pageNo, totalRows, pageSize);
		if (totalRows == 0) {
			return new ArrayList();
		}
		return commonDao.findByCriteria(criteria, pageNo, pageSize);
	}

	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria) {
		return commonDao.findByDetachedCriteria(criteria);
	}

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria) {
		return commonDao.findByCriteria(criteria);
	}

	/**
	 * 以排序方式查询某个实体类的所有记录
	 * 
	 * @param clasz
	 *            实体类名
	 * @param orderBy
	 *            排序的属性名
	 * @param isAsc
	 *            升序为true,降序为false
	 * @return
	 */
	public <T> List<T> getAll(Class<T> clasz, String orderBy, boolean isAsc) {
		return commonDao.getAll(clasz, orderBy, isAsc);
	}

	public <T> T get(Class<T> clasz, Serializable id) {
		return commonDao.get(clasz, id);
	}

	/**
	 * 以属性和属性值方式查询实体
	 * 
	 * @param clasz
	 *            实体类名
	 * @param propertyNames
	 *            属性名数组
	 * @param values
	 *            属性值数组 按顺序与属性名数组对应
	 * @return
	 */
	public <T> List<T> findByProperties(Class<T> clasz, String[] propertyNames,
			Object[] values) {
		return commonDao.findByProperties(clasz, propertyNames, values);
	}

	private Integer getValidPage(Integer pageNo, int totalRows, Integer pageSize) {
		if (!isValidPage(pageNo, totalRows, pageSize)) {
			return getValidPage(--pageNo, totalRows, pageSize);
		}
		int pageCount = (totalRows + (pageSize - (totalRows % pageSize == 0 ? pageSize
				: totalRows % pageSize)))
				/ pageSize;
		return pageCount;
	}

	private boolean isValidPage(Integer pageNo, Integer totalRows,
			Integer pageSize) {
		if (pageNo == 1) {
			return true;
		}
		int rowStart = (pageNo - 1) * pageSize;
		int rowEnd = rowStart + pageSize;
		if (rowEnd > totalRows) {
			rowEnd = totalRows;
		}
		return rowEnd > rowStart;
	}

	/**
	 * 查询多个下拉列表数据
	 * 
	 * @param QueryObjList
	 *            下拉数据查询对像list
	 * @param isRefresh
	 *            用false就行，不开启缓存时，true也不起作用
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<List<ListObject>> getDropListData(
			List<HtmlListQueryObj> QueryObjList, final boolean isRefresh) {
		List<List<ListObject>> list = new ArrayList<List<ListObject>>();
		for (HtmlListQueryObj queryObj : QueryObjList) {
			StringBuffer hql = new StringBuffer();
			hql.append("select new com.dhcc.framework.common.ListObject(")
					.append(queryObj.getKeyPropertyName())
					.append(" as keyObj , ")
					.append(queryObj.getValuePropertyName())
					.append(" as valueObj ) from ")
					.append(queryObj.getHqlObjName())
					.append(" ")
					.append((queryObj.getConditions() != null ? queryObj
							.getConditions() : ""));
			List<ListObject> listDates = commonDao.findByHqlWithValuesMap(
					hql.toString(), queryObj.getParaValues(), isRefresh);
			list.add(listDates);
		}
		return list;
	}

	/**
	 * 查询多个下拉列表数据
	 * 
	 * @param queryObj
	 *            下拉数据查询对像
	 * @param isRefresh
	 *            用false就行，不开启缓存时，true也不起作用
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ListObject> getListData(HtmlListQueryObj queryObj,
			final boolean isRefresh) {
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.dhcc.framework.common.ListObject(")
				.append(queryObj.getKeyPropertyName())
				.append(" as keyObj , ")
				.append(queryObj.getValuePropertyName())
				.append(" as valueObj ) from ")
				.append(queryObj.getHqlObjName())
				.append(" ")
				.append((queryObj.getConditions() != null ? queryObj
						.getConditions() : ""));
		List<ListObject> listDates = commonDao.findByHqlWithValuesMap(
				hql.toString(), queryObj.getParaValues(), isRefresh);
		return listDates;
	}

	/**
	 * 查询多个下拉列表数据
	 * 
	 * @param QueryObjList
	 *            下拉数据查询对像list
	 * @param isRefresh
	 *            用false就行，不开启缓存时，true也不起作用
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String, List<ListObject>> getDropListDataMap(
			List<HtmlListQueryObj> QueryObjList, final boolean isRefresh) {
		HashMap<String, List<ListObject>> map = new HashMap<String, List<ListObject>>();
		for (HtmlListQueryObj queryObj : QueryObjList) {
			StringBuffer hql = new StringBuffer();
			hql.append("select new com.dhcc.framework.common.ListObject(")
					.append(queryObj.getKeyPropertyName())
					.append(" as keyObj , ")
					.append(queryObj.getValuePropertyName())
					.append(" as valueObj ")
					.append(queryObj.getHqlObjName())
					.append(" ")
					.append((queryObj.getConditions() != null ? queryObj
							.getConditions() : ""));
			List<ListObject> listDates = commonDao.findByHqlWithValuesMap(
					hql.toString(), queryObj.getParaValues(), isRefresh);
			map.put(queryObj.getListName(), listDates);
		}
		return map;
	}

	/**
	 * 以对比方式手动保存关联的set ,只更新变动的，比如新增的和删除的
	 * 
	 * @param oldSet
	 *            原set
	 * @param newSet
	 *            当前set
	 * @param idPorperty
	 *            set对的对像的代表期主键的属性名
	 * @param cacheRegion
	 *            缓存区域,没有时设置为null
	 * @return
	 */
	public <T> Set<T> saveRealSet(Set<T> oldSet, Set<T> newSet,
			String idPorperty, String cacheRegion) {
		boolean havcChage = false;
		if (!newSet.containsAll(oldSet)) {
			for (Iterator<T> it = oldSet.iterator(); it.hasNext();) {
				T obj = (T) it.next();
				if (!newSet.contains(obj)) {
					it.remove();
					this.delete(obj);
				}
			}
			if (cacheRegion != null && !"".equals(cacheRegion.trim())) {
				havcChage = true;
			}
		}
		oldSet.addAll(newSet);
		Method idPorGetMethod = null;
		String idPorGetMethodName = "get" + upperFirstChar(idPorperty);
		for (T obj : oldSet) {
			if (idPorGetMethod == null) {
				try {
					idPorGetMethod = obj.getClass().getMethod(
							idPorGetMethodName);
				} catch (SecurityException e) {
					logger.error(e);
					throw new DataBaseException(
							"occur error when invoke getMethod  "
									+ idPorGetMethodName, e);
				} catch (NoSuchMethodException e) {
					logger.error(e);
					throw new DataBaseException(obj.getClass().getSimpleName()
							+ "no" + idPorGetMethodName + "method ", e);
				}
			}
			Object idValue = null;
			try {
				idValue = idPorGetMethod.invoke(obj);
			} catch (IllegalArgumentException e) {
				logger.error(e);
				String msg = "occur error when invoke "
						+ obj.getClass().getSimpleName() + "Object's "
						+ idPorGetMethodName;
				throw new DataBaseException(msg, e);
			} catch (IllegalAccessException e) {
				logger.error(e);
				String msg = "occur error when invoke "
						+ obj.getClass().getSimpleName() + "Object's "
						+ idPorGetMethodName;
				throw new DataBaseException(msg, e);
			} catch (InvocationTargetException e) {
				logger.error(e);
				String msg = "occur error when invoke "
						+ obj.getClass().getSimpleName() + "Object's "
						+ idPorGetMethodName;
				throw new DataBaseException(msg, e);
			}

			if (idValue == null || "".equals(idValue.toString().trim())) {
				this.add(obj);
				havcChage = true;
			}
		}
		if (havcChage
				&& (cacheRegion != null && !"".equals(cacheRegion.trim()))) {

		}
		newSet = null;
		return oldSet;
	}

	public <T> Set<T> listToSet(List<T> list) {
		Set<T> set = new HashSet<T>();
		set.addAll(list);
		return set;
	}

	private static String upperFirstChar(String string) {
		if (string == null) {
			return null;
		}
		if (string.length() <= 1) {
			return string.toLowerCase();
		}
		StringBuffer sb = new StringBuffer(string);
		sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
		return sb.toString();
	}

	@SuppressWarnings("unchecked")
	public void sortStringList(List<String> list) {
		if (list == null || list.size() == 0) {
			return;
		}
		String[] ids = new String[list.size()];
		java.util.Arrays.sort(list.toArray(ids), new idComparator());
		list.clear();
		for (String id : ids) {
			list.add(id);
		}
	}

	@SuppressWarnings("unchecked")
	public void sortLongList(List<Long> list) {
		if (list == null || list.size() == 0) {
			return;
		}
		Long[] ids = new Long[list.size()];
		java.util.Arrays.sort(list.toArray(ids), new idComparator());
		list.clear();
		for (Long id : ids) {
			list.add(id);
		}
	}

	@SuppressWarnings("rawtypes")
	class idComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			Integer key1 = o1.hashCode();
			Integer key2 = o2.hashCode();
			return key1.compareTo(key2);
		}
	}

	@SuppressWarnings("rawtypes")
	class TypeDefineComparator implements Comparator {
		public int compare(Object o1, Object o2) {
			Integer key1 = o1.hashCode();
			Integer key2 = o2.hashCode();
			return key1.compareTo(key2);
		}
	}

	/**
	 * 重名检查
	 * 
	 * @param objName
	 *            实体名
	 * @param namePropName
	 *            要检查重名的属性名
	 * @param nameVal
	 *            要检查重名的属性的当前值
	 * @param idPropName
	 *            实体主键的属性名
	 * @param idPropVal
	 *            实体主键的属性名值，为空时为新增的重名检查，不为空时为增加时的重名检查
	 * @return
	 */
	@SuppressWarnings({ "static-access", "rawtypes" })
	public boolean reNameChk(String objName, final String nameVal,
			final String namePropName, String idPropName, final String idPropVal) {
		StringBuffer hql = new StringBuffer();
		hql.append("select count(")
				.append(idPropName == null ? "*" : idPropName).append(")");
		hql.append(" from ").append(objName);
		hql.append(" where ").append(namePropName).append("=?");
		if (idPropName != null && !"".equals(idPropName.trim())
				&& idPropVal != null && !"".equals(idPropVal.trim())) {
			hql.append(" and  ").append(idPropName).append("!=?");
		}
		List countlist = null;
		if (idPropVal != null && !"".equals(idPropVal.trim())) {
			countlist = commonDao.findByHql(hql.toString(), nameVal, idPropVal);
		} else {
			countlist = commonDao.findByHql(hql.toString(), nameVal);
		}
		int count = commonDao.toLong(countlist.get(0)).intValue();
		return count > 0 ? true : false;
	}

	/**
	 * 重名检查
	 * 
	 * @param objName
	 *            实体名
	 * @param namePropName
	 *            要检查重名的属性名
	 * @param nameVal
	 *            要检查重名的属性的当前值
	 * @param idPropName
	 *            实体主键的属性名
	 * @param idPropVal
	 *            实体主键的属性名值，为空时为新增的重名检查，不为空时为增加时的重名检查
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "static-access" })
	public boolean reNameChk(String objName, final String nameVal,
			final String namePropName, String idPropName, final Long idPropVal) {
		StringBuffer hql = new StringBuffer();
		hql.append("select count(")
				.append(idPropName == null ? "*" : idPropName).append(")");
		hql.append(" from ").append(objName);
		hql.append(" where ").append(namePropName).append("=?");
		if (idPropName != null && !"".equals(idPropName.trim())
				&& idPropVal != null) {
			hql.append(" and  ").append(idPropName).append("!=?");
		}

		List countlist = null;
		if (idPropVal != null) {
			countlist = commonDao.findByHql(hql.toString(), nameVal, idPropVal);
		} else {
			countlist = commonDao.findByHql(hql.toString(), nameVal);
		}
		int count = commonDao.toLong(countlist.get(0)).intValue();
		return count > 0 ? true : false;
	}

	/**
	 * PagerModel 装填数据,PagerModel中的查询语句是HQL形式
	 * 
	 * @param pagerModel
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public void fillPagerModelData(PagerModel pagerModel) {
		int totalRows = pagerModel.getTotals();
		if (totalRows == 0) {
			totalRows = commonDao.getResultCountWithValuesMap(
					pagerModel.getQueryHql(), pagerModel.getHqlParamMap(),
					pagerModel.getCountProName(), false).intValue();
		}
		// int totalNo = this.getValidPage(pagerModel.getPageNo(), totalRows,
		// pagerModel.getPageSize());
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList(1));
			return;
		}
		pagerModel.setTotals(totalRows);
		pagerModel.setPageData(commonDao.findByHqlWithValuesMap(
				pagerModel.getQueryHql(), pagerModel.getPageNo(),
				pagerModel.getPageSize(), pagerModel.getHqlParamMap(), false));
	}

	/**
	 * PagerModel 装填数据,PagerModel中的查询语句是sql形式
	 * 
	 * @param pagerModel
	 * @param classz
	 *            为实体为，如果这个参数不为空，装填的数据就是这个对像的list
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public void fillSqlPagerModelData(PagerModel pagerModel, Class... classz) {
		int totalRows = pagerModel.getTotals();
		if (totalRows == 0) {
			
			totalRows = commonDao.getResultCountBySqlWithValuesMap(
					pagerModel.getQueryHql(), pagerModel.getCountProName(),pagerModel.getHqlParamMap()
					).intValue();
		}
		// int pageNo = this.getValidPage( pagerModel.getPageNo(), totalRows,
		// pagerModel.getPageSize());
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList(1));
			return;
		}
		pagerModel.setTotals(totalRows);
		if (classz != null && classz[0] != null) {
			pagerModel.setPageData(commonDao.findBySqlWithValuesMap(
					pagerModel.getQueryHql(), pagerModel.getPageNo(),
					pagerModel.getPageSize(), classz[0],
					pagerModel.getHqlParamMap()));
		} else {
			pagerModel
					.setPageData(commonDao.findBySqlWithValuesMap(
							pagerModel.getQueryHql(), pagerModel.getPageNo(),
							pagerModel.getPageSize(), null,
							pagerModel.getHqlParamMap()));
		}

	}

	/**
	 * PagerModel 装填数据,PagerModel中的查询语句是sql形式
	 * 
	 * @param pagerModel
	 * @param build
	 *            因是SQL果询，返因的数据是对像数组list 用这个 build做回调把他转为想要的对像list
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public void fillSqlPagerModelData(PagerModel pagerModel,
			ConvertObjArrayToVo build) {
		int totalRows = pagerModel.getTotals();
		if (totalRows == 0) {
			totalRows = commonDao.getResultCountBySqlWithValuesMap(
					pagerModel.getQueryHql(),pagerModel.getCountProName(), pagerModel.getHqlParamMap()
					).intValue();
		}
		// int pageNo = this.getValidPage( pagerModel.getPageNo(), totalRows,
		// pagerModel.getPageSize());
		if (totalRows == 0) {
			pagerModel.setPageData(new ArrayList());
			return;
		}
		List list = commonDao.findBySqlWithValuesMap(pagerModel.getQueryHql(),
				pagerModel.getPageNo(), pagerModel.getPageSize(), null,
				pagerModel.getHqlParamMap());
		pagerModel.setPageData(build.convert(list));
	}

	/**
	 * 通用批量删除方法
	 * 
	 * @param clasz
	 *            要删除的实体对像类名
	 * @param praAndValueMap
	 *            ,要删除的条件map ,key为属性名，value为属性值，value支持list集合 删除时就是用这个去动态构造HQL
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void comonDelete(Class clasz, Map praAndValueMap) {
		if (praAndValueMap == null
				|| (praAndValueMap != null && praAndValueMap.isEmpty())) {
			info(logger,
					"no parameter and it's value ,so dont't exe delete opration");
			return;
		}
		StringBuilder hql = new StringBuilder();
		hql.append("delete from ").append(clasz.getSimpleName());
		if (praAndValueMap != null && !praAndValueMap.isEmpty()) {
			hql.append(" where 1=1 ");
			Iterator it = praAndValueMap.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry<String, Object> me = (Map.Entry<String, Object>) it
						.next();

				if (me.getValue() instanceof List) {
					hql.append(" and  ").append(me.getKey()).append(" in (:")
							.append(me.getKey()).append(")");
				} else {
					hql.append(" and  ").append(me.getKey()).append(" =:")
							.append(me.getKey());
				}
			}
		}
		commonDao.updateByHqlWithValuesMap(hql.toString(), praAndValueMap);
	}

	public <T> List<T> findByProperty(Class<T> clasz, String propertyName,
			Object value) {
		return commonDao.findByProperty(clasz, propertyName, value);
	}

	public Integer executeUpdateBySql(final String hql, final Object[] objects) {
		return commonDao.updateBySql(hql, objects);
	}

	public void dictionaryConvert(Object dictObj,
			Map<String, String> dictMapDesc) {
		if (dictObj == null) {
			return;
		}
		if (dictMapDesc == null || dictMapDesc.isEmpty()) {
			return;
		}
		try {
			Iterator<Entry<String, String>> it = dictMapDesc.entrySet()
					.iterator();
			String[] propertys = null;
			while (it.hasNext()) {
				Entry<String, String> me = it.next();
				propertys = me.getKey().split("\\.");
				Object dictValue = DhccBeanUtils.forceGetProperty(dictObj,
						propertys[0]);
				if (dictValue == null) {
					continue;
				}
				if (propertys.length == 1) {
					;
					DhccBeanUtils.forceSetProperty(dictObj, me.getKey(),
							DictionaryCacheServiceImpl.getDictNameByValueType(
									(String) dictValue, me.getValue()));
				} else {
					Object laseLayerObj = null;
					for (int i = 1; i < propertys.length; i++) {
						if (i != propertys.length - 1
								|| (propertys.length == 2 && i == 1)) {
							laseLayerObj = dictValue;
						}

						dictValue = DhccBeanUtils.forceGetProperty(dictValue,
								propertys[i]);

						if (dictValue == null) {
							break;
						}
					}
					if (dictValue != null && laseLayerObj != null) {
						DhccBeanUtils.forceSetProperty(laseLayerObj,
								propertys[propertys.length - 1],
								DictionaryCacheServiceImpl
										.getDictNameByValueType(
												(String) dictValue,
												me.getValue()));
					}
				}
				dictValue = null;
			}
		} catch (NoSuchFieldException e) {
			logger.error(e.getMessage(), e);
		}
	}

	/**
	 * 把list中字典表中代码值转换为他的名称
	 * 
	 * @param list
	 * @param praAndValueMap
	 *            key为list中object的表示字典表的属性 (支持通过点来多层次的属性如 dto.user.id或是无层次的id),
	 *            value为他的类型，如学历，性别
	 */
	@Override
	public void dictionaryConvert(List<?> list, Map<String, String> dictMapDesc) {
		if (list == null || list.isEmpty()) {
			return;
		}
		if (dictMapDesc == null || dictMapDesc.isEmpty()) {
			return;
		}

		for (Object currObj : list) {
			this.dictionaryConvert(currObj, dictMapDesc);

		}
	}

	/**
	 * 根据相关参数，查询list参数中所含对像所关联的其他对像，可以是一对一，一对多，无中间表的多对多,并把这些关联的对像设置到list中的对像中
	 * @param list:list:己通过hibernate查出的一方， 为一方的list
	 * @param relaMapInfo :key为一方作为在另一方(从方)的外健的属性名 (这个属性在主从方都要用且名字相同),valeu 为了map
	 * 它的key表示从方对像在一方的属性名,value表示从方的类
	 * @param relaTypeMap:key同 relaMapInfo中的key,value为该属在一方中对应关联类型。通过RelaTypeEnum.列出可选的枚举类
	 * @param queryProMap: 可以为空，key同 relaMapInfo中的key value 为要查询的多方对像的属性值(多个属性用逗号隔开)，不指定就查所有属性，指定了属性要求有相关构造函数
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void fillRelaObject(List ownerList,
			Map<String, Map<String, Class>> relaMapInfo,
			Map<String, RelaTypeEnum> relaTypeMap,
			Map<String, String> queryProMap) {
		if (ownerList == null || ownerList.isEmpty()) {
			return;
		}

		Iterator<Entry<String, Map<String, Class>>> it = relaMapInfo.entrySet()
				.iterator();
		List foreKeyVaList = new ArrayList();
		Map praValuesMap = new HashMap(1);
		List foreKeyVaListTemp = new ArrayList();
		Set foreKeyVaLSet = new HashSet();
		List relaObjForegVaList = new ArrayList();
		while (it.hasNext()) {
			Map.Entry<String, Map<String, Class>> me = it.next();
			for (Object currObj : ownerList) {
				Object foreKeyVaLue;
				try {
					foreKeyVaLue = DhccBeanUtils.forceGetProperty(currObj,
							me.getKey());
				} catch (NoSuchFieldException e) {
					throw new DataBaseException(e.getMessage(), e);
				}
				foreKeyVaList.add(foreKeyVaLue);
			}

			StringBuilder hql = new StringBuilder();
			Iterator<Entry<String, Class>> it2 = me.getValue().entrySet()
					.iterator();
			Entry<String, Class> me2 = it2.next();
			if (queryProMap != null && queryProMap.get(me.getKey()) != null) {
				String className = me2.getValue().getName();
				hql.append(" select new " + className + "("
						+ queryProMap.get(me.getKey()) + ") from " + className);
			} else {
				String className = me2.getValue().getName();
				hql.append(" from " + className);
			}
			hql.append(" where " + me.getKey() + " in(:" + me.getKey() + ") ");
		
			
			for (Object obj : foreKeyVaList) {
				foreKeyVaLSet.add(obj);
			}
			Object[] foreKeyVaLArr = foreKeyVaLSet.toArray();
			
			for (Object obj : foreKeyVaLArr) {
				foreKeyVaListTemp.add(obj);
			}
			praValuesMap.put(me.getKey(), foreKeyVaListTemp);
			List valueList = commonDao.findByHqlWithValuesMap(hql.toString(),
					praValuesMap, false);
			if(valueList==null||valueList.isEmpty()){
				continue;
			}
			
			String foreginProName = me.getKey();
			String ownerProName = me2.getKey();
			for(Object currRelaObj :valueList){
				Object relaForeKeyVal;
				try {
					relaForeKeyVal = DhccBeanUtils.forceGetProperty(currRelaObj,
							foreginProName);
				} catch (NoSuchFieldException e) {
					throw new DataBaseException(e.getMessage(), e);
				}
				relaObjForegVaList.add(relaForeKeyVal);
			}
			if (relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.one2one
					.getRelaType()) {
				int il = 0;
				for (Object currForeginValObj : foreKeyVaList) {
					if(currForeginValObj==null){
						il++;
						continue;
						
					}
					Object currObj = ownerList.get(il);
					try {
						this.filllOne2oneRelaObj(currForeginValObj, valueList,
								currObj, ownerProName, relaObjForegVaList);
					} catch (NoSuchFieldException e) {
						throw new DataBaseException(e.getMessage(), e);
					}
					il++;
				}
			} else {

				if (relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.one2manyList
						.getRelaType()||relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.many2manyList
								.getRelaType()) {
					int il = 0;
					for (Object currForeginValObj : foreKeyVaList) {
						if(currForeginValObj==null){
							il++;
							continue;
						}
						Object currObj = ownerList.get(il);
						List manyList = new ArrayList();
						Iterator relaObjIt = valueList.iterator();
						int i = 0;
						while (relaObjIt.hasNext()) {
							Object relaObj = relaObjIt.next();
							if (this.isRealObj(currForeginValObj,
									relaObjForegVaList.get(i))) {
								manyList.add(relaObj);
								if(relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.one2manyList
										.getRelaType()){
									relaObjIt.remove();
								}	
							}
							i++;
						}
						try {
							if (!manyList.isEmpty()) {
								DhccBeanUtils.forceSetProperty(currObj,
										ownerProName, manyList);
							}
						} catch (NoSuchFieldException e) {
							throw new DataBaseException(e.getMessage(), e);
						}
						il++;
					}
				} else if (relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.one2manySet
						.getRelaType()||relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.many2manySet.getRelaType()) {
					int il = 0;
					for (Object currForeginValObj : foreKeyVaList) {
						if(currForeginValObj==null){
							continue;
						}
						Object currObj = ownerList.get(il);
						Set manySet = new HashSet();
						Iterator relaObjIt = valueList.iterator();
						int i = 0;
						while (relaObjIt.hasNext()) {
							Object relaObj = relaObjIt.next();
							if (this.isRealObj(currForeginValObj,
									relaObjForegVaList.get(i))) {
								manySet.add(relaObj);
								if(relaTypeMap.get(me.getKey()).getRelaType() == RelaTypeEnum.one2manySet
										.getRelaType()){
									relaObjIt.remove();
								}
							}
							i++;
						}
						try {
							if (!manySet.isEmpty()) {
								DhccBeanUtils.forceSetProperty(currObj,
										ownerProName, manySet);
							}
						} catch (NoSuchFieldException e) {
							throw new DataBaseException(e.getMessage(), e);
						}
						il++;
					}
				} 
			}
			foreKeyVaList.clear();
			praValuesMap.clear();
			foreKeyVaListTemp.clear();
			foreKeyVaLSet.clear();
			relaObjForegVaList.clear();
		}

	}

	private boolean isRealObj(Object currForeginValObj, Object relaValue) {
		if (relaValue == null) {
			return false;
		}
		if (currForeginValObj instanceof String) {
			if (((String) currForeginValObj).equals((String) relaValue)) {
				return true;
			}
			return false;
		} else if (currForeginValObj instanceof Integer) {
			if ((((Integer) currForeginValObj).intValue()) == (((Integer) relaValue))
					.intValue()) {
				return true;
			}
			return false;
		} else if (currForeginValObj instanceof Double) {
			if ((((Double) currForeginValObj).doubleValue()) == (((Double) relaValue))
					.doubleValue()) {
				return true;
			}
			return false;
		} else if (currForeginValObj instanceof Float) {
			if ((((Float) currForeginValObj).floatValue()) == (((Float) relaValue))
					.floatValue()) {
				return true;
			}
			return false;
		} else if (currForeginValObj instanceof BigDecimal) {
			if ((((BigDecimal) currForeginValObj).intValue()) == (((BigDecimal) relaValue))
					.intValue()) {
				return true;
			}
			return false;
		} else if (currForeginValObj instanceof BigInteger) {
			if ((((BigInteger) currForeginValObj).intValue()) == (((BigInteger) relaValue))
					.intValue()) {
				return true;
			}
			return false;
		} else if (currForeginValObj.toString().equals(relaValue.toString())) {
			return true;
		}

		return false;
	}

	/**
	 * 
	 * @param currForeginValObj
	 *            当前外键值班
	 * @param valueList
	 *            对应的从方对像
	 * @param currObj
	 *            对应的主方对像
	 * @param ownerProName
	 *            在主方关联的属性名
	 * @param relaObjForegVaList 外键在从方按顺序对应的值的list
	 *            外健在主方的属性名
	 * @return
	 * @throws NoSuchFieldException
	 */
	@SuppressWarnings("rawtypes")
	private void filllOne2oneRelaObj(Object currForeginValObj,
			List<?> valueList, Object currObj, String ownerProName,List relaObjForegVaList) throws NoSuchFieldException {
		if (currForeginValObj instanceof String) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if (((String) currForeginValObj).equals((String) relaValue)) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					// 因为是一对一所以用完就删掉
					it.remove();
					break;
				}
				i++;
			}
		} else if (currForeginValObj instanceof Integer) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if ((((Integer) currForeginValObj).intValue()) == (((Integer) relaValue))
						.intValue()) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		} else if (currForeginValObj instanceof Double) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if ((((Double) currForeginValObj).doubleValue()) == (((Integer) relaValue))
						.doubleValue()) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		} else if (currForeginValObj instanceof Float) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if ((((Float) currForeginValObj).floatValue()) == (((Float) relaValue))
						.floatValue()) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		} else if (currForeginValObj instanceof BigDecimal) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if ((((BigDecimal) currForeginValObj).intValue()) == (((BigDecimal) relaValue))
						.intValue()) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		} else if (currForeginValObj instanceof BigInteger) {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if ((((BigInteger) currForeginValObj).intValue()) == (((BigInteger) relaValue))
						.intValue()) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		} else {
			Iterator it = valueList.iterator();
			int i = 0;
			while (it.hasNext()) {
				Object relaObj = it.next();
				Object relaValue = relaObjForegVaList.get(i);
				if (relaValue.toString().equals(currForeginValObj.toString())) {
					DhccBeanUtils.forceSetProperty(currObj, ownerProName,
							relaObj);
					break;
				}
				i++;
			}
		}
	}

	/**
	 * 
	 * @param 要求中间与两个多方所关联的外键，在两个多方中都是主键
	 * @param ownerList 己通过hibernate查出的多对多的一方
	 * @param relaMapInfo:key为 另一多方在list所含对像一方的属性名,value 为 key所对应的多方的类
	 * @param queryProMap 可以为空（目前暂不要传该参数，不支持），key同 relaMapInfo中的key value 为要查询的多方对像的属性值(多个属性用逗号隔开)，不指定就查所有属性，指定了属性要求有相关构造函数
	 * @param middleMapInfo:同relaMapInfo中的key ,value为中间表对类名
	 *  @param relaTypeMap:key同 relaMapInfo中的key,value为该属在一方中对应关联类型。通过RelaTypeEnum.列出可选的枚举类，只能是多对多list或者是对多对set
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void fillRelaObjectWithMidTable(List ownerList,Map<String,Class> relaMapInfo,Map<String,String> queryProMap,Map<String,Class> middleMapInfo,Map<String, RelaTypeEnum> relaTypeMap){
		if(ownerList==null||ownerList.isEmpty()){
			return;
		}
		String ownerIdProName = commonDao.getIdName(ownerList.get(0).getClass());
		Iterator<Map.Entry<String,Class>> it = relaMapInfo.entrySet().iterator();
		List ownerIdList = new ArrayList(ownerList.size());
		Map praValuesMap = new HashMap(1);
		while(it.hasNext()){
			Map.Entry<String,Class> me = it.next();
			String relaObjIdProName =  commonDao.getIdName(me.getValue());
			String relaObjClassName = me.getValue().getName();
			String middTableEntityName = middleMapInfo.get(me.getKey()).getName();
			StringBuilder hql = new StringBuilder();
			if (queryProMap != null && queryProMap.get(me.getKey()) != null){
				hql.append(" select middTableEntity,new "+relaObjClassName +"(" +queryProMap.get(me.getKey()) +") from "+ relaObjClassName +" relaObjEntity ,"+ middTableEntityName +"    middTableEntity ");
			}else{
				hql.append(" select  relaObjEntity,middTableEntity  from " + relaObjClassName +" relaObjEntity ," + middTableEntityName +"    middTableEntity ");
			}
			hql.append(" where middTableEntity."+ownerIdProName +" in (:ownerIds)  and middTableEntity."+relaObjIdProName +"=relaObjEntity."+relaObjIdProName);
			try {
				for(Object currOwnObj :ownerList){
					ownerIdList.add(DhccBeanUtils.forceGetProperty(currOwnObj,
							ownerIdProName));
				}
			} catch (NoSuchFieldException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
			
			praValuesMap.put("ownerIds", ownerIdList);
			List<Object[]> realResultList = commonDao.findByHqlWithValuesMap(hql.toString(), praValuesMap, false);
			if(realResultList==null||realResultList.isEmpty()){
				return;
			}
			this.fillRelaObjectWithMidTable(ownerList, ownerIdList,realResultList, ownerIdProName, relaObjIdProName,relaTypeMap.get(me.getKey()),me.getKey());
			ownerIdList.clear();
			praValuesMap.clear();
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void fillRelaObjectWithMidTable(List ownerList,List ownerIdList,List<Object[]> realResultList,String ownerIdProName,String relaObjIdProName,RelaTypeEnum relaType,String listOrSetProName){
		
		List middOwnerIdList = new ArrayList(realResultList.size());
		List relaObjList = new ArrayList(realResultList.size());
		try {
			for(Object[] objArr:realResultList){
				relaObjList.add(objArr[0]);
				middOwnerIdList.add(DhccBeanUtils.forceGetProperty(objArr[1],
						ownerIdProName));
			}
		} catch (NoSuchFieldException e) {
			throw new DataBaseException(e.getMessage(), e);
		}
		int i =0;
		for(Object currOwnerId:ownerIdList){
			
			Set relaSet = null;
			List relaList = null;
			if(relaType==EnumConstants.RelaTypeEnum.many2manyList){
				relaList = new ArrayList();
			}else{
				relaSet = new HashSet();
			}
			int l = 0;
			for(Object middOwnereId :middOwnerIdList){
				if(this.isRealObj(currOwnerId, middOwnereId)){
					if(relaSet!=null){
						relaSet.add(relaObjList.get(l));
					}else {
						relaList.add(relaObjList.get(l));
					}
				}
				l++;
			}
			try {
				if(relaSet!=null){
					DhccBeanUtils.forceSetProperty(ownerList.get(i), listOrSetProName, relaSet);
				}else if(relaList!=null){
					DhccBeanUtils.forceSetProperty(ownerList.get(i), listOrSetProName, relaList);
				}
			} catch (NoSuchFieldException e) {
				throw new DataBaseException(e.getMessage(), e);
			}
			i++;

		}
	}
	
	/**
	 * 
	 * @param pagerModel :queryHql 这时设置的是原生SQL
	 * @param className  : 查询的结果集要转成的对像的类，可是实体类，也可以是VO类，按命令规则转换。如结果集中的user_id对应对像里的userId
	 * @param columnNameForCount:用于分页查询时，count(columnNameForCount) 函数于用统计记录数的列事，一般用数据库中主键列
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public void fillSqlPagerModelData(PagerModel pagerModel, Class className,
			String columnNameForCount) {
		jdbcTemplateWrapper.fillPagerModelData(pagerModel, className, columnNameForCount);
	}

	@Override
	public NormalAccount checkUser(OperateResult operateResult,String username, String password) {
		String[] propertyNames = { "accountAlias", "password" };
		Object[] values = { username, password};
		List<NormalAccount> accounts = commonDao.findByProperties(NormalAccount.class, propertyNames, values);

		if (accounts.size() == 0) {
			operateResult.setResultCode("-3");
			operateResult.setResultContent("帐号或者密码错误");
			return null;
		}
		return accounts.get(0);
	}

	@Override
	public VenInc getVenIncByBarCode(Long vendorId, String barcode) {
		
		String[] propertyNames = { "venIncVenid", "venIncBarCode" };
		Object[] values = { vendorId, barcode};
		List<VenInc> venIncs = commonDao.findByProperties(VenInc.class, propertyNames, values);

		if (venIncs.size() == 0) {
			return null;
		}
		return venIncs.get(0);
	}

	@Override
	public float getIncFac(Long venIncId, Long hopIncId) {
		
		String[] propertyNames = { "hopIncId", "venIncId" ,"venHopAuditflag"};
		Object[] values = { hopIncId, venIncId,"Y"};
		List<VenHopInc> venHopIncs = commonDao.findByProperties(VenHopInc.class, propertyNames, values);

		if (venHopIncs.size() == 0) {
			return 0;
		}
		return venHopIncs.get(0).getVenFac().floatValue()/venHopIncs.get(0).getHopFac().floatValue();
	}
	
	
	public boolean checkHisNoIsUpload(String hisno,Long hopId){
		
		String[] propertyNames = {"orderHisNo", "orderHopId"};
		Object[] values = {hisno, hopId};
		List<OrderDetail> orders = commonDao.findByProperties(OrderDetail.class,propertyNames, values);
		if(orders.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public HopVendor getVenByBusinessRegNo(String businessRegNo, Long hopId) {
		String[] propertyNames = {"businessRegNo", "hopHopId"};
		Object[] values = {businessRegNo, hopId};
		List<HopVendor>  hopVendors = commonDao.findByProperties(HopVendor.class,propertyNames, values);
		if(hopVendors.size()>0){
			return hopVendors.get(0);
		}
		return null;
	}

	@Override
	public HopCtloc getCtlocByCode(String code, Long hopId) {
		String[] propertyNames = {"hisid", "hospid"};
		Object[] values = {code, hopId};
		List<HopCtloc>  hopCtlocs = commonDao.findByProperties(HopCtloc.class,propertyNames, values);
		if(hopCtlocs.size()>0){
			return hopCtlocs.get(0);
		}
		return null;
	}

	@Override
	public boolean checkIncIsCon(Long venIncId, Long hopIncId) {
		String[] propertyNames = { "hopIncId", "venIncId" };
		Object[] values = { hopIncId, venIncId};
		List<VenHopInc> venHopIncs = commonDao.findByProperties(VenHopInc.class, propertyNames, values);

		if (venHopIncs.size() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public void saveOrdSub(OrderDetailSub detailSub, String remark, Long userId) {
		
		commonDao.saveOrUpdate(detailSub);
		OrderDetail orderDetail=commonDao.get(OrderDetail.class, detailSub.getOrdSubDetailId());
		ExeState ordExe=new ExeState();
		ordExe.setOrdId(orderDetail.getOrderId());
		ordExe.setRemark(remark);
		ordExe.setUserid(userId);
		ordExe.setStateId(detailSub.getOrdSubStatus().equals("Y")?3l:4l);
		ordExe.setExedate(new java.sql.Timestamp(new Date().getTime()));
		commonDao.save(ordExe);
		
		ExeState subExe=new ExeState();
		subExe.setOrdSubId(detailSub.getOrdSubId());
		subExe.setUserid(userId);
		subExe.setRemark(remark);
		subExe.setStateId(detailSub.getOrdSubStatus().equals("Y")?3l:4l);
		subExe.setExedate(new java.sql.Timestamp(new Date().getTime()));
		commonDao.save(subExe);
	}

	@Override
	public void saveOrd(OrderDetail detail, String type, Long userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HopVendor getVenByCode(String code, Long hopId) {
		String[] propertyNames = {"hopCode", "hopHopId"};
		Object[] values = {code, hopId};
		List<HopVendor>  hopVendors = commonDao.findByProperties(HopVendor.class,propertyNames, values);
		if(hopVendors.size()>0){
			return hopVendors.get(0);
		}
		return null;
	}

	@Override
	public HvLabel getHvLabel(String label, Long hopId, Long vendorId) {
		String[] propertyNames = {"hvLabel", "hvHopId","hvVendorId"};
		Object[] values = {label, hopId,vendorId};
		List<HvLabel>  hvLabels = commonDao.findByProperties(HvLabel.class,propertyNames, values);
		if(hvLabels.size()>0){
			return hvLabels.get(0);
		}
		return null;
		
	}
	
}

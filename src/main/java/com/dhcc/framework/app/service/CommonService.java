package com.dhcc.framework.app.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;

import com.dhcc.framework.common.ConvertObjArrayToVo;
import com.dhcc.framework.common.EnumConstants.RelaTypeEnum;
import com.dhcc.framework.common.HtmlListQueryObj;
import com.dhcc.framework.common.ListObject;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.hop.HopVendor;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ord.OrderDetailSub;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.ws.OperateResult;

public interface CommonService {

	public void add(Object entity);

	public void update(Object entity);

	public void saveOrUpdate(Object entity); 
	
	@SuppressWarnings("rawtypes")
	public void delete(Class clasz, String id);

	public void delete(Object entity);


	public <T> T get(Class<T> clasz, String id);

	public CommonDao getCommonDao() ;

	public <T> DetachedCriteria createDetachedCriteria(Class<T> clasz,
			Criterion... criterions);

	public <T> DetachedCriteria createDetachedCriteria(Class<T> clasz,
			Object qbeObject, Criterion... criterions);

	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria, int pageNo,
			int pageSize);

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria, int pageNo, int pageSize);

	@SuppressWarnings("rawtypes")
	public List findByDetachedCriteria(DetachedCriteria criteria);

	@SuppressWarnings("rawtypes")
	public List findByCriteria(Criteria criteria);
	

	public void fillPagerModelData(PagerModel pagerModel);
	@SuppressWarnings("rawtypes")
	public void fillSqlPagerModelData(PagerModel pagerModel,Class...classz);
	
	public void fillSqlPagerModelData(PagerModel pagerModel,ConvertObjArrayToVo build);


	public <T> List<T> getAll(Class<T> clasz, String orderBy, boolean isAsc);

	public <T> T get(Class<T> clasz, Serializable id);

	public <T> List<T> findByProperties(Class<T> clasz, String[] propertyNames,
			Object[] values);

	public  <T> List<T> findByProperty(Class<T> clasz,  String propertyNames,
			Object values);


	@SuppressWarnings("rawtypes")
	public List getListDataByQBE(Class clasz, Object qbeObject, int pageNo,
			int pageSize);

	public List<List<ListObject>> getDropListData(List<HtmlListQueryObj> list,
			final boolean isRefresh);

	public HashMap<String, List<ListObject>> getDropListDataMap(
			List<HtmlListQueryObj> QueryObjList, final boolean isRefresh);



	public <T> Set<T> saveRealSet(Set<T> oldSet, Set<T> newSet,
			String idPorperty, String cacheRegion);

	public <T> Set<T> listToSet(List<T> list);
	
	public void sortStringList(List<String> list);
	

	public boolean reNameChk(String objName, String nameVal,
			String namePropName, String idPropName, String idPropVal);

	public boolean reNameChk(String objName,final String nameVal,final String namePropName,String idPropName,final Long idPropVal);
	
	
	public void sortLongList(List<Long> list);
	
	@SuppressWarnings("rawtypes")
	public void comonDelete(Class clasz ,Map praAndValueMap );
	
	/**
	 * 把list中字典表中代码值转换为他的名称
	 * @param list
	 * @param praAndValueMap key为list中object的表示字典表的属性
	 * (支持通过点来多层次的属性如 dto.user.id或是无层次的id),
	 * value为他的类型，如学历，性别
	 */
	public void dictionaryConvert(List<?> list,Map<String,String> dictMapDesc );
	
	/**
	 * 把list中字典表中代码值转换为他的名称
	 * @param dict 
	 * @param praAndValueMap key为list中object的表示字典表的属性
	 * (支持通过点来多层次的属性如 dto.user.id或是无层次的id),
	 * value为他的类型，如学历，性别
	 */
	public void dictionaryConvert(Object dictObj,Map<String,String> dictMapDesc );
	
	
	/**
	 * 根据相关参数，查询list参数中所含对像所关联的其他对像，可以是一对一，一对多，无中间表的多对多,并把这些关联的对像设置到list中的对像中
	 * @param ownerList:己通过hibernate查出的一方， 为一方的list
	 * @param relaMapInfo key为一方作为在另一方(从方)的外健的属性名 ,
	 * valeu 为了map 它的key表示从方对像在一方的属性名,value表示从方的类
	 * @param relaTypeMap:key同 relaMapInfo中的key,
	 * value为该属在一方中对应关联类型。通过RelaTypeEnum.列出可选的枚举类
	 * @param  queryProMap  可以为空，key同 relaMapInfo中的key 
	 * value 为要查询的多方对像的属性值(多个属性用逗号隔开)，不指定就查所有属性，指定了属性要求有相关构造函数
	 */
	public void fillRelaObject(List ownerList,Map<String,Map<String,Class>> relaMapInfo,
			Map<String,RelaTypeEnum> relaTypeMap,Map<String,String> queryProMap) ;
	
	/**
	 * 
	 * @param 要求中间与两个多方所关联的外键，在两个多方中都是主键
	 * @param list 己通过hibernate查出的多对多的一方
	 * @param relaMapInfo:key为 另一多方在list所含对像一方的属性名,value 为 key所对应的多方的类
	 * @param queryProMap 可以为空（目前暂不要传该参数，不支持），key同 relaMapInfo中的key value 
	 * 为要查询的多方对像的属性值(多个属性用逗号隔开)，不指定就查所有属性，指定了属性要求有相关构造函数
	 * @param middleMapInfo:同relaMapInfo中的key ,value为中间表对类名
	 * @param relaTypeMap:key同 relaMapInfo中的key,value为该属在一方中对应关联类型。
	 * 通过RelaTypeEnum.列出可选的枚举类，只能是多对多list或者是对多对set
	 */
	public void fillRelaObjectWithMidTable(List ownerList,Map<String,Class> relaMapInfo,
			Map<String,String> queryProMap,Map<String,Class> middleMapInfo,Map<String, RelaTypeEnum> relaTypeMap) ;
	
	/**
	 * 
	 * @param pagerModel :queryHql 这时设置的是原生SQL
	 * @param className  : 查询的结果集要转成的对像的类，可是实体类，也可以是VO类，按命令规则转换。如结果集中的user_id对应对像里的userId
	 * @param columnNameForCount:用于分页查询时，count(columnNameForCount) 函数于用统计记录数的列事，一般用数据库中主键列
	 */
	public void fillSqlPagerModelData(PagerModel pagerModel,Class className,String columnNameForCount);
	
	/**
	 * 
	 * @param operateResult :检查用户名和密码
	 * @param username  : 用户名
	 * @param password:密码
	 */
	public NormalAccount checkUser(OperateResult operateResult,String username,String password);
	
	/**
	 * @see  :获取供应商商品
	 * @param vendorId  : 供应商id
	 * @param barcode:商品码
	 */
	public VenInc getVenIncByBarCode(Long vendorId,String barcode);
	
	/**
	 * @see  :获取供应商商品到医院单位转换系数
	 * @param venIncId  : 供应商商品id t_ven_inc 
	 * @param hopIncId ：医院商品id t_hop_inc
	 */
	public float getIncFac(Long venIncId,Long hopIncId);
	
	
	/**
	 * @see  :检查改订单明细是否已经上传
	 * @param hisno  : his订单标识  
	 * @param hopId  ：医院id
	 */
	public boolean checkHisNoIsUpload(String hisno,Long hopId);
	
	/**
	 * @see  :查找供应商
	 * @param businessRegNo  : 供应商工商执照注册号/统一社会信用代码 
	 * @param hopId  ：医院id
	 */
	public HopVendor getVenByBusinessRegNo(String businessRegNo,Long hopId);
	
	/**
	 * @see  :查找医院科室
	 * @param code  : 科室编码 
	 * @param hopId  ：医院id
	 */
	public HopCtloc getCtlocByCode(String code,Long hopId);
	
	/**
	 * @see  :检查医院商品是否和供应商商品做过对照
	 * @param venIncId  : 供应商商品id
	 * @param hopIncId  ：医院商品id
	 */
	public boolean checkIncIsCon(Long venIncId, Long hopIncId);
	
	
	/**
	 * @see  :修改发货表状态，订单表状态，并生成订单执行记录表
	 */
	public void saveOrdSub(OrderDetailSub detailSub,String remark,Long userId);
	
	/**
	 * @see  :修改订单表状态，并生成订单执行记录表
	 */
	public void saveOrd(OrderDetail detail,String remark,Long userId);

}

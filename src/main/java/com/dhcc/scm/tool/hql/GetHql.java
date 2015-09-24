package com.dhcc.scm.tool.hql;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import com.dhcc.framework.exception.DataBaseException;


/**
 * <p>标题: GetHql.java</p>
 * <p>业务描述:根据对象生成HQL语句的相关方法</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月4日
 * @version V1.0 
 */
public class GetHql {
	
	/**
	 * 
	* 方法名:          GetHqlByObject
	* 方法功能描述:    根据对象生成HQL语句
	* @param:         数据对象，需要修改的HQL字符串对象，键值对集合，不需要作为查询条件的属性
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年9月4日 上午9:59:19
	 */
	public void getHqlByObject(Object obj,StringBuilder hqlStr,Map<String, Object> map,List<String> list) {
		if(hqlStr.length()==0){
			hqlStr.append("from ").append(obj.getClass().getName()).append(" where 1=1");
		}
		// 获取f对象对应类中的所有属性域
		list.add("serialVersionUID");
		// 获取f对象对应类中的所有属性域
		Field[] fields = obj.getClass().getDeclaredFields();
		int j=0;
		for(int i = 0 , len = fields.length; i < len; i++) {
			// 对于每个属性，获取属性名
			String varName = fields[i].getName();
			if (list.contains(varName)) {
				continue;
			}
			try {
				// 获取原来的访问控制权限
				boolean accessFlag = fields[i].isAccessible();
				// 修改访问控制权限
				fields[i].setAccessible(true);
				// 获取在对象f中属性fields[i]对应的对象中的变量
				Object varValue = fields[i].get(obj);
				if ((varValue!=null)&&(!varValue.equals(""))) {
					j++;
					hqlStr.append(" And ").append(varName).append("=:varValue").append(j);
					map.put("varValue"+j, varValue);
				}
				// 恢复访问控制权限
				fields[i].setAccessible(accessFlag);
			} catch (Exception e) {
				throw new DataBaseException(e.getMessage(), e);
			}
		}
	}
	
}

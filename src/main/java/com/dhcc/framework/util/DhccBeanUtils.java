package com.dhcc.framework.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;

import com.dhcc.framework.exception.DataBaseException;

/**
 * <p>
 * 扩展Apache Commons BeanUtils, 提供一些反射方面缺失功能的封装.
 * </p>
 * 
 * @author liuyg
 * 
 */
@Component
public class DhccBeanUtils extends org.apache.commons.beanutils.BeanUtils {
	
	private static Log logger = LogFactory.getLog(DhccBeanUtils.class);
	public  DhccBeanUtils() {
	}

	/**
	 * <p>
	 * 循环向上转型,获取对象的DeclaredField.
	 * </p>
	 * 
	 * @throws NoSuchFieldException
	 *             如果没有该Field时抛出.
	 */
	public static Field getDeclaredField(Object object, String propertyName)
			throws NoSuchFieldException {
		Assert.notNull(object);
		Assert.hasText(propertyName);
		return getDeclaredField(object.getClass(), propertyName);
	}

	/**
	 * <p>
	 * 循环向上转型,获取对象的DeclaredField.
	 * </p>
	 * 
	 * @throws NoSuchFieldException
	 *             如果没有该Field时抛出.
	 */
	public static Field getDeclaredField(Class clazz, String propertyName)
			throws NoSuchFieldException {
		Assert.notNull(clazz);
		Assert.hasText(propertyName);
		for (Class superClass = clazz; superClass != Object.class; superClass = superClass
				.getSuperclass()) {
			try {
				return superClass.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e) {
				logger.error(e.getMessage(),e);
			}
		}
		throw new NoSuchFieldException("No such field: " + clazz.getName()
				+ '.' + propertyName);
	}

	/**
	 * <p>
	 * 暴力获取对象变量值,忽略private,protected修饰符的限制.
	 * </p>
	 * 
	 * @throws NoSuchFieldException
	 *             如果没有该Field时抛出.
	 */
	public static Object forceGetProperty(Object object, String propertyName)
			throws NoSuchFieldException {
		Assert.notNull(object);
		Assert.hasText(propertyName);
		Object result = null;
		try {
			result = BeanUtilsBean.getInstance().getPropertyUtils()
					.getProperty(object, propertyName);
			return result;
		} catch (Exception e) {
			logger.error(e);
		}
		Field field = getDeclaredField(object, propertyName);
		boolean accessible = field.isAccessible();
		field.setAccessible(true);
		try {
			result = field.get(object);
		} catch (IllegalAccessException e) {
			logger.info(e.getMessage());
		}
		field.setAccessible(accessible);
		return result;
	}

	/**
	 * <p>
	 * 暴力设置对象变量值,忽略private,protected修饰符的限制.
	 * </p>
	 * 
	 * @throws NoSuchFieldException
	 *             如果没有该Field时抛出.
	 */
	public static void forceSetProperty(Object object, String propertyName,
			Object newValue) throws NoSuchFieldException {
		Assert.notNull(object);
		Assert.hasText(propertyName);

		try {
			BeanUtilsBean.getInstance().getPropertyUtils().setProperty(object,
					propertyName, newValue);
			return;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}

		Field field = getDeclaredField(object, propertyName);
		boolean accessible = field.isAccessible();
		field.setAccessible(true);
		try {
			field.set(object, newValue);
		} catch (IllegalAccessException e) {
			logger.info("Error won't happen");
		}
		field.setAccessible(accessible);
	}

	/**
	 * <p>
	 * 暴力调用对象函数,忽略private,protected修饰符的限制.
	 * </p>
	 * 
	 * @throws NoSuchMethodException
	 *             如果没有该Method时抛出.
	 */
	public static Object invokePrivateMethod(Object object, String methodName,
			Object... params) throws NoSuchMethodException {
		Assert.notNull(object);
		Assert.hasText(methodName);
		Class[] types = new Class[params.length];
		for (int i = 0; i < params.length; i++) {
			types[i] = params[i].getClass();
		}

		Class clazz = object.getClass();
		Method method = null;
		for (Class superClass = clazz; superClass != Object.class; superClass = superClass
				.getSuperclass()) {
			try {
				method = superClass.getDeclaredMethod(methodName, types);
				break;
			} catch (NoSuchMethodException e) {
				logger.error(e.getMessage(),e);
			}
		}

		if (method == null)
			throw new NoSuchMethodException("No Such Method:"
					+ clazz.getSimpleName() + methodName);

		boolean accessible = method.isAccessible();
		method.setAccessible(true);
		Object result = null;
		try {
			result = method.invoke(object, params);
		} catch (Exception e) {
			ReflectionUtils.handleReflectionException(e);
		}
		method.setAccessible(accessible);
		return result;
	}

	/**
	 * <p>
	 * 按Filed的类型取得Field列表.
	 * </p>
	 */
	public static List<Field> getFieldsByType(Object object, Class type) {
		List<Field> list = new ArrayList<Field>();
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields) {
			if (field.getType().isAssignableFrom(type)) {
				list.add(field);
			}
		}
		return list;
	}

	/**
	 * <p>
	 * 按FiledName获得Field的类型.
	 * </p>
	 */
	public static Class getPropertyType(Class type, String name)
			throws NoSuchFieldException {
		return getDeclaredField(type, name).getType();
	}

	/**
	 * <p>
	 * 获得field的getter函数名称.
	 * </p>
	 */
	public static String getGetterName(Class type, String fieldName) {
		Assert.notNull(type, "Type required");
		Assert.hasText(fieldName, "FieldName required");

		if (type.getName().equals("boolean")) {
			return "is" + StringUtils.capitalize(fieldName);
		} else {
			return "get" + StringUtils.capitalize(fieldName);
		}
	}

	/**
	 * <p>
	 * 获得field的getter函数,如果找不到该方法,返回null.
	 * </p>
	 */
	public static Method getGetterMethod(Class type, String fieldName) {
		try {
			return type.getMethod(getGetterName(type, fieldName));
		} catch (NoSuchMethodException e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	public static String getKeyValuesInMap(HashMap map){
		Set set = map.entrySet();
		Iterator it = set.iterator();
		StringBuffer sb = new StringBuffer("\n below are values in dto map attr");
		while (it.hasNext()) {
			Map.Entry en = (Map.Entry) it.next();
			sb.append("\n" +en.getKey()+"==" +en.getValue());
		}
		sb.append("\n");
		return sb.toString();
	}
	
	/**
	 * 从一个对像中拷贝出另一对像，要求Targetclasz有无参构造函数
	 * @param sourceObj
	 * @param Targetclasz
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public  <T> T newObjFromSourceObj(Object sourceObj,Class<T> Targetclasz)  {  
		Object target;
		try {
			target = Targetclasz.newInstance();
			super.copyProperties(target, sourceObj);
		} catch (InstantiationException e) {
			throw new DataBaseException(e.getMessage(),e);
		} catch (IllegalAccessException e) {
			throw new DataBaseException(e.getMessage(),e);
		} catch (InvocationTargetException e) {
			throw new DataBaseException(e.getMessage(),e);
		}
		return (T) target;
	}

}

package com.dhcc.framework.jdbc;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.util.StringUtils;

import com.dhcc.framework.hibernate.dao.CommonDao;
import com.dhcc.framework.util.CalendaUtilities;

/**
 * 对象与表字段映射
 * 
 * @author liuyg
 * 
 */
@SuppressWarnings("rawtypes")
public class ObjectRowMapper implements RowMapper {
	
	private static Log logger = LogFactory.getLog(CommonDao.class);
	
	private Class<?> objectClass;

	public ObjectRowMapper(Class<?> objectClass) {
		this.objectClass = objectClass;
	}

	/**
	 * 该方法自动将数据库字段对应到Object中相应字段 要求：字段名严格为驼峰形式 == 数据库字段名去掉下划线转为驼峰形式
	 * 
	 */
	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Object targetObject = null;
		Field[] fields = objectClass.getDeclaredFields();
		
			try {
				targetObject = objectClass.newInstance();
			} catch (InstantiationException | IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
			for (Field field : fields) {
				// 如果结果中没有改field项则跳过
				String columnName = convertFiledNameToColumnName(field.getName());
				try {
					rs.findColumn(columnName);
				} catch (Exception e) {
					continue;
				}

				// 修改相应filed的权限
				boolean accessFlag = field.isAccessible();
				if(!accessFlag){
					field.setAccessible(true);
				}
				Object value = rs.getObject(columnName);
				if(value==null){
					continue;
				}
				setFieldValue(targetObject, field,rs,columnName);

				// 恢复相应field的权限
				if(!accessFlag){
					field.setAccessible(accessFlag);
				}
			}

		return targetObject;
	}

	/**
	 * 属性名转换为列名
	 * 
	 * @param fieldName
	 *            属性名
	 * @return
	 * @author liuyg
	 */
	public static String convertFiledNameToColumnName(String fieldName) {
		StringBuffer buf = new StringBuffer();
		char[] chars = fieldName.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			Character c = chars[i];
			if (Character.isLetter(c)) {
				if (Character.isLowerCase(c)) {
					buf.append(Character.toUpperCase(c));
				} else {
					buf.append("_").append(Character.toUpperCase(c));
				}
			} else {
				buf.append(c);
			}
		}
		
		return buf.toString();
	}

	public static String convertColumnNameToFiledName(String columnName) {
		StringBuffer buf = new StringBuffer();
		int i = 0;
		while ((i = columnName.indexOf('_')) > 0) {
			buf.append(columnName.substring(0, i));
			columnName = StringUtils.capitalize(columnName.substring(i + 1));
		}
		buf.append(columnName);
		return buf.toString();
	}

	/**
	 * 根据类型对具体对象属性赋值,先调用这个方法再调用把VALUE to String后的方法是为了提高性能
	 */
	public static void setFieldValue(Object targetObj, Field field,ResultSet rs,String columnLabel) {
		
		String elemType = field.getType().toString();
		try{
			if (elemType.indexOf("char") != -1
					|| elemType.indexOf("Character") != -1) {
					field.set(targetObj, rs.getString(columnLabel));
			} else if (elemType.indexOf("double") != -1
					|| elemType.indexOf("Double") != -1) {
				field.set(targetObj, rs.getDouble(columnLabel));
			} else if (elemType.indexOf("float") != -1
					|| elemType.indexOf("Float") != -1) {
				field.set(targetObj, rs.getFloat(columnLabel));
			} else if (elemType.indexOf("int") != -1
					|| elemType.indexOf("Integer") != -1) {
				field.set(targetObj, rs.getInt(columnLabel));
			} else if (elemType.indexOf("long") != -1
					|| elemType.indexOf("Long") != -1) {
				field.set(targetObj, rs.getLong(columnLabel));
			} else if (elemType.indexOf("BigDecimal") != -1) {
				field.set(targetObj, rs.getBigDecimal(columnLabel));
			} else if (elemType.indexOf("Date") != -1) {
				field.set(targetObj, rs.getDate(columnLabel));
			} else if (elemType.indexOf("short") != -1
					|| elemType.indexOf("Short") != -1) {
				field.set(targetObj, rs.getShort(columnLabel));
			} else if (elemType.indexOf("boolean") != -1
					|| elemType.indexOf("Boolean") != -1) {
				field.set(targetObj,rs.getBoolean(columnLabel));		
			} else if (elemType.indexOf("byte") != -1
					|| elemType.indexOf("Byte") != -1) {
					field.set(targetObj, rs.getByte(columnLabel));
			}else if (elemType.indexOf("timestamp") != -1
					|| elemType.indexOf("Timestamp") != -1) {
					field.set(targetObj, rs.getTimestamp(columnLabel));
			} else {
				
				setFieldValue(targetObj,field,rs.getString(columnLabel));

			}
		}catch (IllegalArgumentException e) {
			logger.error(e.getMessage(), e);
		} catch (IllegalAccessException e) {
			logger.error(e.getMessage(), e);
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
		}

	}
	
	/**
	 * 根据类型对具体对象属性赋值
	 */
	public static void setFieldValue(Object targetObj, Field field, String value) {

		String elemType = field.getType().toString();

		if (elemType.indexOf("char") != -1 || elemType.indexOf("Character") != -1) {
			try {
				field.set(targetObj, Character.valueOf(value.charAt(0)));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else if (elemType.indexOf("double") != -1 || elemType.indexOf("Double") != -1) {
			try {
				field.set(targetObj, Double.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else if (elemType.indexOf("float") != -1 || elemType.indexOf("Float") != -1) {
			try {
				field.set(targetObj, Float.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else if (elemType.indexOf("int") != -1 || elemType.indexOf("Integer") != -1) {
			try {
				field.set(targetObj, Integer.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else if (elemType.indexOf("long") != -1 || elemType.indexOf("Long") != -1) {
			try {
				field.set(targetObj, Long.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		}  else if (elemType.indexOf("Date") != -1) {
			try {
				if (null != value) {
					if (value.matches("^\\d{4}-\\d{2}-\\d{2}$")) {
						field.set(targetObj, CalendaUtilities.strToDate(value, CalendaUtilities.shortDate));
					} else if (value.matches("^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$")) {
						field.set(targetObj, CalendaUtilities.strToDate(value, CalendaUtilities.longDate));
					} else if (value.matches("^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}.\\d+$")) {
						field.set(targetObj, CalendaUtilities.strToDate(value, CalendaUtilities.longDate));
					} else {
						field.set(targetObj, CalendaUtilities.strToDate(value, CalendaUtilities.longDate));
					}
				}
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		}else if (elemType.indexOf("short") != -1 || elemType.indexOf("Short") != -1) {
			try {
				field.set(targetObj, Short.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		}else if (elemType.indexOf("boolean") != -1 || elemType.indexOf("Boolean") != -1) {
			try {
				field.set(targetObj, Boolean.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else if (elemType.indexOf("byte") != -1 || elemType.indexOf("Byte") != -1) {
			try {
				field.set(targetObj, Byte.valueOf(value));
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
		} else {
			try {
				field.set(targetObj, (Object) value);
			} catch (IllegalAccessException |IllegalArgumentException e) {
				logger.error(e.getMessage(), e);
			}
		}
	}
}
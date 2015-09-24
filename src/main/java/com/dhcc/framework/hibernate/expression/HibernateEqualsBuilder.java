package com.dhcc.framework.hibernate.expression;

import com.dhcc.framework.util.DhccBeanUtils;

/**
 * @author liuyg
 * 
 */
public class HibernateEqualsBuilder {

	public static boolean reflectionEquals(Object obj, Object target,
			String keyfield) {
		if (target == null || obj == null)
			return false;
		if (target.getClass().equals(obj.getClass())) {
			try {
				Object objId = DhccBeanUtils.forceGetProperty(obj, keyfield);
				Object targetId = DhccBeanUtils.forceGetProperty(target, keyfield);
				if (objId.equals(targetId))
					return true;
			} catch (Exception e) {
			}
		}
		return false;
	}

}

package com.dhcc.framework.hibernate.expression;

import java.io.Serializable;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 * @author liuyg
 * 
 */
@SuppressWarnings("serial")
public class NotNullExpression implements Serializable, HibernateExpression {

	String propertyName;

	public NotNullExpression(String propertyName) {
		this.propertyName = propertyName;
	}

	public Criterion createCriteria() {
		return Restrictions.isNotNull(propertyName);
	}

}

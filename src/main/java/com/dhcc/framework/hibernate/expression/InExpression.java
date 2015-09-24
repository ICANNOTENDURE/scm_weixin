
package com.dhcc.framework.hibernate.expression;

import java.io.Serializable;
import java.util.Collection;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 * <p>属性值集合之一</p>
 * @author liuyg
 *
 */
@SuppressWarnings("serial")
public class InExpression implements Serializable, HibernateExpression {

	Object[] values;
	String propertyName;
	public InExpression(String propertyName,Object[] values)
	{
		this.propertyName = propertyName;
		this.values = values;
	}
	public InExpression(String propertyName,Collection values)
	{
		this.propertyName = propertyName;
		this.values = values.toArray();
	}
	public Criterion createCriteria() {
		
		return Restrictions.in(propertyName,values);
	}

}

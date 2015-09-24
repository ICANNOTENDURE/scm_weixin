
package com.dhcc.framework.hibernate.expression;

import org.hibernate.criterion.Criterion;

/**
 * @author liuyg
 *
 */
public interface HibernateExpression {
	public Criterion createCriteria();
}

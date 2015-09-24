package com.dhcc.framework.hibernate.expression;

import java.io.Serializable;

import org.hibernate.criterion.Criterion;

/**
 * @author liuyg
 * 
 */
@SuppressWarnings("serial")
public class HibernateLogicalExpression extends
		org.hibernate.criterion.LogicalExpression implements
		HibernateExpression, Serializable {

	public HibernateLogicalExpression(HibernateExpression lhs, HibernateExpression rhs,
			LogicalType type) {
		super(lhs.createCriteria(), rhs.createCriteria(), type.getValue());
	}

	public Criterion createCriteria() {
		return this;
	}

}

package com.dhcc.framework.hibernate.expression;

import java.io.Serializable;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.SimpleExpression;

/**
 * <p>
 * 比较表达式
 * </p>
 * 
 * @author liuyg
 * 
 */
@SuppressWarnings("serial")
public class CompareExpression extends SimpleExpression implements
		Serializable, HibernateExpression {

	String propertyName;
	Object value;
	CompareType compareType;

	/**
	 * <p>
	 * 构造比较表达式
	 * </p>
	 * 
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            比较值
	 * @param compareType
	 *            比较类型
	 */
	public CompareExpression(String propertyName, Object value,
			CompareType compareType) {
		super(propertyName, value, compareType.getValue());
		this.propertyName = propertyName;
		this.value = value;
		this.compareType = compareType;
	}

	public Criterion createCriteria() {
		if (value == null)
			return null;
		return this;
	}

}

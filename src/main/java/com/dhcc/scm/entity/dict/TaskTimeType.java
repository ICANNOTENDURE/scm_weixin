package com.dhcc.scm.entity.dict;


import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "t_dict")
@DiscriminatorValue("taskTimeType")
public class TaskTimeType extends Dictionary{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}

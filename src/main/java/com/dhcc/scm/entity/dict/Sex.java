package com.dhcc.scm.entity.dict;


import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "t_dict")
@DiscriminatorValue("sex")
public class Sex extends Dictionary{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}

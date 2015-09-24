package com.dhcc.scm.entity.dict;


import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "t_dict")
@DiscriminatorValue("systemType")
public class SystemType extends Dictionary{

}

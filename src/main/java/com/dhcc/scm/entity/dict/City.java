/**
 * 
 */
package com.dhcc.scm.entity.dict;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author zhouxin
 *
 */
@Entity
@Table(name = "t_dict")
@DiscriminatorValue("city")
public class City extends Dictionary{

}

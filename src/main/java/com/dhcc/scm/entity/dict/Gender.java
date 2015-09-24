package com.dhcc.scm.entity.dict;


import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * <p>标题: Gender.java</p>
 * <p>业务描述:基层医疗卫生开发平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author daichao
 * @date 2014年2月26日
 * @version V1.0 
 */
@Entity
@Table(name = "t_dict")
@DiscriminatorValue("gender")
public class Gender extends Dictionary{

}

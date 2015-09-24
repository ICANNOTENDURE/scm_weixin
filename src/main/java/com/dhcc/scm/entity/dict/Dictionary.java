package com.dhcc.scm.entity.dict;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.dhcc.framework.common.entity.BaseDictionary;

/**
 * <p>标题: Dictionary.java</p>
 * <p>业务描述:统一运维及安全管理平台  字典表</p>
 * <p>公司:东华软件股份公司</p>
 * @version V1.0 
 */
@Entity
@Table(name = "T_SYS_DICT")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
	name = "DIC_TYPE",
	discriminatorType = DiscriminatorType.STRING
)
@DiscriminatorValue(value = "all")
public class Dictionary extends BaseDictionary implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : TODO 
	*/
	private static final long serialVersionUID = 1L;
	
	private Integer dictId;
	private String desc;
	private String value;
	
	public Dictionary() {
	
	}
	
	public Dictionary(Integer dictId) {
		this.dictId = dictId;
	}
	
	public Dictionary(Integer dictId, String desc, String value) {
		this.dictId = dictId;
		this.desc = desc;
		this.value = value;
	}
	
	/**  
	 * @return dictId 
	 */
	@Id
	@GenericGenerator(name="idGenerator",strategy="sequence",
	parameters={@Parameter(name="sequence",value="Seq_SysDic")})
	@GeneratedValue(generator="idGenerator")
	@Column(name = "DIC_ID", unique=true, nullable=false, length=32)
	public Integer getDictId() {
		return dictId;
	}

	/**  
	 * @param dictId dictId 
	 */
	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}

	/**  
	 * @return desc 
	 */
	@Column(name = "DIC_NAME", length = 100)
	public String getDesc() {
		return desc;
	}

	/**  
	 * @param desc desc 
	 */
	public void setDesc(String desc) {
		this.desc = desc;
	}

	/**  
	 * @return value 
	 */
	@Column(name = "DIC_VALUE", length = 100)
	public String getValue() {
		return value;
	}

	/**  
	 * @param value value 
	 */
	public void setValue(String value) {
		this.value = value;
	}

}

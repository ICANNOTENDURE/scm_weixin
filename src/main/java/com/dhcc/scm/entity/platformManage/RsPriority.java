package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

/**
 * <p>标题: RsPriority.java</p>
 * <p>业务描述:统一运维及安全管理平台  接收服务器优先级信息实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Entity
@Table(name="T_RS_PRIORITY", schema="PMS")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","gateways"})
public class RsPriority implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="PRIORITY_ID", unique=true, nullable=false, length=32)
	private String priorityId;

	@Column(name="PRIORITY_CODE", length=16)
	private String priorityCode;
	
	@Column(name="USE_STATE", length=16)
	private String useState;
	
	@JsonIgnore
	@ManyToMany(
		cascade={CascadeType.PERSIST, CascadeType.MERGE},
		mappedBy="rsPriorities",
		fetch = FetchType.LAZY,
		targetEntity = com.dhcc.scm.entity.platformManage.Gateway.class
	)
	private List<Gateway> gateways;

	public RsPriority() {
	}

	/**  
	 * @return priorityId 
	 */
	public String getPriorityId() {
		return priorityId;
	}

	/**  
	 * @param priorityId priorityId 
	 */
	public void setPriorityId(String priorityId) {
		this.priorityId = priorityId;
	}

	/**  
	 * @return priorityCode 
	 */
	public String getPriorityCode() {
		return priorityCode;
	}

	/**  
	 * @param priorityCode priorityCode 
	 */
	public void setPriorityCode(String priorityCode) {
		this.priorityCode = priorityCode;
	}

	/**  
	 * @return useState 
	 */
	public String getUseState() {
		return useState;
	}

	/**  
	 * @param useState useState 
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

	/**  
	 * @return gateways 
	 */
	@JsonIgnore
	public List<Gateway> getGateways() {
		return gateways;
	}

	/**  
	 * @param gateways gateways 
	 */
	@JsonIgnore
	public void setGateways(List<Gateway> gateways) {
		this.gateways = gateways;
	}

}


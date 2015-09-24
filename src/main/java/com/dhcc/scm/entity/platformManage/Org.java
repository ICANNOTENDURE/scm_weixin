package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

/**
 * <p>标题: Org.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构管理实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Entity
@Table(name="T_ORG", schema="PMS")
public class Org implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="ORG_ID", unique=true, nullable=false, length=32)
	private String orgId;
	
	@Column(name="ADDR_CITY", length=64)
	private String addrCity;
	
	@Column(name="ADDR_COUNTY", length=64)
	private String addrCounty;
	
	@Column(name="ADDR_DISTRICTS_CODE", length=64)
	private String addrDistrictsCode;
	
	@Column(name="ADDR_HOUSE_NUMBER", length=64)
	private String addrHouseNumber;
	
	@Column(name="ADDR_STATE", length=64)
	private String addrState;
	
	@Column(name="ADDR_STREET", length=64)
	private String addrStreet;
	
	@Column(name="ADDR_TOWN", length=64)
	private String addrTown;

	@Column(name="ORG_CENTER_ID", length=32)
	private String orgCenterId;
	
	@Column(name="ORG_CODE", length=64)
	private String orgCode;

	@Column(name="ORG_NAME", length=64)
	private String orgName;

	@Column(name="USE_STATE", length=16)
	private String useState;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="GATEWAY_ID")
	private Gateway gateway;
	
	public Org() {
	}

	/**  
	 * @return orgId 
	 */
	public String getOrgId() {
		return orgId;
	}

	/**  
	 * @param orgId orgId 
	 */
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	/**  
	 * @return addrCity 
	 */
	public String getAddrCity() {
		return addrCity;
	}

	/**  
	 * @param addrCity addrCity 
	 */
	public void setAddrCity(String addrCity) {
		this.addrCity = addrCity;
	}

	/**  
	 * @return addrCounty 
	 */
	public String getAddrCounty() {
		return addrCounty;
	}

	/**  
	 * @param addrCounty addrCounty 
	 */
	public void setAddrCounty(String addrCounty) {
		this.addrCounty = addrCounty;
	}

	/**  
	 * @return addrDistrictsCode 
	 */
	public String getAddrDistrictsCode() {
		return addrDistrictsCode;
	}

	/**  
	 * @param addrDistrictsCode addrDistrictsCode 
	 */
	public void setAddrDistrictsCode(String addrDistrictsCode) {
		this.addrDistrictsCode = addrDistrictsCode;
	}

	/**  
	 * @return addrHouseNumber 
	 */
	public String getAddrHouseNumber() {
		return addrHouseNumber;
	}

	/**  
	 * @param addrHouseNumber addrHouseNumber 
	 */
	public void setAddrHouseNumber(String addrHouseNumber) {
		this.addrHouseNumber = addrHouseNumber;
	}

	/**  
	 * @return addrState 
	 */
	public String getAddrState() {
		return addrState;
	}

	/**  
	 * @param addrState addrState 
	 */
	public void setAddrState(String addrState) {
		this.addrState = addrState;
	}

	/**  
	 * @return addrStreet 
	 */
	public String getAddrStreet() {
		return addrStreet;
	}

	/**  
	 * @param addrStreet addrStreet 
	 */
	public void setAddrStreet(String addrStreet) {
		this.addrStreet = addrStreet;
	}

	/**  
	 * @return addrTown 
	 */
	public String getAddrTown() {
		return addrTown;
	}

	/**  
	 * @param addrTown addrTown 
	 */
	public void setAddrTown(String addrTown) {
		this.addrTown = addrTown;
	}

	/**  
	 * @return orgCenterId 
	 */
	public String getOrgCenterId() {
		return orgCenterId;
	}

	/**  
	 * @param orgCenterId orgCenterId 
	 */
	public void setOrgCenterId(String orgCenterId) {
		this.orgCenterId = orgCenterId;
	}

	/**  
	 * @return orgCode 
	 */
	public String getOrgCode() {
		return orgCode;
	}

	/**  
	 * @param orgCode orgCode 
	 */
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	/**  
	 * @return orgName 
	 */
	public String getOrgName() {
		return orgName;
	}

	/**  
	 * @param orgName orgName 
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
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

	@JsonIgnore
	public Gateway getGateway() {
		return gateway;
	}

	/**  
	 * @param gateway gateway 
	 */
	@JsonIgnore
	public void setGateway(Gateway gateway) {
		this.gateway = gateway;
	}

}
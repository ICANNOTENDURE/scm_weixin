package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.GeneratedValue;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import org.hibernate.annotations.GenericGenerator;

import java.util.Date;
import java.util.List;

/**
 * <p>标题: Gateway.java</p>
 * <p>业务描述:统一运维及安全管理平台  应用系统安装配置信息实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@Entity
@Table(name="T_GATEWAY")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","orgs","rsPriorities"})
public class Gateway implements Serializable {
	
	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="GATEWAY_ID", unique=true, nullable=false, length=32)
	private String gatewayId;
	
	@Column(name="ONLINE_STATE", length=16)
	private String onlineState;

	@Column(name="PASSWORD", length=32)
	private String password;
	
	@Column(name="PORT", length=16)
	private String port;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="REG_TIME")
	private Date regTime;
	
	@Column(name="SERVER_ID", length=32)
	private String serverId;
	
	@Column(name="SYSTEM_TYPE", length=16)
	private String systemType;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATE_TIME")
	private Date updateTime;

	@Column(name="USE_STATE", length=16)
	private String useState;

	@Column(name="VERSION", length=64)
	private String version;
	
//	@JsonIgnore
//	@ManyToOne
//	@JoinColumn(name = "SERVER_ID")
//	private Server server;
	
	@OneToMany(mappedBy = "gateway")
	private List<Org> orgs;
	
	@JsonIgnore
	@OneToOne(targetEntity=Cert.class)
	@JoinColumn(name = "CERT_ID")
	private Cert cert;

	@ManyToMany(
		cascade={CascadeType.PERSIST, CascadeType.MERGE},
		fetch = FetchType.LAZY,
		targetEntity = com.dhcc.scm.entity.platformManage.RsPriority.class
	)
	@JoinTable(
		name="T_RS_CONFIG",
		joinColumns={@JoinColumn(name="GATEWAY_ID")},
		inverseJoinColumns={@JoinColumn(name="RS_PRIORITY_ID")}
	)
	private List<RsPriority> rsPriorities;
	
	public Gateway() {
	}
	
	/**  
	 * @return gatewayId 
	 */
	public String getGatewayId() {
		return gatewayId;
	}

	/**  
	 * @param gatewayId gatewayId 
	 */
	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	/**  
	 * @return onlineState 
	 */
	public String getOnlineState() {
		return onlineState;
	}

	/**  
	 * @param onlineState onlineState 
	 */
	public void setOnlineState(String onlineState) {
		this.onlineState = onlineState;
	}

	/**  
	 * @return password 
	 */
	public String getPassword() {
		return password;
	}

	/**  
	 * @param password password 
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**  
	 * @return port 
	 */
	public String getPort() {
		return port;
	}

	/**  
	 * @param port port 
	 */
	public void setPort(String port) {
		this.port = port;
	}

	/**  
	 * @return regTime 
	 */
	public Date getRegTime() {
		return regTime;
	}

	/**  
	 * @param regTime regTime 
	 */
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	/**  
	 * @return serverId 
	 */
	public String getServerId() {
		return serverId;
	}

	/**  
	 * @param serverId serverId 
	 */
	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	/**  
	 * @return systemType 
	 */
	public String getSystemType() {
		return systemType;
	}

	/**  
	 * @param systemType systemType 
	 */
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}

	/**  
	 * @return updateTime 
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**  
	 * @param updateTime updateTime 
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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
	 * @return version 
	 */
	public String getVersion() {
		return version;
	}

	/**  
	 * @param version version 
	 */
	public void setVersion(String version) {
		this.version = version;
	}

//	/**  
//	 * @return server 
//	 */
//	@JsonIgnore
//	public Server getServer() {
//		return server;
//	}
//
//	/**  
//	 * @param server server 
//	 */
//	@JsonIgnore
//	public void setServer(Server server) {
//		this.server = server;
//	}

	/**  
	 * @return orgs 
	 */
	public List<Org> getOrgs() {
		return orgs;
	}

	/**  
	 * @param orgs orgs 
	 */
	public void setOrgs(List<Org> orgs) {
		this.orgs = orgs;
	}

	/**  
	 * @return cert 
	 */
	@JsonIgnore
	public Cert getCert() {
		return cert;
	}

	/**  
	 * @param cert cert 
	 */
	@JsonIgnore
	public void setCert(Cert cert) {
		this.cert = cert;
	}

	/**  
	 * @return rsPriorities 
	 */
	public List<RsPriority> getRsPriorities() {
		return rsPriorities;
	}

	/**  
	 * @param rsPriorities rsPriorities 
	 */
	public void setRsPriorities(List<RsPriority> rsPriorities) {
		this.rsPriorities = rsPriorities;
	}

}

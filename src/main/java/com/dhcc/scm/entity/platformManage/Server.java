package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import org.hibernate.annotations.GenericGenerator;


/**
 * <p>标题: Server.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器信息实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月13日
 * @version V1.0 
 */
@Entity
@Table(name="T_SERVER", schema="PMS")
@JsonIgnoreProperties(value={"hibernateLazyInitializer"})
public class Server implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="SERVER_ID", unique=true, nullable=false,  length=32)
	private String serverId;
	
	@Column(name="ONLINE_STATE", length=16)
	private String onlineState;

	@Column(name="PASSWORD", length=64)
	private String password;

	@Column(name="PORT", length=16)
	private String port;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="REG_TIME")
	private Date regTime;

	@Column(name="SERVER_NAME", length=64)
	private String serverName;
	
	@Column(name="SERVER_TYPE", length=16)
	private String serverType;

	@Column(name="USER_NAME", length=64)
	private String userName;
	
	@OneToMany(targetEntity=Gateway.class, cascade={CascadeType.ALL})
	@JoinColumn(name = "GATEWAY_ID")
	private Set<Gateway> gateways;
	
//	@OneToMany(targetEntity=ServerIp.class, cascade={CascadeType.ALL})
//	@JoinColumn(name = "IP_ID")
//	private Set<ServerIp> serverIps;
	@OneToMany(mappedBy="server")
	private Set<ServerIp> serverIps;
	
//	@JsonIgnore
//	@ManyToOne
//	@JoinColumn(name = "STATISTIC_ID")
//	private Flow flow;
//	
//	@JsonIgnore
//	@ManyToOne
//	@JoinColumn(name = "mon_id")
//	private SysMon sysMon;
//	
//	@JsonIgnore
//	@ManyToOne
//	@JoinColumn(name = "statistics_id")
//	private MonStatistic monStatistic;

	public Server() {
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
	 * @return serverName 
	 */
	public String getServerName() {
		return serverName;
	}

	/**  
	 * @param serverName serverName 
	 */
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	/**  
	 * @return serverType 
	 */
	public String getServerType() {
		return serverType;
	}

	/**  
	 * @param serverType serverType 
	 */
	public void setServerType(String serverType) {
		this.serverType = serverType;
	}

	/**  
	 * @return userName 
	 */
	public String getUserName() {
		return userName;
	}

	/**  
	 * @param userName userName 
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**  
	 * @return gateways 
	 */
	public Set<Gateway> getGateways() {
		return gateways;
	}

	/**  
	 * @param gateways gateways 
	 */
	public void setGateways(Set<Gateway> gateways) {
		this.gateways = gateways;
	}

	/**  
	 * @return serverIps 
	 */
	public Set<ServerIp> getServerIps() {
		return serverIps;
	}

	/**  
	 * @param serverIps serverIps 
	 */
	public void setServerIps(Set<ServerIp> serverIps) {
		this.serverIps = serverIps;
	}

//	/**  
//	 * @return flow 
//	 */
//	@JsonIgnore
//	public Flow getFlow() {
//		return flow;
//	}
//
//	/**  
//	 * @param flow flow 
//	 */
//	@JsonIgnore
//	public void setFlow(Flow flow) {
//		this.flow = flow;
//	}
//
//	/**  
//	 * @return sysMon 
//	 */
//	@JsonIgnore
//	public SysMon getSysMon() {
//		return sysMon;
//	}
//
//	/**  
//	 * @param sysMon sysMon 
//	 */
//	@JsonIgnore
//	public void setSysMon(SysMon sysMon) {
//		this.sysMon = sysMon;
//	}
//
//	/**  
//	 * @return monStatistic 
//	 */
//	@JsonIgnore
//	public MonStatistic getMonStatistic() {
//		return monStatistic;
//	}
//
//	/**  
//	 * @param monStatistic monStatistic 
//	 */
//	@JsonIgnore
//	public void setMonStatistic(MonStatistic monStatistic) {
//		this.monStatistic = monStatistic;
//	}

}

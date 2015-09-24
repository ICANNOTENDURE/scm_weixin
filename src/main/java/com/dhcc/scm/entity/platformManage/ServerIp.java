package com.dhcc.scm.entity.platformManage;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * <p>标题: ServerIp.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器IP地址实体类</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年11月4日
 * @version V1.0 
 */
@Entity
@Table(name="T_SERVER_IP", schema="PMS")
public class ServerIp implements Serializable {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="idGenerator", strategy="uuid")
	@GeneratedValue(generator="idGenerator")
	@Column(name="IP_ID", unique=true, nullable=false, length=32)
	private String ipId;
	
	@Column(name="IP", length=24)
	private String ip;
	
	@Column(name="IP_TYPE", length=16)
	private String ipType;
	
	@Column(name="USE_STATE", length=16)
	private String useState;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "SERVER_ID")
	private Server server;

	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public ServerIp() {
		// TODO Auto-generated constructor stub
	}

	/**  
	 * @return ipId 
	 */
	public String getIpId() {
		return ipId;
	}

	/**  
	 * @param ipId ipId 
	 */
	public void setIpId(String ipId) {
		this.ipId = ipId;
	}

	/**  
	 * @return ip 
	 */
	public String getIp() {
		return ip;
	}

	/**  
	 * @param ip ip 
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}

	/**  
	 * @return ipType 
	 */
	public String getIpType() {
		return ipType;
	}

	/**  
	 * @param ipType ipType 
	 */
	public void setIpType(String ipType) {
		this.ipType = ipType;
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
	 * @return server 
	 */
	@JsonIgnore
	public Server getServer() {
		return server;
	}

	/**  
	 * @param server server 
	 */
	@JsonIgnore
	public void setServer(Server server) {
		this.server = server;
	}
	
}

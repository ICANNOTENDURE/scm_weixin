package com.dhcc.scm.dto.platformManage;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.Cert;
import com.dhcc.scm.entity.platformManage.Gateway;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.vo.platformManage.GatewayVo;

/**
 * <p>标题: GatewayDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  网关信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月31日
 * @version V1.0 
 */
/**
* <p>标题: GatewayDto.java</p>
* <p>业务描述:统一运维及安全管理平台</p>
* <p>公司:东华软件股份公司</p>
* <p>版权:dhcc2013</p>
* @author 李飞
* @date 2013年10月30日
* @version V1.0 
*/
@XmlRootElement
public class GatewayDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Gateway gateway;
	private Server server;
	private Cert cert;
	
	/**  
	* 字段:      字段名称
	* @Fields gatewayVo : 应用系统安装配置信息多表连接分页查询列表数据
	*/
	private GatewayVo gatewayVo;
	
	/**  
	* 字段:      字段名称
	* @Fields regTimeS : 查询应用系统配置信息注册时间范围的起始时刻
	*/
	private Date regTimeS;
	
	/**  
	* 字段:      字段名称
	* @Fields regTimeE : 查询应用系统配置信息注册时间范围的终止时刻
	*/
	private Date regTimeE;
	
	/**  
	* 字段:      字段名称
	* @Fields updateTimeS : 查询应用系统配置信息更新时间范围的起始时刻
	*/
	private Date updateTimeS;
	
	/**  
	* 字段:      字段名称
	* @Fields updateTimeE : 查询应用系统配置信息更新时间范围的终止时刻
	*/
	private Date updateTimeE;
	
	private String columnName = "";
	private String columnValue = "";
	/**  
	 * @return gateway 
	 */
	public Gateway getGateway() {
		return gateway;
	}

	/**  
	 * @param gateway gateway 
	 */
	public void setGateway(Gateway gateway) {
		this.gateway = gateway;
	}

	/**  
	 * @return server 
	 */
	public Server getServer() {
		return server;
	}

	/**  
	 * @param server server 
	 */
	public void setServer(Server server) {
		this.server = server;
	}

	/**  
	 * @return cert 
	 */
	public Cert getCert() {
		return cert;
	}

	/**  
	 * @param cert cert 
	 */
	public void setCert(Cert cert) {
		this.cert = cert;
	}

	/**  
	 * @return gatewayVo 
	 */
	public GatewayVo getGatewayVo() {
		return gatewayVo;
	}

	/**  
	 * @param gatewayVo gatewayVo 
	 */
	public void setGatewayVo(GatewayVo gatewayVo) {
		this.gatewayVo = gatewayVo;
	}

	/**  
	 * @return regTimeS 
	 */
	public Date getRegTimeS() {
		return regTimeS;
	}

	/**  
	 * @param regTimeS regTimeS 
	 */
	public void setRegTimeS(Date regTimeS) {
		this.regTimeS = regTimeS;
	}

	/**  
	 * @return regTimeE 
	 */
	public Date getRegTimeE() {
		return regTimeE;
	}

	/**  
	 * @param regTimeE regTimeE 
	 */
	public void setRegTimeE(Date regTimeE) {
		this.regTimeE = regTimeE;
	}

	/**  
	 * @return updateTimeS 
	 */
	public Date getUpdateTimeS() {
		return updateTimeS;
	}

	/**  
	 * @param updateTimeS updateTimeS 
	 */
	public void setUpdateTimeS(Date updateTimeS) {
		this.updateTimeS = updateTimeS;
	}

	/**  
	 * @return updateTimeE 
	 */
	public Date getUpdateTimeE() {
		return updateTimeE;
	}

	/**  
	 * @param updateTimeE updateTimeE 
	 */
	public void setUpdateTimeE(Date updateTimeE) {
		this.updateTimeE = updateTimeE;
	}

	/**  
	 * @return columnName 
	 */
	public String getColumnName() {
		return columnName;
	}

	/**  
	 * @param columnName columnName 
	 */
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	/**  
	 * @return columnValue 
	 */
	public String getColumnValue() {
		return columnValue;
	}

	/**  
	 * @param columnValue columnValue 
	 */
	public void setColumnValue(String columnValue) {
		this.columnValue = columnValue;
	}
	
}

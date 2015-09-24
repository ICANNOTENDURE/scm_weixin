package com.dhcc.scm.dto.platformManage;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.scm.entity.platformManage.Org;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.vo.platformManage.OrgVo;

/**
 * <p>标题: OrgDto.java</p>
 * <p>业务描述:统一运维及安全管理平台  机构信息传输对象Dto</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年8月29日
 * @version V1.0 
 */
@XmlRootElement
public class OrgDto extends BaseDto {

	/**  
	* 字段:      字段名称
	* @Fields serialVersionUID : 序列化id
	*/
	private static final long serialVersionUID = 1L;
	
	private Org org;
	private Server server;
	
	/**  
	* 字段:      字段名称
	* @Fields orgVo : 机构信息多表连接查询列表数据 
	*/
	private OrgVo orgVo;
	
	private List<OrgVo> orgVos;
	
	/**  
	 * @return org 
	 */
	public Org getOrg() {
		return org;
	}
	
	/**  
	 * @param org org 
	 */
	public void setOrg(Org org) {
		this.org = org;
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
	 * @return orgVo 
	 */
	public OrgVo getOrgVo() {
		return orgVo;
	}

	/**  
	 * @param orgVo orgVo 
	 */
	public void setOrgVo(OrgVo orgVo) {
		this.orgVo = orgVo;
	}

	/**  
	 * @return orgVos 
	 */
	public List<OrgVo> getOrgVos() {
		return orgVos;
	}

	/**  
	 * @param orgVos orgVos 
	 */
	public void setOrgVos(List<OrgVo> orgVos) {
		this.orgVos = orgVos;
	}
	
}

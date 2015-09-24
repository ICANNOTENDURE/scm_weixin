package com.dhcc.scm.blh.platformManage;

import java.security.KeyPair;
import java.security.PublicKey;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.platformManage.ServerDto;
import com.dhcc.scm.dto.platformManage.SystemVersionDto;
import com.dhcc.scm.entity.platformManage.Server;
import com.dhcc.scm.entity.platformManage.SystemVersion;
import com.dhcc.scm.service.platformManage.CertService;
import com.dhcc.scm.service.platformManage.ServerService;
import com.dhcc.scm.tool.cert.Cert;
import com.dhcc.scm.tool.datetime.OperTime;
import com.dhcc.scm.tool.security.RSACoder;

/**
 * <p>标题: ServerBlh.java</p>
 * <p>业务描述:统一运维及安全管理平台  服务器管理业务逻辑实现</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 李飞
 * @date 2013年9月16日
 * @version V1.0 
 */
@Component
public class ServerBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(ServerBlh.class);
	
	@Resource
	ServerService serverService;
	
	@Resource
	CertService certService;
	
	@Resource
	CommonService commonService;
	
	/**  
	* <p>Title: </p> 
	* <p>Description: </p>  
	*/
	public ServerBlh() {
		logger.info("==== new ServerBlh====");
	}
	
	/** 
	* 方法名:          saveOrUpdate
	* 方法功能描述:    保存或者修改服务器信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午5:02:41
	*/
	public void saveOrUpdate(BusinessRequest res) {
		Server server = (super.getDto(ServerDto.class, res)).getServer();
		if ("".equals(server.getServerId())) {
			server.setServerId(null);
		}
		serverService.saveOrUpdate(server);
	}
	
	/** 
	* 方法名:          delServer
	* 方法功能描述:    删除服务器信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月16日 下午5:06:00
	*/
	public void delServer(BusinessRequest res) {
		Server server = (super.getDto(ServerDto.class, res)).getServer();
		
		serverService.delServer(server);
	}
	
	/** 
	* 方法名:          findServerById
	* 方法功能描述:    根据不同类型服务器信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月29日 下午2:52:12
	*/
	public void getServerGraph(BusinessRequest res) {
		ServerDto serverDto = super.getDto(ServerDto.class, res);

		serverService.findServerGraph(serverDto);
		
		Map<String, String> map = new HashMap<String, String>(2);
		map.put("onlineState", "online_state");
		map.put("serverType", "server_type");
		commonService.dictionaryConvert(serverDto.getServerVos(), map);
	}
	
	/** 
	* 方法名:          serverList
	* 方法功能描述:    分页查询服务器信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年9月24日 上午11:17:11
	*/
	public void getServerList(BusinessRequest res) {
		ServerDto serverDto = super.getDto(ServerDto.class, res);
		PagerModel pagerModel = serverDto.getPageModel();
		serverService.findServerList(serverDto);
		
		Map<String, String> map = new HashMap<String, String>(3);
		map.put("serverType", "server_type");
		map.put("onlineState", "online_state");
		map.put("ipType", "ip_type");
		commonService.dictionaryConvert(pagerModel.getPageData(), map);
		
		serverDto.setPageModel(pagerModel);
	}
	
	/** 
	* 方法名:          getSystemType
	* 方法功能描述:    获取安装包系统类型
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月15日 下午4:40:44
	*/
	public void getSystemVersion(BusinessRequest res) {
		ServerDto serverDto = super.getDto(ServerDto.class, res);
		SystemVersionDto systemVersionDto = new SystemVersionDto();
		
		List<SystemVersion> systemVersions = serverService.getSystemVersion(systemVersionDto);
		serverDto.setSystemVersions(systemVersions);
	}
	
	/** 
	* 方法名:          serverRegister
	* 方法功能描述:    新增服务器向PMS请求验证并注册信息
	* @param:         BusinessRequest
	* @return:        void
	* @Author:        李飞
	* @Create Date:   2013年11月22日 下午2:20:49
	*/
	public void serverRegister(BusinessRequest res) {
		ServerDto serverDto = super.getDto(ServerDto.class, res);
		Server server = serverDto.getServer();
		String certSerialNum = serverDto.getSerialNumber();
		String encrypt = serverDto.getEncrypt();	
		String serverId = server.getServerId();
		
		try {
			String certInfo = certService.getCert(certSerialNum).getCertInfo();
			String certKeyInfo = certService.getCert(certSerialNum).getCertKeyInfo();
			//logger.info("\n+++++++++++++++serverRegister:certInfo=++++++++++++++++++\n"+certInfo);
			
			if ((!"".equals(certInfo))&&(!"".equals(certKeyInfo))) {
				Cert cert = new Cert();
				logger.info("\n+++++++++++++++serverRegister:certInfo=++++++++++++++++++\n"+certInfo);
				X509Certificate certObj = cert.CertStrToObj(certInfo);
				KeyPair certKeyObj = cert.KeyStrToObj(certKeyInfo);
				boolean validity = false;
				
				try {
					certObj.checkValidity();
					validity = true;
				} catch (Exception e) {
					// TODO: handle exception
					// System.out.println("证书无效!");
					serverDto.setMsg("证书无效!");
				}
				if (validity) {
					// 获取公钥对象
					PublicKey pubKey = certKeyObj.getPublic();
					byte[] decrypt = RSACoder.decryptByPublicKey(encrypt , pubKey);
					String decryptStr = new String(decrypt);
					// 验证是否过期
					Date rqTime = new Date(Long.parseLong(decryptStr));
					Date vnow = new Date();
					double interval = OperTime.getIntervalTime(vnow, rqTime);
					if ((interval>=0) && (interval<=300)) {
						System.out.println("验证成功!");
						if (!"".equals(serverId)) {
							serverService.saveServer(server);
							serverService.findServerId(serverDto);
							serverId = serverDto.getServerRegisterVo().getServerId();
							System.out.println("serverId="+serverId);
							serverDto.setMsg("已生成服务器唯一标识符!");
						} else {
							serverDto.setMsg("服务器已注册!");
						}
					} else {
						//System.out.println("消息过期!");
						serverDto.setMsg("消息过期!");
					}
					System.out.println("getPublic: "+pubKey+"\n解密后的时间戳: "+decryptStr+
						"\n间隔时间: "+interval);
				} 
			} else {
				// 验证失败
				serverDto.setMsg("验证失败!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new DataBaseException(e.getMessage(), e);
		}
	}

}

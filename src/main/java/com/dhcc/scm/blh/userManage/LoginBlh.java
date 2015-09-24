package com.dhcc.scm.blh.userManage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;
import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.login.LoginDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.login.LoginVo;
import com.dhcc.scm.service.userManage.LoginService;
import com.dhcc.scm.tool.security.AESCoder;


/**
 * <p>标题: LoginBlh.java</p>
 * <p>业务描述:Kerberos登录服务Blh</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年9月23日
 * @version V1.0 
 */
@Component
@PmDataTypes({@PmDataType(methodName="getTicket",clsType=LoginVo.class)})
public class LoginBlh extends AbstractBaseBlh {

	private static Log logger = LogFactory.getLog(LoginBlh.class);
	
	@Resource
	private CommonService commonService;
	
	
	@Resource
	private LoginService loginService;
	
	public LoginBlh() {
		logger.info("====new LoginBlh====");
	}
	
	/**
	 * 
	* 方法名:          getTicket
	* 方法功能描述:    账户首次登录
	* @param:         账户登录数据传输对象
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:51:08
	 */
	public void getTicket(BusinessRequest res){
		LoginDto loginDto = super.getDto(LoginDto.class, res);
		
		LoginVo loginVo=loginDto.getLoginVo();
		String accountKey="";
		accountKey=loginService.getNormalAccountPassword(loginVo);
		if(!accountKey.equals("")){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String timestamp=df.format(new Date());
			String sessionKey=getSessionKey();
			
			// 构造身份票据	{accountId:accountId,sessionKey:sessionKey,timestamp:timestamp}
			StringBuilder identityTicket=new StringBuilder(64);
			identityTicket.append("{\"accountId\":\"").append(loginVo.getAccountId()).append("\",");
			identityTicket.append("\"sessionKey\":\"").append(sessionKey).append("\",");
			identityTicket.append("\"timestamp\":\"").append(timestamp).append("\"}");
			String pmsKey=PropertiesBean.getInstance().getProperty("confg.scmKey");	
			// 获取管理平台通信密钥
			if(!pmsKey.equals("")){

				String idTicketEncrypt = AESCoder.aesCbcEncrypt(identityTicket.toString(), pmsKey);
				loginVo.setIdTicket(idTicketEncrypt);
				
		        // 构造身份认证信息	{sessionKey:sessionKey,timestamp:timestamp}
				StringBuilder authenMsg=new StringBuilder(64);
				authenMsg.append("{\"sessionKey\":\"").append(sessionKey).append("\",");
				authenMsg.append("\"timestamp\":\"").append(timestamp).append("\"}");
				
				String authenMsgEncrypt = AESCoder.aesCbcEncrypt(authenMsg.toString(), accountKey);
				loginVo.setAuthenMsg(authenMsgEncrypt);
		
				// 获取请求访问的业务系统的通信密钥
		        String serviceKey=PropertiesBean.getInstance().getProperty("confg.serviceKey");
				if(!serviceKey.equals("")){
					// 获取此账户在请求访问的业务系统中的权限信息
					String roleFunc=loginService.getNorAccountFunc(loginVo);
					

					// 构造服务票据	{accountId:accountId,sessionKey:sessionKey,timestamp:timestamp,roleFunc:roleFunc}
					StringBuilder serviceTicket=new StringBuilder(512);
					serviceTicket.append("{\"accountId\":\"").append(loginVo.getAccountId()).append("\",");
					serviceTicket.append("\"sessionKey\":\"").append(sessionKey).append("\",");
					serviceTicket.append("\"timestamp\":\"").append(timestamp).append("\",");
					serviceTicket.append("\"roleFunc\":").append(roleFunc).append("}");

					String serviceTicketEncrypt = AESCoder.aesCbcEncrypt(serviceTicket.toString(), serviceKey);
					loginVo.setServiceTicket(serviceTicketEncrypt);
					

			        loginVo.setAccountId("");
			        loginVo.setUserType("");
			        loginVo.setLoginType("");
			        loginVo.setUserName("");
				}
			}
		}

	}
	
	/**
	 * 
	* 方法名:          Login
	* 方法功能描述:    账户登录验证
	* @param:         账户登录数据传输对象
	* @return:        账户登录数据传输对象
	* @Author:        于鸿
	* @Create Date:   2013年9月23日 下午2:32:05
	 */
	public void loginAuthen(BusinessRequest res){
		
	}
	
	/**
	 * 
	* 方法名:          logout
	* 方法功能描述:    账户退出
	* @param:         账户登录数据传输对象
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年9月23日 下午2:29:34
	 */
	public void logout(BusinessRequest res){
		
	}
	
	/**
	 * 
	* 方法名:          getSessionKey
	* 方法功能描述:    生成会话密钥
	* @param:         无
	* @return:        会话密钥;
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:37:53
	 */
	private String getSessionKey() {
		StringBuffer buffer = new StringBuffer("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
		StringBuffer sb = new StringBuffer();
		Random r = new Random();
		int range = buffer.length();
		for (int i = 0; i < 16; i ++){
			sb.append(buffer.charAt(r.nextInt(range)));
		}
		return sb.toString();
	}
	
	/**
	 * 
	 * @param res
	 */
	public void loginAndroid(BusinessRequest res) throws Exception {
		String info="";
		String ctlocName="";
		String ctlocId="";
		LoginDto loginDto = super.getDto(LoginDto.class, res);
		String userName=loginDto.getUserName();
		String passWord=loginDto.getPassword();
		String accountKey="";
		String result=loginService.getUserPassword(userName);
		Long userId=Long.parseLong(result.split("\\^")[0]);
		accountKey=result.split("\\^")[1];
		if(accountKey.equals("")){
			info="用户名输入错误";
		}else if(!accountKey.equals(passWord)){
			info="密码输入错误";
		}else if(accountKey.equals(passWord)){
			info="success";
			NormalAccount normalAccount=commonService.get(NormalAccount.class, userId);
			ctlocId=normalAccount.getNormalUser().getLocId().toString();
			HopCtloc hopCtloc=commonService.get(HopCtloc.class, normalAccount.getNormalUser().getLocId());
			ctlocName=hopCtloc.getName();
		}
		
		/**
		 * 
		if(type==1){
		    Long locIdLong=WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
			HopCtloc HopCtloc=commonService.get(HopCtloc.class, locIdLong);
			userName=userName+"(科室:"+HopCtloc.getName()+")";
		}
		if(type==2){
			Long vendorLong=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
			Vendor Vendor=commonService.get(Vendor.class, vendorLong);
			userName=userName+"(供应商"+Vendor.getName()+")";
		}
		if(type==0){
			userName=userName+"		(系统管理员)";
		}
		*/
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter()
		.write("{\"info\":"
				+ info
				+",\"userId\":"
				+userId
				+ ",\"ctlocId\":"
				+ ctlocId
				+ ",\"ctlocName\":"
				+ctlocName
				+ "}");
		WebContextHolder.getContext().getResponse().getWriter().flush();
		 
	}
	
	

	
}

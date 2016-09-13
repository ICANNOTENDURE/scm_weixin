package com.dhcc.scm.blh.login;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.Visit;
import com.dhcc.framework.web.context.VisitUser;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.blh.userManage.LoginBlh;
import com.dhcc.scm.dto.login.LoginDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.userManage.Func;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.login.LoginVo;
import com.dhcc.scm.service.userManage.LoginService;
import com.dhcc.scm.tool.datetime.OperTime;
import com.dhcc.scm.tool.security.AESCoder;

/**
 * <p>标题: AuthenTicketBlh.java</p>
 * <p>业务描述:验证服务票据Blh</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月11日
 * @version V1.0 
 */
@Component
public class AuthenTicketBlh extends AbstractBaseBlh {
	
	private static Log logger = LogFactory.getLog(AuthenTicketBlh.class);
	
	@Resource 
    LoginBlh loginBlh;
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private CommonService commonService;
	
	public AuthenTicketBlh() {
		logger.info("====new AuthenTicketBlh====");
	}
	
	/**
	 * 
	* 方法名:          getTicket
	* 方法功能描述:    账户首次登录从PMS获取票据
	* @param:         账户登录数据传输对象
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午4:51:08
	 */
	public void getTicket(BusinessRequest res){
		LoginDto loginDto = super.getDto(LoginDto.class, res);

			
			loginBlh.getTicket(res);
			loginDto.setLoginVo( super.getDto(LoginDto.class, res).getLoginVo());
	}
	
	/**
	 * 
	* 方法名:          authenUser
	* 方法功能描述:    验证用户的服务票据
	* @param:         账户登录数据传输对象
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月11日 下午3:10:00
	 */
	public void authenUser(BusinessRequest res){
		LoginDto loginDto = super.getDto(LoginDto.class, res);
		
    	String servicePassword=PropertiesBean.getInstance().getProperty("confg.serviceKey");	
    	//logger.info("\n--------服务密码-------\n"+servicePassword);
    	
    	LoginVo loginVo=loginDto.getLoginVo();
    	String serviceTicket=loginVo.getServiceTicket();
    	String authenMsgC=loginVo.getAuthenMsg();
    	String userName=loginVo.getUserName();

    	String serviceTicketDecrypt = AESCoder.aesCbcDecrypt(serviceTicket, servicePassword);
        //logger.info("\n-----------解密后的服务票据信息-----------\n"+serviceTicketDecrypt);
        
		@SuppressWarnings("unchecked")
		Map<String, Object> ticket = JsonUtils.toObject(serviceTicketDecrypt, Map.class);

		String accountId=ticket.get("accountId").toString();
		String sessionKey=ticket.get("sessionKey").toString();
		String timestamp=ticket.get("timestamp").toString();
		@SuppressWarnings("unchecked")
		List<Map<String, String>> roleFuncList=(List<Map<String, String>>)ticket.get("roleFunc");
        
        String authenMsgDecrypt = AESCoder.aesCbcDecrypt(authenMsgC, sessionKey);
        //logger.info("\n-----------解密后的时间戳-----------\n"+authenMsgDecrypt);
        
        StringBuilder authenMsgS=new StringBuilder();
        String userType=""; //人员类型
        String userStateString=""; //用户状态
        // {"state":"state","msg":"msg"}
        if (authenMsgDecrypt.equals(timestamp)){
        	String currentTime=OperTime.getCurrentTime();
        	double intervalTime=OperTime.getIntervalTime(currentTime, timestamp);
        	//logger.info("\n-----------intervalTime-----------\n"+intervalTime);
        	if ((intervalTime>=-300)&&(intervalTime<=1800)) {
        		WebContext webContext = WebContextHolder.getContext();
        		
        		VisitUser visitUser=new VisitUser();
        		visitUser.setId(accountId);
        		visitUser.setName(userName);
        		
        		//增加登陆人科室，医院，供应商，人员类型
        		NormalAccount normalAccount=commonService.get(NormalAccount.class,Long.valueOf(accountId));
        		if(normalAccount.getNormalUser()!=null){
	        		visitUser.setLocId(normalAccount.getNormalUser().getLocId());
	        		visitUser.setUserType(normalAccount.getNormalUser().getType());
	        		visitUser.setVendorIdLong(normalAccount.getNormalUser().getVendorId());
	        		if(normalAccount.getNormalUser().getLocId()!=null){
	        			HopCtloc HopCtloc=commonService.get(HopCtloc.class,normalAccount.getNormalUser().getLocId());
	        			visitUser.setHopId(HopCtloc.getHospid());
	        		}
	        		//增加人员类型
	        		userType=normalAccount.getNormalUser().getType().toString();
	        		userStateString=normalAccount.getUseState();
        		}
        		
        		Set<String> privilege=new HashSet<String>();
        		for (int i = 0; i < roleFuncList.size(); i++) {
        			Map<String, String> roleFuncMap = roleFuncList.get(i);
        			String[] secutiryUrl=roleFuncMap.get("secutiryUrl").split(",");
        			privilege.addAll(Arrays.asList(secutiryUrl));
        			
				}
        		privilege.remove("");
        		privilege.remove(null);
        		//logger.info("\n-----------privilege-----------\n"+privilege);
        		visitUser.setPrivilege(privilege);
        		// idTicket
        		Visit visit=new Visit();
        		visit.setUserInfo(visitUser);
        		webContext.setVisit(visit);
        		
        		
        		loginVo.setAccountId(accountId);
        		String mainStr=loginService.getNorAccountMainFuncJson(loginVo);
        		//logger.info("\n-----------mainStr-----------\n"+mainStr);
        		webContext.setSessionAttr("MainMenu", mainStr);
        		// 验证成功
				authenMsgS.append("{\"state\":\"1\"");
				//增加用户类型
				authenMsgS.append(",\"userType\":\""+userType+"\"");
				//增加用户当前状态(可用1。不可用2，待审核3)
				authenMsgS.append(",\"userState\":\""+userStateString+"\"}");
					
			}else {
				// 票据过期
				authenMsgS.append("{\"state\":\"2\"}");
			}
        }else{
        	// 验证失败
        	authenMsgS.append("{\"state\":\"3\"}");
        }
        String authenMsgSEncrypt=AESCoder.aesCbcEncrypt(authenMsgS.toString(), sessionKey);
//        logger.info("\n-----------服务票据验证结果-----------\n"+authenMsgSEncrypt);
// 
//    	String authenMsgSDecrypt=AESCoder.aesCbcDecrypt(authenMsgSEncrypt, sessionKey);
//    	logger.info("\n-----------解密后的服务票据验证结果-----------\n"+authenMsgSDecrypt);
        
        loginVo.setServiceTicket("");
        loginVo.setUserName("");
        loginVo.setAuthenMsg(authenMsgSEncrypt);
	}
	
	/**
	 * 
	* 方法名:		logout
	* 方法功能描述:  账户退出
	* @param:       账户登录数据传输对象
	* @return:		无
	* @Author:		于鸿
	* @Create Date:   2013年11月19日 上午10:27:21
	 */
	public void logout(BusinessRequest res){
		WebContext webContext = WebContextHolder.getContext();
		webContext.setVisit(null);
		webContext.getRequest().getSession().invalidate();
	}
	/**
	 * 
	 * @param res
	 * @throws IOException
	 */
	
	public void GetMainMeun(BusinessRequest res) throws IOException{
		WebContext webContext = WebContextHolder.getContext();
		String ss=(String)webContext.getSessionAttr("MainMenu");
		//logger.info("\n-----------login-----------\n"+ss);
		WebContextHolder.getContext().getResponse().getWriter().write(ss);

	}
	
	

	public void GetMenuByParent(BusinessRequest res) throws IOException{
			
			
			LoginDto loginDto=(LoginDto)res.getDto();
			List<Func> funclist=loginService.getFuncByParentId(loginDto);
			String ss=JsonUtils.toJson(funclist);
			//logger.info("\n-----------parnetdi-----------\n"+ss);
			WebContextHolder.getContext().getResponse().getWriter().write(ss);

		}
	

	/**
	 * 
	* @Title: LoginBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年6月13日 下午2:48:27
	* @version V1.0
	 */
	public void getLoginInfo(BusinessRequest res) throws IOException{
		Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
		String userName=WebContextHolder.getContext().getVisit().getUserInfo().getName();
		StringBuilder info=new StringBuilder(512);
		info.append("{\"userName\":\"").append(userName).append("\",");
		
		if(type==1){
			Long locIdLong=WebContextHolder.getContext().getVisit().getUserInfo().getLocId();
			HopCtloc HopCtloc=commonService.get(HopCtloc.class, locIdLong);
			info.append("\"org\":\"").append(HopCtloc.getName()+"\"");
		}
		if(type==2){
			Long vendorLong=WebContextHolder.getContext().getVisit().getUserInfo().getVendorIdLong();
			Vendor Vendor=commonService.get(Vendor.class, vendorLong);
			info.append("\"org\":\"").append(Vendor.getName());
		}
		if(type==0){
			info.append("\"org\":\"").append("系统管理员");
		}
		info.append("}");
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter().write(info.toString());
		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
	
	
	/**
	 * 
	* @Title: AuthenTicketBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月29日 上午11:41:24
	* @version V1.0
	 */
	public void getUserName(BusinessRequest res) throws IOException{
		
		WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
		WebContextHolder.getContext().getResponse().getWriter().write(WebContextHolder.getContext().getVisit().getUserInfo().getName());
		WebContextHolder.getContext().getResponse().getWriter().flush();
	}
}

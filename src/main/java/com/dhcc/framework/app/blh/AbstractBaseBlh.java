package com.dhcc.framework.app.blh;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.transmission.event.BusinessResponse;
import com.dhcc.framework.transmission.event.RequestEvent;
import com.dhcc.framework.transmission.event.ResponseEvent;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.weixin.MpUser;

/**
 * blh 抽像类 所有BLH都要继承它
 * 
 * @author liuyg
 * 
 */
public abstract class AbstractBaseBlh implements BusinessLogicHandler {
	
	private static Log logger = LogFactory.getLog(AbstractBaseBlh.class);
	
	@Resource
	private WxCpService wxCpService;
	
	@Resource
	private CommonService commonService;
	
	public AbstractBaseBlh() {

	}

	public ResponseEvent performTask(RequestEvent requestEvent)
			throws BaseException {

		BusinessRequest ReqEvent = (BusinessRequest) requestEvent;
		ResponseEvent response = this.invokeHander(ReqEvent);
		return response;
	}

	public ResponseEvent invokeHander(BusinessRequest request)
			throws BaseException {

		return BlhInvoker.invokeBlh(request, this, this.getClass());
	}

	/**
	 * 用可变长参数就是为了不强制传入参数，没参数时 直接调用getView，虽然是可变长参数，
	 * 但只取第一个参数作为forward,第二个参数是提信信息或提示信息代码
	 * 
	 * @author liuyg 功能：
	 * @param result
	 * @return
	 */

	public BusinessResponse getResponse(String... resultMsg) {
		BusinessResponse response = new BusinessResponse();
		if (resultMsg != null && resultMsg.length >= 1) {
			response.displayData("forward", resultMsg[0]);
			if (resultMsg.length >= 2 && resultMsg[1] != null) {
				response.displayData("message", resultMsg[1]);
			}
		}
		return response;
	}

	protected void writeResult(String resStr) {
		WebContextHolder.getContext().writeResponse(resStr);
	}

	/**
	 * 写入JSON数据
	 * 
	 * @param obj
	 *            数据对象（转换json前的对象）
	 * @throws IOException
	 */
	public void writeJSON(Object obj) {

		writeResult(JsonUtils.toJson(obj));
	}

	@SuppressWarnings("unchecked")
	protected <T extends BaseDto> T getDto(Class<T> clasz, BusinessRequest req) {
		return (T) req.getDto();
	}

	protected BusinessResponse globalAjax() {

		return getResponse("globalAjaxRest");
	}

	/**
	 * 获取request中参数值
	 * 
	 * @param name
	 * @return 后面的版本中将禁用这些方法
	 */
	public String getParameter(String name) {
		return WebContextHolder.getContext().getRequest().getParameter(name);
	}

	/**
	 * 获取request中参数值数组
	 * 
	 * @param name
	 * @return 后面的版本中将禁用这些方法
	 */
	@Deprecated
	public String[] getParameterValues(String name) {
		return WebContextHolder.getContext().getRequest()
				.getParameterValues(name);
	}

	/**
	 * 获取登录相关信息
	 * 
	 * @return
	 */
	public Map<String,Object> getLoginInfo() {
		Map<String,Object> info = new HashMap<>();
		// 医院
		Long hosId = WebContextHolder.getContext().getVisit().getUserInfo()
				.getHopId();
		info.put("HOSPID", hosId);
		// 科室
		Long locId = WebContextHolder.getContext().getVisit().getUserInfo()
				.getLocId();
		info.put("LOCID", locId);
		// 用户类型
		Long userType = WebContextHolder.getContext().getVisit().getUserInfo()
				.getUserType();
		info.put("USERTYPE", userType);
		// 供应商
		Long vendorId = WebContextHolder.getContext().getVisit().getUserInfo()
				.getVendorIdLong();
		info.put("VENDOR", vendorId);
		// 登录名
		String loginName = WebContextHolder.getContext().getVisit()
				.getUserInfo().getLoginName();
		info.put("LOGNAME", loginName);
		// 登录用户Id
		String loginId = WebContextHolder.getContext().getVisit().getUserInfo()
				.getId();
		info.put("USERID", loginId);
		return info;

	}
	
	
	/**
	 * 获取微信id
	 * @return
	 */
	public String getWeiXinId(){
		String userIdString="";
		Object o =WebContextHolder.getContext().getSessionAttr(BaseConstants.WEIXIN_SESSION_ID);
		if(o!=null){
			userIdString=o.toString();
		}else{
			logger.info("session is null:");
		}
		logger.info("weixin_userIdString:"+userIdString);
		return userIdString;
	}
	
	/**
	 * 获取微信公众号openid
	 * @return
	 */
	public WxMpUser getWxMpUser(){
		WxMpUser wxMpUser =(WxMpUser)WebContextHolder.getContext().getSessionAttr(BaseConstants.WEIXIN_MP_USER);
		return wxMpUser;
	}
	
	public NormalAccount getMpUserId(){
		if(getWxMpUser()==null){
			return null;
		}
		List<MpUser> mpUsers=commonService.findByProperty(MpUser.class, "wxMpOpenId", getWxMpUser().getOpenId());
		if(mpUsers.size()==0){
			return null;
		}
		NormalAccount normalAccount = commonService.get(NormalAccount.class, mpUsers.get(0).getWxMpSciPointer());
		if(normalAccount==null){
			return null;
		}
		return normalAccount;
	}
	
}

package com.dhcc.framework.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dhcc.framework.app.blh.BlhFactory;
import com.dhcc.framework.app.blh.BusinessLogicHandler;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.transmission.event.BusinessResponse;
import com.dhcc.framework.transmission.event.ResponseEvent;
import com.dhcc.framework.util.DhccBeanUtils;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.framework.web.struts2.ValidateProxy;
import com.dhcc.framework.web.struts2.ValidateResult;

/**
 * baseAction 的助手 把这些代码抽出来是为了好扩展
 * 
 * @author liuyg
 * 
 */
public abstract class ActionHelper {

	/**
	 * 校验通过时统一返回这个结果对像，这样可以减少对像的创建
	 */
	public static ValidateResult validatePassResult = new ValidateResult(true);

	protected static final String doExecute(BaseAction actionRef)throws Exception {
		BusinessRequest reqEvent = new BusinessRequest();
		String page = WebContextHolder.getContext().getRequest().getParameter("page");
		String sort=WebContextHolder.getContext().getRequest().getParameter("sort");
		String order=WebContextHolder.getContext().getRequest().getParameter("order");
		if(actionRef.getBaseDto()!=null){
			actionRef.getBaseDto().initTradeAccount();
			WebContextHolder.getContext().setTradeAccount(actionRef.getBaseDto().getTradeAccount());
		}else{
			BaseAction.logger.info(actionRef.getClass() +" getBaseDto()  return null ");
		}
		
		
		if (page != null&&actionRef.getBaseDto()!=null) {

			if(actionRef.getBaseDto().getPageModel()==null){
				actionRef.getBaseDto().setPageModel(new PagerModel());
				actionRef.getBaseDto().setSort(sort);
				actionRef.getBaseDto().setSortOrder(order);
				actionRef.getBaseDto().getPageModel().setPageNo(Integer.valueOf(page));
				String rows = WebContextHolder.getContext().getRequest().getParameter("rows");
				actionRef.getBaseDto().getPageModel().setPageSize(Integer.valueOf(rows == null ? "10" : rows));
			}
		}
		String businessFlow = actionRef.getBusinessFlow();
		if (businessFlow == null) {
			String invokePara = ServletActionContext.getRequest().getParameter(BaseConstants.INVOKE_BLH_METHOD);
			if(invokePara!=null){
				businessFlow = invokePara;
			}
			if(businessFlow==null){
				businessFlow = actionRef.getDefaultBusinessFlow();
			}if(businessFlow==null){
				businessFlow = actionRef.getDefaultBusinessFlow();
			}if(businessFlow==null){
				businessFlow = "list";
			}
			actionRef.setBusinessFlow(businessFlow);
		}
		try {
			String directoryForward = actionRef.directlyJump();
			if (directoryForward != null && !"".equals(directoryForward.trim())) {
				return directoryForward;
			}
			actionRef.prepareRequest(reqEvent);

			
			ValidateResult validateResult = ValidateProxy.validateExe(actionRef.getClass(), actionRef, businessFlow);
			if (validateResult.getResult() != null&& !validateResult.getResult()) {
				if (isAjaxRequest()) {
					HttpServletResponse httpResponse = WebContextHolder.getContext().getResponse();
					httpResponse.setStatus(500);
					httpResponse.getWriter().write(validateResult.getMsg());
					return null;
				} else {
					actionRef.setMessage(validateResult.getMsg());
				}
				return validateResult.getViewName();
			}
			reqEvent.setDealMethod(businessFlow);
			BusinessLogicHandler businessHandler = BlhFactory.getBusinessHandler(actionRef.getClass());
			ResponseEvent resEvent = businessHandler.performTask(reqEvent);
			if (resEvent != null) {
				BusinessResponse response = (BusinessResponse) resEvent;
				actionRef.setDisplayData(response.getDisplayData());
			}
			if (actionRef.displayData != null) {
				Object msg = actionRef.displayData.get("message");
				if (null != msg && !StringUtils.isEmpty((String) msg)) {
					actionRef.message = (String) actionRef.displayData.get("message");
				}
			}
			reqEvent = null;
			resEvent = null;
			return actionRef.processResponse();
		} catch (BaseException e) {
			actionRef.exc = e;
			if (!"overdue".equals(e.getMessage())) {
				if (e.getLinkedException() != null) {
					if (e.getLinkedException().getMessage() != null) {e.setMessage(e.getMessage()+ e.getLinkedException().getMessage());
					}
					BaseAction.logger.error(e.getLinkedException().getMessage(),e.getLinkedException());
				} else {
					BaseAction.logger.error(e.getMessage(), e);
					printStack(e);
				}
			}
			// ajax请求，直接把异常抛出
			if (isAjaxRequest()) {
				throw e;
			}
			ServletActionContext.getRequest().setAttribute("EXP_INFO", e);
			return "globalException";
		} catch (DataBaseException e) {
			if (e.getLinkedException() != null) {
				printStack(e.getLinkedException());
			}
			BaseAction.logger.error(e.getMessage(), e);
			if (isAjaxRequest()) {
				throw e;
			}
			actionRef.exc = new BaseException(e.getMessage(),e.getLinkedException());
			ServletActionContext.getRequest().setAttribute("EXP_INFO",actionRef.exc);
			return "globalException";
		} catch (Exception e) {
			BaseAction.logger.error(e.getMessage(), e);
			if (isAjaxRequest()) {
				throw e;
			}
			actionRef.exc = new BaseException("未知异常" + e.getMessage()+ "请联系管理员", e);
			ServletActionContext.getRequest().setAttribute("EXP_INFO",actionRef.exc);
			return "globalException";
		}
	}

	protected static boolean isAjaxRequest() {
		String requestType = WebContextHolder.getContext().getRequest().getHeader("X-Requested-With");
		if (requestType != null && "XMLHttpRequest".equals(requestType)) {
			return true;
		}
		return false;
	}

	protected static boolean isPrintStack() {
		if ("true".equals(PropertiesBean.getInstance().getProperty(
				"conf.printStackTrace"))) {
			return true;
		}

		return false;
	}

	protected static void printStack(Throwable e) {
		if (isPrintStack()) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 只有JAAX调用时，框架才调用该方法
	 * @param actionRef
	 */
	protected static void result2json(BaseAction actionRef){
		String errorMsg = WebContextHolder.getErrorMsg();
		if(errorMsg!=null){
		//cbb:{msg:"",tourl:""}
			try {
				WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
				WebContextHolder.getContext().getResponse().getWriter().write("cbb:{msg:\""+errorMsg +",tourl:\""+WebContextHolder.getToUrl()+"\"}");
				WebContextHolder.getContext().getResponse().getWriter().flush();
			} catch (IOException e) {
				BaseAction.logger.error(e.getMessage(),e);
			}
			return;
		}
		 Map<String,String > jsonResultMap = BaseAction.getJsonResultAnnoHolder().get(actionRef.getClass().getName());
		if(jsonResultMap!=null&&jsonResultMap.get(actionRef.getBusinessFlow())!=null){
			formData2Json(actionRef, jsonResultMap);
			return;
		}
		jsonResultMap = BaseAction.jsonResult4PojoAnnoHolder.get(actionRef.getClass().getName());
		if(jsonResultMap!=null){
			pojo2Json(actionRef, jsonResultMap);
		}
	}
	
	@SuppressWarnings("static-access")
	private static void formData2Json(BaseAction actionRef,Map<String,String > jsonResultMap){
		String businessFlow =  actionRef.getBusinessFlow();
		String methodjsonResultAnno =jsonResultMap.get(businessFlow);
		if(methodjsonResultAnno==null){
			if(actionRef.logger.isDebugEnabled()){
				actionRef.logger.debug("no JsonResult annotation setting for method "+businessFlow +" in  "+actionRef.getClass().getName());
			}
		}else{
			String[] propertys = methodjsonResultAnno.split("\\.");
			Object value = actionRef;
			try{
				for (int i = 0; i < propertys.length; i++) {
					if(value!=null){
						value = DhccBeanUtils.forceGetProperty(value, propertys[i]);
					}else{
						
						WebContextHolder.getContext().getResponse().getWriter().write("{\""+methodjsonResultAnno +"\":"+"null}");
						WebContextHolder.getContext().getResponse().getWriter().flush();
					}
					
				}
			}catch(NoSuchFieldException e ){
				actionRef.logger.error(e.getMessage(),e);
			}catch(IOException ioe){
			}
			WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
			try {
				if(value!=null){
					if(value!=actionRef){   
						if("dto.jsonChart".equals(methodjsonResultAnno)){
							WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(value));
						}else{
							WebContextHolder.getContext().getResponse().getWriter().write("{\""+methodjsonResultAnno +"\":"+JsonUtils.toJson(value) +"}");
						}
					}else{
						WebContextHolder.getContext().getResponse().getWriter().write("{\""+methodjsonResultAnno +"\":"+"null}");
					}
				}else{
					if("dto.jsonChart".equals(methodjsonResultAnno)){
						WebContextHolder.getContext().getResponse().getWriter().write("{null}");
					}else{
						WebContextHolder.getContext().getResponse().getWriter().write("{\""+methodjsonResultAnno +"\":"+"null}");
					}						
				}
				WebContextHolder.getContext().getResponse().getWriter().flush();
			} catch (IOException e) {
				actionRef.logger.error(e.getMessage(),e);
				throw new DataBaseException(e.getMessage(),e);
			}				
		}
	}
	@SuppressWarnings("static-access")
	private static void pojo2Json(BaseAction actionRef,Map<String,String > jsonResultMap){
		String businessFlow =  actionRef.getBusinessFlow();
		String methodjsonResultAnno =jsonResultMap.get(businessFlow);
		if(methodjsonResultAnno==null){
			if(actionRef.logger.isDebugEnabled()){
				actionRef.logger.debug("no JsonResult annotation setting for method "+businessFlow +" in  "+actionRef.getClass().getName());
			}
		}else{
			String[] propertys = methodjsonResultAnno.split("\\.");
			Object value = actionRef;
			try{
				for (int i = 0; i < propertys.length; i++) {
					if(value!=null){
						value = DhccBeanUtils.forceGetProperty(value, propertys[i]);
					}else{
						
						WebContextHolder.getContext().getResponse().getWriter().write("{\""+methodjsonResultAnno +"\":"+"null}");
						WebContextHolder.getContext().getResponse().getWriter().flush();
					}
					
				}
			}catch(NoSuchFieldException e ){
				actionRef.logger.error(e.getMessage(),e);
			}catch(IOException ioe){
			}
			WebContextHolder.getContext().getResponse().setContentType("text/html;charset=UTF-8");
			try {
				if(value!=null){
					if(value!=actionRef){   
						WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(value));
					}else{
						WebContextHolder.getContext().getResponse().getWriter().write("{null}");
					}
				}else{
					WebContextHolder.getContext().getResponse().getWriter().write("{null}");						
				}
				WebContextHolder.getContext().getResponse().getWriter().flush();
			} catch (IOException e) {
				actionRef.logger.error(e.getMessage(),e);
				throw new DataBaseException(e.getMessage(),e);
			}				
		}
	}
}

package com.dhcc.framework.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.annotation.AlwaysJsonChk;
import com.dhcc.framework.annotation.JResult;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.annotation.JsonResults;
import com.dhcc.framework.annotation.JsonResults4Pojo;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author liuyg
 * 
 */
public abstract class BaseAction extends ActionSupport {

	private static final long serialVersionUID = -5952902703201041404L;
	protected static Log logger = LogFactory.getLog(BaseAction.class);
	protected static Map<String,Map<String,String>> jsonResultAnnoHolder = new HashMap<String,Map<String,String>>();
	protected static Map<String,Map<String,String>> jsonResult4PojoAnnoHolder = new HashMap<String,Map<String,String>>();
	protected static Map<String,Map<String,String>> alwaysJsonResultMethodHolder = new HashMap<String,Map<String,String>>();
	protected static Map<String,String> parseJsonFlgHolder = new HashMap<String,String>();
	public BaseException exc = null;
	protected String businessFlow;
	protected Map<?, ?> displayData = null;
	protected String message;

	public abstract BaseDto getBaseDto();
	
	public  String getDefaultBusinessFlow(){
		
		return null;
	}

	public BaseAction() {
	}

	@SuppressWarnings("deprecation")
	@PostConstruct
	private void parseJsonResult(){
		String className = this.getClass().getName();
		if(parseJsonFlgHolder.containsKey(className)){
			return;
		}
		AlwaysJsonChk ajc = (AlwaysJsonChk)this.getClass().getAnnotation(AlwaysJsonChk.class);
		if(ajc!=null){
			 Map<String,String > lawayseJsonResultMap = new HashMap<String,String>();
			alwaysJsonResultMethodHolder.put(className, lawayseJsonResultMap);
		}
		
		if(jsonResultAnnoHolder.get(className)==null){
			JsonResults jrs = (JsonResults)this.getClass().getAnnotation(JsonResults.class);
			if(jrs!=null){
				JResult[] jrArry = jrs.value();
				if(jrArry!=null){
					 Map<String,String > jsonResultMap = new HashMap<String,String>();
						jsonResultAnnoHolder.put(className, jsonResultMap);
					for(JResult jr :jrArry){
						jsonResultMap.put(jr.BlhMethod(), jr.ognlExpress());
						if(!jr.onlyAjax()&&ajc!=null){
							alwaysJsonResultMethodHolder.get(className).put(jr.BlhMethod(), null);
						}
					}
				}
			}
			JsonResult jsonAnno = (JsonResult)this.getClass().getAnnotation(JsonResult.class);
			if(jsonAnno!=null&&!"".equals(jsonAnno.value())){
				String jsonResultAnnoStr = jsonAnno.value();
				String[] jsonResultArr = jsonResultAnnoStr.split(";");
				 Map<String,String > jsonResultMap = jsonResultAnnoHolder.get(className);
				 if(jsonResultMap==null){
					 jsonResultMap = new HashMap<String,String>();
					 jsonResultAnnoHolder.put(className, jsonResultMap);
				 }	 
				for(String methodJson :jsonResultArr){
					String[] methodJsonArr = methodJson.split(":");
					String[] methodArr = methodJsonArr[0].split(",");
					//key 方法名 value为要JSON 的属性 如dto.xx.xx
					for(String methodStr :methodArr){
						jsonResultMap.put(methodStr, methodJsonArr[1]);
					}
				}
			}
		}
		if(jsonResult4PojoAnnoHolder.get(className)==null){
			JsonResults4Pojo jrs4Pojo = (JsonResults4Pojo)this.getClass().getAnnotation(JsonResults4Pojo.class);
			if(jrs4Pojo!=null){
				JResult[] jrArry = jrs4Pojo.value();
				if(jrArry!=null){
					 Map<String,String > jsonResultMap = new HashMap<String,String>();
					 jsonResult4PojoAnnoHolder.put(className, jsonResultMap);
					for(JResult jr :jrArry){
						jsonResultMap.put(jr.BlhMethod(), jr.ognlExpress());
						if(!jr.onlyAjax()&&ajc!=null){
							alwaysJsonResultMethodHolder.get(className).put(jr.BlhMethod(), null);
						}
					}
				}
			}
			JsonResult4Pojo jsonAnno = (JsonResult4Pojo)this.getClass().getAnnotation(JsonResult4Pojo.class);
			if(jsonAnno!=null&&!"".equals(jsonAnno.value())){
				String jsonResultAnnoStr = jsonAnno.value();
				String[] jsonResultArr = jsonResultAnnoStr.split(";");
				Map<String,String > jsonResultMap = jsonResult4PojoAnnoHolder.get(className);
				if(jsonResultMap==null){
					jsonResultMap= new HashMap<String,String>();
					jsonResult4PojoAnnoHolder.put(className, jsonResultMap);
				}
						
				for(String methodJson :jsonResultArr){
					String[] methodJsonArr = methodJson.split(":");
					String[] methodArr = methodJsonArr[0].split(",");
					//key 方法名 value为要JSON 的属性 如dto.xx.xx
					for(String methodStr :methodArr){
						jsonResultMap.put(methodStr, methodJsonArr[1]);
					}
				}
			}
		}
		parseJsonFlgHolder.put(className, null);
	}
	
	public String execute() throws Exception {
		return doExecute();
	}

	public final String doExecute() throws Exception {
		return ActionHelper.doExecute(this);
	}
	protected String processResponse() throws BaseException {
		HashMap<?, ?> displayData = (HashMap<?, ?>) getDisplayData();
		return forwardPage(displayData);
	}

	protected abstract void prepareRequest(BusinessRequest reqEvent)
			throws BaseException;

	/*
	 * 得到返回( struts result)标记
	 * 
	 * @return
	 */
	protected String forwardPage(HashMap<?, ?> displayData) {

		if (displayData != null && displayData.get("forward") != null) {
			String viewName = displayData.get("forward").toString();
			if ("null".equals(viewName)) {
				return null;
			}
			displayData = null;
			return viewName;
		}
		if (ActionHelper.isAjaxRequest()) {
			try {
				Map<String,String > jsonResultMap = jsonResult4PojoAnnoHolder.get(this.getClass().getName());
				if (getBaseDto().getPageModel() != null&&(jsonResultMap==null||(jsonResultMap!=null&&!"dto.pageModel".equals(jsonResultMap.get(businessFlow))))) {
					if (getBaseDto().getPageModel().getPageData() != null) {
						getBaseDto().getPageModel().setPageDataJson(
								"{\"total\":"
										+ getBaseDto().getPageModel()
												.getTotals()
										+ ",\"rows\":"
										+ JsonUtils.toJson(getBaseDto()
												.getPageModel().getPageData())
										+ "}");
						WebContextHolder
								.getContext()
								.getResponse()
								.getWriter()
								.write(getBaseDto().getPageModel()
										.getPageDataJson());
					}

				}else{
					ActionHelper.result2json(this);
				}

			} catch (IOException e) {
				logger.error(e.getMessage(), e);
			}
			return null;
		} else {
			AlwaysJsonChk ajc = (AlwaysJsonChk)this.getClass().getAnnotation(AlwaysJsonChk.class);
			if(ajc!=null){
				if(alwaysJsonResultMethodHolder.get(this.getClass().getName()).containsKey(this.getBusinessFlow())){
					ActionHelper.result2json(this);
				}
				return null;
			}
			if (getBaseDto().getPageModel() != null) {
				if (getBaseDto().getPageModel().getPageData() != null) {
					getBaseDto().getPageModel().setPageDataJson(
							"{\"total\":"
									+ getBaseDto().getPageModel().getTotals()
									+ ",\"rows\":"
									+ JsonUtils.toJson(getBaseDto()
											.getPageModel().getPageData())
									+ "}");
				}
			}
		}
		String page = this.getBusinessFlow();
		//上传完文件不想返回到jsp而且还不是ajax请求
		if (page.equals("upload")) {
			return null;
		}
		//Android返回json串
		if (page.contains("Android")) {
			return null;
		}
		//weixin返回json串
		if (page.contains("testCon")) {
			return null;
		}
		
		return page;
	}

	protected void setDisplayData(Map<?, ?> displayData) {
		this.displayData = displayData;
	}

	final protected Map<?, ?> getDisplayData() {

		return displayData;
	}

	public String getBusinessFlow() {
		return businessFlow;
	}

	public void setBusinessFlow(String businessFlow) {
		this.businessFlow = businessFlow;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 直接跳转方法，如不需要走后台，想直接跳到某个JSP或是全局result
	 */
	public String directlyJump() {

		return null;
	}

	public static Map<String,Map<String,String>> getJsonResultAnnoHolder() {
		return jsonResultAnnoHolder;
	}
}

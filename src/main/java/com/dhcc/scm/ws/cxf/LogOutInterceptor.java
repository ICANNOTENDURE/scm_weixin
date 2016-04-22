package com.dhcc.scm.ws.cxf;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.AbstractPhaseInterceptor;
import org.apache.cxf.phase.Phase;

import com.dhcc.framework.app.service.CommonService;

public class LogOutInterceptor extends AbstractPhaseInterceptor<Message> {

	@Resource
	private CommonService commonService;
	
	private static Log logger = LogFactory.getLog(LogOutInterceptor.class);
	
	public LogOutInterceptor(String phase) {
		super(phase);
	}

	public LogOutInterceptor() {
		super(Phase.RECEIVE);
	}

	@SuppressWarnings("static-access")
	public void handleMessage(Message message) throws Fault {
		String reqParams = null;
		if (message.get(message.HTTP_REQUEST_METHOD).equals("GET")) {// 采用GET方式请求
			reqParams = (String) message.get(message.QUERY_STRING);
			message.remove(message.QUERY_STRING);
			reqParams = this.getParams(this.getParamsMap(reqParams));
			message.put(message.QUERY_STRING, reqParams);

		} else if (message.get(message.HTTP_REQUEST_METHOD).equals("POST")) {// 采用POST方式请求
			try {
				InputStream is = message.getContent(InputStream.class);
				reqParams = this.getParams(this.getParamsMap(is.toString()));
				if (is != null)
					message.setContent(InputStream.class, new ByteArrayInputStream(reqParams.getBytes()));
			} catch (Exception e) {
				logger.error("GatewayInInterceptor异常", e);
			}
		}
		logger.info("请求的参数：" + reqParams);
	}

	private Map<String, String> getParamsMap(String strParams) {
		if (strParams == null || strParams.trim().length() <= 0) {
			return null;
		}
		Map<String, String> map = new HashMap<String, String>();
		String[] params = strParams.split("&");
		for (int i = 0; i < params.length; i++) {
			String[] arr = params[i].split("=");
			map.put(arr[0], arr[1]);
		}
		return map;
	}

	private String getParams(Map<String, String> map) {
		if (map == null || map.size() == 0) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		Iterator<String> it = map.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = map.get(key);
			/*
			 * 这里可以对客户端上送过来的输入参数进行特殊处理。如密文解密；对数据进行验证等等。。。
			 * if(key.equals("content")){ value.replace("%3D", "="); value =
			 * DesEncrypt.convertPwd(value, "DES"); }
			 */
			if (sb.length() <= 0) {
				sb.append(key + "=" + value);
			} else {
				sb.append("&" + key + "=" + value);
			}
		}
		return sb.toString();
	}

}

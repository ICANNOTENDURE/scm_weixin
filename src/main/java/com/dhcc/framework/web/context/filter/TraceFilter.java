package com.dhcc.framework.web.context.filter;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dhcc.framework.common.BaseConstants;



/**
 * @description 记录项目中action的访问轨迹 格式： [INFO] 2013-07-17 14:33:51,892 -
 *              [617026][192.168.1.1] [/va-aotweb/embeinfo/showeInfo
 *              .action][12345&type=3][227ms] 说明：时间-managerid-ip-请求路径-参数（get or
 *              post）-访问时间
 * @author liuyg
 */

public class TraceFilter implements Filter {

	public static Log log = LogFactory.getLog(TraceFilter.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException,
			ServletException {
		String address = ""; // ip
		Date startDate = null;// 访问开始时间
		Date endDate = null;// 访问结束时间
		String uri = ""; // url
		String param = "";// 请求参数
		Long times = null;// 时间差
		String userId = "";

		HttpServletRequest httpRequest = (HttpServletRequest) arg0;

		userId = (String) httpRequest.getSession().getAttribute(BaseConstants.SESSION_KEY_USER_ID);

		address = httpRequest.getHeader("X-Real-IP");
		if (address == null || address.equals("")) {
			address = httpRequest.getRemoteAddr();
		}
		// ip = httpRequest.getRemoteHost();

		uri = httpRequest.getRequestURI().toString();
		// 访问起始时间
		startDate = new Date();

		// 提取请求参数
		param = extractRequestParam(param, httpRequest);

		arg2.doFilter(arg0, arg1);

		// 计算访问时检差
		endDate = new Date();

		// 计算时差
		times = staticsTimes(startDate, endDate, times);

		// 拼装日志数据
		StringBuffer buffer = new StringBuffer();
		buffer.append("[UID:");
		buffer.append(userId);
		buffer.append("][IP:");
		buffer.append(address);
		buffer.append("][PATH:");
		buffer.append(uri);
		buffer.append("][PARAM:");
		buffer.append(param);
		buffer.append("][");
		buffer.append(times);
		buffer.append("ms]");
		log.info(buffer.toString());

	}

	private Long staticsTimes(Date startDate, Date endDate, Long times) {
		Long interval = new Long(0);
		if (startDate != null && endDate != null) {
			interval = endDate.getTime() - startDate.getTime();
			times = Math.abs(interval); // 毫秒
		}
		return times;
	}

	@SuppressWarnings("rawtypes")
	private String extractRequestParam(String param, HttpServletRequest httpRequest) {
		try {
			Enumeration paramNames = httpRequest.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String paramName = (String) paramNames.nextElement();
				String[] paramValues = httpRequest.getParameterValues(paramName);
				if (paramValues.length == 1) {
					String paramValue = paramValues[0];
					if (paramValue.length() != 0) {
						param = param + paramName + "=" + paramValue + "&";
					}
				}
			}

			if (param.lastIndexOf("&") != -1) {
				param = param.substring(0, param.length() - 1);
			}
		} catch (Exception e) {
			log.error("extractRequestParam exception:" + e);
		}
		return param;
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}

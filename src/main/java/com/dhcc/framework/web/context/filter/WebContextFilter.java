package com.dhcc.framework.web.context.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.framework.web.context.WebContextImpl;

public class WebContextFilter implements Filter {

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	//private static Log logger = LogFactory.getLog(WebContextFilter.class);
	private static String urlMathExpress = "";
	public static Pattern pt;
	private FilterConfig filterConfig;
	private static String welcomeUrl = "login.htm";
	private static boolean loginCheck = true;
	protected String encoding = null;
	final private static String ENCODING_VALUE = "encoding";

	public void destroy() {

	}

	public WebContextFilter() {
		super();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");//
		httpResponse.setHeader("cache-Control", "no-cache"); // HTTP
		httpResponse.setHeader("pragma", "no-cache"); // HTTP
		httpResponse.setHeader("Cache-Control", "no-store");
		httpResponse.setDateHeader("expires", 0); // prevents
		WebContext context = new WebContextImpl();
		context.setRequest((HttpServletRequest) request);
		context.setResponse(httpResponse);
		WebContextHolder.setContext(context);
		if (loginCheck) {
			String url = httpRequest.getRequestURL().toString();
			// 验证登录
			if (WebContextHolder.getContext().getVisit() == null && pt.matcher(url).matches()) {
				if (request.getParameter("ajax") != null) {
					this.goAjaxPageRest(response);
					return;
				}
				this.goLoginPage(request, response);
				return;
			}
			if (WebContextHolder.getContext().getVisit() != null && url.endsWith(filterConfig.getServletContext().getContextPath() + "/")) {
				this.goLoginPage(request, response);
				return;
			}
		}

		chain.doFilter(request, response);
		WebContextHolder.clearContext();
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		urlMathExpress = filterConfig.getInitParameter("urlMath");
		pt = Pattern.compile(urlMathExpress);
		this.encoding = filterConfig.getInitParameter(ENCODING_VALUE);
		welcomeUrl = filterConfig.getInitParameter("loginUrl");
		if ("false".equals(filterConfig.getInitParameter("loginCheck"))) {
			loginCheck = false;
		}
		// System.out.println(filterConfig.getServletContext().getContextPath());
		// System.out.println(filterConfig.getServletContext().getContextPath());
	}

	private void goAjaxPageRest(ServletResponse response) {
		try {
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			httpResponse.setContentType(CONTENT_TYPE);
			PrintWriter out = response.getWriter();
			out.print("overDue");
			out.flush();
			httpResponse.sendError(504, "overDue");
			WebContextHolder.clearContext();
		} catch (IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		}
	}

	private void goLoginPage(ServletRequest request, ServletResponse response) {
		try {
			WebContextHolder.clearContext();
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			httpResponse.setContentType(CONTENT_TYPE);
			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<html><head><script type='text/javascript'>function toLgin() { top.location='");
			sb.append(httpRequest.getContextPath()).append("/").append(welcomeUrl).append("'}</script>");
			sb.append("</head><body onload='toLgin()'></body></html>");
			out.print(sb.toString());
			WebContextHolder.clearContext();
		} catch (IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		}
	}

}

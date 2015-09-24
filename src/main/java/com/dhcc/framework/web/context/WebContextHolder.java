package com.dhcc.framework.web.context;

import org.springframework.util.Assert;



/**
 * @author liuyg
 *
 */
public class WebContextHolder {

	private static ThreadLocal<WebContext> contextHolder = new ThreadLocal<WebContext>();
	
	public static void clearContext() {
        contextHolder.set(null);
    }

    public static WebContext getContext() {
    	
    	WebContext sc = (WebContext)contextHolder.get();
        if (sc == null) {
        	sc = new WebContextImpl();
            contextHolder.set(sc);
        }

        return sc;
    }

    public static void setContext(WebContext context) {
        Assert.notNull(context, "Only non-null SecurityContext instances are permitted");
        contextHolder.set(context);
    }

	public static String getErrorMsg() {
		WebContext sc = (WebContext)contextHolder.get();
		if(sc!=null){
			return sc.getMsg();
		}
		return null;
	}

	public static void setErrorMsg(String msg) {
		WebContext sc = (WebContext)contextHolder.get();
		if(sc!=null){
			sc.setMsg(msg);
		}
	}

	public static String getToUrl() {
		WebContext sc = (WebContext)contextHolder.get();
		if(sc!=null){
			return sc.getToUrl();
		}
		return null;
	}

	public static void setToUrl(String toUrl) {
		WebContext sc = (WebContext)contextHolder.get();
		if(sc!=null){
			sc.setToUrl(toUrl);
		}
	}
}

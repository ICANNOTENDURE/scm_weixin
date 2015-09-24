package com.dhcc.framework.common;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import com.dhcc.framework.annotation.Descript;

/**
 * WebService描述信息存储器，为注册服务提供信息
 * 
 * @author 黎乐乔[joe7bit@163.com]
 * @timestamp 2014-01-22 11:25:29
 */
public abstract class WsInfoHolder {
    
    /**
     * wsInfoMap<ws类名，<方法名，描述>>
     */
    private static Map<String, Map<String, String>> wsInfoMap = new HashMap<String, Map<String, String>>();
    
    public static Map<String, Map<String, String>> getWsInfoMap() {
        return wsInfoMap;
    }

    public static void registWsInfo(Class<?> wsClass) {
        
        Map<String, String> infoMap = new HashMap<String, String>();
        
        Descript wsClassAnno = wsClass.getAnnotation(Descript.class);
        if(wsClassAnno != null) {
            infoMap.put(wsClass.getSimpleName(), wsClassAnno.value());
        }
        
        Method[] methods = wsClass.getDeclaredMethods();
        Descript wsMethodAnno = null;
        for(Method method : methods) {
            wsMethodAnno = method.getAnnotation(Descript.class);
            if(wsMethodAnno != null) {
                infoMap.put(method.getName(), wsMethodAnno.value());
            }
        }
        
        wsInfoMap.put(wsClass.getName(), infoMap);
    }
}
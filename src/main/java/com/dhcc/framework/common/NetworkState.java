package com.dhcc.framework.common;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Callable;

/**
 * <p>标题: NetworkState.java</p>
 * <p>业务描述:持续检测网络是否连通</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 姚凯
 * @date 2013年8月26日
 * @version V1.0 
 */
public class NetworkState implements Callable<Boolean>{
	
    // 判断网络状态  
    public static boolean isConnect() {
    	boolean connectStates = false;
        Runtime runtime = Runtime.getRuntime(); 
        try { 
            Process process = runtime.exec("ping " + "192.168.5.5"); 
            InputStream is = process.getInputStream(); 
            InputStreamReader isr = new InputStreamReader(is); 
            BufferedReader br = new BufferedReader(isr); 
            String line = null; 
            StringBuffer sb = new StringBuffer(); 
            while ((line = br.readLine()) != null) { 
                sb.append(line); 
                System.out.println("返回值为:"+line);  
            } 
            is.close(); 
            isr.close(); 
            br.close(); 
 
            if (null != sb && !sb.toString().equals("")) { 
                String logString = ""; 
                if (sb.toString().indexOf("TTL") > 0) { 
                	
                    // 网络畅通  
                    logString = "网络正常，时间 " + getCurrentTime();
                    connectStates =  true;
                } else {
                	
                    // 网络不畅通  
                    logString = "网络断开，时间 " + getCurrentTime();
                    connectStates =  false;
                }
            }            
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
        return connectStates;
    } 
 
    // 获得当前时间  
    public static String getCurrentTime() { 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss"); 
        String time = sdf.format(new Date()); 
        return time; 
    } 
    
    @Override
    public Boolean call() {
		boolean connectStates = false;
		connectStates = isConnect();
		if(connectStates) {
			connectStates = true;
		}
		return connectStates;
    }
}
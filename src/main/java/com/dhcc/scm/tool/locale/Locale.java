/**  
* @Title: Locale.java
* @Package com.dhcc.pms.tool.locale
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年8月5日 下午3:35:27
* @version V1.0  
*/
package com.dhcc.scm.tool.locale;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author Administrator
 *
 */
public class Locale {
	
	  
	public static String getMACAddress(){   
		  
        String address = "";   
        String os = System.getProperty("os.name");   
        String osUser=System.getProperty("user.name");   
        if (os != null && os.startsWith("Windows")) {   
  
            try {   
  
                String command = "cmd.exe /c ipconfig /all";   
                   
                Process p = Runtime.getRuntime().exec(command);   
  
                BufferedReader br =new BufferedReader(new InputStreamReader(p.getInputStream()));   
  
                String line;   
  
                while ((line = br.readLine()) != null) {   
  
                    if (line.indexOf("Physical Address") > 0) {   
  
                        int index = line.indexOf(":");   
  
                        index += 2;   
  
                        address = line.substring(index);   
  
                        break;   
  
                    }   
  
                }   
  
                br.close();   
  
                return address.trim();   
  
            }   
  
            catch (IOException e) {   
            }   
  
        }   
        return address;   
  
    }  
 
}

/**  
* @Title: Order.java
* @Package com.dhcc.pms.ws.ord.client
* @Description: TODO(用一句话描述该文件做什么)
* @author zhouxin  
* @date 2014 2014年7月4日 下午2:40:29
* @version V1.0  
*/
package com.dhcc.scm;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.regex.Pattern;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.dhcc.framework.common.BaseConstants;




@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class Order extends AbstractTransactionalJUnit4SpringContextTests{
	
	/**
	 * 
	* @Title: beaut 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param     设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年6月3日 上午9:37:16
	 */
	public static void beaut() {  
	     
		HashMap<java.lang.String, Integer> hashMap=new HashMap<String,Integer>();
		hashMap.put("ss",2);
		hashMap.put("33", 22);
		
		
		
		
//		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
//        factory.setServiceClass(OrderStateWServiceInterface.class);
//        factory.setAddress("http://127.0.0.1:8080/pms/ws/orderStateWService?wsdl");
//        OrderStateWServiceInterface service = (OrderStateWServiceInterface) factory.create();
//        VenIncWeb venIncWeb=new VenIncWeb();
//        venIncWeb.setPassWord("1");
//        venIncWeb.setUserName("vendor2");
//        VenIncItmWeb VenIncItmWeb1=new VenIncItmWeb();
//        venIncWeb.getIncWebs().add(VenIncItmWeb1);
//		System.out.println(service.getVenInc(venIncWeb).getResultCode());
//	    for(OrderWebVo info:gvinfo){  
//	        System.out.println(info.getHopname()+"\t"+info.getPurloc()+  
//	                "\t"+info.getRecloc()+"\t"); 
//	        for(OrderItmWebVo OrderItmWebVo:info.getOrderItmWSVos()){
//	        	System.out.println(OrderItmWebVo.getOrderitmid()+"\t"+OrderItmWebVo.getHisqty()+  
//		                "\t"+OrderItmWebVo.getFac()+"\t"); 
//	        }
//	        
//	    } 
//		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();  
//		Client client = dcf.createClient("http://10.160.17.11:57772/dthealth/web/web.DHCST.SoapService.SCMDataExchange.CLS?WSDL=1"); 
//		//QName q = new QName("http://ord.ws.pms.dhcc.com/", "getVenInc");
//		try {
//			//Object[] objects = client.invoke("recievedMsg", 2400l);
//			//VenIncWeb venIncs=new VenIncWeb();
//			Object[] objects = client.invoke("GetLoc2");
//			System.out.print(objects[0].getClass()+"\t");
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
//		String ns = "http://ord.ws.pms.dhcc.com/";  
//        String wsdlUrl = "http://127.0.0.1:8080/pms/ws/orderStateWService?wsdl";
//        try{
//        MessageFactory factory=MessageFactory.newInstance();
//        //2，根据消息工厂创建SOAPMessage
//         
//        SOAPMessage messge=factory.createMessage();
//        //3,创建SOAPPart
//        SOAPPart part=messge.getSOAPPart() ;
//        //4，获取信封
//        SOAPEnvelope envelop=part.getEnvelope() ;
//        //5，获取消息主题部分
//        SOAPBody body=envelop.getBody();
//         
//        //6，创建信息
//        QName qname=new QName(wsdlUrl,"listOrderWS","ns");
//        SOAPElement ele=body.addBodyElement(qname);
//        ele.addChildElement("number1").setValue("1");
//        ele.addChildElement("number2").setValue("2");
//         
//        messge.writeTo(System.out);
//        }catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
          

		
		  	try {
				URL url = new URL("http://127.0.0.1:57772/dthealth/web/web.DHCST.SoapService.SCMDataExchange.cls?soap_method=GetLoc2");//要调用的url
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setConnectTimeout(5000);
				conn.setRequestMethod("GET");//设置get方式获取数据
				
				if (conn.getResponseCode() == 200) {//如果连接成功

					File   xmlFIle=new File("123.xml");
					OutputStream outStream=new FileOutputStream(xmlFIle);
					byte[] buffer = new byte[BaseConstants.BUFFER_SIZE];
					int len = 0;
				    while( (len = conn.getInputStream().read(buffer)) !=-1 ){
				            outStream.write(buffer, 0, len);
				    }
					

				    outStream.close();
				}
				conn.disconnect();
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	
	
	
	  /**
     * 从输入流中读取数据
     * @param inStream
     * @return
     * @throws Exception
     */
    public static byte[] readInputStream(InputStream inStream) throws Exception{
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while( (len = inStream.read(buffer)) !=-1 ){
            outStream.write(buffer, 0, len);
        }
        byte[] data = outStream.toByteArray();//网页的二进制数据
        outStream.close();
        inStream.close();
        return data;
    }
    
    /**
     * 文件内容替换
     * 
     * @param inFileName 源文件
     * @param from
     * @param to
     * @return 返回替换后文件
     * @throws IOException
     * @throws UnsupportedEncodingException
     */
    public static File replace(String inFileName, String from, String to)
            throws IOException, UnsupportedEncodingException {
        File inFile = new File(inFileName);
        BufferedReader in = new BufferedReader(new InputStreamReader(
                new FileInputStream(inFile), "utf-8"));
        File outFile = new File(inFile + ".tmp");
        PrintWriter out = new PrintWriter(new BufferedWriter(
                new OutputStreamWriter(new FileOutputStream(outFile), "utf-8")));
        String reading;
        while ((reading = in.readLine()) != null) {
            out.println(reading.replaceAll(from, to));
        }
        try {
			out.close();
			in.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //infile.delete(); //删除源文件
        //outfile.renameTo(infile); //对临时文件重命名
        
        return outFile;
    }
    
    
    @Test
    public void hibernate(){
    	System.out.println("start");
	}
    
    public static Pattern WXpt=Pattern.compile("^((?!weixin/wxMessageCtrl!).)*$");
    
    public static void main(String[] args){
    	String url="/scm/weixin/wxMessageCtrl!searchOrder.htm";
    	System.out.println(url.indexOf("weixin/wxMessageCtrl!")>-1);
	}
    
}

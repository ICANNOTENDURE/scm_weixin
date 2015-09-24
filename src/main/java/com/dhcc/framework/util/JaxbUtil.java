/**
 * 
 */
package com.dhcc.framework.util;

import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * <p> 项目名称：cdbp</p>   
 * <p> 类名称：JaxbUtil</p>   
 * <p> 类描述：暂无 </p>
 * <p> 创建人：Administrator</p>   
 * <p> 创建时间：2013年10月14日 下午9:15:39</p>   
 * <p> 修改人：Administrator</p>   
 * <p> 修改时间：2013年10月14日 下午9:15:39</p>   
 * <p> 修改备注：新建 </p>
 * <p> @version   
 */

public class JaxbUtil {

	
	private static Log log = LogFactory.getLog(JaxbUtil.class);
	/**
	 * 将对象转换为字符串xml
	 * @param obj 对象
	 * @param clazz2 obj里面包含其它对象的类型
	 * @return String
	 * @throws JAXBException
	 */
	public static String praseToXml(Object obj,  Class<?> clazz2) throws JAXBException{
		Writer writer = new StringWriter();
    	JAXBContext jaxbContext = JAXBContext.newInstance(obj.getClass(),clazz2);  
        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();  
        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        jaxbMarshaller.marshal(obj, writer);
        //jaxbMarshaller.marshal(obj, System.out);
		return writer.toString();  
	}
	 
	/**
	 * 将字符串xml转换为对象
	 * @param xml 字符串xml
	 * @param obj 对象
	 * @param clazz2 clazz2 obj里面包含其它对象的类型
	 * @return
	 * @throws JAXBException
	 */
	public static Object xmlToObject(final String xml,Object obj,  Class<?> clazz2) throws JAXBException{
		JAXBContext context = JAXBContext.newInstance(obj.getClass(),clazz2);   
        Unmarshaller unmarshaller = context.createUnmarshaller();
        Reader reader = new StringReader(xml);
        Object object = unmarshaller.unmarshal(reader);
        return object;
	}
	
}

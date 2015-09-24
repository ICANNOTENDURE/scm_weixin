package com.dhcc.framework.test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;


@ContextConfiguration(locations = { "classpath*:/applicationContext.xml" })
public abstract class AbstractBaseTransactionalSpringContextTest extends
		AbstractTransactionalJUnit4SpringContextTests {
	public static Log logger = LogFactory
			.getLog(AbstractTransactionalJUnit4SpringContextTests.class);
	public ApplicationContext getApplicationContext(){

		return super.applicationContext;//"classpath*:/applicationContext.xml"
	}

	private static Map<String,Map<String,Class>> blhPmTypeMap = new HashMap<String,Map<String,Class>>();
	public void exportService(){
		Map<String, Object> beanMap = applicationContext
				.getBeansWithAnnotation(Component.class);
		Collection<Object> list = beanMap.values();
		String sysName = null;
		String apiReslurceName = null;
		String packageName = null;
		String clientPackageName = null;
		String busiName = null;
		String blhName = null;
		String blhSimpleName = null;
		StringBuffer sb = null;
		StringBuffer clientsb = null;
		String actionName = null;
		String dtoName = null;
		String restFilePatch = null;
		String clientRestFilePatch = null;
		String rootRestPath = null;
		Map<String,String> actionMap = new HashMap<String,String>();
		//com.dhcc.chmis.dto.publichealth.ChornicRecordDto
		Map<String,String> dtoMap = new HashMap<String,String>();
		Map<String,String> blhBeanIdMap = new HashMap<String,String>();
		
		for (Object obj : list) {
			if (obj.getClass().getSuperclass().getName()
					.equals("com.dhcc.framework.app.blh.AbstractBaseBlh")&&obj.getClass().getName().indexOf("com.dhcc.framework")<0) {
				blhName = obj.getClass().getName();
				PmDataTypes pmDataTypes = (PmDataTypes)obj.getClass().getAnnotation(PmDataTypes.class);
				if(pmDataTypes!=null){
					
					PmDataType[]  pts= pmDataTypes.value();
					if(pts!=null){
						Map<String,Class> pmDataType = new HashMap<String,Class>();
						for(PmDataType pt:pts){
							pmDataType.put(pt.methodName(), pt.clsType());
						}
						blhPmTypeMap.put(blhName, pmDataType);
					}
				}
				blhSimpleName = obj.getClass().getSimpleName();
				String[] packPath = obj.getClass().getName().split("\\.");
				busiName = packPath[packPath.length - 2];
				if (sysName == null) {
					sysName = packPath[2];
					apiReslurceName = UpperFirstChar(sysName) + "ApiResource";
					packageName = "package  com.dhcc." + sysName + ".web.rest";
					restFilePatch = "com.dhcc." + sysName + ".web.rest";
					sb = getResourceHead(packageName);	
					clientPackageName ="package  com.dhcc." + sysName + ".client.service.rest";
					clientRestFilePatch = "com.dhcc." + sysName + ".client.service.rest";
					clientsb = getClientHead(clientPackageName);
				}

				if(!busiName.equals(sysName)&&packPath.length==6){
					actionName = "com.dhcc."+sysName +".web."+busiName+".action."+getDefaultActionByBlh(blhSimpleName);
					actionMap.put(blhName, actionName);
					sb.append("import " +blhName+";\n");
					dtoName = "com.dhcc."+sysName +".dto."+busiName+"."+getDefaultDtoByBlh(blhSimpleName);
					sb.append("import " +dtoName+";\n");
					clientsb.append("import " +dtoName+";\n");
					dtoMap.put(blhName, dtoName);
					blhBeanIdMap.put(blhName, lowerFirstChar(blhSimpleName));
				}else{
					System.out.println(blhName +" is not fit name requestment ");
				}
				
			}
		}
		rootRestPath = "/"+sysName +"Service";
		sb.append(" \n");
		sb.append("@Component\n");
		sb.append("@Path(\"/"+sysName+"Service\")\n");
		sb.append("public class "+apiReslurceName+" { \n");
		
		sb.append(" \n");
		sb.append("    private static Log logger = LogFactory.getLog("+apiReslurceName+".class);\n");
		sb.append(" \n");
		
		clientsb.append("public abstract class "+apiReslurceName+"Client { \n");
		clientsb.append(" \n");
		clientsb.append("    private static Log logger = LogFactory.getLog("+apiReslurceName+"Client.class);\n");
		clientsb.append(" \n");
		clientsb.append("    private static Client client = null;\n");
		clientsb.append("    static {\n");
		clientsb.append("        ClientConfig config = new DefaultClientConfig();\n");
		clientsb.append("        config.getClasses().add(JacksonJaxbJsonProvider.class);\n");
		clientsb.append("        client = Client.create(config);\n");
		clientsb.append("    }\n");
		//String blhNameId = null;
		for (Object blhObj : list) {
			if (blhObj.getClass().getSuperclass().getName()
					.equals("com.dhcc.framework.app.blh.AbstractBaseBlh")) {
				blhName = blhObj.getClass().getName();
				blhSimpleName = blhObj.getClass().getSimpleName();
				String actionClassName = actionMap.get(blhName);
				if(actionClassName==null){
					continue;
				}
				String dtoParaName = dtoMap.get(blhName).substring(dtoMap.get(blhName).lastIndexOf(".")+1);
				String dtoClsStr = dtoMap.get(blhName);
				String blhBeandId = blhBeanIdMap.get(blhName);

				String spaceName= null;
				String methodName = null;
				String actionMapName = null;
				Class actioncls = null;
				try {
					actioncls = Class.forName(actionClassName);
					org.apache.struts2.convention.annotation.Namespace nameSpacec = (org.apache.struts2.convention.annotation.Namespace)actioncls.getAnnotation(org.apache.struts2.convention.annotation.Namespace.class);
					actionMapName =((Action)actioncls.getAnnotation(Action.class)).value();
					if(nameSpacec!=null&&!nameSpacec.value().equals("/")){
						spaceName = nameSpacec.value() ;
					}else{
						System.out.println("NameSpace is root ==== " +actionClassName );
					}
					parseJsonResult(actioncls);
				} catch (ClassNotFoundException e) {
					System.out.println(" for blh "+blhName+ "   no find action     "+actionClassName );
				}
				Method[] methods = blhObj.getClass().getMethods();
				int i = 0;
				for(Method m:methods){
					Class[] methodPara = m.getParameterTypes();
					if(spaceName!=null&&methodPara!=null&&methodPara.length==1
							&&methodPara[0].getName().equals("com.dhcc.framework.transmission.event.BusinessRequest")
							&&!"invokeHander".equals(m.getName())){
						methodName = m.getName();
						if(i==0){
							sb.append("    @Resource \n");
							sb.append("    "+     UpperFirstChar(blhBeandId)+" " +blhBeandId +";\n");
							sb.append("\n");
						}
						sb.append(getMethodHead(spaceName,methodName,actionMapName,actionClassName));
						String returnDataClass = getReturnObjType(dtoClsStr,actionClassName, methodName,blhName);
						sb.append("    //"+blhSimpleName +" method :"+methodName+" rest api \n");
						sb.append("    public Response<"+returnDataClass+"> "+actionMapName +UpperFirstChar(methodName) +"("+dtoParaName+" dto) { \n");
						sb.append("        BusinessRequest request = new BusinessRequest();\n");
						sb.append("        request.setDto(dto);\n");
						sb.append("        WebContextHolder.getContext().setTradeAccount(dto.getTradeAccount());\n");
						sb.append("        Response rest = new Response<"+returnDataClass+"> ();\n");
						sb.append("        try {\n");
						sb.append("            "+blhBeandId+"."+methodName+"(request);\n");
						sb.append(         parseReturnDataExpress(actionClassName,methodName,returnDataClass));
						sb.append("        } catch (Exception e) {\n");
						sb.append("            rest.setOpFlg(\"0\");\n");
						sb.append("            rest.setMsg(e.getMessage()==null?\"unknow exception \":e.getMessage());\n");
						sb.append("            logger.error(e.getMessage(),e);\n");
						sb.append("        }\n");
						sb.append("        rest.setTradeAccount(dto.getTradeAccount());\n");
						sb.append("        return rest;\n");
						sb.append("    } \n");
						
						String url = rootRestPath +spaceName+"/"+actionMapName.substring(0,actionMapName.lastIndexOf("Ctrl"))+"/"+methodName;
						String accessPathVar = actionMapName +UpperFirstChar(methodName) +"Url";
						clientsb.append("    \n");
						clientsb.append("    //"+blhSimpleName +" method :"+methodName+" rest api client \n");
						clientsb.append("    private static String  " +accessPathVar +" =\"" +url +"\";\n");
						clientsb.append("    private static WebResource  " +accessPathVar +"WebResource = null ;\n");
						clientsb.append("    public static Response<"+returnDataClass+">  "+actionMapName +UpperFirstChar(methodName) +"("+dtoParaName+" dto) { \n");
						clientsb.append("         if("+accessPathVar+"WebResource == null){\n");
						clientsb.append("             String accessUrl = PropertiesBean.getInstance().getProperty(\"conf."+sysName+".address\")+\"/dhccApi\"+"+accessPathVar+";\n");
						clientsb.append("             "+accessPathVar+"WebResource = client.resource(UriBuilder.fromUri(accessUrl).build());\n");
						clientsb.append("         }\n");
						clientsb.append("         dto.initTradeAccount();\n");
						clientsb.append("         ClientResponse response = "+accessPathVar+"WebResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, dto);\n");
						clientsb.append("         if(response.getStatus()!=200){\n");
						clientsb.append("             logger.error(response.getEntity(String.class));\n");
						clientsb.append("             throw new DataBaseException(\"request error : code=\"+response.getStatus());\n");
				        clientsb.append("         }\n");
						//clientsb.append("         String resultStr = response.getEntity(String.class);\n");
						clientsb.append("         Response<"+returnDataClass+"> respObj =null;\n");
						clientsb.append("         respObj =response.getEntity(new GenericType<Response<"+returnDataClass+">>() { });\n");
						clientsb.append("         return respObj;\n");
						clientsb.append("    } \n");
						
						//写返回字原始json的方法
						
						
						clientsb.append("    public static String  "+actionMapName +UpperFirstChar(methodName) +"Json("+dtoParaName+" dto) { \n");
						clientsb.append("         if("+accessPathVar+"WebResource == null){\n");
						clientsb.append("             String accessUrl = PropertiesBean.getInstance().getProperty(\"conf."+sysName+".address\")+\"/dhccApi\"+"+accessPathVar+";\n");
						clientsb.append("             "+accessPathVar+"WebResource = client.resource(UriBuilder.fromUri(accessUrl).build());\n");
						clientsb.append("         }\n");
						
						clientsb.append("         dto.initTradeAccount();\n");
						clientsb.append("         ClientResponse response = "+accessPathVar+"WebResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, dto);\n");
						clientsb.append("         if(response.getStatus()!=200){\n");
						clientsb.append("             logger.error(response.getEntity(String.class));\n");
						clientsb.append("             throw new DataBaseException(\"request error : code=\"+response.getStatus());\n");
				        clientsb.append("         }\n");
						clientsb.append("         return response.getEntity(String.class);\n");
						clientsb.append("    } \n");
						i++;
					}
				}
			}
		}
		sb.append(" \n");
		sb.append("} \n");
		
		clientsb.append(" \n");
		clientsb.append("} \n");
		//System.out.println(sb);
		writeRestServiceCode(sb.toString(),restFilePatch,apiReslurceName);
		writeRestClientCode(clientsb.toString(),clientRestFilePatch,apiReslurceName+"Client");
		System.out.println("=====================service export finish =======================");
		
	}
	
    private static void writeRestClientCode(String content,String packageName,String restClientJavaName){
   	 File outFile = null;
   	 String dirSeparator = File.separator;
   	 String packageDir = packageName.replaceAll("\\.", "\\\\");
   	
   	 outFile = new File("d:"+dirSeparator+"src" + dirSeparator + "main"
					+ dirSeparator + "java" + dirSeparator + packageDir
					+ dirSeparator  +restClientJavaName + ".java");
   	 //outFile = new File("src\\main\\java\\com\\dhcc\\chmis\\web\rest\\ChmisApiResource.java");
   	 BufferedWriter output = null;
   	 FileWriter fr = null;
   	 try {
            try{
	            if(outFile.exists() && true || outFile.createNewFile()){
	            	fr=	new FileWriter(outFile);
	            }
            }catch(IOException ex){
            	//通过是用捕获异常创建缺少路径（只有第一次试用模板的时候还会抛出该异常）
            	outFile.getParentFile().mkdirs(); 
            	fr=	new FileWriter(outFile);
            }
            
            fr.write(content);
            fr.flush();
			fr.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}finally{
			if(fr!=null){
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
   	 
   }
	
    private static void writeRestServiceCode(String content,String packageName,String restServerJavaName){
    	 File outFile = null;
    	 String dirSeparator = File.separator;
    	 String packageDir = packageName.replaceAll("\\.", "\\\\");
    	
    	 outFile = new File("d:"+dirSeparator+"src" + dirSeparator + "main"
					+ dirSeparator + "java" + dirSeparator + packageDir
					+ dirSeparator  +restServerJavaName + ".java");
    	 //outFile = new File("src\\main\\java\\com\\dhcc\\chmis\\web\rest\\ChmisApiResource.java");
    	 BufferedWriter output = null;
    	 FileWriter fr = null;
    	 try {
             try{
 	            if(outFile.exists() && true || outFile.createNewFile()){
 	            	fr=	new FileWriter(outFile);
 	            }
             }catch(IOException ex){
             	//通过是用捕获异常创建缺少路径（只有第一次试用模板的时候还会抛出该异常）
             	outFile.getParentFile().mkdirs(); 
            	fr=	new FileWriter(outFile);
             }
             
             fr.write(content);
             fr.flush();
			 fr.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}finally{
			if(fr!=null){
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
    	 
    }
    
	protected static Map<String,Map<String,String>> jsonResultAnnoHolder = new HashMap<String,Map<String,String>>();
	protected static Map<String,Map<String,String>> jsonResult4PojoAnnoHolder = new HashMap<String,Map<String,String>>();
	
	private static String getReturnObjType(String dtoClassStr,String  actionClassName,String methodName,String blhName){
		 try {
			String anotReturnDataExpress = getReturnDataAnno(actionClassName,methodName);
			if(anotReturnDataExpress!=null){
				Class dtoCls = Class.forName(dtoClassStr);
				String[]  dataExpressArr = anotReturnDataExpress.split("\\.");
				Field filed = null;
				Class currFiledClass = dtoCls;
				for(String currFieldName :dataExpressArr){
					if( "dto".equals(currFieldName)){
						continue;
					}
					filed =  currFiledClass.getDeclaredField(currFieldName);
					currFiledClass = 	filed.getType();
				}
				return currFiledClass.getName();
			}else{
				Map<String,Class> map = blhPmTypeMap.get(blhName);
				Class pmListType = null;
				if(map!=null){
					pmListType = map.get(methodName);
				}
				if(pmListType!=null){
					return pmListType.getName();
				}else{
					System.out.println("======="+blhName +" method:" +methodName +" need assgin pageModel list data type by  PmDataTypes anntotation ");
				}
				//在这里后续写上pageMode数据类型
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		 System.out.println("======="+blhName +" method:" +methodName +" need assgin pageModel list data type by  PmDataTypes anntotation ");
		return null;
	}
	
	private static String getReturnDataAnno(String  actionClassName,String methodName){
		Map<String,String> map = jsonResultAnnoHolder.get(actionClassName);
		String anotReturnDataExpress = null;
		if(map!=null){
			anotReturnDataExpress = map.get(methodName);
		}
		
		if(anotReturnDataExpress==null){
			map = jsonResult4PojoAnnoHolder.get(actionClassName);
			if(map!=null){
				anotReturnDataExpress = map.get(methodName);
			}
		}
		return anotReturnDataExpress;
	}
	private static String parseReturnDataExpress(String  actionClassName,String methodName,String returnDataClass){
		StringBuffer sb = new StringBuffer();
		String anotReturnDataExpress = getReturnDataAnno(actionClassName,methodName);
		sb.append("            rest.setOpFlg(\"1\");\n");
		if(anotReturnDataExpress==null){
			sb.append("            //因没json注解，把pagerModel的数据返回\n");
			sb.append("            if(dto.getPageModel()!=null){\n");
			sb.append("                List<"+returnDataClass+"> dataList = (List<"+returnDataClass+">)dto.getPageModel().getPageData(); \n");
			sb.append("                rest.setPageNo(dto.getPageModel().getPageNo());\n");
			sb.append("                rest.setPageSize(dto.getPageModel().getPageSize());\n");
			sb.append("                rest.setTotals(dto.getPageModel().getTotals());\n");
			sb.append("                rest.setPageData(dataList);\n");
			sb.append("            }\n");
		}else{
			String[]  dataExpressArr = anotReturnDataExpress.split("\\.");
			String returnDataExpress = "dto";
			for(String currDataAccessStr :dataExpressArr){
				if( "dto".equals(currDataAccessStr)){
					continue;
				}
				returnDataExpress +=".get"+UpperFirstChar(currDataAccessStr)+"()";
			}
			sb.append("            @SuppressWarnings(\"rawtypes\")\n");
			sb.append("            List<"+returnDataClass+"> dataList = new ArrayList<"+returnDataClass+">(1);\n");
			sb.append("            //有可能数据为空，所以这里加上空指针处理\n");
			sb.append("            try{\n");
			sb.append("                dataList.add("+returnDataExpress+");\n");
			sb.append("            }catch (NullPointerException e){\n");
			sb.append("            \n");
			sb.append("            }\n");
			sb.append("            rest.setPageData(dataList);\n");
		}
		return sb.toString();
	}
	
	@SuppressWarnings("rawtypes")
	private static void parseJsonResult(Class actioncCls ){

		if(jsonResultAnnoHolder.get(actioncCls.getName())==null){
			@SuppressWarnings("unchecked")
			JsonResult jsonAnno = (JsonResult)actioncCls.getAnnotation(JsonResult.class);
			if(jsonAnno!=null&&!"".equals(jsonAnno.value())){
				String jsonResultAnnoStr = jsonAnno.value();
				String[] jsonResultArr = jsonResultAnnoStr.split(";");
				Map<String,String > jsonResultMap = new HashMap<String,String>();
				jsonResultAnnoHolder.put(actioncCls.getName(), jsonResultMap);
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
		if(jsonResult4PojoAnnoHolder.get(actioncCls.getName())==null){
			JsonResult4Pojo jsonAnno = (JsonResult4Pojo)actioncCls.getAnnotation(JsonResult4Pojo.class);
			if(jsonAnno!=null&&!"".equals(jsonAnno.value())){
				String jsonResultAnnoStr = jsonAnno.value();
				String[] jsonResultArr = jsonResultAnnoStr.split(";");
				 Map<String,String > jsonResultMap = new HashMap<String,String>();
				 jsonResult4PojoAnnoHolder.put(actioncCls.getName(), jsonResultMap);
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
	}
	
	public static String getDefaultActionByBlh(
			String blhName)
			throws StringIndexOutOfBoundsException {
		return blhName.substring(0,blhName.lastIndexOf("Blh")) + "Action";
	}
	
	public static String getDefaultDtoByBlh(
			String blhName)
			throws StringIndexOutOfBoundsException {
		return blhName.substring(0,blhName.lastIndexOf("Blh")) + "Dto";
	}
	private static String getMethodHead(String spaceName,String methodName,String actionMapName,String actionClassName){
		StringBuffer sb = new StringBuffer("\n");
		Map<String,String> map = jsonResultAnnoHolder.get(actionClassName);
		String anotReturnDataExpress = null;
		if(map!=null){
			anotReturnDataExpress = map.get(methodName);
		}
		
		if(anotReturnDataExpress==null){
			map = jsonResult4PojoAnnoHolder.get(actionClassName);
			if(map!=null){
				anotReturnDataExpress = map.get(methodName);
			}
		}
		if(anotReturnDataExpress!=null){
			sb.append("    @SuppressWarnings(\"unchecked\")\n");
		}
		sb.append("    @POST\n");
		sb.append("    @Path(\""+spaceName+"/"+actionMapName.substring(0,actionMapName.lastIndexOf("Ctrl"))+"/"+methodName+"\")\n");
		sb.append("    @Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })\n");
		sb.append("    @Produces({ MediaType.APPLICATION_JSON})\n");
		return sb.toString();
	}
	private static  StringBuffer getResourceHead(String packageName) {
		StringBuffer sb = new StringBuffer(packageName+";\n");
		sb.append(" \n");
		sb.append("import java.util.ArrayList;\n");
		sb.append("import java.util.List;\n");
		sb.append(" \n");
		sb.append("import javax.annotation.Resource;\n");
		sb.append("import javax.ws.rs.Consumes;\n");
		sb.append("import javax.ws.rs.GET;\n");
		sb.append("import javax.ws.rs.POST;\n");
		sb.append("import javax.ws.rs.Path;\n");
		sb.append("import javax.ws.rs.PathParam;\n");
		sb.append("import javax.ws.rs.Produces;\n");
		sb.append("import javax.ws.rs.core.MediaType;\n");
		sb.append(" \n");
		sb.append("import org.apache.commons.logging.Log;\n");
		sb.append("import org.apache.commons.logging.LogFactory;\n");
		sb.append(" \n");
		sb.append("import org.springframework.stereotype.Component;\n");
		sb.append(" \n");
		sb.append("import com.dhcc.framework.transmission.event.BusinessRequest;\n");
		sb.append("import com.dhcc.framework.transmission.dto.Response;\n");
		sb.append("import com.dhcc.framework.web.context.WebContextHolder;\n");
		return sb;

	}

	private static  StringBuffer getClientHead(String packageName) {
		StringBuffer sb = new StringBuffer(packageName+";\n");
		sb.append(" \n");
		sb.append("import javax.ws.rs.core.MediaType;\n");
		sb.append("import javax.ws.rs.core.UriBuilder;\n");
		//sb.append("import javax.xml.bind.JAXBException;\n");
		sb.append(" \n");
		sb.append("import java.util.ArrayList;\n");
		sb.append("import java.util.List;\n");
		sb.append(" \n");
		sb.append("import com.sun.jersey.api.client.Client;\n");
		sb.append("import com.sun.jersey.api.client.WebResource;\n");
		sb.append("import com.sun.jersey.api.client.ClientResponse;\n");
		sb.append("import com.sun.jersey.api.client.config.ClientConfig;\n");
		sb.append("import com.sun.jersey.api.client.config.DefaultClientConfig;\n");
		sb.append("import com.sun.jersey.api.client.GenericType;\n");
		//sb.append("import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;\n");
		sb.append("import com.fasterxml.jackson.jaxrs.json.JacksonJaxbJsonProvider\n");
		//sb.append("import org.codehaus.jackson.type.TypeReference;\n");
		sb.append(" \n");
		
		sb.append("import org.apache.commons.logging.Log;\n");
		sb.append("import org.apache.commons.logging.LogFactory;\n");
		sb.append(" \n");
		
		//sb.append("import com.dhcc.framework.util.JsonUtils;\n");
		//sb.append("import com.dhcc.framework.util.JaxbUtil;\n");
		sb.append("import com.dhcc.framework.transmission.dto.Response;\n");
		sb.append("import com.dhcc.framework.common.config.PropertiesBean;\n");
		sb.append("import com.dhcc.framework.exception.DataBaseException;\n");
		return sb;

	}
	private static String UpperFirstChar(String string) {
		if (string == null) {
			return null;
		}
		if (string.length() <= 1) {
			return string.toLowerCase();
		}
		StringBuffer sb = new StringBuffer(string);
		sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
		return sb.toString();
	}
	
	private static String lowerFirstChar(String string) {
		if (string == null) {
			return null;
		}
		if (string.length() <= 1) {
			return string.toLowerCase();
		}
		StringBuffer sb = new StringBuffer(string);
		sb.setCharAt(0, Character.toLowerCase(sb.charAt(0)));
		return sb.toString();
	}
}
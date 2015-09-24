package com.dhcc.framework.test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Namespace;
import org.junit.Before;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.dhcc.framework.annotation.BlhNoParameter;
import com.dhcc.framework.annotation.BlhParameter;
import com.dhcc.framework.annotation.BlhParameters;
import com.dhcc.framework.annotation.Descript;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.annotation.NoAction;
import com.dhcc.framework.annotation.OutPut;
import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;

/**
 * action和blh注解参数解析合成器
 * 
 * @author 黎乐乔[joe7bit@163.com]
 */
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public abstract class AnnoParameterParser extends AbstractTransactionalJUnit4SpringContextTests {

    protected static Log logger = LogFactory.getLog(AnnoParameterParser.class);

    /**
     * <namespace, [blhClass, actClass, dtoClass]>
     */
    protected static Map<String, Class<?>[]> preParseMap = new HashMap<String, Class<?>[]>();

    /**
     * <namespace, <methodName, [<paramsIN_name, paramsIN_type>, <paramOUT_name, paramOUT_type>, <paramName, required>]>>
     */
    protected static Map<String, Map<String, List<Map<String, String>>>> parsedParamsMap = new HashMap<String, Map<String, List<Map<String, String>>>>();

    protected Map<String, Map<String, List<Map<String, String>>>> getParsedParamsMap() {
        if(preParseMap.entrySet().size() < 1) {
            this.preParse();
        }
        if(parsedParamsMap.entrySet().size() < 1) {
            parseParams(preParseMap);
        }
        return parsedParamsMap;
    }

    @Before
    public void preParse() {
        Map<String, Object> beanMap = applicationContext.getBeansWithAnnotation(Component.class);
        Collection<Object> list = beanMap.values();
        for(Object obj : list) {
            if(obj.getClass().getSuperclass().getName().equals("com.dhcc.framework.app.blh.AbstractBaseBlh")
                    && obj.getClass().getName().indexOf("com.dhcc.framework") < 0
                    && obj.getClass().getName().indexOf(System.getProperty("user.dir").split("\\\\")[System.getProperty("user.dir").split("\\\\").length-1]) > 0) {
                Class<?>[] clzHolder = new Class<?>[3];
                Class<?> blhClass = obj.getClass();
                clzHolder[0] = blhClass;
                System.out.println("=="+blhClass);

                String[] packPath = blhClass.getName().split("\\.");
                String sysName = packPath[2];
                String busiName = packPath[packPath.length - 2];
                Class<?> actClass = null;
                String packageName = "";
                NoAction noAction = blhClass.getAnnotation(NoAction.class);
                /**判断如果没有方法需要暴露成接口，直接continue*/
                Method[] methods = blhClass.getMethods();
                boolean flag = false;
                for(Method method : methods) {
                	 BlhParameters bParameters = method.getAnnotation(BlhParameters.class);
                     if(bParameters == null){
                    	 continue;
                     }else{
                    	 flag = true;
                    	 break;
                     }
                }
                if(!flag){
                	continue;
                }
              
                /**对于没有Action层的时候，默认存储的Action的Class类是String的Class，默认命名空间是Blh中填写的命名空间--add-by-jiatao-2014/4/9*/
                if(noAction !=null &&noAction.nameSpace() !=null && !"".equals(noAction.nameSpace())){
     
                    clzHolder[1] = String.class;
                    
                    String actionNS = noAction.nameSpace();
                    packageName = "com.dhcc." + sysName + ".ws." + busiName + "." + actionNS.substring(1);
                    
                }else{
                	 String actionName = "com.dhcc." + sysName + ".web." + busiName + ".action." + getDefaultActionByBlh(blhClass.getSimpleName());
                     try {
                         actClass = Class.forName(actionName);
                     } catch(ClassNotFoundException e) {
                     }
                     clzHolder[1] = actClass;
                     System.out.println(actClass);
                     
                     Namespace actionNS = (Namespace)actClass.getAnnotation(Namespace.class);
                     packageName = "com.dhcc." + sysName + ".ws." + busiName + "." + actionNS.value().substring(1);
                }
                 
                /**dto的时候如果在NoAction标注中有标注，按照标注取值，如果没有按照默认程序*/
                String dtoName = "";
                if(noAction !=null && !"".equals(noAction.dtoClass())){
                	dtoName = noAction.dtoClass();
                }else{
                	dtoName = "com.dhcc." + sysName + ".dto." + busiName + "." + getDefaultDtoByBlh(blhClass.getSimpleName());
                }
                Class<?> dtoClass = null;
                try {
                    dtoClass = Class.forName(dtoName);
                } catch(ClassNotFoundException e) {
                	
                }
                clzHolder[2] = dtoClass;
                System.out.println(dtoClass);

                preParseMap.put(packageName, clzHolder);
                System.out.println(packageName);
            }
        }
    }

    /**
     * 循环从（Blh和Action）类中扫描@BlhParameters、@PmDataTypes、@JsonResult及@JsonResult4Pojo标签，
     * 解析合成方法的入参和出参，并关联命名空间存入parsedParamsMap中
     * 
     * @param preParseMap
     */
    protected static void parseParams(Map<String, Class<?>[]> preParseMap) {

        if(preParseMap == null || preParseMap.entrySet().size() < 1) {
            logger.error("no blh/action class to parse.");
            System.exit(-1);
        }

        Set<Entry<String, Class<?>[]>> preSet = preParseMap.entrySet();
        for(Entry<String, Class<?>[]> set : preSet) {
            String namespace = set.getKey();
            Class<?> blhClass = set.getValue()[0];
            Class<?> actClass = set.getValue()[1];
            Class<?> dtoClass = set.getValue()[2];

            Map<String, List<Map<String, String>>> methodIOParams = new HashMap<String, List<Map<String, String>>>();

            Method[] methods = blhClass.getMethods();
            for(Method method : methods) {
                BlhParameters paramsINAnno = method.getAnnotation(BlhParameters.class);
                BlhNoParameter noParam = method.getAnnotation(BlhNoParameter.class);
                if(noParam != null) {
                    continue;
                }
                if(paramsINAnno == null && noParam == null) {
                    logger.warn("Method: " + method.getName() + " has no valid parameter annotation attached, webservice ignored!");
                    continue;
                }
                List<Map<String, String>> paramsMapList = new ArrayList<Map<String, String>>();
                Map<String, String> paramsMapIN = new HashMap<String, String>();
                Map<String, String> paramsMapOUT = new HashMap<String, String>();
                Map<String, String> paramRequired = new HashMap<String, String>();
                Map<String, String> paramvalues = new HashMap<String, String>();/**增加传入参数是对象的存储*/
                Map<String, String> descript = new HashMap<String, String>();
                if(paramsINAnno != null) {
                	  String test = "";
                    BlhParameter[] paramsIN = paramsINAnno.parameter();
                    for(BlhParameter param : paramsIN) {
                        String paramExpression = param.parameterExpress();
                        String[] fields = getFieldNames(paramExpression);
                        String paramName = getFieldNameChain(paramExpression);
                        String paramClass = getMethodTypeChain(dtoClass, fields);
                        String required = param.required() ? "true" : "false";
                        /**增加解析测试参数代码--jiatao-20140411*/
                        String[] testvalues = param.testvalues();
                        String desc = param.desc();
                        for(int i = 0;i < testvalues.length;i++){
                        	if(i == testvalues.length-1){
                        		test += testvalues[i]+":"+desc+";";
                        		break;
                        	}
                        	test += testvalues[i]+",";
                        }
                        paramvalues.put("testvalues", test);
                        /**end*/
                        paramsMapIN.put(paramName, paramClass);
                        paramRequired.put(paramName, required);
                    }
                } else {
                    paramsMapIN.put("VOID_INPUT", null);
                }
                Descript desc = method.getAnnotation(Descript.class);
                if(desc != null){
                	descript.put("descript", desc.value());
                }
                paramsMapList.add(paramsMapIN);
                setReturnType(paramsMapOUT,method,dtoClass);
                paramsMapList.add(paramsMapOUT);
                paramsMapList.add(paramRequired);
                paramsMapList.add(paramvalues);
                paramsMapList.add(descript);
                //paramsMapOUT.put("RETURN_TYPE", "void");
                methodIOParams.put(method.getName(), paramsMapList);
            }

            if(blhClass != null) {
                PmDataTypes pmOUTBlhAnno = blhClass.getAnnotation(PmDataTypes.class);
                if(pmOUTBlhAnno != null) {
                    setReturnType(methodIOParams, pmOUTBlhAnno);
                }

                JsonResult jrOUTBlhAnno = blhClass.getAnnotation(JsonResult.class);
                if(jrOUTBlhAnno != null && dtoClass != null) {
                    setReturnType(methodIOParams, jrOUTBlhAnno, dtoClass);
                }

                JsonResult4Pojo jr4pOUTBlhAnno = blhClass.getAnnotation(JsonResult4Pojo.class);
                if(jr4pOUTBlhAnno != null && dtoClass != null) {
                    setReturnType(methodIOParams, jr4pOUTBlhAnno, dtoClass);
                }
            }

            if(actClass != null && actClass != String.class) {
                PmDataTypes pmOUTActAnno = actClass.getAnnotation(PmDataTypes.class);
                if(pmOUTActAnno != null) {
                    setReturnType(methodIOParams, pmOUTActAnno);
                }

                JsonResult jrOUTActAnno = actClass.getAnnotation(JsonResult.class);
                if(jrOUTActAnno != null && dtoClass != null) {
                    setReturnType(methodIOParams, jrOUTActAnno, dtoClass);
                }

                JsonResult4Pojo jr4pOUTActAnno = actClass.getAnnotation(JsonResult4Pojo.class);
                if(jr4pOUTActAnno != null && dtoClass != null) {
                    setReturnType(methodIOParams, jr4pOUTActAnno, dtoClass);
                }
            }

            if(methodIOParams.entrySet().size() > 0) {
                parsedParamsMap.put(namespace, methodIOParams);
            }
        }
    }
    
    /**
     * parseParams中重构出来的方法
     * 
     * @param methodIOParams
     * @param paramsOUTAnno
     */
    protected static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, PmDataTypes paramsOUTAnno) {
        if(paramsOUTAnno != null) {
            PmDataType[] paramsOUT = paramsOUTAnno.value();
            for(PmDataType param : paramsOUT) {
                String methodName = param.methodName();
                String returnType = "java.util.List<" + param.clsType().getName() + ">";
                if(methodIOParams.get(methodName) != null) {
                    methodIOParams.get(methodName).listIterator(1).next().put("RETURN_TYPE", returnType);
                }
            }
        }
    }
    
    /**增加OutPut参数解析方法--add-by-jiatao-2014/4/9*/
    protected static void setReturnType(Map<String, String> paramsMapOUT,Method method, Class<?> dtoClass) {
    	OutPut outPut = method.getAnnotation(OutPut.class);
        if(outPut != null && !"".equals(outPut.ognlExpress())) {
            String jrAnnoStr = outPut.ognlExpress();
                    String[] fields = getFieldNames(jrAnnoStr);
                    String returnType = getMethodTypeChain(dtoClass, fields);  
                    paramsMapOUT.put("RETURN_TYPE", returnType);
        }else{
        	paramsMapOUT.put("RETURN_TYPE", "void");
        }
    }

    protected static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, JsonResult paramsOUTAnno, Class<?> dtoClass) {
        if(paramsOUTAnno != null && !"".equals(paramsOUTAnno.value())) {
            String jrAnnoStr = paramsOUTAnno.value();
            String[] jrArray = jrAnnoStr.split(";");
            for(String methodGroup : jrArray) {
                String[] methodArr = methodGroup.split(":");
                String[] methods = methodArr[0].split(",");
                for(String methodName : methods) {
                    String returnStr = methodArr[1];
                    String[] fields = getFieldNames(returnStr);
                    String returnType = getMethodTypeChain(dtoClass, fields);
                    if(methodIOParams.get(methodName) != null) {
                        methodIOParams.get(methodName).listIterator(1).next().put("RETURN_TYPE", returnType);
                    }
                }
            }
        }
    }

    protected static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, JsonResult4Pojo paramsOUTAnno, Class<?> dtoClass) {
        if(paramsOUTAnno != null && !"".equals(paramsOUTAnno.value())) {
            String jr4pAnnoStr = paramsOUTAnno.value();
            String[] jr4pArray = jr4pAnnoStr.split(";");
            for(String methodGroup : jr4pArray) {
                String[] methodArr = methodGroup.split(":");
                String[] methods = methodArr[0].split(",");
                for(String methodName : methods) {
                    String returnStr = methodArr[1];
                    String[] fields = getFieldNames(returnStr);
                    String returnType = getMethodTypeChain(dtoClass, fields);
                    if(methodIOParams.get(methodName) != null) {
                        methodIOParams.get(methodName).listIterator(1).next().put("RETURN_TYPE", returnType);
                    }
                }
            }
        }
    }

    /**
     * 解析表达式获得所有字段名
     * 
     * @param expression
     * @return
     */
    protected static String[] getFieldNames(String expression) {

        if(expression.startsWith("dto.")) {
            expression = expression.substring(4);
        }
        String[] fields = expression.split("\\.");
        return fields;
    }

    /**
     * 取得目标字段链的名称
     * 
     * @param expression
     * @return xxx.yyy.zzz
     */
    protected static String getFieldNameChain(String expression) {
        // int lastDotPoz = expression.indexOf('.');
        return expression; /* .substring(lastDotPoz + 1) */
    }

    /**
     * 取得目标方法链的返回类型
     * 
     * @param dtoClass
     * @param fields
     * @return xxxType|yyyType|zzzType
     */
    protected static String getMethodTypeChain(Class<?> dtoClass, String[] fields) {

        Method chain = null;
        StringBuffer returnType = new StringBuffer();
        try {
            chain = dtoClass.getMethod("get" + upperFirstChar(fields[0]));
            returnType.append(chain.getReturnType().getName());
        } catch(Exception e) {
            e.printStackTrace();
        }
        for(int i=1; i<fields.length; i++) {
            try {
                if(chain.getReturnType().getTypeParameters().length < 1) { // get方法返回RAW类型
                    chain = chain.getReturnType().getMethod("get" + upperFirstChar(fields[i]));
                } else { //  get方法返回范型类型
                    Class<?>[] parameterizedType = getParameterizedType(chain);
                    if(chain.getGenericReturnType().toString().startsWith("java.util.Map")) {
                        chain = (parameterizedType[1].getMethod("get" + upperFirstChar(fields[i])));
                        returnType.append("<").append(parameterizedType[0].getName()).append(",").append(parameterizedType[1].getName()).append(">");
                    } else {
                        chain = (parameterizedType[0].getMethod("get" + upperFirstChar(fields[i])));
                        returnType.append("<").append(parameterizedType[0].getName()).append(">");
                    }
                }
                returnType.append("|").append(chain.getReturnType().getName());
                
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        if(chain.getReturnType().getTypeParameters().length > 0) {  // 链中最后一环的处理
            Class<?>[] parameterizedType = getParameterizedType(chain);
            if(chain.getGenericReturnType().toString().startsWith("java.util.Map")) {
                returnType.append("<").append(parameterizedType[0].getName()).append(",").append(parameterizedType[1].getName()).append(">");
            } else {
                returnType.append("<").append(parameterizedType[0].getName()).append(">");
            }
        }
        return returnType.toString();
    }


    /**
     * 获取给定方法返回的范型类型的参数化类型
     * 
     * @param method
     * @return paramClass
     */
    protected static Class<?>[] getParameterizedType(Method method) {
        
        Type[] types = ((ParameterizedType)method.getGenericReturnType()).getActualTypeArguments();
        Class<?>[] paramClasses = null;
        if(types != null) {
            paramClasses = new Class<?>[types.length];
            for(int i=0; i<types.length; i++) {
                paramClasses[i] = (Class<?>)types[i];
            }
        }
        return paramClasses;
    }
    
    /**
     * 首字母大写
     * 
     * @param expression
     * @return
     */
    protected static String upperFirstChar(String expression) {
        char[] array = expression.toCharArray();
        array[0] -= 32;
        return String.valueOf(array);
    }

    /**
     * 首字母小写
     * 
     * @param expression
     * @return
     */
    protected static String lowerFirstChar(String expression) {
        char[] array = expression.toCharArray();
        array[0] += 32;
        return String.valueOf(array);
    }

    /**
     * 据blh名拼装action名
     * 
     * @param blhName
     * @return actionName
     * @throws StringIndexOutOfBoundsException
     */
    protected static String getDefaultActionByBlh(String blhName) throws StringIndexOutOfBoundsException {
        return blhName.substring(0, blhName.lastIndexOf("Blh")) + "Action";
    }

    /**
     * 据blh名拼装dto名
     * 
     * @param blhName
     * @return dtoName
     * @throws StringIndexOutOfBoundsException
     */
    protected static String getDefaultDtoByBlh(String blhName) throws StringIndexOutOfBoundsException {
        return blhName.substring(0, blhName.lastIndexOf("Blh")) + "Dto";
    }

    /**
     * 把拼接好的代码按指定包路径写到java源文件
     * 
     * @param fileType  "main"写ws包装类文件 / "test"写blh测试类文件
     * @param outputPackage
     * @param codeContent
     * @param outFileName
     */
    protected static void writeCodeFile(String fileType, String codeContent, String outputPackage, String outFileName) {
        
        String dirSeparator = File.separator;
        String outputPath = outputPackage.replaceAll("\\.", "\\"+dirSeparator);
        File outFile = null;
        if(fileType.equals("main")) {
            outFile = new File("src" + dirSeparator + "main" + dirSeparator + "java" + dirSeparator + outputPath + dirSeparator + outFileName + ".java");
        } else if(fileType.equals("test")){
            outFile = new File("src" + dirSeparator + "test" + dirSeparator + "java" + dirSeparator + outputPath + dirSeparator + outFileName + ".java");
        }else if(fileType.equals("wsspringxml")){
          	 outFile = new File("src" + dirSeparator + "main" + dirSeparator + "baseResources" + dirSeparator + outputPath + dirSeparator + outFileName + ".xml");
        }/**增加webservice的spring配置文件--add--by--jiatao--20140402*/
        BufferedWriter output = null;
        try {
            try {
                if(outFile.exists() && true || outFile.createNewFile()) {
                    output = new BufferedWriter(new FileWriter(outFile));
                }
            } catch(IOException e) {
                outFile.getParentFile().mkdirs();
                output = new BufferedWriter(new FileWriter(outFile));
            }
            output.write(codeContent);
            output.flush();
            output.close();
        } catch(IOException e) {
            e.printStackTrace();
        } finally {
            if(output != null) {
                try {
                    output.close();
                    output = null;
                } catch(IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 根据申明的参数类型返回正确的可实例化类型
     * 
     * @param definedType
     * @return correctType
     */
    protected static String correctType(String definedType) {
        
        if(definedType.endsWith(">")) {
            if(definedType.startsWith("java.util.Set")) {
                return definedType.replace("java.util.Set", "java.util.HashSet");
            }
            if(definedType.startsWith("java.util.List")) {
                return definedType.replace("java.util.List", "java.util.ArrayList");
            }
            if(definedType.startsWith("java.util.Map")) {
                return definedType.replace("java.util.Map", "java.util.HashMap");
            }
            return definedType;
        }
        return definedType;
    }

    /**
     * 根据带范型参数的申明类型返回所有参数类型
     * 
     * @param definedType
     * @return paramedType
     */
    protected static String[] paramedType(String definedType) {
        definedType = definedType.substring(definedType.indexOf('<')+1, definedType.indexOf('>'));
        return definedType.split("\\,");
    }
    
    /**
     * 根据类型名返回类型变量名
     * 
     * @param paramedType
     * @return paramedName
     */
    protected static String paramedName(String paramedType) {
        return lowerFirstChar(paramedType.substring(paramedType.lastIndexOf('.')+1));
    }
}
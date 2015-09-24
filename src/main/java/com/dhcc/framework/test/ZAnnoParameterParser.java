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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.tools.java2ws.JavaToWS;
import org.apache.struts2.convention.annotation.Namespace;
import org.junit.Before;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.dhcc.framework.annotation.Blh2WS;
import com.dhcc.framework.annotation.BlhNoParameter;
import com.dhcc.framework.annotation.BlhParameter;
import com.dhcc.framework.annotation.BlhParameters;
import com.dhcc.framework.annotation.JsonResult;
import com.dhcc.framework.annotation.JsonResult4Pojo;
import com.dhcc.framework.annotation.PmDataType;
import com.dhcc.framework.annotation.PmDataTypes;

/**
 * action和blh注解参数解析合成器，webservice包装类及其wsdl生成器，blh单元测试类生成器
 * 
 * @author 黎乐乔[joe7bit@163.com]
 */
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class ZAnnoParameterParser extends AbstractTransactionalJUnit4SpringContextTests {

    protected static Log logger = LogFactory.getLog(ZAnnoParameterParser.class);

    /**
     * <namespace, [blhClass, actClass, dtoClass]>
     */
    protected static Map<String, Class<?>[]> preParseMap = new HashMap<String, Class<?>[]>();

    /**
     * <namespace, <methodName, [<paramsIN_name, paramsIN_type>, <paramOUT_name, paramOUT_type>, <paramName, required>]>>
     */
    protected static Map<String, Map<String, List<Map<String, String>>>> parsedParamsMap = new HashMap<String, Map<String, List<Map<String, String>>>>();

    public Map<String, Map<String, List<Map<String, String>>>> getParsedParamsMap() {
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
                    && obj.getClass().getName().indexOf("com.dhcc.framework") < 0) {
                Class<?>[] clzHolder = new Class<?>[3];
                Class<?> blhClass = obj.getClass();
                clzHolder[0] = blhClass;
                System.out.println(blhClass);

                String[] packPath = blhClass.getName().split("\\.");
                String sysName = packPath[2];
                String busiName = packPath[packPath.length - 2];
                String actionName = "com.dhcc." + sysName + ".web." + busiName + ".action." + getDefaultActionByBlh(blhClass.getSimpleName());
                Class<?> actClass = null;
                try {
                    actClass = Class.forName(actionName);
                } catch(ClassNotFoundException e) {
                    // e.printStackTrace();
                }
                clzHolder[1] = actClass;
                System.out.println(actClass);

                String dtoName = "com.dhcc." + sysName + ".dto." + busiName + "." + getDefaultDtoByBlh(blhClass.getSimpleName());
                Class<?> dtoClass = null;
                try {
                    dtoClass = Class.forName(dtoName);
                } catch(ClassNotFoundException e) {
                    // e.printStackTrace();
                }
                clzHolder[2] = dtoClass;
                System.out.println(dtoClass);

                Namespace actionNS = (Namespace)actClass.getAnnotation(Namespace.class);
                // String namespace = "http:/" + actionNS.value() + ".ws." + busiName + ".web." + sysName + ".dhcc.com";
                String packageName = "com.dhcc." + sysName + ".ws." + busiName + "." + actionNS.value().substring(1);
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

            Method[] methods = blhClass.getDeclaredMethods();
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
                if(paramsINAnno != null) {
                    BlhParameter[] paramsIN = paramsINAnno.parameter();
                    for(BlhParameter param : paramsIN) {
                        String paramExpression = param.parameterExpress();
                        String[] fields = getFieldNames(paramExpression);
                        String paramName = getFieldNameChain(paramExpression);
                        String paramClass = getMethodTypeChain(dtoClass, fields);
                        String required = param.required() ? "true" : "false";
                        paramsMapIN.put(paramName, paramClass);
                        paramRequired.put(paramName, required);
                    }
                } else {
                    paramsMapIN.put("VOID_INPUT", null);
                }
                paramsMapList.add(paramsMapIN);
                paramsMapList.add(paramsMapOUT);
                paramsMapList.add(paramRequired);
                paramsMapOUT.put("RETURN_TYPE", "void");
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

            if(actClass != null) {
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
    private static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, PmDataTypes paramsOUTAnno) {
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

    private static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, JsonResult paramsOUTAnno, Class<?> dtoClass) {
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

    private static void setReturnType(Map<String, List<Map<String, String>>> methodIOParams, JsonResult4Pojo paramsOUTAnno, Class<?> dtoClass) {
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
    private static String[] getFieldNames(String expression) {

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
    private static String getFieldNameChain(String expression) {

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
    private static String getMethodTypeChain(Class<?> dtoClass, String[] fields) {

        Method chain = null;
        StringBuffer returnType = new StringBuffer();
        try {
            chain = dtoClass.getDeclaredMethod("get" + upperFirstChar(fields[0]));
            returnType.append(chain.getReturnType().getName());
        } catch(Exception e) {
            e.printStackTrace();
        }
        for(int i=1; i<fields.length; i++) {
            try {
                if(chain.getReturnType().getTypeParameters().length < 1) { // get方法返回RAW类型
                    chain = chain.getReturnType().getDeclaredMethod("get" + upperFirstChar(fields[i]));
                } else { // get方法返回范型类型
                    Class<?>[] parameterizedType = getParameterizedType(chain);
                    if(chain.getGenericReturnType().toString().startsWith("java.util.Map")) {
                        chain = (parameterizedType[1].getDeclaredMethod("get" + upperFirstChar(fields[i])));
                        returnType.append("<").append(parameterizedType[0].getName()).append(",").append(parameterizedType[1].getName()).append(">");
                    } else {
                        chain = (parameterizedType[0].getDeclaredMethod("get" + upperFirstChar(fields[i])));
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
    private static Class<?>[] getParameterizedType(Method method) {
        
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
    private static String upperFirstChar(String expression) {
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
    private static String lowerFirstChar(String expression) {
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
    private static String getDefaultActionByBlh(String blhName) throws StringIndexOutOfBoundsException {
        return blhName.substring(0, blhName.lastIndexOf("Blh")) + "Action";
    }

    /**
     * 据blh名拼装dto名
     * 
     * @param blhName
     * @return dtoName
     * @throws StringIndexOutOfBoundsException
     */
    private static String getDefaultDtoByBlh(String blhName) throws StringIndexOutOfBoundsException {
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
    private static void writeCodeFile(String fileType, String codeContent, String outputPackage, String outFileName) {
        
        String dirSeparator = File.separator;
        String outputPath = outputPackage.replaceAll("\\.", "\\"+dirSeparator);
        File outFile = null;
        if(fileType.equals("main")) {
            outFile = new File("src" + dirSeparator + "main" + dirSeparator + "java" + dirSeparator + outputPath + dirSeparator + outFileName + ".java");
        } else if(fileType.equals("test")){
            outFile = new File("src" + dirSeparator + "test" + dirSeparator + "java" + dirSeparator + outputPath + dirSeparator + outFileName + ".java");
        }
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
    private static String correctType(String definedType) {
        
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
    private static String[] paramedType(String definedType) {
        definedType = definedType.substring(definedType.indexOf('<')+1, definedType.indexOf('>'));
        return definedType.split("\\,");
    }
    
    /**
     * 根据类型名返回类型变量名
     * 
     * @param paramedType
     * @return paramedName
     */
    private static String paramedName(String paramedType) {
        return lowerFirstChar(paramedType.substring(paramedType.lastIndexOf('.')+1));
    }
    
    /**
     * 根据解析好的方法参数拼装ws包装类
     */
    public void generateWebServiceCode() {
        ZAnnoParameterParser.parseParams(preParseMap);
        System.err.println(parsedParamsMap.entrySet());
        if(parsedParamsMap.entrySet().size() > 0) {
            Iterator<Entry<String, Map<String, List<Map<String, String>>>>> entries = parsedParamsMap.entrySet().iterator();
            while(entries.hasNext()) {
                Entry<String, Map<String, List<Map<String, String>>>> entry = entries.next();
                StringBuffer code = new StringBuffer();
                String packageName = entry.getKey();
                String outputPackage = packageName.substring(0, packageName.lastIndexOf('.'));
                String blhPackName = preParseMap.get(packageName)[0].getName();
                Class<?> blhClass = null;
                try {
                    blhClass = Class.forName(blhPackName);
                } catch(ClassNotFoundException e) {
                    e.printStackTrace();
                }
                Blh2WS blh2WSClassAnno = blhClass.getAnnotation(Blh2WS.class);
                Method[] methodObjs = blhClass.getDeclaredMethods();
                Map<String, Method> methodMap = new HashMap<String, Method>();
                for(Method methodObj : methodObjs) {
                    methodMap.put(methodObj.getName(), methodObj);
                }
                String dtoPackName = preParseMap.get(packageName)[2].getName();
                String blhClassName = blhPackName.substring(blhPackName.lastIndexOf('.')+1);
                String dtoClassName = dtoPackName.substring(dtoPackName.lastIndexOf('.')+1);
                String entityName = dtoClassName.substring(0, dtoClassName.indexOf("Dto"));
                String outFileName = entityName + "WService";
                code.append("package " + outputPackage + ";\n\n");
                code.append("import javax.annotation.Resource;\n");
                code.append("import javax.annotation.PostConstruct;\n");
                code.append("import javax.xml.bind.annotation.XmlElement;\n");
                code.append("import org.apache.commons.logging.Log;\n");
                code.append("import org.apache.commons.logging.LogFactory;\n");
                code.append("import org.springframework.stereotype.Component;\n");
                code.append("import "+ blhPackName + ";\n");
                code.append("import "+ dtoPackName + ";\n");
                code.append("import com.dhcc.framework.transmission.event.BusinessRequest;\n\n");
                code.append("/**\n");
                code.append(" * @author auto-generated by AnnoParameterParser\n");
                code.append(" * @timestamp " + (new java.sql.Timestamp(System.currentTimeMillis()).toString()) + "\n");
                code.append(" */\n");
                if(blh2WSClassAnno != null) {
                    code.append("@com.dhcc.framework.annotation.Blh2WS(\"" + blh2WSClassAnno.value() + "\")\n");
                }
                code.append("@Component\n");
                code.append("@SuppressWarnings({\"unchecked\",\"unused\"})\n");
                code.append("public class " + outFileName + " {\n\n");
                code.append("    private static Log logger = LogFactory.getLog(" + outFileName + ".class);\n\n");
                code.append("    @Resource\n");
                code.append("    private " + blhClassName + " blh;\n\n");
                Iterator<Map.Entry<String,List<Map<String,String>>>> methods = entry.getValue().entrySet().iterator();
                while(methods.hasNext()) {
                    Entry<String, List<Map<String, String>>> method = methods.next();
                    Method methodObj = methodMap.get(method.getKey());
                    Blh2WS blh2WSMethodAnno = methodObj.getAnnotation(Blh2WS.class);
                    if(blh2WSMethodAnno != null) {
                        code.append("    @com.dhcc.framework.annotation.Blh2WS(\"" + blh2WSMethodAnno.value() + "\")\n");
                    }
                    String returnType = method.getValue().get(1).get("RETURN_TYPE");
                    Iterator<Entry<String, String>> params = method.getValue().get(0).entrySet().iterator();
                    Map<String, String> paramRequiredMap = method.getValue().get(2);
                    String methodParameters = "";
                    StringBuffer core = new StringBuffer();  //循环拼接核心代码
                    String[] paramNameArray = null;
                    String[] paramTypeArray = null;
                    Map<String, Object> cache = new HashMap<String, Object>(); //回溯缓存标记
                    while(params.hasNext()) {
                        Entry<String, String> param = params.next();
                        String paramNameChain = param.getKey();
                        String paramTypeChain = param.getValue();
                        paramNameArray = paramNameChain.split("\\.");
                        paramTypeArray = paramTypeChain.split("\\|");
                        int len = paramNameArray.length;
                        for(int i=0; i<len-1; i++) {  //参数方法链路处理
                            if(cache.get(paramNameArray[i]) == null) {
                                core.append("        " + paramTypeArray[i] + " " + paramNameArray[i] + " = new " + correctType(paramTypeArray[i]) + "();\n");
                                if(paramTypeArray[i].startsWith("java.util.Map")) {
                                    core.append("        " + paramedType(paramTypeArray[i])[0] + " " + paramedName(paramedType(paramTypeArray[i])[0]) + " = new " + correctType(paramedType(paramTypeArray[i])[0]) + "();\n");
                                    core.append("        " + paramedType(paramTypeArray[i])[1] + " " + paramedName(paramedType(paramTypeArray[i])[1]) + " = new " + correctType(paramedType(paramTypeArray[i])[1]) + "();\n");
                                    if(cache.get(paramNameArray[i+1]) == null && i<len-2) {
                                        core.append("        " + paramTypeArray[i+1] + " " + paramNameArray[i+1] + " = new " + correctType(paramTypeArray[i+1]) + "();\n");
                                        cache.put(paramNameArray[i+1], "OBJECT");
                                    }
                                    core.append("        " + paramedName(paramedType(paramTypeArray[i])[1]) + ".set" + upperFirstChar(paramNameArray[i+1]) + "(" + paramNameArray[i+1] + ");\n");
                                    core.append("        " + paramNameArray[i] + ".put" + "(" + paramedName(paramedType(paramTypeArray[i])[0] + "," + paramedName(paramedType(paramTypeArray[i])[1] + ");\n")));
                                    cache.put(paramNameArray[i+1], "METHOD");
                                }
                                if(paramTypeArray[i].startsWith("java.util.Set") || paramTypeArray[i].startsWith("java.util.List")) {
                                    core.append("        " + paramedType(paramTypeArray[i])[0] + " " + paramedName(paramedType(paramTypeArray[i])[0]) + " = new " + correctType(paramedType(paramTypeArray[i])[0]) + "();\n");
                                    if(cache.get(paramNameArray[i+1]) == null && i<len-2) {
                                        core.append("        " + paramTypeArray[i+1] + " " + paramNameArray[i+1] + " = new " + correctType(paramTypeArray[i+1]) + "();\n");
                                        cache.put(paramNameArray[i+1], "OBJECT");
                                    }
                                    core.append("        " + paramedName(paramedType(paramTypeArray[i])[0]) + ".set" + upperFirstChar(paramNameArray[i+1]) + "(" + paramNameArray[i+1] + ");\n");
                                    core.append("        " + paramNameArray[i] + ".add" + "(" + paramedName(paramedType(paramTypeArray[i])[0] + ");\n"));
                                    cache.put(paramNameArray[i+1], "METHOD");
                                }
                                cache.put(paramNameArray[i], "OBJECT");
                            }
                        }
                        for(int j=1; j<len; j++) {
                            if(cache.get(paramNameArray[j]) == "METHOD") {
                                continue;
                            }
                            core.append("        " + paramNameArray[j-1] + ".set" + upperFirstChar(paramNameArray[j]) + "(" + paramNameArray[j] + ");\n");
                        }
                        String requiredAnno = "";
                        if(paramRequiredMap.get(paramNameChain).equals("true")) {
                            requiredAnno = "@XmlElement(required=true, nillable=false) ";
                        }
                        methodParameters += requiredAnno + paramTypeChain.substring(paramTypeChain.lastIndexOf('|')+1) + " " + paramNameChain.substring(paramNameChain.lastIndexOf('.')+1) + ", ";
                    }
                    methodParameters = methodParameters.substring(0, methodParameters.lastIndexOf(','));
                    code.append("    public " + returnType + " " + method.getKey() + "(" + methodParameters + ") {\n\n");
                    code.append("        " + dtoClassName + " dto = new " + dtoClassName + "();\n");
                    code.append(core.toString());
                    code.append("        dto.set" + entityName + "(" + lowerFirstChar(entityName) + ");\n");
                    code.append("        BusinessRequest request = new BusinessRequest();\n");
                    code.append("        request.setDto(dto);\n\n");
                    code.append("        try {\n");
                    code.append("            blh." + method.getKey() + "(request);\n");
                    code.append("        } catch(Exception e) {\n");
                    code.append("            logger.error(e.getMessage(), e);\n");
                    code.append("        }\n");
                    if(returnType != "void") {
                        code.append("        if(dto.getPageModel() != null) {\n");
                        if(returnType.endsWith(">")) {
                            code.append("            return (" + returnType + ")dto.getPageModel().getPageData();\n");
                        } else {
                            code.append("            return (" + returnType + ")dto.getPageModel().getPageData().get(0);\n");
                        }
                        code.append("        }\n");
                        code.append("        return null;\n");
                    }
                    code.append("    }\n\n");
                }
                code.append("    @PostConstruct\n");
                code.append("    private void preRegister() {\n");
                code.append("        com.dhcc.framework.common.WsInfoHolder.registWsInfo(" + outFileName + ".class);\n");
                code.append("    }\n");
                code.append("}");
                
                writeCodeFile("main", code.toString(), outputPackage, outFileName);
                logger.info("wrapper codes generated to " + outputPackage);
                
                try {
                    Thread.sleep(1);  //确保系统不会乱序
                } catch(InterruptedException e) {
                    e.printStackTrace();
                }
                
                String compiledFile = "target/classes/" + outputPackage.replace('.', '/') + "/" + outFileName + ".class";
                if(new File(compiledFile).exists()) {  //若生成的源文件已编译好就自动再生成其wsdl文件
                    System.out.println("===========================" + compiledFile);
                    try {
                        Class<?> targetClass = Class.forName(outputPackage + "." + outFileName);
                        String wsdlTargetDir = "webContent/wsdl";
                        String soapAddress = "/ws/" + lowerFirstChar(outFileName);
                        String frontEnd = "simple";
                        String[] wsdlArgs = new String[] {"-wsdl", "-fe", frontEnd, "-a", soapAddress, "-d", wsdlTargetDir, targetClass.getName()};
                        new JavaToWS(wsdlArgs).run();
                        logger.info("wsdl for " + outFileName + " is generated to " + wsdlTargetDir);
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    logger.error("there's no " + outFileName + " source codes exist or it's not compiled yet.");
                }
            }
        } else {
            logger.error("there's nothing to generate. please check the annotations in blh and action.");
        }
    }

    /**
     * 根据解析的参数和blh方法生成单元测试
     */
    public void generateBlhTestCode() {
        ZAnnoParameterParser.parseParams(preParseMap);
        System.err.println(parsedParamsMap.entrySet());
        if(parsedParamsMap.entrySet().size() > 0) {
            Iterator<Entry<String, Map<String, List<Map<String, String>>>>> entries = parsedParamsMap.entrySet().iterator();
            while(entries.hasNext()) {
                Entry<String, Map<String, List<Map<String, String>>>> entry = entries.next();
                StringBuffer code = new StringBuffer();
                String packageName = entry.getKey();
                String outputPackage = packageName.substring(0, packageName.lastIndexOf('.')).replace(".ws.", ".blh.").replace("com.dhcc.", "com.dhcc.test.");
                String blhPackName = preParseMap.get(packageName)[0].getName();
                String dtoPackName = preParseMap.get(packageName)[2].getName();
                String blhClassName = blhPackName.substring(blhPackName.lastIndexOf('.')+1);
                String dtoClassName = dtoPackName.substring(dtoPackName.lastIndexOf('.')+1);
                String entityName = dtoClassName.substring(0, dtoClassName.indexOf("Dto"));
                String outFileName = blhClassName + "Test";
                code.append("package " + outputPackage + ";\n\n");
                code.append("import javax.annotation.Resource;\n");
                code.append("import org.junit.Test;\n");
                code.append("import org.junit.Assert;\n");
                code.append("import org.springframework.test.annotation.Rollback;\n");
                code.append("import "+ blhPackName + ";\n");
                code.append("import "+ dtoPackName + ";\n");
                code.append("import com.dhcc.framework.transmission.event.BusinessRequest;\n");
                code.append("import com.dhcc.framework.test.AbstractBaseTransactionalSpringContextTest;\n\n");
                code.append("/**\n");
                code.append(" * @author auto-generated by AnnoParameterParser\n");
                code.append(" * @timestamp " + (new java.sql.Timestamp(System.currentTimeMillis()).toString()) + "\n");
                code.append(" */\n");
                code.append("public class " + outFileName + " extends AbstractBaseTransactionalSpringContextTest {\n\n");
                code.append("    @Resource\n");
                code.append("    private " + blhClassName + " blh;\n\n");
                Iterator<Map.Entry<String,List<Map<String,String>>>> methods = entry.getValue().entrySet().iterator();
                while(methods.hasNext()) {
                    Entry<String, List<Map<String, String>>> method = methods.next();
                    String returnType = method.getValue().get(1).get("RETURN_TYPE");
                    Iterator<Entry<String, String>> params = method.getValue().get(0).entrySet().iterator();
                    String methodParameters = "";
                    StringBuffer core = new StringBuffer();  //循环拼接核心代码
                    StringBuffer parm = new StringBuffer();  //传入的实参列代码
                    String[] paramNameArray = null;
                    String[] paramTypeArray = null;
                    Map<String, Object> cache = new HashMap<String, Object>(); //回溯缓存标记
                    while(params.hasNext()) {
                        Entry<String, String> param = params.next();
                        String paramNameChain = param.getKey();
                        String paramTypeChain = param.getValue();
                        paramNameArray = paramNameChain.split("\\.");
                        paramTypeArray = paramTypeChain.split("\\|");
                        int len = paramNameArray.length;
                        for(int i=0; i<len-1; i++) {  //参数方法链路处理
                            if(cache.get(paramNameArray[i]) == null) {
                                core.append("        " + paramTypeArray[i] + " " + paramNameArray[i] + " = new " + correctType(paramTypeArray[i]) + "();\n");
                                if(paramTypeArray[i].startsWith("java.util.Map")) {
                                    core.append("        " + paramedType(paramTypeArray[i])[0] + " " + paramedName(paramedType(paramTypeArray[i])[0]) + " = new " + correctType(paramedType(paramTypeArray[i])[0]) + "();\n");
                                    core.append("        " + paramedType(paramTypeArray[i])[1] + " " + paramedName(paramedType(paramTypeArray[i])[1]) + " = new " + correctType(paramedType(paramTypeArray[i])[1]) + "();\n");
                                    if(cache.get(paramNameArray[i+1]) == null && i<len-2) {
                                        core.append("        " + paramTypeArray[i+1] + " " + paramNameArray[i+1] + " = new " + correctType(paramTypeArray[i+1]) + "();\n");
                                        cache.put(paramNameArray[i+1], "OBJECT");
                                    }
                                    core.append("        " + paramedName(paramedType(paramTypeArray[i])[1]) + ".set" + upperFirstChar(paramNameArray[i+1]) + "(" + paramNameArray[i+1] + ");\n");
                                    core.append("        " + paramNameArray[i] + ".put" + "(" + paramedName(paramedType(paramTypeArray[i])[0] + "," + paramedName(paramedType(paramTypeArray[i])[1] + ");\n")));
                                    cache.put(paramNameArray[i+1], "METHOD");
                                }
                                if(paramTypeArray[i].startsWith("java.util.Set") || paramTypeArray[i].startsWith("java.util.List")) {
                                    core.append("        " + paramedType(paramTypeArray[i])[0] + " " + paramedName(paramedType(paramTypeArray[i])[0]) + " = new " + correctType(paramedType(paramTypeArray[i])[0]) + "();\n");
                                    if(cache.get(paramNameArray[i+1]) == null && i<len-2) {
                                        core.append("        " + paramTypeArray[i+1] + " " + paramNameArray[i+1] + " = new " + correctType(paramTypeArray[i+1]) + "();\n");
                                        cache.put(paramNameArray[i+1], "OBJECT");
                                    }
                                    core.append("        " + paramedName(paramedType(paramTypeArray[i])[0]) + ".set" + upperFirstChar(paramNameArray[i+1]) + "(" + paramNameArray[i+1] + ");\n");
                                    core.append("        " + paramNameArray[i] + ".add" + "(" + paramedName(paramedType(paramTypeArray[i])[0] + ");\n"));
                                    cache.put(paramNameArray[i+1], "METHOD");
                                }
                                cache.put(paramNameArray[i], "OBJECT");
                            }
                        }
                        for(int j=1; j<len; j++) {
                            if(cache.get(paramNameArray[j]) == "METHOD") {
                                continue;
                            }
                            core.append("        " + paramNameArray[j-1] + ".set" + upperFirstChar(paramNameArray[j]) + "(" + paramNameArray[j] + ");\n");
                        }
                        methodParameters += paramTypeChain.substring(paramTypeChain.lastIndexOf('|')+1) + " " + paramNameChain.substring(paramNameChain.lastIndexOf('.')+1) + ", ";
                    }
                    methodParameters = methodParameters.substring(0, methodParameters.lastIndexOf(','));
                    String[] paramDefineLines = methodParameters.split(",");
                    for(int i=0; i<paramDefineLines.length; i++) {
                        String paramDefineLine = paramDefineLines[i].trim();
                        String paramClassName = paramDefineLine.split(" ")[0];
                        parm.append("        " + paramDefineLine + " = new " + paramClassName +"();\n");
                    }
                    code.append("    @Test\n");
                    code.append("    @Rollback(true)\n");
                    code.append("    public void " + method.getKey() + "() {\n\n");
                    code.append("        //请按业务实际情况设置所需的参数值进行测试\n" + parm.toString() + "\n");
                    code.append("        " + dtoClassName + " dto = new " + dtoClassName + "();\n");
                    code.append(core.toString());
                    code.append("        dto.set" + entityName + "(" + lowerFirstChar(entityName) + ");\n");
                    code.append("        BusinessRequest request = new BusinessRequest();\n");
                    code.append("        request.setDto(dto);\n\n");
                    code.append("        blh." + method.getKey() + "(request);\n");
                    if(returnType != "void") {
                        code.append("        Assert.assertNotNull(dto.getPageModel().getPageData());\n");
                    }
                    code.append("    }\n\n");
                }
                code.append("}");
                
                writeCodeFile("test", code.toString(), outputPackage, outFileName);
                logger.info("test codes generated to " + outputPackage);
                
            }
        } else {
            logger.error("there's nothing to generate. please check the annotations in blh and action.");
        }
    }
}
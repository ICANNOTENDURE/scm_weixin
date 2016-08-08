package com.dhcc.framework.common.codegen;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.dhcc.framework.annotation.JSCombo;
import com.dhcc.framework.common.entity.vo.easyui.DataGridColumn;
import com.dhcc.framework.util.JsonUtils;


/**
 * 
 * 根据模板生成原始代码工具类
 * @author ZangJH
 * @date 2013-9-9
 * @version V1.0
 */
public  abstract class CodeGenUtils {
	
	//模板文件根目录
	//private String TEMPLATE_BASE_DIR="src\\main\\baseResources\\codeTemplate\\";\
	//private static String TEMPLATE_BASE_DIR="src\\main\\baseResources\\codeTemplate\\";
	//action模板文件
	private static String ACTION_TEMPLATE="WebActionTemplate.dhcctemplate";
	//blh模板文件
	private static String BLH_TEMPLATE="BlhTemplate.dhcctemplate";
	//service模板文件
	private static String SERVICE_TEMPLATE="ServiceTemplate.dhcctemplate";
	//dao模板文件
	private static String DAO_TEMPLATE="DaoTemplate.dhcctemplate";
	
	private static String DTO_TEMPLATE="DtoTemplate.dhcctemplate";
	
	private static String SERVICEIMPL_TEMPLATE="ServiceImplTemplate.dhcctemplate";
	
	private static String JS_TEMPLATE="JsTemplate.dhcctemplate";
	
	private static String JSP_TEMPLATE="JspTemplate.dhcctemplate";
	
	private static String createTemplateType(String type) {
		
		String templateName="";
		switch (type.trim().toUpperCase()) {
		case "ACTION":
			templateName = ACTION_TEMPLATE;
			break;
		case "BLH":
			templateName = BLH_TEMPLATE;
			break;
		case "SERVICE":
			templateName = SERVICE_TEMPLATE;
			break;
		case "SERVICEIMPL":
			templateName = SERVICEIMPL_TEMPLATE;
			break;
		case "DAO":
			templateName = DAO_TEMPLATE;
			break;
		case "DTO":
			templateName = DTO_TEMPLATE;
			break;
		case "JS":
			templateName = JS_TEMPLATE;
			break;
		case "JSP":
			templateName = JSP_TEMPLATE;
			break;	
		default:
			break;
		}

		return templateName;

	}
	
	/**
	 * 方法名:          to1Upper
	 * 方法功能描述:    传入的字符串转成首字母大写
	 * @param:         
	 * @return:        String
	 * @Author:        ZangJH
	 * @Create Date:   2013-9-9 下午1:18:29
	 */
	private static String to1Upper(String str){
		return (char)((char)str.charAt(0)-'a'+'A')+ str.substring(1);
	}
	
	private static String to1Lower(String str){
		return (char)((char)str.charAt(0)+'a'-'A')+ str.substring(1);
	}
	
	private  static void readTemplateFile2Code(ArrayList<String> parmsList, String type){

		//String templateFileName = File.separator+"codeTemplate" +File.separator+ createTemplateType(type);
		String templateFileName ="/codeTemplate/"+ createTemplateType(type);
		//System.out.println(templateFileName);
		String dirSeparator = File.separator;
		//首字母转换大写
		String postfix =to1Upper(type);
		
		//通过packageName得到路径
		String innerDir = ((String)parmsList.get(0)).replaceAll("\\.", "\\\\");
		BufferedReader reader = null;
		BufferedWriter output = null;
		try {
			
			InputStreamReader fr = new InputStreamReader(CodeGenUtils.class.getResourceAsStream(templateFileName));
            //reader = new BufferedReader(new FileReader(templateFile));
			
            reader = new BufferedReader(fr);
            String tempString = null;
            File outFile = null;
           
			if ("serviceimpl".equals(type)) {
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + "service" + dirSeparator + parmsList.get(3).toLowerCase()
						+ dirSeparator + "impl"
						+ dirSeparator + parmsList.get(1) + "ServiceImpl" + ".java");
			}else if("action".equals(type)){
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + "web" + dirSeparator + parmsList.get(3).toLowerCase()
						+ dirSeparator + type
						+ dirSeparator + parmsList.get(1) + postfix + ".java");
			}else  if("dao".equals(type)){
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + type + dirSeparator + parmsList.get(3).toLowerCase()
						+ dirSeparator + parmsList.get(2) + postfix + ".java");
			}else  if("jsp".equals(type)){
				// 创建输出文件
				outFile = new File("webContent" + dirSeparator + "WEB-INF"
						+ dirSeparator + "jsp" 
						+ dirSeparator  + parmsList.get(3).toLowerCase()
						+ dirSeparator + parmsList.get(2)  + ".jsp");
				System.out.println("jsp:"+outFile);
			}else  if("js".equals(type)){
				// 创建输出文件
				outFile = new File("webContent" + dirSeparator + "js"
						+ dirSeparator + "dhcc" + dirSeparator + "pms" 
						+ dirSeparator  + parmsList.get(3).toLowerCase()
						+ dirSeparator + to1Lower(parmsList.get(2))  + ".js");
				System.out.println("JS:"+outFile);
			}else{
				if("dto".equals(type)){
				}else if("blh".equals(type)){
				}else if("service".equals(type)){
				}
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + type + dirSeparator + parmsList.get(3).toLowerCase()
						+ dirSeparator + parmsList.get(1) + postfix + ".java");
			}
                        
            
            try{
	            if(outFile.exists() && true || outFile.createNewFile()){
	            	output = new BufferedWriter(new FileWriter(outFile));
	            }
            }catch(IOException ex){
            	//通过是用捕获异常创建缺少路径（只有第一次试用模板的时候还会抛出该异常）
            	outFile.getParentFile().mkdirs(); 
            	output = new BufferedWriter(new FileWriter(outFile));
            }

            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
//            	if(templateFileName.indexOf("DaoTemplate.dhcctemplate")>=0){
//            		System.out.println(tempString);
//            	}
            	StringBuffer replaceString=new StringBuffer();
            		replaceString.append(tempString.replace("{$packageName}", parmsList.get(0))
    						.replace("{$businessName}", parmsList.get(1))
    						.replace("{$businessName_lower}", parmsList.get(1).toLowerCase())
    						.replace("{$businessName_1lower}", to1Lower(parmsList.get(1)))
    						.replace("{$entityName}", parmsList.get(2))
    						.replace("{$entityName_1lower}", to1Lower(parmsList.get(2)))
    						.replace("{$modulesName}", parmsList.get(3))
    						.replace("{$TableTr}", parmsList.get(4))
            				.replace("{$JsColoumn}", parmsList.get(5))
            				.replace("{$entitiyId_1Uper}", parmsList.get(6))
            				.replace("{$entitiyId}", parmsList.get(7)));
                output.write(replaceString.toString());
                output.newLine();
            }
            reader.close();
            output.close();
            System.out.println("ok");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e1) {
                }
            }
        }
	}
	
	/**
	 * 
	 * @param packageName:系统包前缀（包名） 如com.dhcc.ehr
	 * @param businessName:业务名 如  UserManager (首字母大字，每个单词首字母大写)
	 * @param entityName:实体类名 如   User
	 */
	public static void createCode(String packageName,String businessName,String entityName,String modulesName){
		
		ArrayList<String> parmsList = new ArrayList<String>();
		parmsList.add(packageName);
		parmsList.add(businessName);
		parmsList.add(entityName);
		parmsList.add(modulesName);
		parmsList.add(getJspTable(packageName,modulesName,entityName));
		parmsList.add(getJsGridColunm(packageName,modulesName,entityName));
		parmsList.add(to1Upper(getEnitiyId(packageName,modulesName,entityName)));
		parmsList.add(getEnitiyId(packageName,modulesName,entityName));
		//分别产生目前需要的文件 —— 四层
		for (String type : new String[]{"action","blh","serviceimpl","service","dao","dto","jsp","js"}){
			readTemplateFile2Code(parmsList,type);
		}
	}
	

	/**
	 * 
	* @Title: getJspTable 
	* @Description: TODO(获取实体类的属性放到jsp里) 
	* @param @param args
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年7月15日 下午10:25:41
	 */
	public static String getJspTable(String ...args) {
		
		StringBuffer stringBuffer=new StringBuffer();
		try {
			Class<?> userCla = Class.forName(args[0]+".entity."+args[1]+"."+args[2]);
			Field[] fs = userCla.getDeclaredFields();
			for (Field f:fs) {
				if("serialVersionUID".equals(f.getName())){
					continue;
				}
				javax.persistence.Id id=(javax.persistence.Id)f.getAnnotation(javax.persistence.Id.class);
				javax.persistence.Version version=(javax.persistence.Version)f.getAnnotation(javax.persistence.Version.class);
				if((id!=null)||(version!=null)){
					stringBuffer.append("<input type=\"hidden\" name=\"dto."+to1Lower(args[2])+"."+f.getName()+"\"/>");
					continue;
				}
				JSCombo jsCombo=(JSCombo)f.getAnnotation(JSCombo.class);
				if(jsCombo!=null){
					System.out.println(jsCombo.textField());
				}
				com.dhcc.framework.annotation.ColumnName columnName=(com.dhcc.framework.annotation.ColumnName) f.getAnnotation(com.dhcc.framework.annotation.ColumnName.class);
				String jspFileName=f.getName();
				if(columnName!=null){
					jspFileName=columnName.value();
				}
				stringBuffer.append("<tr>");
				stringBuffer.append("<td class='textLabel' style='text-align: right; width: 20%'>"+jspFileName+":</td>");
				stringBuffer.append("<td class='textParent' style='text-align: left; width: 30%'>");
				String easyUI="validatebox";
				if ((f.getGenericType().toString().equals("class java.util.Date"))||(f.getGenericType().toString().equals("class java.sql.Date"))) {
					easyUI="datebox";
				}else if(jsCombo!=null){
					easyUI="combox";
				}
				stringBuffer.append(" <input style='width: 250px;' class='"+easyUI+"' type='text' name='dto."+to1Lower(args[2])+"."+f.getName()+"' ></input>");
				stringBuffer.append("</td>");
				stringBuffer.append("</tr>");
			}
		} catch (Exception e) {
		}
		return stringBuffer.toString();
	
	}
	
	public static String getJsGridColunm(String ...args) {
		
		List<DataGridColumn> dataGridColumns=new ArrayList<DataGridColumn>();
		try {
			Class<?> userCla = Class.forName(args[0]+".entity."+args[1]+"."+args[2]);
			Field[] fs = userCla.getDeclaredFields();
			for (int i = 0; i < fs.length; i++) {
				Field f = fs[i];
				if("serialVersionUID".equals(f.getName())){
					continue;
				}
				DataGridColumn dataGridColumn=new DataGridColumn();
				javax.persistence.Id id=(javax.persistence.Id)f.getAnnotation(javax.persistence.Id.class);
				if(id!=null){
					dataGridColumn.setHidden(true);
				}
				com.dhcc.framework.annotation.ColumnName columnName=(com.dhcc.framework.annotation.ColumnName) f.getAnnotation(com.dhcc.framework.annotation.ColumnName.class);
				String jsTitle=f.getName();
				if(columnName!=null){
					jsTitle=columnName.value();
				}
				dataGridColumn.setField(f.getName());
				dataGridColumn.setTitle(jsTitle);
				dataGridColumn.setWidth(50);
				dataGridColumns.add(dataGridColumn);
			}
		} catch (Exception e) {
		}
		return JsonUtils.toJson(dataGridColumns);
	
	}
	
	public static String getEnitiyId(String ...args) {
	
		try {
			Class<?> userCla = Class.forName(args[0]+".entity."+args[1]+"."+args[2]);
			Field[] fs = userCla.getDeclaredFields();
			for (int i = 0; i < fs.length; i++) {
				Field f = fs[i];
				javax.persistence.Id id=(javax.persistence.Id)f.getAnnotation(javax.persistence.Id.class);
				if(id!=null){
					return f.getName();
				}
			}
		} catch (Exception e) {
			
		}
		return "";
	
	}
}

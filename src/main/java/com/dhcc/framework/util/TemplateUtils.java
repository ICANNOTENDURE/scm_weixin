package com.dhcc.framework.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;


/**
 * 
 * 根据模板生成原始代码工具类
 * @author ZangJH
 * @date 2013-9-9
 * @version V1.0
 */
public class TemplateUtils {
	
	//模板文件根目录
	private String TEMPLATE_BASE_DIR="src\\main\\baseResources\\codeTemplate\\";
	//action模板文件
	private String ACTION_TEMPLATE="WebActionTemplate.dhcctemplate";
	//blh模板文件
	private String BLH_TEMPLATE="BlhTemplate.dhcctemplate";
	//service模板文件
	private String SERVICE_TEMPLATE="ServiceTemplate.dhcctemplate";
	//dao模板文件
	private String DAO_TEMPLATE="DaoTemplate.dhcctemplate";
	
	private String DTO_TEMPLATE="DtoTemplate.dhcctemplate";
	
	private String SERVICEIMPL_TEMPLATE="ServiceImplTemplate.dhcctemplate";
	
	private String createTemplateType(String type) {
		
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
	private String to1Upper(String str){
		return (char)((char)str.charAt(0)-'a'+'A')+ str.substring(1);
	}
	
	private String to1Lower(String str){
		return (char)((char)str.charAt(0)+'a'-'A')+ str.substring(1);
	}
	
	private void readTemplateFile2Code(ArrayList<String> parmsList, String type){
		
		String templateFileName = TEMPLATE_BASE_DIR + createTemplateType(type);
		String dirSeparator = File.separator;
		//首字母转换大写
		String postfix =to1Upper(type);
		
//		System.out.println(postfix + "======>" + templateFileName);
		
		//通过packageName得到路径
		String innerDir = ((String)parmsList.get(0)).replaceAll("\\.", "\\\\");
		
//		System.out.println(innerDir);
		
		File templateFile = new File(templateFileName);
		BufferedReader reader = null;
		BufferedWriter output = null;
		try {
            
            reader = new BufferedReader(new FileReader(templateFile));
            String tempString = null;
            File outFile = null;
            
			if ("serviceimpl".equals(type)) {
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + "service" + dirSeparator + parmsList.get(1).toLowerCase()
						+ dirSeparator + "impl"
						+ dirSeparator + parmsList.get(1) + "ServiceImpl" + ".java");
			}else if("action".equals(type)){
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + "web" + dirSeparator + parmsList.get(1).toLowerCase()
						+ dirSeparator + type
						+ dirSeparator + parmsList.get(1) + postfix + ".java");
			}else {
				// 创建输出文件
				outFile = new File("src" + dirSeparator + "main"
						+ dirSeparator + "java" + dirSeparator + innerDir
						+ dirSeparator + type + dirSeparator + parmsList.get(1).toLowerCase()
						+ dirSeparator + parmsList.get(1) + postfix + ".java");
			}
            
//            System.out.println("src\\main\\java\\"+ innerDir + dirSeparator + parmsList.get(1) + type +".java");            
            
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
            	
//            	System.out.println("读入的文字" + tempString);
				String replaceString = tempString.replace("{$packageName}", parmsList.get(0))
						.replace("{$businessName}", parmsList.get(1))
						.replace("{$businessName_lower}", parmsList.get(1).toLowerCase())
						.replace("{$businessName_1lower}", to1Lower(parmsList.get(1)))
						.replace("{$entityName}", parmsList.get(2))
						.replace("{$entityName_1lower}", to1Lower(parmsList.get(2)));
            	
                output.write(replaceString);
                output.newLine();
            }
            reader.close();
            output.close();
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
	 * 方法名:          createCode
	 * 方法功能描述:    
	 * @param:         包名	业务名	VO类名（由JPA生成的实体类）
	 * @return:        void
	 * @Author:        ZangJH
	 * @Create Date:   2013-9-4 上午11:59:21
	 */
	public void createCode(String packageName,String businessName,String entityName){
		
		ArrayList<String> parmsList = new ArrayList<String>();
		parmsList.add(packageName);
		parmsList.add(businessName);
		parmsList.add(entityName);
		
		//分别产生目前需要的文件 —— 四层
		for (String type : new String[]{"action","blh","serviceimpl","service","dao","dto"}){
			
			readTemplateFile2Code(parmsList,type);
		}
	}
	
	public static void main(String[] args){
		
		TemplateUtils objTemplateUtils=new TemplateUtils();
		//入参：包名com.dhcc.ehr 业务名DeedDanger(例如DeedDangerBlh) 实体名DeedDanger(有可能与业务名相同但不一定)
		objTemplateUtils.createCode("com.dhcc.ehr", "DeedDanger", "DeedDanger");
		
	}
}

package com.dhcc.framework.common.cache.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.framework.common.cache.service.DictionaryCacheService;
import com.dhcc.framework.common.entity.BaseDictionary;
import com.dhcc.framework.hibernate.dao.CommonDao;


@Component("dictionaryCacheService")
@DependsOn("springContextHolder")
public class DictionaryCacheServiceImpl implements DictionaryCacheService {
	
	private static Log log = LogFactory.getLog(DictionaryCacheServiceImpl.class);
	
	private static Map<String,String> dictionaryHolder;
	/**
	 * 
	 */
	private static Map<String, List<BaseDictionary>> direcListMap = new HashMap<String,List<BaseDictionary>>();
	/**
	 * key 为字典type 
	 * value 为某类字段的map 它的key为字典value ,value这字典的名称
	 */
	private static Map<String, BaseDictionary> dictionaryMap = new HashMap<String,BaseDictionary>();
	
	public DictionaryCacheServiceImpl(){
		
	}
	
	
	@PostConstruct
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public   void init(){
		try {
			if(SpringContextHolder.getBean("dictionaryHolder")!=null){
				dictionaryHolder = SpringContextHolder.getBean("dictionaryHolder");
			}
			
			Iterator<Map.Entry<String, String>> it = dictionaryHolder.entrySet().iterator();
			CommonDao commonDao =  SpringContextHolder.getBean("commonDao");
			while (it.hasNext()) {
				Map.Entry<String, String> me = (Map.Entry<String, String>) it.next();
				List<BaseDictionary> list = commonDao.findDictionary(me.getValue());
				if(list!=null){
					String type = me.getKey();
					direcListMap.put(type, list);
					for(BaseDictionary dc :list){
						dictionaryMap.put(type+"_"+dc.getValue(), dc);
					}	 
				}
			}
		} catch (Exception e) {
			log.error("======PLS confirm if or not configuration dictionaryHolder=====");
			log.error(e.getMessage());
		}
		
	}

	/**
	 * 
	 * @param value 字典值 
	 * @param type  字典类型
	 * @return 字典名称  
	 */
	public static  String getDictNameByValueType(String value ,String type){
		if( dictionaryMap.get(type+"_"+value)!=null){
			return dictionaryMap.get(type+"_"+value).getDesc();
		}
		return "";
		
	}
	
	/**
	 * 
	 * @param type 字典类型
	 * @return 字典列表
	 */
	public static List<BaseDictionary> getDictListByType(String type){
		
		return direcListMap.get(type)==null?null:direcListMap.get(type);
	}

	public  Map<String, BaseDictionary> getDictionaryMap() {
		return dictionaryMap;
	}
	
	public  Map<String, List<BaseDictionary>> getDictionaryListMap() {
		return direcListMap;
	}
}

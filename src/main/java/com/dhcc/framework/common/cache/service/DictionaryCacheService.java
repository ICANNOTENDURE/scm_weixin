package com.dhcc.framework.common.cache.service;

import java.util.List;
import java.util.Map;

import com.dhcc.framework.common.entity.BaseDictionary;


public interface DictionaryCacheService {
	
	public void init();
	
	public Map<String, BaseDictionary> getDictionaryMap();
	
	public Map<String, List<BaseDictionary>> getDictionaryListMap();
	
}
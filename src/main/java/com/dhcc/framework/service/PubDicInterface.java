package com.dhcc.framework.service;

import java.util.List;
import java.util.Map;

import com.dhcc.framework.common.entity.vo.dict.BatchLoad;


public interface PubDicInterface {

	public  Map<String,List<BaseDic>> batchLoadDic(BatchLoad batchLoad);
	
	public  List<BaseDic> loadSingleDic(String dicTypeId);
}

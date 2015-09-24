package com.dhcc.framework.common.web.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.common.SpringContextHolder;
import com.dhcc.framework.common.cache.service.impl.DictionaryCacheServiceImpl;
import com.dhcc.framework.common.entity.BaseDictionary;
import com.dhcc.framework.common.entity.vo.dict.BatchLoad;
import com.dhcc.framework.service.BaseDic;
import com.dhcc.framework.service.PubDicInterface;




/**
 * 数据字曲公共服务类 类
 * @author liuyg
 * @version 0.5
 * @since 2013-08-17
 */
@Component
@Path("/dictService")
public class DictionaryResource {


	private static Log logger = LogFactory.getLog(DictionaryResource.class);
	@GET
	@Path("/find/{type}")
	@Produces({ MediaType.APPLICATION_JSON})
	public  List<BaseDictionary> find(@PathParam("type") String type) {
		
		return DictionaryCacheServiceImpl.getDictListByType(type);
		
	}
	
	
	@POST
	@Path("/batchLoad")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON})
	public Map<String,List<BaseDictionary>> load(BatchLoad batchLoad){
		if(batchLoad==null){
			return null;
		}
		if(batchLoad.getIds()==null||batchLoad.getIds().trim().equals("")){
			return null;
		}
		if(batchLoad.getDicts()==null||batchLoad.getDicts().trim().equals("")){
			return null;
		}
		String[] idsArr = batchLoad.getIds().split(",");
		String[] dictsArr =  batchLoad.getDicts().split(",");
		Map<String,List<BaseDictionary>>  resultMap = new HashMap<String,List<BaseDictionary>>(idsArr.length);
		int i = 0;
		for(String id :idsArr){
			List<BaseDictionary> currDict = DictionaryCacheServiceImpl.getDictListByType(dictsArr[i]);
			if(currDict!=null&&!currDict.isEmpty()){
				resultMap.put(id, currDict);
			}
			i++;
		}
		return resultMap;
	}
	@POST
	@Path("/pubBatchLoad")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON})
	public Map<String,List<BaseDic>> pubLoad(BatchLoad batchLoad){
		if(batchLoad==null){
			return null;
		}
		if(batchLoad.getIds()==null||batchLoad.getIds().trim().equals("")){
			return null;
		}
		if(batchLoad.getDicts()==null||batchLoad.getDicts().trim().equals("")){
			return null;
		}
		PubDicInterface pubDicInterface = null ;
		try {
			pubDicInterface = SpringContextHolder.getBean("pubDicInterface");
		} catch (Exception e) {
			logger.error("pub dic no pubDicInterface implements  "+e.getMessage(),e);
			return null;
		}
		return pubDicInterface.batchLoadDic(batchLoad);
	}
}

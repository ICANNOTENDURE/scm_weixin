/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ord;

import java.util.List;
import java.util.Map;

import com.dhcc.scm.dto.ord.OrdDto;
import com.dhcc.scm.entity.ord.OrderDetail;

public interface OrdService {

	public void list(OrdDto dto);
	

	public void listOrdr(OrdDto dto);
	
	public void deleteItm(OrdDto dto);
	
	/**
	 * 
	* @Title: OrdService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月29日 下午3:28:28
	* @version V1.0
	 */
	public void listDelv(OrdDto dto);
	
	/**
	 * 
	* @Title: OrdService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月29日 下午4:37:13
	* @version V1.0
	 */
	public void listDeliverItm(OrdDto dto);
	
	/**
	 * 
	* @Title: OrdService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年8月29日 下午5:00:22
	* @version V1.0
	 */
	public void deleteDelvItm(OrdDto dto);

	
	public void impOrd( Map<String, List<OrderDetail>> venMap);
}

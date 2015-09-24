/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.ven;

import java.util.Date;

import com.dhcc.scm.dto.ven.VenIncAdviceDto;
import com.dhcc.scm.entity.ven.VenIncAdvice;

public interface VenIncAdviceService {

	public void list(VenIncAdviceDto dto);
	
	public void save(VenIncAdviceDto dto);
	
	public void delete(VenIncAdviceDto dto);
	
	public void update(VenIncAdviceDto dto);
	
	public VenIncAdvice findById(VenIncAdviceDto dto);
	
	/**
	 * 
	* @Title: listVenIncAdvice 
	* @Description: TODO(查询商品咨询信息) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月5日 下午8:32:34
	 */
	public void listVenIncAdvice(VenIncAdviceDto dto);
	
	/**
	 * 
	* @Title: getVenIncAdviceNum 
	* @Description: TODO(查询供应商待回复咨询条数) 
	* @param     设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月6日 上午10:50:56
	 */
	public int getVenIncAdviceNum(Date date);
	
	/**
	 * 
	* @Title: getVenIncAdviceList 
	* @Description: TODO(查询供应商待回复商品列表) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月6日 下午1:41:19
	 */
	public void getVenIncAdviceList(VenIncAdviceDto dto);
	
	/**
	 * 
	* @Title: getNurIncAdviceNum 
	* @Description: TODO(查询护士咨询商品回复未读的数量) 
	* @param @param dto
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月7日 上午10:08:14
	 */
	public int getNurIncAdviceNum(VenIncAdviceDto dto);
}

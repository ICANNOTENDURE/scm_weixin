/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.comment;

import java.util.List;

import com.dhcc.scm.dto.comment.CommentDto;
import com.dhcc.scm.entity.vo.chart.ChartVO;


public interface CommentService {

	/**
	 * 
	* @Title: listVenEval 
	* @Description: TODO(查询供应商评价) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月15日 上午10:32:28
	 */
	public void listVenEval(CommentDto dto);
	
	public void listVenIncEval(CommentDto dto);
	
	public List<ChartVO> getIncTag(Long incid);
}

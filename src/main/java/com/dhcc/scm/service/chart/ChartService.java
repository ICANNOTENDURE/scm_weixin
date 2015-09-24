/**
 * 通过模板生成Service
 * template by zxx
 */
package com.dhcc.scm.service.chart;

import com.dhcc.scm.dto.chart.OrdVenDistributionDto;


public interface ChartService {

	/**
	 * 
	* @Title: ChartService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午1:59:40
	* @version V1.0
	 */
	public void listOrdVenDistribution(OrdVenDistributionDto dto);
	
	
	/**
	 * 
	* @Title: ChartService.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param dto
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午3:34:48
	* @version V1.0
	 */
	public void listOrdReqQty(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listEvalute 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年2月5日 下午7:46:36
	 */
	public void listEvalute(OrdVenDistributionDto dto);
	/**
	 * 
	* @Title: listLocAmt 
	* @Description: TODO(科室金恩) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 上午9:42:45
	 */
	public void listLocAmt(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listLocIncPrice 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 下午12:56:01
	 */
	public void listLocIncPrice(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listLocIncPriceByMon 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 下午2:20:43
	 */
	public void listLocIncPriceByMon(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: venSevenDayAmt 
	* @Description: TODO(供应商七天销售额) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月18日 上午10:11:11
	 */
	public void venSevenDayAmt(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: venOneMonthHotSale 
	* @Description: TODO(近一个月销售情况) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月18日 下午3:26:35
	 */
	public void venOneMonthHotSale(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listLocAmtGrpByDate 
	* @Description: TODO(按时间，科室统计金额) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 上午11:35:21
	 */
	public void listLocAmtGrpByDate(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listLocIncAmt 
	* @Description: TODO(科室采购金额按商品汇总) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 下午5:30:25
	 */
	public void listLocIncAmt(OrdVenDistributionDto dto);
	
	/**
	 * 
	* @Title: listLocGroupAmt 
	* @Description: TODO(当前登录科室采购金额按商品分类汇总) 
	* @param @param dto    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 下午4:51:50
	 */
	public void listLocGroupAmt(OrdVenDistributionDto dto);
}

package com.dhcc.scm.blh.chart;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.chart.OrdVenDistributionDto;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.vo.chart.BarVO;
import com.dhcc.scm.entity.vo.chart.ChartBarVO;
import com.dhcc.scm.entity.vo.chart.ChartResultSubVO;
import com.dhcc.scm.entity.vo.chart.ChartResultVO;
import com.dhcc.scm.entity.vo.chart.ChartVO;
import com.dhcc.scm.entity.vo.chart.ChartVenHotSaleVO;
import com.dhcc.scm.entity.vo.chart.EvaluteChartVO;
import com.dhcc.scm.service.chart.ChartService;

@Component
public class ChartBlh extends AbstractBaseBlh {

	
	private static Log logger = LogFactory.getLog(ChartBlh.class);
	
	@Resource
	private ChartService chartService;
	
	@Resource
	CommonService commonService;

	 

	
	/**
	 * 
	* @Title: ChartBlh.java
	* @Description: TODO(查询医院订单发货信息，登录主界面图表使用)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午2:04:26
	* @version V1.0
	 */
	public void listOrdVenDistribution(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		
		try {
			chartService.listOrdVenDistribution(dto);
			for(ChartVO chartVo:dto.getChartVOs()){
				dto.getNames().add(chartVo.getName());
			}
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	
	/**
	 * 
	* @Title: ChartBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年9月1日 下午3:35:51
	* @version V1.0
	 */
			
	public void listOrdReqQty(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		dto.setMaxQty(0);
		dto.setMinQty(0);
		try {
			chartService.listOrdReqQty(dto);
			for(ChartVO chartVo:dto.getChartVOs()){
				dto.getNames().add(chartVo.getName());
				dto.getValues().add(chartVo.getValue());
				dto.getValue1s().add(chartVo.getValue1());
				
				/*
				int tmpMax=Integer.valueOf(dto.getMaxQty()).intValue();
				int cur=Integer.valueOf(chartVo.getValue()).intValue();
				if(cur>tmpMax){
					dto.setMaxQty(Integer.valueOf(chartVo.getValue()));
					dto.setMaxQtyMonth(chartVo.getName());
				}
				int tmpMin=Integer.valueOf(dto.getMinQty()).intValue();
				int curMin=Integer.valueOf(chartVo.getValue()).intValue();
				if(curMin<tmpMin){
					dto.setMinQty(Integer.valueOf(chartVo.getValue()));
					dto.setMinQtyMonth(chartVo.getName());
				}
				*/
			}
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	public void listEvalute(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		
		try {
			chartService.listEvalute(dto);
			for(EvaluteChartVO evaluteChartVO:dto.getEvaluteChartVOs()){
				dto.getNames().add(evaluteChartVO.getName());
				dto.getValues().add(evaluteChartVO.getValue().toString());
				dto.getValue1s().add(evaluteChartVO.getValue1().toString());
				dto.getValue2s().add(evaluteChartVO.getValue2().toString());
				dto.getValue3s().add(evaluteChartVO.getValue3().toString());
				dto.getValue4s().add(evaluteChartVO.getValue4().toString());
			}
			super.writeJSON(dto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	/**
	 * 
	* @Title: listLocAMt 
	* @Description: TODO(查询科室金额) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 上午9:44:08
	 */
	public void listLocAMt(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.listLocAmt(dto);
			super.writeJSON(dto.getChartVOs());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	/**
	 * 
	* @Title: listLocIncPrice 
	* @Description: TODO(商品单品价格平均值) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年4月12日 下午12:28:28
	 */
	public void listLocIncPrice(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			
			chartService.listLocIncPrice(dto);
			ChartResultVO chartResultVO=new ChartResultVO();
			chartResultVO.setChartVOs(new ArrayList<ChartVO>());
			Map<String, String> locMap = new HashMap<String, String>();
			for(ChartVO chartVO:dto.getChartVOs()){
				locMap.put(chartVO.getName(), chartVO.getName());
				chartResultVO.getChartVOs().add(chartVO);
			}
		
			dto.getChartVOs().removeAll(dto.getChartVOs());
			Map<String, Map<String, String>> map = new HashMap<String, Map<String, String>>();
			chartService.listLocIncPriceByMon(dto);
			float maxPrice=0;
			for(ChartVO chartVO:dto.getChartVOs()){
				if(map.containsKey(chartVO.getName())){
					map.get(chartVO.getName()).put(chartVO.getValue1(),chartVO.getValue());
				}else{
					Map<String, String> locMap1=new HashMap<String, String>();;
					for(Map.Entry<String, String> entryLoc: locMap.entrySet()) {
						locMap1.put(entryLoc.getKey(),"0");
					}
					locMap1.put(chartVO.getValue1(), chartVO.getValue());
					map.put(chartVO.getName(),locMap1);
				}
				if(Float.parseFloat(chartVO.getValue())>maxPrice){
					maxPrice=Float.parseFloat(chartVO.getValue());
				}
			}
			chartResultVO.setMaxPrice(maxPrice*1.5f);
			List<ChartResultSubVO> chartResultSubVOs=new ArrayList<ChartResultSubVO>();
			for(Map.Entry<String, Map<String, String>> entry: map.entrySet()) {
				ChartResultSubVO chartResultSubVO=new ChartResultSubVO();
				chartResultSubVO.setMonth(entry.getKey());
				List<ChartVO> chartVO2=new ArrayList<ChartVO>();
				for(Map.Entry<String, String> entrySub: entry.getValue().entrySet()) {
					ChartVO chartVO=new ChartVO();
					chartVO.setName(entrySub.getKey());
					chartVO.setValue(entrySub.getValue());
					chartVO2.add(chartVO);
				}
				chartResultSubVO.setChartVOs(chartVO2);
				chartResultSubVOs.add(chartResultSubVO);
			}		   
			Collections.sort(chartResultSubVOs, new Comparator<ChartResultSubVO>() {
	            public int compare(ChartResultSubVO arg0, ChartResultSubVO arg1) {
	                return arg0.getMonth().compareTo(arg1.getMonth());
	            }
	        });
			chartResultVO.setChartResultSubVOs(chartResultSubVOs);
			super.writeJSON(chartResultVO);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	public void listLocIncPriceByMon(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.listLocIncPriceByMon(dto);
			super.writeJSON(dto.getChartVOs());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	
	
	/**
	 * 
	* @Title: venSevenDayAmt 
	* @Description: TODO(供应商七天销售额) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月18日 上午10:14:21
	 */
	@SuppressWarnings("static-access")
	public void venSevenDayAmt(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.venSevenDayAmt(dto);
//			Collections.sort(dto.getChartVOs(), new Comparator<ChartVO>() {
//	            public int compare(ChartVO arg0, ChartVO arg1) {
//	                return arg1.getName().compareTo(arg0.getName());
//	            }
//	        });
			List<ChartVO> chartVOs=new ArrayList<ChartVO>();
			Calendar calendar=Calendar.getInstance();   
			calendar.setTime(new Date());
			calendar.add(calendar.DATE, 1);
			for(int i=1;i<=7;i++){
				calendar.add(calendar.DATE, -1);
				ChartVO chartVO=new ChartVO();
				chartVO.setName(StringUtils.formatShortDate(calendar.getTime()));
				for(ChartVO chartVOtmp:dto.getChartVOs()){
					if(chartVOtmp.getName().equals(chartVO.getName())){
						chartVO.setValue(chartVOtmp.getValue());
					}
				}
				chartVOs.add(chartVO);
			}
			super.writeJSON(chartVOs);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	/**
	 * 
	* @Title: venOneMonthHotSale 
	* @Description: TODO(供应商近一个月热销产品) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 上午11:37:23
	 */
	public void venOneMonthHotSale(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.venOneMonthHotSale(dto);
			for(ChartVenHotSaleVO chartVenHotSaleVO:dto.getChartVenHotSaleVOs()){
				VenInc inc=commonService.get(VenInc.class, chartVenHotSaleVO.getIncid());
				chartVenHotSaleVO.setIncname(inc.getVenIncName());
				chartVenHotSaleVO.setLocqty(inc.getVenIncQty());
				if(inc.getVenIncQty()==null){
					chartVenHotSaleVO.setLocqty(0f);
				}
			}
			super.writeJSON(dto.getChartVenHotSaleVOs());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	
	
	/**
	 * 
	* @Title: listLocAmtGrpByDate 
	* @Description: TODO(医院按科室，时间分组统计金额) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 上午11:37:50
	 */
	public void locAmtGrpByDate(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.listLocAmtGrpByDate(dto);
			Map<String, Object> locMap = new HashMap<String, Object>();
			Map<String, Object> dateMap = new HashMap<String, Object>();
			Map<String, String> valueMap = new HashMap<String, String>();
			List<String> categoryList=new ArrayList<String>();
			List<ChartBarVO> chartBarVOs=new ArrayList<ChartBarVO>();
			for(BarVO barVO:dto.getBarVOs()){
				if(!locMap.containsKey(barVO.getCategory().toString())){
					locMap.put(barVO.getCategory(), null);
					categoryList.add(barVO.getCategory());
				}
				if(!dateMap.containsKey(barVO.getLegend())){
					dateMap.put(barVO.getLegend(), null);
				}
				valueMap.put(barVO.getLegend()+"||"+barVO.getCategory(),barVO.getSerie());
			}
			
			
			for(Map.Entry<String, Object> dateEntry: dateMap.entrySet()) {
				ChartBarVO chartBarVO=new ChartBarVO();
				chartBarVO.setLegend(dateEntry.getKey());
				List<String> series=new ArrayList<String>();
				for(Map.Entry<String, Object> locEntry: locMap.entrySet()) {
					String key=dateEntry.getKey()+"||"+locEntry.getKey();
					String value="0";
					if(valueMap.containsKey(key)){
						value=valueMap.get(key);
					}else {
						continue;
					}
					series.add(value);
				}
				chartBarVO.setCategory(categoryList);
				chartBarVO.setSeries(series);
				chartBarVOs.add(chartBarVO);
			 }
			Collections.sort(chartBarVOs,new Comparator<ChartBarVO>(){   
	            public int compare(ChartBarVO b1, ChartBarVO b2) {  
	                return b1.getLegend().compareTo(b2.getLegend());  
	            }  
	              
	        });
			super.writeJSON(chartBarVOs);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	/**
	 * 
	* @Title: locAmtPriceByDate 
	* @Description: TODO(医院按科室，商品,时间分组统计采购平均单价) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 上午9:48:59
	 */
	public void locAmtPriceByDate(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		try {
			chartService.listLocAmtGrpByDate(dto);
			Map<String, Object> locMap = new HashMap<String, Object>();
			Map<String, Object> dateMap = new HashMap<String, Object>();
			Map<String, String> valueMap = new HashMap<String, String>();
			List<String> categoryList=new ArrayList<String>();
			List<ChartBarVO> chartBarVOs=new ArrayList<ChartBarVO>();
			for(BarVO barVO:dto.getBarVOs()){
				if(!locMap.containsKey(barVO.getCategory().toString())){
					locMap.put(barVO.getCategory(), null);
					categoryList.add(barVO.getCategory());
				}
				if(!dateMap.containsKey(barVO.getLegend())){
					dateMap.put(barVO.getLegend(), null);
				}
				valueMap.put(barVO.getLegend()+"||"+barVO.getCategory(),barVO.getSerie());
			}
			
			
			for(Map.Entry<String, Object> dateEntry: dateMap.entrySet()) {
				ChartBarVO chartBarVO=new ChartBarVO();
				chartBarVO.setLegend(dateEntry.getKey());
				List<String> series=new ArrayList<String>();
				for(Map.Entry<String, Object> locEntry: locMap.entrySet()) {
					String key=dateEntry.getKey()+"||"+locEntry.getKey();
					String value="0";
					if(valueMap.containsKey(key)){
						value=valueMap.get(key);
					}else {
						continue;
					}
					series.add(value);
				}
				chartBarVO.setCategory(categoryList);
				chartBarVO.setSeries(series);
				chartBarVOs.add(chartBarVO);
			 }
			Collections.sort(chartBarVOs,new Comparator<ChartBarVO>(){   
	            public int compare(ChartBarVO b1, ChartBarVO b2) {  
	                return b1.getLegend().compareTo(b2.getLegend());  
	            }  
	              
	        });
			super.writeJSON(chartBarVOs);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
		
	}
	
	
	/**
	 * 
	* @Title: listLocIncAmt 
	* @Description: TODO(查询当前科室按商品汇总采购金额) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月22日 下午5:31:58
	 */
	public void locIncAmt(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		chartService.listLocIncAmt(dto);
		super.writeJSON(dto.getChartVOs());	
	}
	
	/**
	 * 
	* @Title: listLocGroupAmt 
	* @Description: TODO(当前登录科室采购金额按商品分类汇总) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月25日 下午4:52:57
	 */
	public void locGroupAmt(BusinessRequest res){
		OrdVenDistributionDto dto=super.getDto(OrdVenDistributionDto.class, res);
		chartService.listLocGroupAmt(dto);
		super.writeJSON(dto.getChartVOs());	
	}
}
	
	

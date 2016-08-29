/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.hv;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.dto.hv.HvLabelDto;
import com.dhcc.scm.entity.hv.HvLabel;
import com.dhcc.scm.entity.hv.HvPrintCount;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.service.hv.HvLabelService;
import com.fasterxml.jackson.core.type.TypeReference;

@Component
public class HvLabelBlh extends AbstractBaseBlh {


	@Resource
	private HvLabelService hvLabelService;
	
	@Resource
	private CommonService commonService;
	
	public HvLabelBlh() {
		
	}
	
	/**
	 * 进入某个列表的入口方法
	 * 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list
	 * 框架 在不调Ctrl时，不指定方法，就默认为它list，在action中通过
	 * json注解，所dto中的pageModel to json
	 * @param: res
	 *  
	 */
	public void list(BusinessRequest res) {
	
		HvLabelDto dto = super.getDto(HvLabelDto.class, res);
		
		//调用对应的service方法
		hvLabelService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HvLabelDto dto = super.getDto(HvLabelDto.class, res);
		
		try {
			if(StringUtils.isNotBlank(dto.getParStr())){
				@SuppressWarnings("unchecked")
				List<HvLabel> hvLabels =(List<HvLabel>) JsonUtils.toObject(dto.getParStr(),  new TypeReference<List<HvLabel>>() { });
				for(HvLabel tmpHvLabel:hvLabels){
					HvLabel hvLabel=commonService.get(HvLabel.class, tmpHvLabel.getHvId());
					hvLabel.setHvInvNo(tmpHvLabel.getHvInvNo());
					hvLabel.setHvInvNoDate(tmpHvLabel.getHvInvNoDate());
					commonService.saveOrUpdate(hvLabel);
					dto.getOperateResult().setResultCode("0");
				}
			}else{
				dto.getOperateResult().setResultContent("入参为空");
			}
		} catch (Exception e) {
			dto.getOperateResult().setResultContent(e.getMessage());
			e.printStackTrace();
		}finally{
			super.writeJSON(dto.getOperateResult());
		}
		
	}
	
	
	/**
	 * 
	* @Title: Print 
	* @Description: TODO(打印高值条码) 
	* @param @param res
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2016年8月22日 下午9:07:40
	 */
	public String Print(BusinessRequest res){
		HvLabelDto dto = super.getDto(HvLabelDto.class, res);
		if(dto.getVenIncIdPrn()==null){
			return "print";
		}
		try {
			VenInc inc=commonService.get(VenInc.class, dto.getVenIncIdPrn());
			dto.setIncname(inc.getVenIncName());
			String[] propertyNames={"printCountDate","printCountVenIncId"};
			Object[] values={new Date(),dto.getVenIncIdPrn()};
			List<HvPrintCount> hvPrintCounts=commonService.findByProperties(HvPrintCount.class, propertyNames, values);
			int currSeq=1;Long countId=null;
			if(hvPrintCounts.size()==0){
				HvPrintCount hvPrintCount=new HvPrintCount();
				hvPrintCount.setPrintCountDate(new Date());
				hvPrintCount.setPrintCountVenIncId(dto.getVenIncIdPrn());
				hvPrintCount.setPrintCountSeq(1);
				commonService.saveOrUpdate(hvPrintCount);
				countId=hvPrintCount.getPrintCountId();
			}else{
				currSeq=hvPrintCounts.get(0).getPrintCountSeq();
				countId=hvPrintCounts.get(0).getPrintCountId();
			}
			SimpleDateFormat sdf =new SimpleDateFormat("yyMMdd");
			dto.setBarCodes(new ArrayList<String>());
			for(int i=1;i<=dto.getVenCountPrn();i++){
				currSeq=currSeq+1;
				for(int j=1;j<=dto.getVenReaptPrn();j++){
					String bar=dto.getVenCodePrn()+dto.getVenIncCodePrn()+sdf.format(dto.getVenExpPrn())+sdf.format(new Date())+String.format("%04d", currSeq);
					dto.getBarCodes().add(bar);
				}
			}
			HvPrintCount hvPrintCount=commonService.get(HvPrintCount.class, countId);
			hvPrintCount.setPrintCountSeq(hvPrintCount.getPrintCountSeq()+dto.getVenCountPrn());
			commonService.saveOrUpdate(hvPrintCount);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "print";
	}
		
	
}

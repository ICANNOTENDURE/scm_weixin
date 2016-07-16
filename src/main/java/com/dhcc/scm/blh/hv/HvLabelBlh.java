/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.hv;

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
	
	
	
}

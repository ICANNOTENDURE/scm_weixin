package com.dhcc.scm.web.chart.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.dhcc.framework.annotation.Blh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.dto.BaseDto;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.BaseAction;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.chart.OrdVenDistributionDto;
import com.dhcc.scm.entity.cat.SubCatGroup;

@Namespace(value="/chart")
@Scope("prototype")
@Action(value="chartCtrl",results={
		@Result(name="venPortal" ,location="/WEB-INF/jsp/venPortal/venPortal.jsp"),
		@Result(name="hopLocAmt" ,location="/WEB-INF/jsp/chart/hopLocAmt.jsp"),
		@Result(name="hopLocIncPrice" ,location="/WEB-INF/jsp/chart/hopLocIncPrice.jsp"),
		@Result(name="listLocIncAmt" ,location="/WEB-INF/jsp/chart/locIncAmt.jsp"),
		@Result(name="listLocAmtGrpByDate" ,location="/WEB-INF/jsp/chart/listLocAmtGrpByDate.jsp"),
		@Result(name="listLocPriceGrpByDate" ,location="/WEB-INF/jsp/chart/listLocPriceGrpByDate.jsp"),
		@Result(name="listLocGroupAmt" ,location="/WEB-INF/jsp/chart/locGroupAmt.jsp"),
		@Result(name="hop" ,location="/WEB-INF/jsp/chart/hop.jsp")
})
@Blh("chartBlh")
public class ChartAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Resource
	private CommonService commonService;
	
	//DemoDto用于数据的传递
	private OrdVenDistributionDto dto=new OrdVenDistributionDto();
	@Override
	public BaseDto getBaseDto() {
		return dto;
	}

	@Override
	public String directlyJump() {
		//直接返回jsp
		if("index".equals(super.getBusinessFlow())){
			Long type=WebContextHolder.getContext().getVisit().getUserInfo().getUserType();
			if(type.toString().equals("1")){
				return "hop";
			}
			if(type.toString().equals("0")){
				
				return "hop";
			}
			if(type.toString().equals("2")){
				
				return "venPortal";
			}
			return "venPortal";
		}
		
		
		//各个科室金额
		if("hopLocAmt".equals(super.getBusinessFlow())){
			return "hopLocAmt";
		}
		//各个科室金额
		if("hopLocIncPrice".equals(super.getBusinessFlow())){
			dto.setSubCatGroups(commonService.getAll(SubCatGroup.class, "subParrefGroupID",false));
			return "hopLocIncPrice";
		}
		//全院科室采购金额环比
		if("listLocAmtGrpByDate".equals(super.getBusinessFlow())){
			return "listLocAmtGrpByDate";
		}
		//全院科室采购单价环比
		if("listLocPriceGrpByDate".equals(super.getBusinessFlow())){
			return "listLocPriceGrpByDate";
		}
		//科室采购金额
		if("listLocIncAmt".equals(super.getBusinessFlow())){
			return "listLocIncAmt";
		}
		if("listLocGroupAmt".equals(super.getBusinessFlow())){
			return "listLocGroupAmt";
		}
		return null;
	}
	
	/**
	 * 将页面请求过来的数据放到用户数据类中进行数据转换
	 */
	@Override
	protected void prepareRequest(BusinessRequest reqEvent) throws BaseException {
		reqEvent.setDto(dto);
	}

	public OrdVenDistributionDto getDto() {
		return dto;
	}

	public void setDto(OrdVenDistributionDto dto) {
		this.dto = dto;
	}

}

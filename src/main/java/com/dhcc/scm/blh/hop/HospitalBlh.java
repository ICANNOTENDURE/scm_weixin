/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.hop;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HospitalDto;
import com.dhcc.scm.entity.hop.Hospital;
import com.dhcc.scm.service.hop.HospitalService;


@Component
public class HospitalBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HospitalBlh.class);

	@Resource
	private HospitalService hospitalService;
	
	@Resource
	private CommonService commonService;
	
	public HospitalBlh() {
		
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
	
		HospitalDto dto = super.getDto(HospitalDto.class, res);

		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}	
		//调用对应的service方法
		hospitalService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HospitalDto dto = super.getDto(HospitalDto.class, res);
		if(dto.getHospital().getHospitalId()==null||
				(dto.getHospital().getHospitalId()).equals("")){
			dto.getHospital().setHospitalId(null);
			//调用对应的service方法
			hospitalService.save(dto);
		}else{
			hospitalService.update(dto);
		}
		
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HospitalDto dto = super.getDto(HospitalDto.class, res);
		
		//调用对应的service方法
		hospitalService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HospitalDto dto = super.getDto(HospitalDto.class, res);
		
		//调用对应的service方法
		hospitalService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HospitalDto dto = super.getDto(HospitalDto.class, res);
		
		//调用对应的service方法
		hospitalService.findById(dto);
		
	}
	
	
	/**
	 * 通过登录人员类型获取医院列表
	 * @author Administrator
	 * @param res
	 * @throws Exception
	 */
	
	public void getHospInfo(BusinessRequest res) throws Exception{
		HospitalDto dto = super.getDto(HospitalDto.class, res);
		List<Hospital> hospitals=new ArrayList<Hospital>();
		WebContext webContext = WebContextHolder.getContext();
		String type=webContext.getVisit().getUserInfo().getUserType().toString();
		//0,工作，1医院,2,供应商,3护士
		if("0".equals(type)){
			hospitals=hospitalService.getHospInfo(dto);
		}
		if(("1".equals(type))||("3".equals(type))){
			Long hop=webContext.getVisit().getUserInfo().getHopId();
			Hospital hospital=commonService.get(Hospital.class, hop);
			hospitals.add(hospital);
		}
		webContext.getResponse().getWriter().write(JsonUtils.toJson(hospitals));
	
	}
}

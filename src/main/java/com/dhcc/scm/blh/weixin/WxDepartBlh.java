/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.weixin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.WxCpDepart;
import me.chanjar.weixin.cp.bean.WxCpUser;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.scm.dto.weixin.WxDepartDto;
import com.dhcc.scm.dto.weixin.WxUserDto;
import com.dhcc.scm.entity.hop.HopCtloc;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.entity.weixin.WxDepart;
import com.dhcc.scm.service.weixin.WxDepartService;
import com.dhcc.scm.service.weixin.WxUserService;

@Component
public class WxDepartBlh extends AbstractBaseBlh {

	@Resource
	private WxDepartService wxDepartService;

	@Resource
	private CommonService commonService;

	@Resource
	private WxCpService wxCpService;
	
	@Resource
	private WxUserService wxUserService;

	public WxDepartBlh() {

	}

	/**
	 * 进入某个列表的入口方法 列表方法，也就是查询方法，调用的时候不需要xxxCtrl!list 框架
	 * 在不调Ctrl时，不指定方法，就默认为它list，在action中通过 json注解，所dto中的pageModel to json
	 * 
	 * @param: res
	 * 
	 */
	public void list(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);

		// 调用对应的service方法
		wxDepartService.list(dto);
	}

	// 保存
	public void save(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);

		// 调用对应的service方法
		try {

			WxCpDepart wxCpDepart = new WxCpDepart();
			wxCpDepart.setName(dto.getWxDepart().getWxDepartName());
			wxCpDepart.setId(dto.getWxDepart().getWxDepartId());
			wxCpDepart.setParentId(dto.getWxDepart().getWxDepartParentId());
			if (dto.getWxDepart().getWxDepartId() == null) {
				commonService.saveOrUpdate(dto.getWxDepart());
				wxCpDepart.setId(dto.getWxDepart().getWxDepartId());
				wxCpService.departCreate(wxCpDepart);
			} else {
				commonService.saveOrUpdate(dto.getWxDepart());
				wxCpDepart.setId(dto.getWxDepart().getWxDepartId());
				wxCpService.departUpdate(wxCpDepart);
			}
		} catch (WxErrorException e) {
			e.printStackTrace();
		}
	}
	
	// 删除
	public void delete(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);
		OperateResult operateResult = new OperateResult();
		try {
			wxCpService.departDelete(dto.getWxDepart().getWxDepartId());
			commonService.delete(commonService.get(WxDepart.class, dto.getWxDepart().getWxDepartId()));
			operateResult.setResultCode("0");
		} catch (WxErrorException e) {
			e.printStackTrace();
			operateResult.setResultContent(e.getMessage());
		} finally {
			super.writeJSON(operateResult);
		}
	}

	/**
	 * 修改初始化方法 也是根据iD查询实体的方法 在action加能过注解把这个实体to json
	 * 
	 * @param: res
	 * 
	 */
	public void findById(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);

		// 调用对应的service方法
		wxDepartService.findById(dto);

	}
	
	
	
	public void listUser(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);

		// 调用对应的service方法
		wxDepartService.list(dto);
		System.out.println(1);
	}
	
	public void saveUser(BusinessRequest res) {

		WxDepartDto dto = super.getDto(WxDepartDto.class, res);

		// 调用对应的service方法
		try {

			WxCpUser wxCpUser = new WxCpUser();
			wxCpUser.setEmail(dto.getWxUser().getWxUserEmail());
			wxCpUser.setMobile(dto.getWxUser().getWxUserTel());
			wxCpUser.setWeiXinId(dto.getWxUser().getWxUserWeixinId());
			wxCpUser.setName(dto.getWxUser().getWxUserName());
			if(dto.getWxUser().getWxUserDepartId()!=null){
				Integer[] departs=new Integer[dto.getWxUser().getWxUserDepartId()];
				wxCpUser.setDepartIds(departs);
			}
			if (StringUtils.isBlank(dto.getWxUser().getWxUserId())) {
				commonService.saveOrUpdate(dto.getWxUser());
				wxCpUser.setUserId(dto.getWxUser().getWxUserId());
				wxCpService.userCreate(wxCpUser);
			} else {
				commonService.saveOrUpdate(dto.getWxUser());
				wxCpUser.setUserId(dto.getWxUser().getWxUserId());
				wxCpService.userUpdate(wxCpUser);
			}
		} catch (WxErrorException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	* @Title: syncDepart 
	* @Description: TODO(同步平台供应商和科室到微信部门) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年9月2日 下午3:16:02
	 */
	public void syncLoc(BusinessRequest res) {
		
		WxDepartDto dto=new WxDepartDto();
		OperateResult operateResult=new OperateResult();
		Integer successCount=0;
		String hopKey = PropertiesBean.getInstance().getProperty("config.weixin.hopkey");
		List<WxDepart> hopDeparts=commonService.findByProperty(WxDepart.class, "wxDepartName", hopKey);
		Integer hopParent=hopDeparts.get(0).getWxDepartId();
		List<WxDepart> departs=commonService.findByProperty(WxDepart.class, "wxDepartParentId",hopParent);
		Map<String, WxDepart> departMap=new HashMap<String, WxDepart>();
		for(WxDepart wxDepart:departs){
			departMap.put(String.valueOf(wxDepart.getWxDepartScmId()), wxDepart);
		}
		//医院科室
		List<HopCtloc> hopCtlocs=commonService.getAll(HopCtloc.class, "hopCtlocId", true);
		try {
			for(HopCtloc hopCtloc:hopCtlocs){
				
				if(departMap.containsKey(String.valueOf(hopCtloc.getHopCtlocId()))){
					WxDepart wxDepart=departMap.get(Long.toString(hopCtloc.getHopCtlocId()));
					dto.setWxDepart(wxDepart);
					wxDepartService.update(dto);
				}else{
					WxDepart wxDepart=new WxDepart();
					wxDepart.setWxDepartName(hopCtloc.getName());
					wxDepart.setWxDepartScmId(hopCtloc.getHopCtlocId());
					wxDepart.setWxDepartParentId(hopParent);
					dto.setWxDepart(wxDepart);
					wxDepartService.save(dto);
				}
				successCount++;
			}
			operateResult.setResultCode("0");
			operateResult.setResultValue(Integer.toString(successCount));
		} catch (WxErrorException e) {
			e.printStackTrace();
			operateResult.setResultContent(e.getMessage());
			operateResult.setResultValue(Integer.toString(successCount));
		}finally{
			super.writeJSON(operateResult);
		}
		
	}
	
	/**
	 * 
	* @Title: syncVen 
	* @Description: TODO(同步平台供应商到微信通讯录 ) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年9月7日 上午9:04:02
	 */
	public void syncVen(BusinessRequest res) {
		
		WxDepartDto dto=new WxDepartDto();
		WxUserDto userDto=new WxUserDto();
		OperateResult operateResult=new OperateResult();
		Integer successCount=0;
		String venKey = PropertiesBean.getInstance().getProperty("config.weixin.venkey");
		List<WxDepart> venDeparts=commonService.findByProperty(WxDepart.class, "wxDepartName",venKey);
		if(venDeparts.size()==0){
			return;
		}

		Integer venParent=venDeparts.get(0).getWxDepartId();
		List<WxDepart> departs=commonService.findByProperty(WxDepart.class, "wxDepartParentId", venParent);
		Map<String, WxDepart> departMap=new HashMap<String, WxDepart>();
		for(WxDepart wxDepart:departs){
			departMap.put(String.valueOf(wxDepart.getWxDepartScmId()), wxDepart);
		}
		List<Vendor> vendors=commonService.getAll(Vendor.class, "vendorId", true);
		try {			
			for(Vendor vendor:vendors){
				if(StringUtils.isBlank(vendor.getName())){
					continue;
				}
				if(departMap.containsKey(String.valueOf(vendor.getVendorId()))){
					WxDepart wxDepart=departMap.get(Long.toString(vendor.getVendorId()));
					dto.setWxDepart(wxDepart);
					wxDepartService.update(dto);
				}else{
					dto.setWxDepart(null);
					WxDepart wxDepart=new WxDepart();
					wxDepart.setWxDepartName(vendor.getName());
					wxDepart.setWxDepartScmId(vendor.getVendorId());
					wxDepart.setWxDepartParentId(venParent);
					dto.setWxDepart(wxDepart);
					wxDepartService.save(dto);
				}
//				List<NormalUser> normalUsers=commonService.findByProperty(NormalUser.class, "vendorId", vendor.getVendorId());
//				for(NormalUser normalUser:normalUsers){
//					if(true){
//						continue;
//					}
//					if(StringUtils.isBlank(normalUser.getEmail())){
//						continue;
//					}
//					String[] propertyNames={"wxUserDepartId","wxUserScmId"};
//					Object[] values={dto.getWxDepart().getWxDepartId(),normalUser.getUserId()};
//					List<WxUser> users=commonService.findByProperties(WxUser.class, propertyNames, values);
//					userDto.setWxUser(new WxUser());
//					userDto.getWxUser().setWxUserDepartId(dto.getWxDepart().getWxDepartId());
//					userDto.getWxUser().setWxUserScmId(normalUser.getUserId());
//					userDto.getWxUser().setWxUserEmail(normalUser.getEmail());
//					userDto.getWxUser().setWxUserName(normalUser.getRealName());
//					if(users.size()==0){
//						wxUserService.save(userDto);
//					}else{
//						wxUserService.update(userDto);
//					}
//				}
		
				successCount++;
			}
			operateResult.setResultCode("0");
			operateResult.setResultValue(Integer.toString(successCount));
		} catch (WxErrorException e) {
			operateResult.setResultContent(e.getMessage());
			operateResult.setResultValue(Integer.toString(successCount));
			e.printStackTrace();
		}finally{
			super.writeJSON(operateResult);
		}
		
	}

}

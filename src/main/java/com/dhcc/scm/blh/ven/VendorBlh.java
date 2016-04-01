/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.ven;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.IpUtil;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.util.StringUtils;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VendorDto;
import com.dhcc.scm.entity.hop.HopVendorLog;
import com.dhcc.scm.entity.ord.OrderDetail;
import com.dhcc.scm.entity.ven.VenInc;
import com.dhcc.scm.entity.ven.VenQualifPic;
import com.dhcc.scm.entity.ven.VenQualifType;
import com.dhcc.scm.entity.ven.VenQualification;
import com.dhcc.scm.entity.ven.Vendor;
import com.dhcc.scm.entity.vo.ven.PortalInfoVo;
import com.dhcc.scm.entity.vo.ven.VenQualifTypeVO;
import com.dhcc.scm.service.ven.VenIncAdviceService;
import com.dhcc.scm.service.ven.VendorService;
import com.fasterxml.jackson.core.type.TypeReference;


@Component
public class VendorBlh extends AbstractBaseBlh {


	@Resource
	private VendorService vendorService;
	
	@Resource
	private VenIncAdviceService venIncAdviceService;
	
	@Resource
	private CommonService commonService;
	
	
	public VendorBlh() {
		
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
		VendorDto dto = super.getDto(VendorDto.class, res);
		//调用对应的service方法
		vendorService.list(dto);
	}
	/**
	 * 
	* @Title: listVendor 
	* @Description: TODO(供应商注册审核时使用) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月20日 上午9:07:03
	 */
	public void listVendor(BusinessRequest res) {
		VendorDto dto = super.getDto(VendorDto.class, res);
		//调用对应的service方法
		vendorService.listVendor(dto);
	}
	/**
	 * 
	* @Title: listVendorHistory 
	* @Description: TODO(供应商注册审) 	
	* @author hxy 
	* @date 2016年3月31日 13:33:03
	 */
	public void listVendorHistory(BusinessRequest res) {
		VendorDto dto = super.getDto(VendorDto.class, res);
		//调用对应的service方法
		vendorService.listVendorHistory(dto);	
	}
	
	/**
	 * 
	* @Title: VendorBlh.java
	* @Description: TODO(保存供应商)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月9日 上午9:36:31
	* @version V1.0
	 */
	public void save(BusinessRequest res) {
	
		VendorDto dto = super.getDto(VendorDto.class, res);
		HopVendorLog log=new HopVendorLog();
		StringBuilder logContent=new StringBuilder();
		try{
		List<VenQualification> venQualificationList=JsonUtils.toObject(dto.getVenQualificationList(), new TypeReference<List<VenQualification>>() { });
		if(dto.getVendor().getVendorId()==null){
			log.setOperateType("增加");
			if(StringUtils.isNullOrEmpty(dto.getVendor().getName())){
				logContent.append(" 名称:"+dto.getVendor().getName());
			}
			if(StringUtils.isNullOrEmpty(dto.getVendor().getEmail())){
				logContent.append(" 邮箱:"+dto.getVendor().getEmail());
			}
			if(StringUtils.isNullOrEmpty(dto.getVendor().getAddress())){
				logContent.append(" 地址:"+dto.getVendor().getAddress());
			}
			if(StringUtils.isNullOrEmpty(dto.getVendor().getContact())){
				logContent.append(" 联系人:"+dto.getVendor().getContact());
			}
			for(VenQualification venQualification:venQualificationList){
				if(venQualification.getExpdate()!=null){
					VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
					logContent.append(" "+venQualifType.getName()+"效期:"+StringUtils.formatShortDate(venQualification.getExpdate()));
				}
				if(org.apache.commons.lang.StringUtils.isNotBlank(venQualification.getDescription())){
					VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
					logContent.append(" "+venQualifType.getName()+":"+venQualification.getDescription());
				}
			}
		}else{
			log.setOperateType("修改");
			Vendor vendor=commonService.get(Vendor.class, dto.getVendor().getVendorId());
			if(!vendor.getName().equals(dto.getVendor().getName())){
				logContent.append(" 名称:"+dto.getVendor().getName());
			}
			if(!vendor.getEmail().equals(dto.getVendor().getEmail())){
				logContent.append(" 邮箱:"+dto.getVendor().getEmail());
			}
			if(!vendor.getAddress().equals(dto.getVendor().getAddress())){
				logContent.append(" 地址:"+dto.getVendor().getAddress());
			}
			if(!vendor.getContact().equals(dto.getVendor().getContact())){
				logContent.append(" 联系人:"+dto.getVendor().getContact());
			}
			for(VenQualification venQualification:venQualificationList){
				
				if(venQualification.getVenQualificationId()==null){
					if(venQualification.getExpdate()!=null){
						VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
						logContent.append(" "+venQualifType.getType()+":"+StringUtils.formatShortDate(venQualification.getExpdate()));
					}
					if(org.apache.commons.lang.StringUtils.isNotBlank(venQualification.getDescription())){
						VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
						logContent.append(" "+venQualifType.getName()+":"+venQualification.getDescription());
					}
				}else{
					VenQualification venQualificationTmp=commonService.get(VenQualification.class, venQualification.getVenQualificationId());
					if(!StringUtils.formatShortDate(venQualificationTmp.getExpdate()).equals(StringUtils.formatShortDate(venQualification.getExpdate()))){
						VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
						logContent.append(" "+venQualifType.getType()+":"+StringUtils.formatShortDate(venQualification.getExpdate()));
					}
					if(org.apache.commons.lang.StringUtils.isNotBlank(venQualification.getDescription())){
						VenQualifType venQualifType=commonService.get(VenQualifType.class, venQualification.getVenQualifTypeId());
						logContent.append(" "+venQualifType.getName()+":"+venQualification.getDescription());
					}
				}		
			}
		}
		dto.getVendor().setVenQualificationList(venQualificationList);
		vendorService.saveOrUpdate(dto);
		log.setVendorId(dto.getVendor().getVendorId());
		dto.setMessage("保存成功");
		dto.setSuccess(true);
		
		
		log.setOpContent(logContent.toString());
		log.setOperateIp(IpUtil.getIpAddrByRequest(WebContextHolder.getContext().getRequest()));
		log.setOperateDate(new Date());
		log.setOpUserName(WebContextHolder.getContext().getVisit().getUserInfo().getName());
		commonService.saveOrUpdate(log);
		}catch(Exception e){
			e.printStackTrace();
			dto.setSuccess(false);
			dto.setMsg(e.getMessage());
		}
	}
	
	
	/**
	 * 
	* @Title: VendorBlh.java
	* @Description: TODO(返回供应商列表下拉列表)
	* @param res
	* @throws IOException
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月9日 上午9:35:54
	* @version V1.0
	 */
	public void getVenCombox(BusinessRequest res) throws IOException {
		VendorDto dto = super.getDto(VendorDto.class, res);
		if(dto.getVendor()!=null){
			dto.getVendor().setName(new String(dto.getVendor().getName().getBytes("ISO8859-1"), "UTF-8").trim());
		}
		//WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(vendorService.findVenComboList(dto)));
		super.writeJSON(vendorService.findVenComboList(dto));
	}
	
	/**
	* 
	* @Title: VendorBlh.java
	* @Description: TODO(删除供应商)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月9日 上午9:35:22
	* @version V1.0
	 */
	public void delete(BusinessRequest res) {
	
		VendorDto dto = super.getDto(VendorDto.class, res);
		//调用对应的service方法
		vendorService.delete(dto);
	}
	
	/**
	 * 
	* @Title: VendorBlh.java
	* @Description: TODO(进入增加页面)
	* @return:void 
	* @author zhouxin  
	* @date 2014年5月9日 上午9:32:09
	* @version V1.0
	 */
	public void listMain(BusinessRequest res) {
		
		VendorDto dto = super.getDto(VendorDto.class, res);
		List<VenQualifType> venQualifTypeList=commonService.getAll(VenQualifType.class,"seq",true);
		List<VenQualifTypeVO> venQualifTypeVOList=new ArrayList<>();
		for(int i=0;i<venQualifTypeList.size();i++){
			VenQualifTypeVO venQualifTypeVO =new VenQualifTypeVO();
			venQualifTypeVO.setName(venQualifTypeList.get(i).getName());
			venQualifTypeVO.setType(venQualifTypeList.get(i).getVenQualifTypeId());
			venQualifTypeVOList.add(venQualifTypeVO);
		}
		dto.setVenQualifTypeVOList(venQualifTypeVOList);
		
	}
	
	/**
	 * 
	* 方法名:          delUpload
	* 方法功能描述:      删除文件
	* @param:         
	* @return:        
	 * @throws IOException 
	* @Author:        周鑫
	* @Create Date:   2014年04月30日
	 */
	public void deleteUpload(BusinessRequest res) {
		VendorDto dto = super.getDto(VendorDto.class, res);
		//删除upload文件夹下的所有文件
		VenQualifPic venQualifPic=commonService.get(VenQualifPic.class,Long.valueOf(dto.getVenQualifPicId()));
		String storePathString=ServletActionContext.getServletContext().getRealPath("/uploads")+"\\"+venQualifPic.getPath();
		File tempFile = new File(storePathString);
		try{
			FileUtils.forceDelete(tempFile);
			commonService.delete(venQualifPic);
			dto.setSuccess(true);
			super.writeResult(dto.getVenQualifPicId());
		}catch(Exception e){
			dto.setSuccess(false);
		}
	}
	/**
	 * 
	* 方法名:          upload
	* 方法功能描述:    上传文件到upload文件夹
	* @param:         
	* @return:        
	* @Author:        周鑫
	* @Create Date:   2014年04月15日
	 */
	public void upload(BusinessRequest res) throws Exception{
		VendorDto dto = super.getDto(VendorDto.class, res);
		Date date = new Date();
		SimpleDateFormat smDateFormat=new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
		
		//生成随机文件名
		String newFileName =smDateFormat.format(date) +UUID.randomUUID()+ com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
		//获取文件存储路径
		String storageFileName = ServletActionContext.getServletContext().getRealPath(File.separator+"uploads");
		//判断文件存储路径是否存在，若不存在则自动新建
		File document = new File(storageFileName);
		if (!document.exists()) {
			document.mkdir();
		}
		dto.setStorgeFileName(newFileName);
		File dstFile = new File(storageFileName,newFileName); 
        com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);
        
        vendorService.saveOrUpdatePic(dto);
        super.writeResult(dto.getVendor().getVendorId().toString());
 
	}

	/**
	 * 
	* @Title: findById 
	* @Description: TODO(根据供应商id查询名称) 
	* @param @param res
	* @param @throws IOException    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月27日 上午10:51:48
	 */
	public void findById(BusinessRequest res) throws IOException {
		
		VendorDto dto = super.getDto(VendorDto.class, res);
		Vendor vendor=commonService.get(Vendor.class, dto.getVendor().getVendorId());
		if(vendor!=null){
			super.writeResult(vendor.getName());
		}
	}
	
	
	
	/**
	 * 
	* @Title: getPortalInfo 
	* @Description: TODO(查询供应商登录portal信息) 
	* @param @param res    设定文件 
	* @return void    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月6日 上午10:53:05
	 */
	@SuppressWarnings("unchecked")
	public void getPortalInfo(BusinessRequest res){
		PortalInfoVo portalInfoVo=new PortalInfoVo();
		portalInfoVo.setAdviceNum(venIncAdviceService.getVenIncAdviceNum(null));
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -1);
		int todaydayAdviceNum=venIncAdviceService.getVenIncAdviceNum(cal.getTime());
		portalInfoVo.setTodayAdviceNum(todaydayAdviceNum);
		
		//新订单
		DetachedCriteria recieveCriteria = DetachedCriteria.forClass(OrderDetail.class);
		recieveCriteria.add(Restrictions.eq("orderVenId", Long.valueOf(super.getLoginInfo().get("VENDOR").toString())));
		recieveCriteria.add(Restrictions.eq("orderState", 1l));
		recieveCriteria.setProjection(Projections.rowCount());
		List<Long> rnewOrderNum=commonService.findByDetachedCriteria(recieveCriteria);
		portalInfoVo.setNewOrderNum(rnewOrderNum.get(0).intValue());
		
		//待发货
		DetachedCriteria sendCriteria = DetachedCriteria.forClass(OrderDetail.class);
		sendCriteria.add(Restrictions.eq("orderVenId", Long.valueOf(super.getLoginInfo().get("VENDOR").toString())));
		sendCriteria.add(Restrictions.eq("orderState",2l));
		sendCriteria.setProjection(Projections.rowCount());
		List<Long> sendOrderNum=commonService.findByDetachedCriteria(sendCriteria);
		portalInfoVo.setSendOrderNum(sendOrderNum.get(0).intValue());
				
		//退货申请
		DetachedCriteria reqCriteria = DetachedCriteria.forClass(OrderDetail.class);
		reqCriteria.add(Restrictions.eq("orderVenId", Long.valueOf(super.getLoginInfo().get("VENDOR").toString())));
		reqCriteria.add(Restrictions.eq("orderState", 6l));
		reqCriteria.setProjection(Projections.rowCount());
		List<Long> reqNum=commonService.findByDetachedCriteria(reqCriteria);
		portalInfoVo.setReqOrderNum(reqNum.get(0).intValue());
		
		//商品品种
		DetachedCriteria incQtyCriteria = DetachedCriteria.forClass(VenInc.class);
		incQtyCriteria.add(Restrictions.eq("venIncVenid", Long.valueOf(super.getLoginInfo().get("VENDOR").toString())));
		incQtyCriteria.setProjection(Projections.rowCount());
		List<Long> incQtyNum=commonService.findByDetachedCriteria(incQtyCriteria);
		portalInfoVo.setIncQtyNum(incQtyNum.get(0).intValue());	
		super.writeJSON(portalInfoVo);
	}
}

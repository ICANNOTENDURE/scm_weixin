/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ven;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.scm.dto.ven.VenIncQualifyPicDto;
import com.dhcc.scm.entity.sys.SysQualifType;
import com.dhcc.scm.entity.ven.VenIncqQualif;
import com.dhcc.scm.entity.ven.VenIncqQualifPic;
import com.dhcc.scm.tool.datetime.OperTime;
import com.fasterxml.jackson.core.type.TypeReference;

@Component
public class VenIncQualifPicBlh extends AbstractBaseBlh {

	@Resource
	private CommonService commonService;

	public VenIncQualifPicBlh() {

	}
	
	public void delete(BusinessRequest res){
		VenIncQualifyPicDto dto = super.getDto(VenIncQualifyPicDto.class, res);
		if(dto.getIncqQualifPic().getPicId()!=null){
			VenIncqQualifPic incqQualifPic=commonService.get(VenIncqQualifPic.class, dto.getIncqQualifPic().getPicId());
			String parentPath = ServletActionContext.getServletContext().getRealPath("/uploadPic/venIncQualify");
			try {
				FileUtils.forceDelete(new File(parentPath,incqQualifPic.getPicPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				//调用对应的service方法
				commonService.delete(incqQualifPic);
			}
		}
	}
	
	// 上传商品资质图片
	@SuppressWarnings("unchecked")
	public String uploadPic(BusinessRequest res) {

		VenIncQualifyPicDto dto = super.getDto(VenIncQualifyPicDto.class, res);
		try {
			// 生成随机文件名
			String newFileName = "VINCQUALIFY" + OperTime.getCurrentDate() + UUID.randomUUID() + com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
			// 获取文件存储路径
			String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadPic/venIncQualify");
			// 判断文件存储路径是否存在，若不存在则自动新建
			File document = new File(storageFileName);
			if (!document.exists()) {
				document.mkdir();
			}

			File dstFile = new File(storageFileName, newFileName);
			FileUtils.copyFile(dto.getUpload(), dstFile);

			DetachedCriteria criteria = DetachedCriteria.forClass(VenIncqQualif.class);
			criteria.add(Restrictions.eq("qualifyIncId", dto.getVenIncId()));
			criteria.add(Restrictions.eq("sysQualifType.qualifTypeId", dto.getQualifyTypeId()));
			List<VenIncqQualif> incqQualifs = commonService.findByDetachedCriteria(criteria);
			Long qualifyId;
			if (incqQualifs.size() < 1) {
				VenIncqQualif incqQualif = new VenIncqQualif();
				incqQualif.setQualifyIncId(dto.getVenIncId());
				incqQualif.setSysQualifType(commonService.get(SysQualifType.class, dto.getQualifyTypeId()));
				commonService.saveOrUpdate(incqQualif);
				qualifyId=incqQualif.getQualifyId();
			} else {
				qualifyId=incqQualifs.get(0).getQualifyId();
			}
			VenIncqQualifPic incqQualifPic=new VenIncqQualifPic(newFileName, qualifyId, dto.getUploadFileName());
			commonService.saveOrUpdate(incqQualifPic);
			dto.setIncqQualifPic(incqQualifPic);
			dto.getOperateResult().setResultCode("0");
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
		}finally{
			writeJSON(dto);
		}
		return "null";
	}
	
	// 上传商品资质图片 lvpeng 16-1-16
	@SuppressWarnings("unchecked")
	public String uploadPicmore(BusinessRequest res) {

		VenIncQualifyPicDto dto = super.getDto(VenIncQualifyPicDto.class, res);
	
		try {
			// 生成随机文件名
			String newFileName = "VINCQUALIFY" + OperTime.getCurrentDate() + UUID.randomUUID() + com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
			// 获取文件存储路径
			String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadPic/venIncQualify");
			// 判断文件存储路径是否存在，若不存在则自动新建
			File document = new File(storageFileName);
			if (!document.exists()) {
				document.mkdir();
			}

			File dstFile = new File(storageFileName, newFileName);
			FileUtils.copyFile(dto.getUpload(), dstFile);
			
			if(dto.getVenIncArrId()!=null){
				 String[] venIncId=dto.getVenIncArrId().split("#");
				 for (int i = 0; i < venIncId.length; i++) {
					 	//创建hibernate的工厂
					 	DetachedCriteria criteria = DetachedCriteria.forClass(VenIncqQualif.class);
					 	//添加查询条件
						criteria.add(Restrictions.eq("qualifyIncId", Long.valueOf(venIncId[i])));
						criteria.add(Restrictions.eq("sysQualifType.qualifTypeId", dto.getQualifyTypeId()));
						//返回查询数据存放
						List<VenIncqQualif> incqQualifs = commonService.findByDetachedCriteria(criteria);
						Long qualifyId;
						if (incqQualifs.size() < 1) {
							VenIncqQualif incqQualif = new VenIncqQualif();
							incqQualif.setQualifyIncId(Long.valueOf(venIncId[i]));
							incqQualif.setSysQualifType(commonService.get(SysQualifType.class, dto.getQualifyTypeId()));
							commonService.saveOrUpdate(incqQualif);
							qualifyId=incqQualif.getQualifyId();
						} else {
							qualifyId=incqQualifs.get(0).getQualifyId();
						}
						VenIncqQualifPic incqQualifPic=new VenIncqQualifPic(newFileName, qualifyId, dto.getUploadFileName());
						commonService.saveOrUpdate(incqQualifPic);
						dto.setIncqQualifPic(incqQualifPic);
						dto.getOperateResult().setResultCode("0");
				}
			}
			//int VenIncIdlength=dto.getVenIncArrId().split('#');
			
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
		}finally{
			writeJSON(dto);
		}
		return "null";
	}
	
	public void saveQualify(BusinessRequest res){
		VenIncQualifyPicDto dto = super.getDto(VenIncQualifyPicDto.class, res);
		try {
			if(StringUtils.isNotBlank(dto.getIncQualifStr())){
				List<VenIncqQualif> incqQualifs=JsonUtils.toObject(dto.getIncQualifStr(), new TypeReference<List<VenIncqQualif>>() { });
				for(VenIncqQualif incqQualif:incqQualifs){
					String[] propertyNames={"qualifyIncId","sysQualifType.qualifTypeId"};
					Object[] values={incqQualif.getQualifyIncId(),incqQualif.getSysQualifType().getQualifTypeId()};
					List<VenIncqQualif> incqQualifs2=commonService.findByProperties(VenIncqQualif.class, propertyNames, values);
					if(incqQualifs2.size()>0){
						incqQualif.setQualifyId(incqQualifs2.get(0).getQualifyId());
					}
						commonService.saveOrUpdate(incqQualif);
					
				}
				dto.getOperateResult().setResultCode("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
		}finally{
			super.writeJSON(dto.getOperateResult());
		}
	}
	
	//保存多个商品资质信息 lvpeng 16-1-18
	public void saveQualifymore(BusinessRequest res){
		VenIncQualifyPicDto dto = super.getDto(VenIncQualifyPicDto.class, res);
		try {
			if(StringUtils.isNotBlank(dto.getIncQualifStr())){
			String[] venIncId =dto.getVenIncArrId().split("#");
				for(int i=0;i<venIncId.length;i++){
					List<VenIncqQualif> incqQualifs=JsonUtils.toObject(dto.getIncQualifStr(), new TypeReference<List<VenIncqQualif>>() { });
					for(VenIncqQualif incqQualif:incqQualifs){
						String[] propertyNames={"qualifyIncId","sysQualifType.qualifTypeId"};
						Object[] values={Long.valueOf(venIncId[i]),incqQualif.getSysQualifType().getQualifTypeId()};
						List<VenIncqQualif> incqQualifs2=commonService.findByProperties(VenIncqQualif.class, propertyNames, values);
						if(incqQualifs2.size()>0){
							incqQualif.setQualifyId(incqQualifs2.get(0).getQualifyId());
						}
						incqQualif.setQualifyIncId(Long.valueOf(venIncId[i]));
						commonService.saveOrUpdate(incqQualif);
						
					}
			}
				dto.getOperateResult().setResultCode("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultContent(e.getMessage());
		}finally{
			super.writeJSON(dto.getOperateResult());
		}
	}
		
}

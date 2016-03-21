/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.ven;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.ven.VenIncPicDto;
import com.dhcc.scm.entity.ven.VenIncPic;
import com.dhcc.scm.entity.vo.ven.VenIncPicVo;
import com.dhcc.scm.service.ven.VenIncPicService;


@Component
public class VenIncPicBlh extends AbstractBaseBlh {


	@Resource
	private VenIncPicService venIncPicService;
	
	@Resource
	private CommonService commonService;
	
	private String venIncPicPathString;
	
	public VenIncPicBlh() {
		
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
	
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}
		//调用对应的service方法
		venIncPicService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		if(dto.getVenIncPic().getVenIncPicId()==null || 
				dto.getVenIncPic().getVenIncPicId().equals("")){
			dto.getVenIncPic().setVenIncPicId(null);
			dto.getVenIncPic().setVenIncPicPath(venIncPicPathString);
			venIncPicService.save(dto);
		}else{
			venIncPicService.update(dto);
		}
		
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		
		VenIncPic venIncPic=commonService.get(VenIncPic.class,dto.getVenIncPic().getVenIncPicId());
		String parentPath = ServletActionContext.getServletContext().getRealPath("/uploadPic");
		try {
			FileUtils.forceDelete(new File(parentPath,venIncPic.getVenIncPicPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//调用对应的service方法
			commonService.delete(venIncPic);
		}
		
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		
		//调用对应的service方法
		venIncPicService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		
		//调用对应的service方法
		venIncPicService.findById(dto);
		
	}
	
	//显示VenIncVo信息，即包括科室表中的指向医院Id对应的医院描述
	public void listInfo(BusinessRequest res) throws Exception {			
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);		
		List<VenIncPicVo> venIncPicVos=new ArrayList<VenIncPicVo>();		
		venIncPicVos=venIncPicService.getListInfo(dto);
		WebContext webContext = WebContextHolder.getContext();
		//webContext.getResponse().getWriter().write(JsonUtils.toJson(venIncPicVos));
		webContext.getResponse().getWriter().write(
				"{\"total\":"
						+ dto.getPageModel()
								.getTotals()
						+ ",\"rows\":"
						+ JsonUtils.toJson(venIncPicVos)
						+ "}");
	}
	
	/**
	 * 上传图片
	 * @param res
	 */
	public void upload(BusinessRequest res){
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		Date date = new Date();
		SimpleDateFormat smDateFormat=new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
		try{
			//生成随机文件名
			String newFileName =smDateFormat.format(date) +UUID.randomUUID()+ com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
				//获取文件存储路径
				String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadPic");
				//判断文件存储路径是否存在，若不存在则自动新建
				File document = new File(storageFileName);
			if(!document.exists()) {
				 document.mkdir();
			}
		
			File dstFile = new File(storageFileName,newFileName); 
			FileUtils.copyFile(dto.getUpload(), dstFile);
			
			VenIncPic venIncPic=new VenIncPic();
			venIncPic.setVenIncPicPath(newFileName);
			venIncPic.setVenIncPicVenincid(dto.getVendorIncId());
			venIncPic.setVenIncPicSeq(dto.getVendorIncPicSeq());
			List<VenIncPic> venIncPics=commonService.findByProperty(VenIncPic.class, "venIncPicVenincid", dto.getVendorIncId());
			long picSeq=(long)(venIncPics.size()+1);
			venIncPic.setVenIncPicSeq(picSeq);
			commonService.saveOrUpdate(venIncPic);
			dto.setVenIncPic(venIncPic);
			WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(dto));;
		}catch(Exception e)	{
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	* @Title: VenIncPicBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月15日 下午5:30:08
	* @version V1.0
	 * @throws IOException 
	 */
	public void listIncPic(BusinessRequest res) throws IOException{
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		WebContextHolder.getContext().getResponse().getWriter().write(JsonUtils.toJson(commonService.findByProperty(VenIncPic.class, "venIncPicVenincid", dto.getVendorIncId())));
	}
	
	
	/**
	 * 
	* @Title: VenIncPicBlh.java
	* @Description: TODO(用一句话描述该文件做什么)
	* @param res
	* @return:void 
	* @author zhouxin  
	* @date 2014年7月17日 上午10:15:05
	* @version V1.0
	 */
	public void saveSeq(BusinessRequest res) {
		VenIncPicDto dto = super.getDto(VenIncPicDto.class, res);
		VenIncPic venIncPic=commonService.get(VenIncPic.class, dto.getVendorIncPicId());
		venIncPic.setVenIncPicSeq(dto.getVendorIncPicSeq());
		commonService.saveOrUpdate(venIncPic);
	}
	
	
}

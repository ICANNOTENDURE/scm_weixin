/**
 * 通过模板生成Blh 
 * template by liuyg
 */
package com.dhcc.scm.blh.hop;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.JsonUtils;
import com.dhcc.framework.web.context.WebContext;
import com.dhcc.framework.web.context.WebContextHolder;
import com.dhcc.scm.dto.hop.HopIncPicDto;
import com.dhcc.scm.entity.vo.hop.HopIncPicVo;
import com.dhcc.scm.service.hop.HopIncPicService;


@Component
public class HopIncPicBlh extends AbstractBaseBlh {

	@SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(HopIncPicBlh.class);

	@Resource
	private HopIncPicService hopIncPicService;
	//最大缓存空间
	private static final int BUFFER_SIZE = 16 * 1024;
	private String hopIncPicPathString;
	
	public HopIncPicBlh() {
		
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
	
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		if(dto.getPageModel() == null){
			dto.setPageModel(new PagerModel());
		}
		//调用对应的service方法
		hopIncPicService.list(dto);
	}
	
	//保存
	public void save(BusinessRequest res) {
	
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		if(dto.getHopIncPic().getHopIncPicId()==null||
				(dto.getHopIncPic().getHopIncPicId()).equals("")){
			dto.getHopIncPic().setHopIncPicId(null);	
			//dto.getHopIncPic().setIncPicIncid(BigDecimal.valueOf(dto.getHopIncDr()));	
			dto.getHopIncPic().setIncPicPath(hopIncPicPathString);
			hopIncPicService.save(dto);		
		}else {
			//dto.getHopIncPic().setIncPicIncid(BigDecimal.valueOf(dto.getHopIncDr()));
			hopIncPicService.update(dto);
		}	

	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		
		//调用对应的service方法
		hopIncPicService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		
		//调用对应的service方法
		hopIncPicService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		
		//调用对应的service方法
		hopIncPicService.findById(dto);
		
	}
	
	//显示HopCtlocVo信息，即包括科室表中的指向医院Id对应的医院描述
	public void listInfo(BusinessRequest res) throws Exception {
				
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		List<HopIncPicVo> hopIncPicVos=new ArrayList<HopIncPicVo>();		
		hopIncPicVos=hopIncPicService.getListInfo(dto);
		WebContext webContext = WebContextHolder.getContext();
		//webContext.getResponse().getWriter().write(JsonUtils.toJson(hopIncPicVos));
		webContext.getResponse().getWriter().write(
				"{\"total\":"
						+ dto.getPageModel()
								.getTotals()
						+ ",\"rows\":"
						+ JsonUtils.toJson(hopIncPicVos)
						+ "}");
					
	}
	
	/**
	 * 上传图片
	 * @param res
	 */
	public void upload(BusinessRequest res){
		HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		Date date = new Date();
		SimpleDateFormat smDateFormat=new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
		try{
			//生成随机文件名
			String newFileName =smDateFormat.format(date) +UUID.randomUUID()+ this.getFileExp(dto.getUploadFileName());
				//获取文件存储路径
				String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads");
				//判断文件存储路径是否存在，若不存在则自动新建
				File document = new File(storageFileName);
			if(!document.exists()) {
				 document.mkdir();
			}
		
			File dstFile = new File(storageFileName,newFileName); 
			this.copyFile(dto.getUpload(), dstFile);
			//给hopIncPic中的hopIncPicPath字段赋值
			hopIncPicPathString=newFileName;
		}catch(Exception e)	{
			e.printStackTrace();
		}
        
        //WebContext context=WebContextHolder.getContext();
        
	}
	
	/**
	 * 
	 * 方法名:         getFileExp
	 * 方法功能描述:     获取文件的后缀名
	 * @param:         
	 * @return:        
	 * @Author:      周鑫
	 */
	private String getFileExp(String fileName) throws Exception{
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	/**
	 * 
	 * 方法名:          copyFile
	 * 方法功能描述:    拷贝源文件到指定位置
	 * @param:         
	 * @return:        
	 * @Author:        周鑫
	 */
	private void copyFile(File srcFile,File dstFile){
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			try{
				inputStream = new BufferedInputStream(new FileInputStream(srcFile),BUFFER_SIZE);
				outputStream = new BufferedOutputStream(new FileOutputStream(dstFile), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while(inputStream.read(buffer)>0){
					outputStream.write(buffer);
				}
			}finally{
				if(null!=inputStream){
					inputStream.close();
				}
				if(null!=outputStream){
					outputStream.close();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new DataBaseException(e.getMessage(), e);
		}
	}
	
	//删除图片
	public void deletePic(BusinessRequest res){
		//HopIncPicDto dto = super.getDto(HopIncPicDto.class, res);
		try{			
			String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploads");
			//判断文件存储路径是否存在，若不存在则自动新建
			File document = new File(storageFileName+"//"+hopIncPicPathString);
			if(!document.exists()) {
				 document.delete();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}

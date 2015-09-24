/**
 * 通过模板生成Blh 
 * template by zxx
 */
package com.dhcc.scm.blh.hop;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.app.service.CommonService;
import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.util.FileUtils;
import com.dhcc.scm.dto.hop.HopIncNewsDto;
import com.dhcc.scm.entity.hop.HopIncNews;
import com.dhcc.scm.entity.userManage.NormalAccount;
import com.dhcc.scm.entity.vo.ws.OperateResult;
import com.dhcc.scm.service.hop.HopIncNewsService;


@Component
public class HopIncNewsBlh extends AbstractBaseBlh {


	@Resource
	private HopIncNewsService hopIncNewsService;
	
	@Resource
	private CommonService commonService;
	
	public HopIncNewsBlh() {
		
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
	
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		if(dto.getHopIncNews()==null){
			dto.setHopIncNews(new HopIncNews());
		}
		String userType=super.getLoginInfo().get("USERTYPE").toString();
		dto.setUserType(userType);
		//护士
		if(userType.equals("3")){
			dto.getHopIncNews().setIncNewsType("2");
		}
		//供应商
		if(userType.equals("2")){
			dto.getHopIncNews().setIncNewsType("1");
		}
		//调用对应的service方法
		hopIncNewsService.list(dto);
	}
	
	/**
	 * 
	* @Title: hopIncNewsDetail 
	* @Description: TODO(医院查看新闻明细) 
	* @param @param res
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	* @author zhouxin   
	* @date 2015年5月11日 下午5:30:54
	 */
	public String hopIncNewsDetail(BusinessRequest res){
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		String userType=super.getLoginInfo().get("USERTYPE").toString();
		dto.setUserType(userType);
		if(dto.getHopIncNews()!=null){
			if(dto.getHopIncNews().getIncNewsId()!=null){
				HopIncNews hopIncNews=commonService.get(HopIncNews.class, dto.getHopIncNews().getIncNewsId());
				hopIncNews.setReadCount(hopIncNews.getReadCount()+1);
				NormalAccount normalAccount=commonService.get(NormalAccount.class, hopIncNews.getIncNewsUserId());
				hopIncNews.setUserName(normalAccount.getAccountAlias());
				dto.setHopIncNews(hopIncNews);
				commonService.saveOrUpdate(hopIncNews);
			}
		}
		return "hopIncNewsDetail";
		
	}

	//保存
	public String save(BusinessRequest res) {
	
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		dto.setOperateResult(new OperateResult());
		dto.setBackUrl("hop/hopIncNewsCtrl!listMain.htm");
		dto.setListUrl("hop/hopIncNewsCtrl!listNewsMain.htm");

		try {
			dto.getHopIncNews().setIncNewsUserId(Long.valueOf(super.getLoginInfo().get("USERID").toString()));
			dto.getHopIncNews().setIncNewsDate(new Date());
			if (dto.getUpload() != null) {
				Date date = new Date();
				SimpleDateFormat smDateFormat = new SimpleDateFormat("yyyy-MM-dd+HH-mm-ss");
				//生成随机文件名
				String newFileName = smDateFormat.format(date) + UUID.randomUUID().toString() + com.dhcc.framework.util.FileUtils.getFileExp(dto.getUploadFileName());
				//获取文件存储路径
				String storageFileName = ServletActionContext.getServletContext().getRealPath("/uploadNews");
				//判断文件存储路径是否存在，若不存在则自动新建
				File document = new File(storageFileName);
				if (!document.exists()) {
					document.mkdir();
				}

				File dstFile = new File(storageFileName, newFileName);
				if(FileUtils.getFileSizes(dto.getUpload())>BaseConstants.MAX_SIZE){
					dto.getOperateResult().setResultCode("-1");
					dto.getOperateResult().setResultContent("附件大小不能超过50M！");
					return "operateResult";
				}
				com.dhcc.framework.util.FileUtils.copyFile(dto.getUpload(), dstFile, BaseConstants.BUFFER_SIZE);
				dto.getHopIncNews().setIncNewsPath(newFileName);
			}
			commonService.saveOrUpdate(dto.getHopIncNews());
			dto.getOperateResult().setResultCode("1");
			dto.getOperateResult().setResultContent("增加通知成功！");
			return "operateResult";
		} catch (Exception e) {
			e.printStackTrace();
			dto.getOperateResult().setResultCode("-1");
			dto.getOperateResult().setResultContent("增加通知失败！"+e.getMessage());
			return "operateResult";
		}
	
	}
	
	//删除
	public void delete(BusinessRequest res) {
	
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		
		//调用对应的service方法
		hopIncNewsService.delete(dto);
	}
	
	//更新
	public void update(BusinessRequest res) {
	
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		
		//调用对应的service方法
		hopIncNewsService.update(dto);
	}
	
	/**
	 * 修改初始化方法
	 * 也是根据iD查询实体的方法
	 * 在action加能过注解把这个实体to json
	 * @param: res
	 *  
	 */
	public void findById(BusinessRequest res) {
	
		HopIncNewsDto dto = super.getDto(HopIncNewsDto.class, res);
		
		//调用对应的service方法
		hopIncNewsService.findById(dto);
		
	}
	
}

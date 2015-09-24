package com.dhcc.framework.common.config.blh;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.dhcc.framework.app.blh.AbstractBaseBlh;
import com.dhcc.framework.common.PagerModel;
import com.dhcc.framework.common.config.HibPropertiesBean;
import com.dhcc.framework.common.config.PropertiesBean;
import com.dhcc.framework.common.config.SpringSetupContextHolder;
import com.dhcc.framework.common.config.dto.PropertiesDto;
import com.dhcc.framework.common.config.vo.ConfItem;
import com.dhcc.framework.exception.DataBaseException;
import com.dhcc.framework.transmission.event.BusinessRequest;
import com.dhcc.framework.web.context.WebContextHolder;

/**
 * @author daichao
 *
 */
@Component
public class PropertiesBlh extends AbstractBaseBlh {
	
	@Resource
	PropertiesBean propertiesBean;
	
	@Resource
	HibPropertiesBean hibPropertiesBean;
	
	
	
	private static Log logger=LogFactory.getLog(PropertiesBlh.class);
	
	public PropertiesBlh() {
	}
	
	/**
	 * 重启方法
	 */
	public void refressh(BusinessRequest res){
		try {
			propertiesBean.setProperty("conf.setup.flg","1");
			propertiesBean.write();
			SpringSetupContextHolder.refressh();
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(),e);
		}
	}
	
	public void test(BusinessRequest res){
		Connection connection = null;
		try {
			String url=hibPropertiesBean.getProperty("jdbc.url");
			String driver=hibPropertiesBean.getProperty("jdbc.driver");
			String username=hibPropertiesBean.getProperty("jdbc.username");
			String password=hibPropertiesBean.getProperty("jdbc.password");
			Class.forName(driver);
			connection=DriverManager.getConnection(url, username, password);
			WebContextHolder.getContext().getResponse().getWriter().write("succ");
		} catch (Exception e) {
			try {
				WebContextHolder.getContext().getResponse().getWriter().write("error");
			} catch (IOException e1) {
				logger.error(e.getMessage(),e1);
			}
		}finally{
			if(connection!=null){
				try {
					connection.close();
				} catch (SQLException e) {
					logger.error(e.getMessage(),e);
				}
			}
		}
	}
	
	public void list(BusinessRequest res){
			PropertiesDto dto=super.getDto(PropertiesDto.class, res);
			List<ConfItem>confItems=null;
			
			if("hibPropertiesCtrl".equals(dto.getActionName())){
				confItems=getAllProperties(hibPropertiesBean);
			}else if("propertiesCtrl".equals(dto.getActionName())){
				confItems=getAllProperties(propertiesBean);
			}
			
			PagerModel pagerModel=new PagerModel();
			pagerModel.setPageData(confItems);
			pagerModel.setPageNo(1);
			pagerModel.setPageSize(confItems.size());
			pagerModel.setTotals(confItems.size());		
			dto.setPageModel(pagerModel);
			
	}
	
	public synchronized void save(BusinessRequest res){
		
		try {
		PropertiesDto dto=super.getDto(PropertiesDto.class, res);
		ConfItem confItem=dto.getConfItem();
		
		if("propertiesCtrl".equals(dto.getActionName())){
			propertiesBean.setProperty(confItem.getKey().trim(), confItem.getValue().trim());
			propertiesBean.write();
		}else if("hibPropertiesCtrl".equals(dto.getActionName())) {
			hibPropertiesBean.setProperty(confItem.getKey().trim(), confItem.getValue().trim());
			hibPropertiesBean.write();
		}
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(),e);
		}
	}
	
	public synchronized void delete(BusinessRequest res){
		
		try {
		PropertiesDto dto=super.getDto(PropertiesDto.class, res);
		ConfItem confItem=dto.getConfItem();
		
		if("propertiesCtrl".equals(dto.getActionName())){
			propertiesBean.remove(confItem.getKey());
			propertiesBean.write();
		}else if("hibPropertiesCtrl".equals(dto.getActionName())) {
			hibPropertiesBean.remove(confItem.getKey());
			hibPropertiesBean.write();
		}
		} catch (Exception e) {
			throw new DataBaseException(e.getMessage(),e);
		}
	}
	
	public void findById(BusinessRequest res){
		
		try{
		PropertiesDto dto=super.getDto(PropertiesDto.class, res);
		ConfItem confItem=dto.getConfItem();
		
		if("propertiesCtrl".equals(dto.getActionName())){
			String value=(String) propertiesBean.get(confItem.getKey());
			confItem.setValue(value);
			dto.setConfItem(confItem);
			propertiesBean.write();
		}else if("hibPropertiesCtrl".equals(dto.getActionName())) {
			String value=(String) hibPropertiesBean.get(confItem.getKey());
			hibPropertiesBean.get(confItem.getKey());
			confItem.setValue(value);
			dto.setConfItem(confItem);
			hibPropertiesBean.write();
		}
		}catch(Exception e){
			throw new DataBaseException(e.getMessage(),e);
		}
	}
	
	private List< ConfItem> getAllProperties(Properties properties){
		
			List<ConfItem>confItems=new ArrayList<ConfItem>();
			Enumeration<String> keys=(Enumeration<String>) properties.propertyNames();
			while (keys.hasMoreElements()) {
				String key = (String) keys.nextElement();
				if("conf.setup.flag".equals(key)){
					continue;
				}
				String value=(String) properties.get(key);
				ConfItem confItem=new ConfItem();
				confItem.setKey(key);
				confItem.setValue(value);
				confItems.add(confItem);
			}
			Collections.sort(confItems);
			return confItems;
	}
	
}

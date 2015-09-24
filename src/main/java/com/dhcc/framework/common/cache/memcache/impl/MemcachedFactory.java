package com.dhcc.framework.common.cache.memcache.impl;

import java.io.IOException;

import javax.annotation.PostConstruct;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.MemcachedClientBuilder;
import net.rubyeye.xmemcached.XMemcachedClientBuilder;
import net.rubyeye.xmemcached.command.BinaryCommandFactory;
import net.rubyeye.xmemcached.utils.AddrUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import com.dhcc.framework.common.cache.memcache.MemcachedService;
import com.dhcc.framework.common.config.PropertiesBean;



/**
 * Memcached工厂类
 * @author liuyg 
 */

@Component
@DependsOn("propertiesBean")
public class MemcachedFactory {

	private static Log logger = LogFactory.getLog(MemcachedFactory.class);

	private static MemcachedFactory instance;
	private static MemcachedService memcachedService = null;

	

	private MemcachedFactory() {
		instance = this;
	}

	public static MemcachedFactory getInstance() {

		return instance;
	}

	@PostConstruct
	public synchronized void init() throws IOException {
		if (null != memcachedService) {
			logger.info("memcached server already init");
			return;
		}
		String address = PropertiesBean.getInstance().getProperty("conf.memcached.server.address");
		String size = PropertiesBean.getInstance().getProperty("conf.memcached.server.conn.size");
		if(size==null||address==null){
			logger.warn("  no memcache configuration=====");
			return;
		}
		MemcachedClientBuilder builder = new XMemcachedClientBuilder(AddrUtil.getAddresses(address), new int[] { 1 });
		builder.setCommandFactory(new BinaryCommandFactory());
		
		builder.setConnectionPoolSize(Integer.valueOf(size));
		MemcachedClient memcachedClient = null;
		try {
			memcachedClient = builder.build();
			memcachedService = new MemcachedServiceImpl(memcachedClient);
			logger.info("memcached server init success");
		} catch (Exception e) {
			logger.error(" if no using memcache PLS egore this error======"+e.getMessage(),e);
		}

	}

	public MemcachedService getMemcachedService() {
		if (null == memcachedService) {
			throw new NullPointerException();
		}
		return memcachedService;
	}




}

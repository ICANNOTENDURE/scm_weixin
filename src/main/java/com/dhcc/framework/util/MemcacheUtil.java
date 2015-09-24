/**
 * 
 */
package com.dhcc.framework.util;

import java.util.concurrent.TimeoutException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.rubyeye.xmemcached.exception.MemcachedException;

import com.dhcc.framework.common.cache.memcache.impl.MemcachedFactory;

/**
 * 读写memcache 工具类
 * 
 * @author liuyg
 */
public abstract class  MemcacheUtil {

	private static Log logger = LogFactory.getLog(MemcacheUtil.class);

	/**
	 * 写memcache 如果有相同key存在，什么也不做，也就是说value还是原来的，不会被这次操作覆盖
	 * @param key
	 * @param value
	 * @param timeout,存放时间周期,以秒为单位
	 * @return  操作不成功返回false
	 */
	public static boolean put(String key, Object value, int timeout) {
		boolean result = false;
		try {
			result = MemcachedFactory.getInstance().getMemcachedService()
					.addCache(key, value, timeout);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}



	/**
	 * 写memcache
	 * 不设置存放周期默认为28小时,如果有相同key存在，什么也不做，也就是说value还是原来的，不会被这次操作覆盖
	 * @param key
	 * @param value
	 * @return   操作不成功返回false
	 */
	public static boolean put(String key, Object value) {
		boolean result = false;
		try {
			result = MemcachedFactory.getInstance().getMemcachedService()
					.addCache(key, value);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}



	/**
	 * 从memcache 读取数据
	 * @param key
	 * @param timeout  ,超时时间
	 * @return
	 */
	public static Object get(String key, long timeout) {
		Object result = null;
		try {
			result= MemcachedFactory.getInstance().getMemcachedService()
					.getCache(key, timeout);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 从memcache 读取数据
	 * @param key
	 * @param timeout
	 * @param classes
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T get(String key, long timeout, Class<T> classes){
		Object result = null;
		try {
			result =  MemcachedFactory.getInstance().getMemcachedService()
					.getCache(key, timeout);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return (T)result;
	}

	/**
	 * 从memcache 读取数据
	 * 
	 * @param key
	 * @return
	 */
	public static Object get(String key) {
		Object result = null;
		try {
			result= MemcachedFactory.getInstance().getMemcachedService()
					.getCache(key);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}

	/**
	 * 从memcache 读取数据
	 * 
	 * @param key
	 * @param classes
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T get(String key, Class<T> classes) {
		Object result = null;
		try {
			result=  MemcachedFactory.getInstance().getMemcachedService()
					.getCache(key);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return (T)result;
	}

	/**
	 * 写数据到memcache,如果有相同的key存在了，就覆盖之前的,不设置存放周期默认为28小时
	 * 
	 * @param key
	 * @param value
	 * @return 操作成功返回true
	 */
	public static boolean forcePut(String key, Object value) {
		boolean result = false;
		try {
			result= MemcachedFactory.getInstance().getMemcachedService()
					.setCache(key, value);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}

	/**
	 * 写数据到memcache:如果有相同的key存在了，就覆盖之前的
	 * @param key
	 * @param value
	 * @param timeout:过期时间以秒为单位
	 * @return 操作成功返回true
	 */
	public static boolean forcePut(String key, Object value, int timeout){
		boolean result = false;
		try {
			result= MemcachedFactory.getInstance().getMemcachedService()
					.setCache(key, value,timeout);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}

	/**
	 * 删除memcache 数据
	 * 
	 * @param key
	 * @return
	 * @throws TimeoutException
	 * @throws InterruptedException
	 * @throws MemcachedException
	 */
	public static boolean deleteCache(String key)  {
		boolean result = false;
		try {
			result= MemcachedFactory.getInstance().getMemcachedService()
					.deleteCache(key);
		} catch (TimeoutException e) {
			logger.error(e.getMessage());
		} catch (InterruptedException e) {
			logger.error(e.getMessage());
		} catch (MemcachedException e) {
			logger.error(e.getMessage());
		}
		return result;
	}
}

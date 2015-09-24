package com.dhcc.framework.common.cache.memcache;

import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.exception.MemcachedException;

/**
 * MemcachedService 服务接口，调用者不需要访问这个接口，统一通过MemcacheUtil来访问memcache
 * 
 * @author liuyg 2013-10-10
 */
public interface MemcachedService {

	public boolean addCache(String key, Object value, int timeout)
			throws TimeoutException, InterruptedException, MemcachedException;

	public boolean addCache(String key, Object value) throws TimeoutException,
			InterruptedException, MemcachedException;

	public Object getCache(String key, long timeout) throws TimeoutException,
			InterruptedException, MemcachedException;

	public Object getCache(String key) throws TimeoutException,
			InterruptedException, MemcachedException;

	public boolean setCache(String key, Object value) throws TimeoutException,
			InterruptedException, MemcachedException;

	public boolean setCache(String key, Object value, int timeout)
			throws TimeoutException, InterruptedException, MemcachedException;

	public boolean deleteCache(String key) throws TimeoutException,
			InterruptedException, MemcachedException;
}

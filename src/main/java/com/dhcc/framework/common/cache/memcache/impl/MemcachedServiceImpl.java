package com.dhcc.framework.common.cache.memcache.impl;

import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import com.dhcc.framework.common.BaseConstants;
import com.dhcc.framework.common.cache.memcache.AbstraceMemService;

/**
 * 实现对memcache 数据的写，读，和删除的实现
 * 
 * @author liuyg
 */

public class MemcachedServiceImpl extends AbstraceMemService {

	protected MemcachedServiceImpl(MemcachedClient client) {
		super(client);
	}

	@Override
	public boolean addCache(String key, Object value, int timeout)
			throws TimeoutException, InterruptedException, MemcachedException {
		return client.add(key, timeout, value);
	}

	@Override
	public boolean addCache(String key, Object value) throws TimeoutException,
			InterruptedException, MemcachedException {
		return addCache(key, value, BaseConstants.MEM_MAX_AGE);
	}

	@Override
	public Object getCache(String key, long timeout) throws TimeoutException,
			InterruptedException, MemcachedException {
		if (null != client.get(key, timeout)) {
			return client.get(key, timeout);
		}
		return null;
	}

	@Override
	public Object getCache(String key) throws TimeoutException,
			InterruptedException, MemcachedException {
		return client.get(key);
	}

	@Override
	public boolean setCache(String key, Object value) throws TimeoutException,
			InterruptedException, MemcachedException {
		return setCache(key, value, BaseConstants.MEM_MAX_AGE);
	}

	@Override
	public boolean setCache(String key, Object value, int timeout)
			throws TimeoutException, InterruptedException, MemcachedException {
		return client.set(key, timeout, value);
	}

	@Override
	public boolean deleteCache(String key) throws TimeoutException,
			InterruptedException, MemcachedException {
		return client.delete(key);
	}
}

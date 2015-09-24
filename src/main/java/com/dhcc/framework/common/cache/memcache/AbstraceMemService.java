package com.dhcc.framework.common.cache.memcache;

import net.rubyeye.xmemcached.MemcachedClient;

/**
 * MemcachedService抽像类，由子类实现该接口方法，抽像类中只定义了 MemcachedClient
 * 
 * @author liuyg 2013-10-10
 */
public abstract class AbstraceMemService implements MemcachedService {

	protected MemcachedClient client;

	protected AbstraceMemService(MemcachedClient client) {
		this.client = client;
	}
}

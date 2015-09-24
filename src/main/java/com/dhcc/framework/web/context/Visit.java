package com.dhcc.framework.web.context;

import java.util.HashSet;
import java.util.Set;

/**
 * 用来记录web context相关用户信息
 * @author liuyg
 * 
 */
public  class Visit implements java.io.Serializable {

	private VisitUser userInfo;
	private Set<String> errors ;
	


	public void clearErrors() {
		if(errors==null){
			return;
		}
		errors.clear();
	}

	public Set<String> getErrors() {
		return errors;
	}

	public void addError(String err) {
		if(errors==null){
			errors = new HashSet<String>();
		}
		errors.add(err);
	}

	public void setErrors(Set<String> errors) {
		this.errors = errors;
	}

	public VisitUser getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(VisitUser userInfo) {
		this.userInfo = userInfo;
	}

	@SuppressWarnings("unchecked")
	public  <T> T getUserInfo(Class<T>  clasz){
		return (T) this.userInfo;
	}

	
}
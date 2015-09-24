package com.dhcc.framework.transmission.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResponseEvent implements IEvent {
	
	private static final long serialVersionUID = -7120764183687192558L;

	@SuppressWarnings("rawtypes")
	protected Map displayData = null;
	
	/**
	 * 暂时不用，将来用来保存异常
	 */
	@SuppressWarnings("rawtypes")
	protected List exceptionParam;


	/**
	 * 用户Id
	 */
	protected String userId;

	public ResponseEvent() {

	}

	public ResponseEvent(String userId) {
		this.userId = userId;
		
	}


	@SuppressWarnings("rawtypes")
	public List getExceptionParam() {
		return exceptionParam;
	}

	public String[] getExceptionParamsAsString() {
		if (exceptionParam==null||(exceptionParam!=null&&exceptionParam.size() <= 0)){
			return null;
		}
		String result[] = new String[exceptionParam.size()];
		for (int i = 0; i < exceptionParam.size(); i++)
			result[i] = (String) exceptionParam.get(i);

		return result;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setExceptionParam(List exceptionParam) {
		if(this.exceptionParam==null){
			this.exceptionParam = new ArrayList();
		}
		this.exceptionParam.addAll(exceptionParam);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserID(String userId) {
		this.userId = userId;
	}

	/**
	 * 
	 * @param fieldName
	 *            想要显示的数据字段名
	 * @param obj
	 *            想要显示的数据对象
	 */
	protected void addDisplayData(String fieldName, Object obj) {
		if(displayData==null){
			displayData = new HashMap();
		}
		displayData.put(fieldName, obj);

	}

	/**
	 * 设置需要显示的数据
	 * 
	 * @param fieldName
	 *            想要显示的数据字段名
	 * @param data
	 *            想要显示的数据内容
	 */
	public void displayData(String fieldName, Object data) {
		addDisplayData(fieldName, data);
	}
}

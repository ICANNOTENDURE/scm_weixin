package com.dhcc.framework.exception;





/**
 * 
 * Description : 自定义异
 * @author 刘有根
 * 
 */
public class BaseException extends Exception {
	

	// 参数列表
	private String[] argumentValues;

	// 原始异常
	private Exception linkedException;

	// 错误信息
	private String message;

	// 跳转页面
	private String dispathPage;


	public BaseException(String message) {

		this.message = message;
	

	}

	public BaseException(String message,Exception exception) {
		this.message = message;
		this.linkedException = exception;
	}
	

	/**
	 * 用指定原始异常、跳转页面和表现形式构造新异常
	 * @param exception  原始异常
	 * @param dispathPage  跳转页面
	 * @param occasion 表现形式
	 */
	public BaseException(Exception exception,String dispathPage) {
		this.linkedException = exception;
		this.dispathPage = dispathPage; 
	}





	/**
	 * 用指定参数列表构造新异常
	 * @param argumentValues 指定错误信息的参数列表
	 */
	public BaseException(String[] argumentValues) {
		this.argumentValues = argumentValues;
	}

	/**
	 * 用指定MessageID、参数列表和原始异常构造新异常
	 * 
	 * @param messageID
	 *            指定的错误信息ID
	 * @param argumentValues
	 *            指定错误信息的参数列表
	 * @param exception
	 *            原始异常
	 */
	public BaseException(String[] argumentValues,
			Exception exception) {
		this.argumentValues = argumentValues;
		this.linkedException = exception;
	}

	/**
	 * 获得原始的异常
	 * 
	 * @return 原始异常
	 */
	public Exception getLinkedException() {
		return linkedException;
	}

	/**
	 * 设定原始异常
	 * 
	 * @param exception
	 *            原始异常
	 */
	public void setLinkedException(Exception exception) {
		linkedException = exception;
	}


	/**
	 * 获得错误信息
	 * 
	 * @return 错误信息
	 */
	public String getMessage() {

		return message;
	}

	/**
	 * 设置单个参数
	 * 
	 * @param argumentValue
	 *            参数值
	 */
	public void setArgumentValues(String argumentValue) {
		argumentValues = new String[1];
		argumentValues[0] = argumentValue;
	}

	/**
	 * 设置参数列表
	 * 
	 * @param argumentValues
	 *            参数列表
	 */
	public void setArgumentValues(String[] argumentValues) {
		this.argumentValues = argumentValues;
	}

	/**
	 * 设置跳转页面
	 * 
	 * @param dispatchPage
	 *            跳转页面
	 */
	public void setDispatchPage(String dispatchPage) {
		this.dispathPage = dispatchPage;
	}

	/**
	 * 获得跳转页面
	 * 
	 * @return 跳转页面
	 */
	public String getDispatchPage() {
		return this.dispathPage;
	}

	public String toString() {
		String excepInfo = getClass().getName() + ":" + ":"+ message + ": ";
		if (linkedException != null) {
			excepInfo += linkedException.getMessage();

		}
		return excepInfo;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
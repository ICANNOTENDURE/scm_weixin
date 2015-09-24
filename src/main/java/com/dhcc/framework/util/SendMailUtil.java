package com.dhcc.framework.util;

import java.util.Calendar;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import com.dhcc.framework.common.config.PropertiesBean;

public class SendMailUtil {

	private static Log logger = LogFactory.getLog(SendMailUtil.class);
	/**
	 * 同步方式发邮件
	 * 
	 * @param subject
	 * @param msg
	 * @param toMail
	 *            多个地址用逗号隔开
	 * @param timeOut
	 *            ,可选 不设置默认为 60 * 1000
	 * @throws EmailException
	 */
	public static void sendEmail(String subject, String msg, String toMail,
			int... timeOut) throws EmailException {
		if (null == toMail) {
			return;
		}

		HtmlEmail email = new HtmlEmail();
		email.setHostName(PropertiesBean.getInstance().getProperty("mail.host"));
		email.setSslSmtpPort(PropertiesBean.getInstance().getProperty("mail.port"));
		email.setAuthenticator(new DefaultAuthenticator(
				PropertiesBean.getInstance().getProperty("mail.username"), 
				PropertiesBean.getInstance().getProperty("mail.pwd")));
		email.setSSLOnConnect(Boolean.parseBoolean(PropertiesBean.getInstance().getProperty("mail.ssl")));
		email.setCharset("utf-8");
		email.setFrom(PropertiesBean.getInstance().getProperty("mail.username"));
		email.setDebug(Boolean.parseBoolean(PropertiesBean.getInstance()
				.getProperty("mail.debug")));
		email.setSubject(subject);
		email.setMsg(msg);
		email.setSentDate(Calendar.getInstance().getTime());
		email.setSocketConnectionTimeout(10 * 1000);
		for (String toAddress : toMail
				.split(com.dhcc.framework.common.BaseConstants.COMMA)) {
			email.addTo(toAddress.trim());
		}
		if (null != timeOut && timeOut.length > 0) {
			email.setSocketTimeout(timeOut[0]);
		} else {
			email.setSocketTimeout(60 * 1000);
		}
		email.send();
	}

	/**
	 * 异步方式发送邮件 
	 * @param subject
	 * @param msg
	 * @param toMail  多个地址用逗号隔开
	 * @param timeOut
	 *            ,可选 不设置默认为 60 * 1000
	 * @throws EmailException
	 */
	public static void sendEmailByAsync(final String subject, final String msg,
			final String toMail, final int... timeOut) throws EmailException {
		if (null == toMail) {
			return;
		}
		new Thread() {
			@Override
			public void run() {
				try {
					SendMailUtil.sendEmail(subject, msg, toMail, timeOut);
				} catch (EmailException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}.start();
	}

}
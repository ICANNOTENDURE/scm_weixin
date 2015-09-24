package com.dhcc.framework.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class LogWrap {

	public static void info(Log logger, Object msgObj) {
		if (logger.isInfoEnabled()) {
			logger.info(msgObj);
		}

	}

	public static void debug(Log logger, Object msgObj) {
		if (logger.isDebugEnabled()) {
			logger.debug(msgObj);
		}

	}

	public static void error(Log logger, Object msgObj) {

		logger.error(msgObj);

	}

	public static void info(Class c, Object msgObj) {
		Log logger = LogFactory.getLog(c);
		if (logger.isInfoEnabled()) {
			logger.info(msgObj);
		}
		logger = null;
	}

	public static void debug(Class c, Object msgObj) {
		Log logger = LogFactory.getLog(c);
		if (logger.isDebugEnabled()) {
			logger.debug(msgObj);
		}
		logger = null;
	}

	public static void error(Class c, Object msgObj) {
		Log logger = LogFactory.getLog(c);
		logger.error(msgObj);
		logger = null;
	}
}

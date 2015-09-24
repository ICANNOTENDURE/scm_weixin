package com.dhcc.framework.common.config;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;

import org.apache.commons.lang3.text.StrSubstitutor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

@Component
public class PropertiesBean extends OrderedProperties {
	
		private static final long serialVersionUID = 1L;

		/** this points to an ordinary file */
		private String contextPath;

		protected static Log logger = LogFactory.getLog(PropertiesBean.class);

		private static PropertiesBean instance;

		public static PropertiesBean getInstance() {
			return instance;
		}

		public PropertiesBean() throws IOException {
			this(PropertiesBean.class.getClassLoader().getResource("application.properties"));
			instance = this;
		}


		public PropertiesBean(URL contextFileUrl) throws IOException {
			try {
				contextPath = URLDecoder.decode(contextFileUrl.getPath(), "UTF-8");
			} catch (IOException e) {
				logger.error("Unable to read from " + contextPath, e);
				throw e;
			}
			try {
				load(new FileInputStream(contextPath));
			} catch (IOException e) {
				logger.error("Unable to read from " + contextPath, e);
				throw e;
			}
		}

		/**
		 * Creates new XMLBean from an input stream; XMLBean is read-only!!!
		 */
		public PropertiesBean(InputStream is) throws IOException {
			contextPath = null;
			try {
				load(is);
			} catch (IOException e) {
				logger.error("Unable to read from stream");
				throw e;
			}
		}

		/**
		 * This method saves the properties-file connected by PropertiesBean.<br>
		 * <b>NOTE:</b> only call this on an PropertiesBean _NOT_ created from an
		 * InputStream!
		 * 
		 * @throws IOException
		 */
		public void write() throws IOException {
			// it might be that we do not have an ordinary file,
			// so we can't write to it
			if (contextPath == null)
				throw new IOException("Path not given");

			store(new FileOutputStream(contextPath), "");
			try {
				store(new FileOutputStream(contextPath), "");
			} catch (IOException ex) {
				if (logger.isInfoEnabled()) {
					logger.info(ex.getMessage());
				}
				throw ex;
			}
		}

		public int getInt(String property) {
			return Integer.parseInt(getProperty(property, "0"));
		}

		/**
		 * Gets the property value replacing all variable references
		 */
		public String getPropertyWithSubstitutions(String property) {
			return StrSubstitutor.replaceSystemProperties(getProperty(property));
		}

		public String getContextPath() {
			return contextPath;
		}
}

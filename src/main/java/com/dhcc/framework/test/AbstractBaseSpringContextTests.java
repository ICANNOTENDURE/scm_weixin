package com.dhcc.framework.test;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations = { "classpath*:/applicationContext.xml" })
public class AbstractBaseSpringContextTests extends
		AbstractJUnit4SpringContextTests {

}

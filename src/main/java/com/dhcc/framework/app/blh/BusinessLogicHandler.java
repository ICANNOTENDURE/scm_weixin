package com.dhcc.framework.app.blh;

import com.dhcc.framework.exception.BaseException;
import com.dhcc.framework.transmission.event.RequestEvent;
import com.dhcc.framework.transmission.event.ResponseEvent;


public interface BusinessLogicHandler {

	public ResponseEvent performTask(RequestEvent requestevent)
			throws BaseException;

}

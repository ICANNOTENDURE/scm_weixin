package com.dhcc.scm.ws.wx;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import org.apache.cxf.annotations.WSDLDocumentation;

import com.dhcc.scm.entity.vo.ws.OperateResult;

@WebService
@SOAPBinding(style=SOAPBinding.Style.RPC)
public interface WeiXinServiceInterface {
	
    @WebMethod
    @WebResult(name="operateResult")
    @WSDLDocumentation("发送微信通知")
    public OperateResult sendMessage(@WebParam(name="usename")String usename,@WebParam(name="password")String password,@WebParam(name="vendorCode")String vendorCode,@WebParam(name="msg")String msg,@WebParam(name="keyword1")String keyword1,@WebParam(name="keyword2")String keyword2);
    
}

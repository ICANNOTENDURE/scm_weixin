<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>东华医疗供应链平台</title>

<%@include file="/WEB-INF/jsp/common/bootstrap.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/4.4.0/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login/index.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/login/jquery.backgroundcover.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/login.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/login/fun.base.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/login/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/security/aes.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/security/login.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dhcc/pms/login/login.js"></script>	
<script src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
</head>
<body>
   <script>
   layer.open({
       type: 1
       ,title: false
       ,area: '300px;'
       ,closeBtn :false
       ,shade: 0.8
       ,btn: ['我已阅读']
       ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
       ,moveType: 1 //拖拽模式，0或者1
       ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">皖医弋矶山医院通知<br><br>&nbsp;&nbsp;&nbsp;请各个厂家及供应商仔细核对当月发票，若有差错，从即日起当月将不办理入库并推迟六个月入库，各供应商按要求及时递送发票。若有其他操作方面的问题，请及时与东华沟通。近期医院将出台票据管理规定！谢谢合作！</div>'
       
     });
   </script>
  <div class="index">
    <!--LOGO-->
    <div class="login_header">
      <div class="logotop"><img src="<%=request.getContextPath()%>/images/login/logotop.png" alt=""/>
        <!--详细信息-->
        <div class="login_row">
            <div class="row login_row_4">
                <ul>
                    <li>
                        <i class="fa fa-car login_icon_1"></i>&nbsp;<span>互联网+物流</span>
                    </li>
                    <li>
                        <i class="fa fa-laptop login_icon_2"></i>&nbsp;<span>一站式平台</span>
                    </li>
                    <li>
                        <i class="fa fa-suitcase login_icon_3"></i>&nbsp;<span>院内院外闭环管理</span>
                    </li>
                    <li>
                        <i class="fa fa-wechat login_icon_4"></i>&nbsp;<span>微信办公</span>
                    </li>
                </ul>
            </div>
        </div>
        <!--详细信息-->
      </div>
    </div>
    <!--LOGO-->

    <!--轮播图-->

      <div class="login_carousel">
          <div data-ride="carousel" id="carousel_container" class="carousel slide">
              <!--图片容器-->
              <div class="carousel-inner">
              	 <s:iterator value="banners" status="status">
              	 	<s:if test="#status.count==1">
              	 		<div class="item active">
              	 	</s:if>
					<s:else>
						<div class="item">
					</s:else>
						<img src="<%=request.getContextPath()%>/uploadPic/${bannerPath}" alt="" style="height:440px;width: 100%"/>
					</div>	
				 </s:iterator>
              </div>
              <!--小圆圈容器-->
              <ol class="carousel-indicators">
              	 <s:iterator value="banners" status="status">
					 <li data-slide-to="${status.count}" data-target="#carousel_container"></li>	
				 </s:iterator>
              </ol>
              <!--左右按钮容器-->
              <a href="#carousel_container" data-slide="prev" class="left carousel-control">
                  <span class="fa fa-chevron-left" aria-hidden="true"></span>
              </a>
              <a href="#carousel_container" data-slide="next" class="right carousel-control">
                  <span class="fa fa-chevron-right" aria-hidden="true"></span>
              </a>
          </div>
      </div>
    <!--轮播图-->
    <!--登录框 SCQ-->
    <div class="loginboxP_cq loginbox_cq">
      <div class="tcq">登录云平台&nbsp;<!-- <a href="" class="tcq1">注册新用户</a> --></div>
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-addon"><i class="fa fa-user"></i></div>
          <input type="text" class="form-control" placeholder="请输入用户名..." id="mp_userName" name="mp_userName">
        </div>
      </div>
      <div class="form-group">
        <div class="input-group">
          <div class="input-group-addon"><i class="fa fa-lock"></i></div>
          <input type="password" class="form-control" placeholder="请输入密码..." id="mp_password" name="mp_password">
        </div>
      </div>
      <button type="button" class="btn btn-primary btn-lg btn-block" onclick="javascript: SendAuthen();">登录</button>
        <p></p>
      <a href="javascript:vendorRegist();" class="edit_pw">供应商注册</a>
      <a href="javascript:forgetPassword();" class="edit_pw">找回密码</a>
      <a href="javascript:auditResult();" class="edit_room">查询审核结果</a>
    </div>
    <!--登录框 ECQ-->

    <!--页脚-->
    <div class="login_footer">
      <div class="log_f">
        <div class="login_logo"><img src="<%=request.getContextPath()%>/images/login/logo1.png" /><i class="fa fa-registered"></i></div>
        <div class="login_logo"><img src="<%=request.getContextPath()%>/images/login/logo2.png" /></div>
        <i class="fa fa-copyright"></i>
        <span>2014-2016</span>
        <span>东华软件股份公司版权所有</span><span>|</span>
        <span>联系我们</span><span>|</span>
        <span>加入我们</span><span>|</span>
        <span>页面改进意见</span>
        <a href="#" class="red"><i class="fa fa-thumbs-o-up login_up_color"></i>点赞（19）</a>
        <a href="#" class="green"><i class="fa fa-thumbs-o-down login_down_color"></i>不喜欢（1）</a>
        <img id="weixin" src="<%=request.getContextPath()%>/images/login/weixinMP.jpg" alt="" width="100px" height="100px"/>
      </div>
    </div>
      <!--页脚-->
  </div>

</body>
</html>

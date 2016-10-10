<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
</head>
<body>
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
				  <div class="item active"><img src="<%=request.getContextPath()%>/images/login/guoqing.jpg" alt="" style="height:440px;width: 100%"/></div>	
                  <div class="item"><img src="<%=request.getContextPath()%>/images/login/2.jpg" alt="" style="height:440px;width: 100%"/></div>
                  <div class="item"><img src="<%=request.getContextPath()%>/images/login/3.jpg" alt="" style="height:440px;width: 100%"/></div>
                  <div class="item"><img src="<%=request.getContextPath()%>/images/login/4.jpg" alt="" style="height:440px;width: 100%"/></div>
              </div>
              <!--小圆圈容器-->
              <ol class="carousel-indicators">
                  <li data-slide-to="0" data-target="#carousel_container"></li>
                  <li data-slide-to="1" data-target="#carousel_container"></li>
                  <li data-slide-to="2" data-target="#carousel_container"></li>
                  <li data-slide-to="3" data-target="#carousel_container"></li>
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

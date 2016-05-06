<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- amaze  -->
<link href="<%=request.getContextPath()%>/css/amazeui.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/amaze/amazeui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/Acc.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/logo_small.png" media="screen" />

<div id="message" style="width:100%;font-size:14px; position:fixed; top:0;_position:relative; z-index:999999; _top:expression(document.body.scrollTop);"></div>



<!-- common confirm -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="common-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd" id="common-confirm-hd">提示</div>
    <div class="am-modal-bd" id="common-confirm-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
<!-- common alert -->
<div class="am-modal am-modal-alert" tabindex="-1" id="common-alert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd" id="common-alert-hd">提示</div>
    <div class="am-modal-bd" id="common-alert-bd">操作成功!</div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>
<!-- common loading -->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="common-modal-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">正在载入...</div>
    <div class="am-modal-bd">
      <span class="am-icon-spinner am-icon-spin"></span>
    </div>
  </div>
</div>
<!--end-->
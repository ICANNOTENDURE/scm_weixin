<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
    .divcss4 {
    width: 48%;
    height: 223px;
    border: 1px solid;
    float: left;
}
.divcss {
    width: 3.5%;
    height: 223px;
    padding-top: 40px;
    float: left;
}
.divcss a{
    text-decoration:none;
}
.divcss3 {
    width: 48%;
    height: 223px;
    border: 1px solid;
    float: left
}
.divcss5 {
    height: 250px;
}
.divcss6 {
    height: 281px;
    border: 1px solid;
}
.ms2side__div select {
    width: 350px;
    float: left;
}
#one{width:200px; height:180px; float:left}
#two{width:50px; height:180px; float:left}
#three{width:200px; height:180px; float:left}
.btn{width:50px; height:30px; margin-top:10px; cursor:pointer;}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dic</title>
<%@include file="/WEB-INF/jsp/common/scriptInc.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/dhcc/pms/sys/sysMessage.js"></script>  

</head>
<body>
 <div class="panel-header" style="width: 1287px;">
 <div class="panel-title">通知管理</div>
 <div class="panel-tool"></div>
 </div>

<div class="divcss5" id="detailWin">
    <div class="divcss5">
        <table class="tab" cellpadding="0" cellspacing="0" style="width:500px;height:250px;">
            <input id="messageId" type="hidden" name="dto.sysMessage.messageId"/>
            <tr>
                <td style="text-align: right">发送方：</td>
                <td style="width: 120px">
                     <input name="Position" type="radio" value="H" checked="checked"/>医院
                    <input name="Position" type="radio" value="V"/>供应商  
                </td>
                <td><input id="test1" style="width: 180px" name="dto.sysMessage.messageSendPointer"/></td>
                
            </tr>
            <tr>
                <td style="text-align: right">通知标题：</td>
                <td colspan="4">
                    <input type="text" style="width: 77%" name="dto.sysMessage.messageTitle"/>
                </td>
            </tr>
            <!-- <tr>
				<td class='textLabel' style='text-align: right; width: 20%'>messageType:</td>
				<td class='textParent' style='text-align: left; width: 30%'> <input style='width: 250px;' class='validatebox' type='text' name='dto.sysMessage.messageType' value="2" ></input></td>
				</tr> -->
                <td style="text-align: right">通知内容：</td>
                <td colspan="4">
                    <textarea  cols=40 rows=4 name="dto.sysMessage.messageContent">

                   </textarea>
                </td>
            </tr>
            <tr>
                <td  style="min-width: 70px;text-align: right">发送日期：</td>
                <td ><input id="starDate" type="text" style="width: 100%" /></td>
                <td colspan="2" style="min-width: 70px;text-align: left">发送时间：
                <input id="endDate" type="text" style="width: 100%"/></td>
                
            </tr>
             <tr style=display:none>
            <td  style="min-width: 100px;text-align: right">发送日期和时间：</td>
                <td ><input id="sendDate" type="text" style="width: 100%" name="dto.sysMessage.messageDate"/></td>
            </tr>
             <tr style=display:none>
                <td  style="min-width: 70px;text-align: right">创建日期：</td>
                <td ><input id="createDate" type="text" style="width: 100%" name="dto.sysMessage.messageCreatedate"/></td>
               </tr>
           <tr>  
             <td style="text-align: right">接收类型：</td>
             <td colspan="2"><input id="telRec" name="recType" type="checkbox" value="3"/>电脑接收
             <input id="wxRec" name="recType" type="checkbox" value="2"/>微信接收
             
             &nbsp;&nbsp;
                          说明：可以多选</td>
          </tr>
        </table>
    </div>
    <!-- <div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
			</div> -->
    <hr style="height:1px;border:none;border-top:0px solid #555555;"/>
    <hr/>
          <div class="divcss6" style="padding-left: 5px;padding-top: 10px" >
    	<p>
        <a alight="right">接收方：</a>
        <a width="50px"><input type="radio" name="platform" value="H" checked="checked"/>医院</a>
        <a><input id="hopPar" style="width: 130px"/></a>
        <a width="30px"><input type="radio" name="platform" value="V">供应商</a>
        <a width="30px"><input type="radio" name="platform" value="S">平台</a>
        &nbsp;&nbsp;
        <!-- <a alight="right">接收类型：</a>
        <a width="30px"><input name="" type="checkbox" value=""/>电脑接收</a>
        <a width="30px"><input name="" type="checkbox" value=""/>微信接收</a>
        &nbsp;&nbsp;
        <a width="30px">说明：可以多选</a> -->
        </p>   

         <!--  select下拉框内容交换开始-->
            <table width="800px" style="margin-left:70px" align="center" border="0" cellpadding="0" cellspacing="0" class="newContTab">
            <tr>
              <td><div>
                  <div>
                
                    <select multiple="multiple" id="select1" style="width:350px;height:200px; float:left; border:1px #A0A0A4 outset; padding:4px; "> 
                      
                    </select>
                  </div>
                  <div style="float:left;padding-left: 5px;"> 
                    <span id="add">
                    <input type="button" class="btn" value="添加"/>
                    </span><br />
                    <span id="add_all">
                    <input type="button" class="btn" value="全加"/>
                    </span> <br />
                    <span id="remove">
                    <input type="button" class="btn" value="移除"/>
                    </span><br />
                    <span id="remove_all">
                    <input type="button" class="btn" value="全清"/>
                    </span> 
                    </div>
                  <div>
                    <select multiple="multiple" id="select2" style="width: 350px;height:200px; float:lfet;border:1px #A0A0A4 outset; padding:4px;">
                    </select>
                  </div>
                </div>
                </td>
            </tr>
          </table>   
          <!--select下拉框内容交换结束  -->
          <input type="hidden" id="uidlist" name="uidlist" value="" /> 
          <div id="btnDiv" align="center">
				<table cellpadding="0" cellspacing="0" style="width: 100%">
					<tr>
						<td style="text-align: center;"><a id="submitBtn" class="linkbutton"
							data-options="iconCls:'icon-save'">提交</a> <a id="cancelBtn"
							class="linkbutton" data-options="iconCls:'icon-cancel'"
							onclick="javascript:cancelClick()">取消</a>
						</td>
					</tr>
				</table>
            
        </div>
    </div>
</div>

</body>
</html>
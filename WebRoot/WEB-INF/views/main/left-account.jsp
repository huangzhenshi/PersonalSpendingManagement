<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>

<div class="F-left" style="width:100%;">
	<div class="PanelLeft F-left">
    	<div class="BoxLeft">
        	<img src="${ctx}/res/resource/style/images/icon01Hit.png" width="40" height="38" alt="" />
            <h4><b>功能组件</b></h4>
        </div>
        <div class="clear"></div>
        <div class="menuLeftFirst">
			<ul>
		         <li id="doRecordNav" class="hit" onclick="refreshCenterAndAddUsername('${ctx}/record/toMainRecordPage.do?');" >
		        	 <span>我要记账</span>
		         </li> 
		         
		         <li id="recordReviewNav" onclick="refreshCenterAndAddUsername('${ctx}/record/getRecordReview.do?');" >
		  		    <span>账单回顾</span>
		  		 </li> 
		         <li  id="propertyNav"  onclick="refreshCenterAndAddUsername('${ctx}/property/toPropertyMainPage.do?');">
		         	<span>资产管理</span>
		         </li> 
		         
		          <li  id="flowNav" onclick="refreshCenterAndAddUsername('${ctx}/cashFlow/toCashFlowMainPage.do?year=2016&');">
		          	<span>资金流转</span>
		          </li>  
		          
		         <li  id="cardNav" onclick="refreshCenterAndAddUsername('${ctx}/cards/toCardMainPage.do?');">
		        	 <span>银行卡管理</span>
		         </li>     
			 </ul>
		</div>
	</div>
</div>
<script>
	$(function(){
		if("${menuTag}"){
			$("#${menuTag}").click();
		}
	});
	
</script>

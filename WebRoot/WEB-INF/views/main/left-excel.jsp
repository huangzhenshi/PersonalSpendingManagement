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
		         <li id="doRecordNav" class="hit" onclick="refreshCenter('${ctx}/excel/toMainExcelPage.do?username=${username}');" >
		        	 <span>account export</span>
		         </li> 
		         
		         <li id="recordReviewNav" onclick="refreshCenter('${ctx}/record/getRecordReview.do?username=${username}');" >
		  		    <span>habit export</span>
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

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
		         <li id="doSleepNav" class="hit" onclick="refreshCenter('${ctx}/sleep/toMainSleepPage.do?username=${username}');" >
		        	 <span>Sleep</span>
		         </li> 
		         
		         <li  onclick="refreshCenter('${ctx}/diary/toMainDiaryPage.do?username=${username}');" >
		  		    <span>Article</span>
		  		 </li> 
		  		 <li  onclick="refreshCenter('${ctx}/listTodo/toListTodoMainPage.do?username=${username}');" >
		  		    <span>ListTodo</span>
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

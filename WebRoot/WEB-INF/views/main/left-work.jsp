<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>

<div class="F-left" style="width:100%;">
	<div class="PanelLeft F-left">
    	
        <div class="clear"></div>
        <div class="menuLeftFirst">
			<ul>
		         <li id="doSleepNav" class="hit" onclick="refreshCenter('${ctx}/blog/toMainBlogPage.do?username=${username}');" >
		        	 <span>Blog</span>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>


<div class="F-left" style="width:100%;">
	<div class="PanelLeft F-left">
    	<div class="BoxLeft">
        	<img src="${ctx}/res/resource/style/images/icon01Hit.png" width="40" height="38" alt="" />
            <h4><b>系统配置</b></h4>
        </div>
        <div class="clear"></div>
        <div class="menuLeftFirst">
			<ul>
		          <li id="configCodeNav" class="hit"  onclick="refreshCenter('${ctx}/code/toMainRecordPage.do?username=${username}');" >
		        	 <span>Code Config</span>
		         </li> 
		          <li id="configCodeNav" onclick="refreshCenter('${ctx}/hierarchy/toMainHierarchyPage.do?username=${username}');" >
		        	 <span>Hierarchy Config</span>
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

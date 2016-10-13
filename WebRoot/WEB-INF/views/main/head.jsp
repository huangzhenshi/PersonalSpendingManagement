<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- <%@taglib prefix="cui" tagdir="/WEB-INF/tags"%> --%>
<!--head begin-->
    	<div class="w-head clearfix">
    		<div class="w-h-l">
    			<img src="${ctx}/res/resource/style/css/images/logo.png" class="logo">
    		</div>
    		<div class="w-h-M">
    			<div class="w-h-m-c">
    				<ul id="headMenu" class="headMenu">
    						<li id="account" onclick="toDisplay('account')" title="财务管理"><i class="tz"></i><span>财务管理</span></li>
    						<li id="smartAnalyseNav" onclick="toDisplay('smart')" title="智能分析"><i class="gl"></i><span>智能分析</span></li>
    						<li id="todoNav" onclick="toDisplay('Content')" title="待办事项"><i class="gl"></i><span>待办事项</span></li>
    						<li id="habitNav" onclick="toDisplay('Content')" title="习惯养成"><i class="gl"></i><span>习惯养成</span></li>
    						<li id="excelNav" onclick="toDisplay('Content')" title="导入导出"><i class="gl"></i><span>导入导出</span></li>
    						<li id="codeNav" onclick="toDisplay('config')" title="系统配置"><i class="gl"></i><span>系统配置</span></li>
    				</ul>
    			</div>
    		</div>
    		
    	</div>

<script type="text/javascript">
var pannel="";
	function toDisplay(name,menuTag){
		var username=$("#username").val();
		if(!name)return;
		if(typeof(menuName)!=undefined){
			menuName = name;
		}
		panel = $("#coralui-layout").layout("panel","west");
		if(panel.length>0){
			panel = $("#coralui-layout").layout("remove","west");
		}
		$("#coralui-layout").layout("add",{region: 'west',width: 220,height:500,split: true});
		panel = $("#coralui-layout").layout("panel","west");
		panel.panel("option","onLoad",initTreebox);
		panel.panel("option","onResize",initTreebox);

		panel = $("#coralui-layout").layout("panel","west");
		panel.panel("refresh", ctx+"/main/"+name+"/getLeftMenu.do?menuTag="+menuTag+"&username="+username);
		panel = $("#coralui-layout").layout("panel","center");
		var baseUrl="";
		if(name=="smart"){
			baseUrl='${ctx}/smart/getMonthMainPage.do?username='+username;
		}else if(name=='account'){
			baseUrl='${ctx}/record/toMainRecordPage.do?username='+username;
		}else if(name=="config"){
			baseUrl='${ctx}/code/toMainRecordPage.do?username='+username;
		}
		panel.panel("refresh", baseUrl);
		
	}
	//页面加载完毕后获取下拉框的value值
	$(function(){
		if("${navTag}"){
			toDisplay("${navTag}","${menuTag}");
		}else{
			toDisplay("account");
		}
		
	});
	

</script>

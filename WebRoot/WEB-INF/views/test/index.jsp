<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<div style="display: none;">login</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="Thu, 01 Jan 1970 00:00:01 GMT"> 
<meta http-equiv="expires" content="0">


<%@ include file="../../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
<style>.error{color:red;}</style>
</head>
<body>

<!-- 导航栏 -->
<%@include file="../common/navbar.jsp" %>
		    <cui:grid id="todoGrid${idSuffix}" rownumbers="true" fitStyle="fill" url="${ctx}/todo/test.do">
		    	<cui:gridCols>
		    		<cui:gridCol name="type" align="center" formatter="typeTodoFormat">待办类型</cui:gridCol>
		    		<cui:gridCol name="times" align="center">应办日期</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
</body>
</html>
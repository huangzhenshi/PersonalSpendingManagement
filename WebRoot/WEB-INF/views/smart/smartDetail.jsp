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


<title>黄大大财务管理软件</title>
<%@ include file="../../include/headerForCUI.jsp"%>
</head>
<body>
<div>
<h2 class="text-center">${times}本月累计其他开销${elseTotal}元</h2>
	<input type="text" id="holderName"  hidden="true" value="${username}"/>
	    <cui:grid id="elseGrid${idSuffix}" rownumbers="true" width="auto" height="900"
	    		data="${elseList}" datatype="local" rowNum="50">
	    	<cui:gridCols>
	    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
	    		<cui:gridCol name="columnName"  align="center">开销名称</cui:gridCol>
	    		<cui:gridCol name="value"  align="center">金额</cui:gridCol>
	    	</cui:gridCols>
	    </cui:grid> 
	    
</div>		    
	<script>

	</script>
</body>
</html>
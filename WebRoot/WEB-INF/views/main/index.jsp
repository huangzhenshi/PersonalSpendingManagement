<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Tornado_Huang财务管理软件</title>



<script src="${ctx}/res/jquery-cui/4.0.2/dev/ui/jquery-1.9.1.min.js"></script>

<link href="${ctx}/res/resource/style/css/common.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/body.css" type="text/css" rel="stylesheet" />

<%@ include file="../../include/headerForCUI.jsp"%>
<%@include file="../cards/editOrUpdateCardModal.jsp" %>
<%@include file="../records/editOrUpdateRecordModal.jsp" %>
<%@include file="../code/editOrUpdateCodeModal.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/res/thirdParty/jquery-lightbox-0.5/css/jquery.lightbox-0.5.css">
<script src="${ctx}/res/thirdParty/jquery-lightbox-0.5/js/jquery.lightbox-0.5.js"></script> 

<style>
html,body {
	height: 100%;
	width: 100%;
}
</style>
</head>
<body>
<input type="text" id="username"  hidden="true" value="${username}"/>
	<cui:layout id="coralui-layout" fit="true">
			<cui:layoutRegion region="north" split="false" style="height:60px;border:none">
			</cui:layoutRegion>
			<div style="height:60px;width:100%;position: absolute;left:0;top:0;z-index: 22;">
				<%@ include file="head.jsp"%>
			</div>
			<cui:layoutRegion  region='center' split="false" onLoad="layoutCenterResize" onResize="layoutCenterResize">
			</cui:layoutRegion>
	</cui:layout>
</body>
</html>